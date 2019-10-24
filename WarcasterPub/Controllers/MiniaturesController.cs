using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BusinessLogicLayer;

namespace WarcasterPub.Controllers
{
	public class MiniaturesController : Controller
	{
		// GET: Models
		public ActionResult Index()
		{
			List<ModelBLL> items = null;
			using (ContextBLL ctx = new ContextBLL())
			{
				items = ctx.ModelsGetAll(0, 100);
			}
			return View(items);
		}

		// GET: Models/Details/5
		public ActionResult Details(int id)
		{
			ModelBLL item = null;
			using (ContextBLL ctx = new ContextBLL())
			{
				item = ctx.ModelFindByID(id);
			}
			return View(item);
		}

		// GET: Models/Create
		public ActionResult Create()
		{
			return View();
		}

		// POST: Models/Create
		[HttpPost]
		public ActionResult Create(ModelBLL NewModel)
		{
			try
			{
				int NewModelID = 0;
				using (ContextBLL ctx = new ContextBLL())
				{
					NewModelID = ctx.ModelCreate(NewModel);
				}
				return RedirectToAction("Details", new { id = NewModelID });
			}
			catch(Exception oops)
			{
				return View("error", oops);
			}
		}

		// GET: Models/Edit/5
		public ActionResult Edit(int id)
		{
			ModelBLL item = null;
			using (ContextBLL ctx = new ContextBLL())
			{
				item = ctx.ModelFindByID(id);
			}
			return View(item);
		}

		// POST: Models/Edit/5
		[HttpPost]
		public ActionResult Edit(int id, ModelBLL ModelToEdit)
		{
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
				return View("error", oops);
			}
		}

		// GET: Models/Delete/5
		public ActionResult Delete(int id)
		{
			ModelBLL item = null;
			using (ContextBLL ctx = new ContextBLL())
			{
				item = ctx.ModelFindByID(id);
			}
			return View(item);
		}

		// POST: Models/Delete/5
		[HttpPost]
		public ActionResult Delete(int id, ModelBLL ModelToDelete)
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
				return View("error", oops);
			}
		}
	}
}
