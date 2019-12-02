using BusinessLogicLayer;
using ErrorLogger;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WarcasterPub.Models;

namespace WarcasterPub.Controllers
{
	[MustBeInRole(Roles = Constants.NormalRoleName)] public class ArmyModelsController : Controller
    {
		#region IsMine stuff
		// A bool method that returns false if user should not be seeing/manipulating the army.
		public bool IsMineOrAdmin(FullArmyData Army)
		{   // this little filter should make sure the object is either the users, or the user is in 
			//developer / administrator role. It should make it so people can't edit others armies.
			// Returns a false if you shouldnt be able to mess with it.
			bool ReturnValue = false;
			if (User.IsInRole("Administrator") |
				User.IsInRole(Constants.DeveloperRoleName) |
				Army.UserName == User.Identity.Name)
			{
				ReturnValue = true;
			}
			return ReturnValue;
		}
		public bool IsMineOrAdmin(ArmyBLL Army)
		{   // this little filter should make sure the object is either the users, or the user is in 
			//developer / administrator role. It should make it so people can't edit others armies.
			// Returns a false if you shouldnt be able to mess with it.
			bool ReturnValue = false;
			if (User.IsInRole("Administrator") |
				User.IsInRole("Developer") |
				Army.UserName == User.Identity.Name)
			{
				ReturnValue = true;
			}
			return ReturnValue;
		}
		#endregion

		// GET: ArmyModels
		public ActionResult Index()
		{
			if (!User.IsInRole("Developer") && !User.IsInRole("Administrator"))
			{
				return RedirectToAction("MyIndex");
			}
			List<ArmyBLL> armies = null;
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					armies = ctx.ArmiesGetAll(Constants.DefaultPageNumber, Constants.DefaultPageSize);
				}
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
			return View(armies);
		}

