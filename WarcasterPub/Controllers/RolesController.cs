using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BusinessLogicLayer;


namespace WarcasterPub.Controllers
{
    public class RolesController : Controller
    {
        // GET: Roles
        public ActionResult Index()
        {
			List<RoleBLL> items = null;
			using (ContextBLL ctx = new ContextBLL())
			{
				items = ctx.RoleGetAll(0, 100);
			}
			return View(items);
		}

        // GET: Roles/Details/5
        public ActionResult Details(int id)
        {
			RoleBLL item = null;
			using (ContextBLL ctx = new ContextBLL())
			{
				item = ctx.RoleFindByID(id);
			}
			return View(item);
		}

        // GET: Roles/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Roles/Create
        [HttpPost]
        public ActionResult Create(RoleBLL NewRole)
        {
            try
            {
				int NewRoleID = 0;
				using (ContextBLL ctx = new ContextBLL())
				{
					NewRoleID = ctx.RoleCreate(NewRole.RoleName);
				}
				return RedirectToAction("Details", new { id = NewRoleID });
            }
			catch (Exception oops)
			{
				return View("error", oops);
			}
		}

        // GET: Roles/Edit/5
        public ActionResult Edit(int id)
        {
			RoleBLL item = null;
			using (ContextBLL ctx = new ContextBLL())
			{
				item = ctx.RoleFindByID(id);
			}
			return View(item);
        }

        // POST: Roles/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, RoleBLL RoleToEdit)
        {
            try
            {
				using (ContextBLL ctx = new ContextBLL())
				{
					ctx.RoleUpdate(id, RoleToEdit.RoleName);
				}
				return RedirectToAction("Details", new { id = RoleToEdit.RoleID });
            }
			catch (Exception oops)
			{
				return View("error", oops);
			}
		}

        // GET: Roles/Delete/5
        public ActionResult Delete(int id)
        {
			RoleBLL item = null;
			using (ContextBLL ctx = new ContextBLL())
			{
				item = ctx.RoleFindByID(id);
			}
			return View(item);
		}

        // POST: Roles/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, RoleBLL RoleToDelete)
        {
            try
            {
				using (ContextBLL ctx = new ContextBLL())
				{
					ctx.RoleDelete(id);
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
