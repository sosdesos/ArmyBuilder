using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BusinessLogicLayer;

namespace WarcasterPub.Controllers
{
    public class ArmiesController : Controller
    {
        // GET: Armies
        public ActionResult Index()
		{
			List<ArmyBLL> items = null;
			using (ContextBLL ctx = new ContextBLL())
			{
				items = ctx.ArmiesGetAll(0, 100);
			}
			return View(items);
		}

		// GET: Armies/Details/5
		public ActionResult Details(int id)
		{
			ArmyBLL item = null;
			using (ContextBLL ctx = new ContextBLL())
			{
				item = ctx.ArmyFindByID(id);
			}
			return View(item);
		}

		// GET: Armies/Create
		public ActionResult Create()
        {
            return View();
        }

        // POST: Armies/Create
        [HttpPost]
		public ActionResult Create(ArmyBLL NewArmy)
		{
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
				return View("error", oops);
			}
		}

		// GET: Armies/Edit/5
		public ActionResult Edit(int id)
		{
			ArmyBLL item = null;
			using (ContextBLL ctx = new ContextBLL())
			{
				item = ctx.ArmyFindByID(id);
			}
			return View(item);
		}

		// POST: Armies/Edit/5
		[HttpPost]
        public ActionResult Edit(int id, ArmyBLL ArmyToEdit)
		{
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
				return View("error", oops);
			}
		}

		// GET: Armies/Delete/5
		public ActionResult Delete(int id)
		{
			ArmyBLL item = null;
			using (ContextBLL ctx = new ContextBLL())
			{
				item = ctx.ArmyFindByID(id);
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
				return View("error", oops);
			}
		}
    }
}
