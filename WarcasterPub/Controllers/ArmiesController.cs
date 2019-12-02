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
	[MustBeInRole(Roles = Constants.DeveloperRoleName)] public class ArmiesController : Controller
    {
        // GET: Armies
        public ActionResult Index()
		{
			List<ArmyBLL> armies = null;
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					armies = ctx.ArmiesGetAll(Constants.DefaultPageNumber, Constants.DefaultPageSize);
				}
			}
			catch(Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
			return View(armies);
		}

		// GET: Armies/Details/5
		public ActionResult Details(int id)
		{
			ArmyBLL army = null;
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					army = ctx.ArmyFindByID(id);
				}
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
			return View(army);
		}

		// GET: Armies/Create
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

        // POST: Armies/Create
        [HttpPost]
		public ActionResult Create(ArmyBLL NewArmy)
		{
			if (!ModelState.IsValid)
			{
				return View(NewArmy);
			}
			try
			{
				int NewArmyID = 0;
				using (ContextBLL ctx = new ContextBLL())
				{
					NewArmyID = ctx.ArmyCreate(NewArmy);
				}
				return RedirectToAction("Details", new { id = NewArmyID });
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
		}

		// GET: Armies/Edit/5
		public ActionResult Edit(int id)
		{
			ArmyBLL item = null;
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					item = ctx.ArmyFindByID(id);
				}
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
			return View(item);
		}

		// POST: Armies/Edit/5
		[HttpPost]
        public ActionResult Edit(int id, ArmyBLL ArmyToEdit)
		{
			if (!ModelState.IsValid)
			{
				return View(ArmyToEdit);
			}
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					ArmyToEdit.ArmyID = id;
					ctx.ArmyUpdate(ArmyToEdit);
				}
				return RedirectToAction("Details", new { id = ArmyToEdit.ArmyID });
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
		}

		// GET: Armies/Delete/5
		public ActionResult Delete(int id)
		{
			ArmyBLL item = null;
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					item = ctx.ArmyFindByID(id);
				}
			}
			catch(Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
			return View(item);
		}

		// POST: Armies/Delete/5
		[HttpPost]
		public ActionResult Delete(int id, ArmyBLL ArmyToDelete)
		{
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
