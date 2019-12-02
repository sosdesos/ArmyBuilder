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
    [MustBeInRole(Roles = Constants.AdministratorRoleName)]public class RolesController : Controller
    {// This part is only available to Admins and Developers
        // GET: Roles
        public ActionResult Index()
        {
			List<RoleBLL> items = null;
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					items = ctx.RoleGetAll(0, 100);
				}
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
			return View(items);
		}

        // GET: Roles/Details/5
        public ActionResult Details(int id)
        {
			RoleBLL item = null;
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					item = ctx.RoleFindByID(id);
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

		// GET: Roles/Create
		[MustBeInRole(Roles = Constants.DeveloperRoleName)] public ActionResult Create()
        {// because we hardcoded roles in our code we dont want anyone but developers to be able to edit roles
            return View();
        }

        // POST: Roles/Create
        [HttpPost]
		[MustBeInRole(Roles = Constants.DeveloperRoleName)] public ActionResult Create(RoleBLL NewRole)
		{// because we hardcoded roles in our code we dont want anyone but developers to be able to edit roles
			if (!ModelState.IsValid)
			{
				return View(NewRole);
			}
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
				Error.Log(oops);
				return View("Error", oops);
			}
		}

		// GET: Roles/Edit/5
		[MustBeInRole(Roles = Constants.DeveloperRoleName)]	public ActionResult Edit(int id)
		{// because we hardcoded roles in our code we dont want anyone but developers to be able to edit roles
			RoleBLL item = null;
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					item = ctx.RoleFindByID(id);
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

        // POST: Roles/Edit/5
        [HttpPost]
		[MustBeInRole(Roles = Constants.DeveloperRoleName)] public ActionResult Edit(int id, RoleBLL RoleToEdit)
		{// because we hardcoded roles in our code we dont want anyone but developers to be able to edit roles
			if (!ModelState.IsValid)
			{
				return View(RoleToEdit);
			}
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
				Error.Log(oops);
				return View("Error", oops);
			}
		}

		// GET: Roles/Delete/5
		[MustBeInRole(Roles = Constants.DeveloperRoleName)] public ActionResult Delete(int id)
		{// because we hardcoded roles in our code we dont want anyone but developers to be able to edit roles
			RoleBLL item = null;
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					item = ctx.RoleFindByID(id);
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

        // POST: Roles/Delete/5
        [HttpPost]
		[MustBeInRole(Roles = Constants.DeveloperRoleName)] public ActionResult Delete(int id, RoleBLL RoleToDelete)
		{// because we hardcoded roles in our code we dont want anyone but developers to be able to edit roles
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
				Error.Log(oops);
				return View("Error", oops);
			}
		}
    }
}
