using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BusinessLogicLayer;

namespace WarcasterPub.Controllers
{
    public class FactionsController : Controller
    {
        // GET: Factions
        public ActionResult Index()
        {
			List<FactionBLL> items = null;
			using (ContextBLL ctx = new ContextBLL())
			{
				items = ctx.FactionsGetAll(0, 100);
			}
			return View(items);
        }

        // GET: Factions/Details/5
        public ActionResult Details(int id)
		{
			FactionBLL item = null;
			using (ContextBLL ctx = new ContextBLL())
			{
				item = ctx.FactionFindByID(id);
			}
			return View(item);
		}

		// GET: Factions/Create
		public ActionResult Create()
        {
            return View();
        }

        // POST: Factions/Create
        [HttpPost]
        public ActionResult Create(FactionBLL NewFaction)
		{
			try
			{
				int NewFactionID = 0;
				using (ContextBLL ctx = new ContextBLL())
				{
					NewFactionID = ctx.FactionCreate(NewFaction);
				}
				return RedirectToAction("Details", new { id = NewFactionID });
			}
			catch (Exception oops)
			{
				return View("error", oops);
			}
		}

		// GET: Factions/Edit/5
		public ActionResult Edit(int id)
		{
			FactionBLL item = null;
			using (ContextBLL ctx = new ContextBLL())
			{
				item = ctx.FactionFindByID(id);
			}
			return View(item);
		}

		// POST: Factions/Edit/5
		[HttpPost]
		public ActionResult Edit(int id, FactionBLL FactionToEdit)
		{
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					FactionToEdit.FactionID = id;
					ctx.FactionUpdate(FactionToEdit);
				}
				return RedirectToAction("Details", new { id = FactionToEdit.FactionID });
			}
			catch (Exception oops)
			{
				return View("error", oops);
			}
		}

		// GET: Factions/Delete/5
		public ActionResult Delete(int id)
		{
			FactionBLL item = null;
			using (ContextBLL ctx = new ContextBLL())
			{
				item = ctx.FactionFindByID(id);
			}
			return View(item);
		}

		// POST: Factions/Delete/5
		[HttpPost]
        public ActionResult Delete(int id, FactionBLL FactionToDelete)
		{
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
				return View("error", oops);
			}
		}
	}
}
