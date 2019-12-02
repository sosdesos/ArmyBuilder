using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BusinessLogicLayer;
using ErrorLogger;
using WarcasterPub.Models;

namespace WarcasterPub.Controllers
{
	public class MiniaturesController : Controller
	{
		// GET: Models
		public ActionResult Index()
		{	// just retreives all 
			List<ModelBLL> items = null;
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					items = ctx.ModelsGetAll(Constants.DefaultPageNumber, Constants.DefaultPageSize);
				}
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
			return View(items);
		}
		// GET: Models
		public ActionResult FactionIndex(int id)
		{   // retreives all models from 1 faction
			List<ModelBLL> items = null;
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					items = ctx.ModelsFindByFactionID(id, 0, 100);
				}
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
			return View("Index",items);
		}

		// GET: Models/Details/5
		public ActionResult Details(int id)
		{
			ModelBLL item = null;
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					item = ctx.ModelFindByID(id);
					if (item == null)
					{
						return View("NotFound");
					}
				}
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
			return View(item);
		}

		// GET: Models/Create
		[MustBeInRole(Roles = Constants.PressgangerRoleName)] public ActionResult Create()
		{
			#region Pulldown Stuff
			List<SelectListItem> ListOfFactions   = new List<SelectListItem>();
			List<SelectListItem> ListOfModelTypes = new List<SelectListItem>();
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
					ViewBag.ModelTypeList = ListOfModelTypes;
					for (int i = 0; i < Constants.MiniatureTypes.Count; i++)
					{
						SelectListItem Types = new SelectListItem();
						Types.Text = Constants.MiniatureTypes[i];
						Types.Value = i.ToString();
						ListOfModelTypes.Add(Types);
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

		// POST: Models/Create
		[HttpPost]
		[MustBeInRole(Roles = Constants.PressgangerRoleName)] public ActionResult Create(ModelBLL NewModel)
		{
			if (!ModelState.IsValid)
			{
				return View(NewModel);
			}
			try
			{
				int NewModelID = 0;
				using (ContextBLL ctx = new ContextBLL())
				{
					NewModelID = ctx.ModelCreate(NewModel);
				}
				return RedirectToAction("Details", new { id = NewModelID });
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
		}

		// GET: Models/Edit/5
		[MustBeInRole(Roles = Constants.PressgangerRoleName)]public ActionResult Edit(int id)
		{
			List<SelectListItem> ListOfFactions = new List<SelectListItem>();
			List<SelectListItem> ListOfModelTypes = new List<SelectListItem>();
			List<SelectListItem> ListOfModelsToConnect = new List<SelectListItem>();

			ModelBLL miniature = null;
			using (ContextBLL ctx = new ContextBLL())
				try
				{
					miniature = ctx.ModelFindByID(id);
					if (miniature == null)
					{
						return View("NotFound");
					}
					{
						#region Pulldown Stuff
						List<FactionBLL> factions = ctx.FactionsGetAll(0, 100);
						ViewBag.FactionList = ListOfFactions;
						foreach (FactionBLL faction in factions)
						{// Pulldown list for the Factions
							SelectListItem i = new SelectListItem();
							i.Text = faction.FactionName;
							i.Value = faction.FactionID.ToString();
							ListOfFactions.Add(i);
						}

						ViewBag.ModelTypeList = ListOfModelTypes;
						for (int i = 0; i < Constants.MiniatureTypes.Count; i++)
						{//Pulldown list for the ModelType, this is important for point calculations
							SelectListItem Types = new SelectListItem();
							Types.Text = Constants.MiniatureTypes[i];
							Types.Value = i.ToString();
							ListOfModelTypes.Add(Types);
						}

						List<ModelBLL> ModelsToAttach = ctx.ModelsFindByFactionID(miniature.FactionID, Constants.DefaultPageNumber, Constants.DefaultPageSize);
						ViewBag.ListOfModelsToConnect = ListOfModelsToConnect;
						for (int i = 0; i <= ModelsToAttach.Count; i++)
						{//Pulldown list for the ModelType, this is important for point calculations
							SelectListItem parent = new SelectListItem();
							if (0 == i)
							{
								parent.Text = "None";
								parent.Value = i.ToString();
								ListOfModelsToConnect.Add(parent);
							}
							else
							{
								parent.Text = ModelsToAttach[i - 1].ModelName;
								parent.Value = ModelsToAttach[i - 1].ModelID.ToString();
								ListOfModelsToConnect.Add(parent);
							}
						}
						#endregion Pulldown Stuff
					}
				}
				catch (Exception oops)
				{
					Error.Log(oops);
					return View("Error", oops);
				}
			return View(miniature);
		}

		// POST: Models/Edit/5
		[HttpPost]
		[MustBeInRole(Roles = Constants.PressgangerRoleName)] public ActionResult Edit(int id, ModelBLL ModelToEdit)
		{
			if (!ModelState.IsValid)
			{
				return View(ModelToEdit);
			}
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					ModelToEdit.ModelID = id;
					ctx.ModelUpdate(ModelToEdit);
				}
				return RedirectToAction("Details", new { id = ModelToEdit.ModelID });
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
		}

		// GET: Models/Delete/5
		[MustBeInRole(Roles = Constants.PressgangerRoleName)] public ActionResult Delete(int id)
		{
			ModelBLL item = null;
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					item = ctx.ModelFindByID(id);
					if (item == null)
					{
						return View("NotFound");
					}
				}
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
			return View(item);
		}

		// POST: Models/Delete/5
		[HttpPost]
		[MustBeInRole(Roles = Constants.PressgangerRoleName)] public ActionResult Delete(int id, ModelBLL ModelToDelete)
		{
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					ctx.ModelDelete(id);
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