		// GET: ArmyModels
		public ActionResult MyIndex()
		{//Grabs an index of armies owned by user
			List<ArmyBLL> armies = null;
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{// we retrieve the user by his Name in User.Identity then get his armies
					UserBLL Me = ctx.UserFindByName(User.Identity.Name);
					armies = ctx.ArmiesFindByUserID(Me.UserID, Constants.DefaultPageNumber, Constants.DefaultPageSize);
				}
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("error", oops);
			}
			return View("index",armies);
		}

		// GET: ArmyModels/Details

		public ActionResult Details(int id)
		{	// this will show the army info, but will also show a list of models that come with the army
			// if this army is not owned by user and doesnt have role user is diverted.
			List<ArmyModelBLL> models = null;
			ArmyBLL army = null;
			try
			{// using is used because we use an SQL connection which is high in resources
				using (ContextBLL ctx = new ContextBLL())
				{
					army = ctx.ArmyFindByID(id);
					if (army == null)
					{// If no record is returned we divert to a custom error screen.
						return View("NotFound");
					}
					models = ctx.ArmyModelsFindByArmyID(army.ArmyID, Constants.DefaultPageNumber, Constants.DefaultPageSize);
				}
			}
			catch (Exception oops)
			{// if the connection fails or something else goes wrong we log the error and divert.
				Error.Log(oops);
				return View("Error", oops);
			}
			FullArmyData item = new FullArmyData(army, models);// item is an instance of FullArmyData!
				item.models = models;
			if (!IsMineOrAdmin(item))
			{// if user should not see this we divert him.
				return View("Porpoise");
			}
			return View(item);
		}

        // GET: ArmyModels/Create
        public ActionResult Create()
		{
			#region Pulldown Stuff
			List<SelectListItem> ListOfFactions = new List<SelectListItem>();
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					List<FactionBLL> factions = ctx.FactionsGetAll(0, 100);
					ViewBag.FactionList = ListOfFactions;
					foreach (FactionBLL faction in factions)
					{
						SelectListItem i = new SelectListItem();
						i.Text = faction.FactionName;
						i.Value = faction.FactionID.ToString();
						ListOfFactions.Add(i);
					}
				}
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
			#endregion Pulldown Stuff

			return View();
		}

		// POST: ArmyModels/Create
		[HttpPost]
        public ActionResult Create(ArmyBLL Record)
		{
			//var errors = ModelState.Values.SelectMany(v => v.Errors);
			//ModelState["ArmyID"].Errors.Clear();// These are expected to be empty so ignored
			//ModelState["UserID"].Errors.Clear();// These are expected to be empty so ignored
			if (!ModelState.IsValid)
			{
				return View(Record);
			}
			int NewArmyID = 0;
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					UserBLL me = ctx.UserFindByName(User.Identity.Name);
					Record.UserID = me.UserID;
					NewArmyID = ctx.ArmyCreate(Record);
				}
				return RedirectToAction("Details", new { id = NewArmyID } );
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("error", oops);
			}
		}

		// GET: ArmyModels/Edit
		public ActionResult Edit(int id)
		{   // this will show the army info, but will also show a list of models that come with the army
			List<ArmyModelBLL> models = null;
			ArmyBLL army = null;
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					army = ctx.ArmyFindByID(id);
					if (army == null)
					{
						return View("NotFound");
					}
					models = ctx.ArmyModelsFindByFactionID(army.ArmyID, army.FactionID, Constants.DefaultPageNumber, Constants.DefaultPageSize);

			#region Pulldown Stuff
			//We want to make pull down menus for models so we can easily select the quantity and 
			//amount of full squats we can select. These menus are restricted by the field allowence.
			List<List<SelectListItem>> FieldAllowance = new List<List<SelectListItem>>();
			List<List<SelectListItem>> FullSquats = new List<List<SelectListItem>>();
			ViewBag.MaxFieldAllowance = FieldAllowance;
			ViewBag.MaxFullSquats = FullSquats;

			for (int i = 0; i < models.Count; i++)
			{
				FieldAllowance.Add(new List<SelectListItem>());
				FullSquats.Add(new List<SelectListItem>());
						int MaxQuantity = 0;
			if(0 != models[i].AttachesToModelID)
						{// limits the attached models to qty of parent model
							ArmyModelBLL OriginalModel = ctx.ArmyModelsFindByArmyIDAndModelID(army.ArmyID, models[i].AttachesToModelID);
							MaxQuantity = OriginalModel.Quantity;
						}
						else
						{
							MaxQuantity = models[i].FieldAllowence;
						}
				for (int j = 0; j < MaxQuantity + 1; j++)
				{//this is the list for the quantity
					SelectListItem sli = new SelectListItem();
					sli.Text = j.ToString();
					sli.Value = j.ToString();
					if(j == models[i].Quantity)
					{
						sli.Selected = true;
					}
					FieldAllowance[i].Add(sli);
				}
				for(int jj = 0; jj< models[i].Quantity + 1;jj++)
				{   // this is the list for the Full squats. we limit this to the quantity , 
					// since full squat is an upgrade to a squat
					// it makes no sense to make a selection larger then the amount of squats.
					SelectListItem sli = new SelectListItem();
					sli.Text = jj.ToString();
					sli.Value = jj.ToString();
					if (jj == models[i].FullSquats)
					{
						sli.Selected = true;
					}
					FullSquats[i].Add(sli);
				}
			}
					#endregion Pulldown stuff
				}
			}
			catch (Exception oops)
			{//error logger and divert to error screen
				Error.Log(oops);
				return View("error", oops);
			}
			FullArmyData item = new FullArmyData(army, models);
			item.models = models;
			if (!IsMineOrAdmin(item))
			{// check if user should be editing this
				return View("Porpoise");
			}
			return View(item);
		}

		// POST: ArmyModels/Edit
		[HttpPost]
        public ActionResult Edit(int id, FullArmyData Army)
        {// we check if the form returned is validated
			if (!ModelState.IsValid)
			{
				return View(Army);
			}
			ArmyBLL ArmyData = new ArmyBLL(Army);
            try
            {
				using (ContextBLL ctx = new ContextBLL())
				{
					ctx.ArmyUpdate(ArmyData);
					ctx.ArmyModelsDeleteByArmyID(Army.ArmyID);
					for(int i = 0; i < Army.models.Count; i++)
					{// to make sure we have a good save of the edited army data we delete the army data,
						//then we put in the new army roster. I figured this is less taxing then pulling
						//up the old roster, compare info, then delete, edit and create records accordingly.
						ArmyModelBLL model = new ArmyModelBLL();
						model.Quantity = Army.models[i].Quantity;
						model.FullSquats = Army.models[i].FullSquats;
						model.ModelID = Army.models[i].ModelID;
						model.ArmyID = Army.ArmyID;
						//models.Add(model);
						if (model.Quantity > 0)
						{// if this model is in the army create a record in the many to many table.
							ctx.ArmyModelCreate(model);
						}
					}
				}
				TempData.Add("Message", "Saved");	//we use this message for a pop-up confirmation
				return RedirectToAction("Edit", new { id = Army.ArmyID });
				// sending to edit because I want the user to see the new values and do possible tweaks
				//till they are happy. saving just updates the info and calculates points.
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("error", oops);
			}
		}

		// GET: ArmyModels/Delete
		// GET: Armies/Delete
		public ActionResult Delete(int id)
		{
			ArmyBLL army = null;
			try
			{// confirmation info to see the army to delete.
				using (ContextBLL ctx = new ContextBLL())
				{
					army = ctx.ArmyFindByID(id);
					if (army == null)
					{//if the record doesn't exist we divert them
						return View("NotFound");
					}
					if (!IsMineOrAdmin(army))
					{//if they should not be able to touch it we divert them
						return View("Porpoise");
					}
				}
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
			return View(army);
		}

		// POST: ArmyModels/Delete
		[HttpPost]
        public ActionResult Delete(int id, ArmyBLL ArmyToDelete)
		{// this will not only delete the army but also all models in the many to many table that come with it
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					ctx.ArmyDelete(id);
				}
				return RedirectToAction("Index");
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
		}
	}
}
