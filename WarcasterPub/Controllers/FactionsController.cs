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
	public class FactionsController : Controller
    {
        // GET: Factions
        public ActionResult Index()
        {//shows all factions. not much to say.
			List<FactionBLL> items = null;
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					items = ctx.FactionsGetAll(0, 100);
				}
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
			return View(items);
        }

        // GET: Factions/Details/5
        public ActionResult Details(int id)
		{//shows detailed info about the faction.
			FactionBLL item = null;
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					item = ctx.FactionFindByID(id);
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

		// GET: Factions/Create
		[MustBeInRole(Roles = Constants.PressgangerRoleName)] public ActionResult Create()
        {//pressgangers and up are allowed to create new factions.
            return View();
        }

        // POST: Factions/Create
        [HttpPost]
		[MustBeInRole(Roles = Constants.PressgangerRoleName)] public ActionResult Create(FactionBLL NewFaction)
		{// check if form is validated.
			if (!ModelState.IsValid)
			{
				return View(NewFaction);
			}
			try
			{//attempts to create a new record in the database, then return to index
				int NewFactionID = 0;
				using (ContextBLL ctx = new ContextBLL())
				{
					NewFactionID = ctx.FactionCreate(NewFaction);
				}
				return RedirectToAction("Details", new { id = NewFactionID });
			}
			catch (Exception oops)
			{//if something goes wrong we log the error and redirect to the error page.
				Error.Log(oops);
				return View("Error", oops);
			}
		}

		// GET: Factions/Edit/5
		[MustBeInRole(Roles = Constants.PressgangerRoleName)] public ActionResult Edit(int id)
		{// pressgangers and up can also edit the factions
			FactionBLL item = null;
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					item = ctx.FactionFindByID(id);
					if (item == null)
					{// if the record is not found redirect the user
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

		// POST: Factions/Edit/5
		[HttpPost]
		[MustBeInRole(Roles = Constants.PressgangerRoleName)] public ActionResult Edit(int id, FactionBLL FactionToEdit)
		{//check if form is validated
			if (!ModelState.IsValid)
			{
				return View(FactionToEdit);
			}
			try
			{// update faction info
				using (ContextBLL ctx = new ContextBLL())
				{
					FactionToEdit.FactionID = id;
					ctx.FactionUpdate(FactionToEdit);
				}
				return RedirectToAction("Details", new { id = FactionToEdit.FactionID });
			}
			catch (Exception oops)
			{//if something goes wrong we log and redirect
				Error.Log(oops);
				return View("Error", oops);
			}
		}

		// GET: Factions/Delete/5
		[MustBeInRole(Roles = Constants.PressgangerRoleName)] public ActionResult Delete(int id)
		{//pressgangers and up can delete the faction
			FactionBLL item = null;
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{// check if the record exist
					item = ctx.FactionFindByID(id);
					if (item == null)
					{
						return View("NotFound");
					}
				}
			}
			catch (Exception oops)
			{//log and redirect on error during retrieval
				Error.Log(oops);
				return View("Error", oops);
			}
			return View(item);// show info to confirm the right info is deleted
		}

		// POST: Factions/Delete/5
		[HttpPost]
		[MustBeInRole(Roles = Constants.PressgangerRoleName)] public ActionResult Delete(int id, FactionBLL FactionToDelete)
		{// basic delete stuff.
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					ctx.FactionDelete(id);
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
