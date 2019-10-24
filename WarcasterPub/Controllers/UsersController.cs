using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BusinessLogicLayer;


namespace WarcasterPub.Controllers
{
    public class UsersController : Controller
    {
        // GET: Users
        public ActionResult Index()
        {
			List<UserBLL> items = null;
			using (ContextBLL ctx = new ContextBLL())
			{
				items = ctx.UserGetAll(0, 100);
			}
			return View(items);
        }

        // GET: Users/Details/5
        public ActionResult Details(int id)
        {
			UserBLL item = null;
			using (ContextBLL ctx = new ContextBLL())
			{
				item = ctx.UserFindByID(id);
			}
			return View(item);
        }

        // GET: Users/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Users/Create
        [HttpPost]
        public ActionResult Create(UserBLL NewUser)
        {
            try
            {
				int NewUserID = 0;
				using (ContextBLL ctx = new ContextBLL())
				{
					NewUserID = ctx.UserCreate(NewUser);
				}
				return RedirectToAction("Details", new { id = NewUserID });
			}
            catch
            {
                return View();
            }
        }

        // GET: Users/Edit/5
        public ActionResult Edit(int id)
        {
			UserBLL item = null;
			using (ContextBLL ctx = new ContextBLL())
			{
				item = ctx.UserFindByID(id);
			}
			return View(item);
        }

        // POST: Users/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, UserBLL UserToEdit)
        {
            try
            {
				using (ContextBLL ctx = new ContextBLL())
				{
					UserToEdit.UserID = id;
					ctx.UserUpdate(UserToEdit);
				}
				return RedirectToAction("Details", new { id = UserToEdit.UserID });
			}
            catch
            {
                return View();
            }
        }

        // GET: Users/Delete/5
        public ActionResult Delete(int id)
        {
			UserBLL item = null;
			using (ContextBLL ctx = new ContextBLL())
			{
				item = ctx.UserFindByID(id);
			}
			return View(item);
        }

        // POST: Users/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, UserBLL UserToDelete)
        {
            try
            {
				using (ContextBLL ctx = new ContextBLL())
				{
					ctx.UserDelete(id);
				}
				return RedirectToAction("Index");
			}
            catch
            {
                return View();
            }
        }
    }
}
