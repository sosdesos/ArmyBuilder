using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using BusinessLogicLayer;
using ErrorLogger;
using WarcasterPub.Models;

namespace WarcasterPub.Controllers
{
	[MustBeInRole(Roles = Constants.NormalRoleName)] public class UsersController : Controller
    {
		// GET: Users
		[MustBeInRole(Roles = Constants.AdministratorRoleName)] public ActionResult Index()
        {
			List<UserBLL> items = null;
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					items = ctx.UserGetAll(0, 100);
				}
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
			return View(items);
        }

        // GET: Users/Details/5
        public ActionResult Details(int id)
        {
			UserBLL item = null;
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					item = ctx.UserFindByID(id);
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

		// GET: Users/Create
		[MustBeInRole(Roles = Constants.AdministratorRoleName)] public ActionResult Create()
        {
			List<SelectListItem> item = new List<SelectListItem>();
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					List<RoleBLL> roles = ctx.RoleGetAll(0, 100);
					ViewBag.ListItems = item;
					foreach (RoleBLL role in roles)
					{
						SelectListItem i = new SelectListItem();
						i.Text = role.RoleName;
						i.Value = role.RoleID.ToString();
						item.Add(i);
					}
				}
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
			return View();
        }

        // POST: Users/Create
        [HttpPost]
		[MustBeInRole(Roles = Constants.AdministratorRoleName)] public ActionResult Create(UserBLL NewUser)
        {
            try
            {
				if (!ModelState.IsValid)
				{
					return View(NewUser);
				}
				int NewUserID = 0;
				using (ContextBLL ctx = new ContextBLL())
				{
					NewUserID = ctx.UserCreate(NewUser);
				}
				return RedirectToAction("Details", new { id = NewUserID });
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
		}

		// GET: Users/Edit/5
		[MustBeInRole(Roles = Constants.AdministratorRoleName)] public ActionResult Edit(int id)
        {
			UserBLL User = null;
			List<SelectListItem> item = new List<SelectListItem>();
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					User = ctx.UserFindByID(id);
					if (User == null)
					{
						return View("NotFound");
					}
					List<RoleBLL> roles = ctx.RoleGetAll(0, 100);
					ViewBag.ListItems = item;
					foreach (RoleBLL role in roles)
					{
						SelectListItem i = new SelectListItem();
						i.Text = role.RoleName;
						i.Value = role.RoleID.ToString();
						item.Add(i);
					}
				}
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
			return View(User);
        }

        // POST: Users/Edit/5
        [HttpPost]
		[MustBeInRole(Roles = Constants.AdministratorRoleName)] public ActionResult Edit(int id, UserBLL UserToEdit)
        {
			if (!ModelState.IsValid)
			{
				return View(UserToEdit);
			}
			try
            {
				using (ContextBLL ctx = new ContextBLL())
				{
					UserToEdit.UserID = id;
					ctx.UserUpdate(UserToEdit);
				}
				return RedirectToAction("Details", new { id = UserToEdit.UserID });
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
		}

		// GET: Users/Delete/5
		[MustBeInRole(Roles = Constants.AdministratorRoleName)] public ActionResult Delete(int id)
        {
			UserBLL item = null;
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					item = ctx.UserFindByID(id);
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

        // POST: Users/Delete/5
        [HttpPost]
		[MustBeInRole(Roles = Constants.AdministratorRoleName)] public ActionResult Delete(int id, UserBLL UserToDelete)
        {
            try
            {
				using (ContextBLL ctx = new ContextBLL())
				{
					ctx.UserDelete(id);
				}
				return RedirectToAction("Index");
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
		}

		// GET: Users/MyDetails
		public ActionResult MyDetails()
		{// to prevent anyone from messing with userinfo they shouldnt I made a details for the user himself
			UserBLL item = null;
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{//For security we take the ID from User.Identity instead of from a form
					item = ctx.UserFindByName(User.Identity.Name);
					if (item == null)
					{// because we pull the info from User.Identity we should never see this, but it never hurts
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

		// GET: Users/MyEdit/5
		public ActionResult MyEdit()
		{// gives people the oppertunity to edit their own data. 
			UserBLL Me = null;
			List<SelectListItem> item = new List<SelectListItem>();
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{// we take the UserID from User.Identity for security reasons.
					Me = ctx.UserFindByName(User.Identity.Name);
					if (Me == null)
					{//check if a record is there.
						return View("NotFound");
					}
				}
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
			return View(Me);
		}

		// POST: Users/MyEdit/5
		[HttpPost]
		public ActionResult MyEdit( UserBLL UserToEdit)
		{// check if form is validated
			if (!ModelState.IsValid)
			{
				return View(UserToEdit);
			}
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{// we replace the UserID with the one that fits the User.Identity name to be sure we 
					//have the right one
					UserBLL me = ctx.UserFindByName(User.Identity.Name);
					UserToEdit.UserID = me.UserID;
					ctx.UserUpdate(UserToEdit);
				}
				return RedirectToAction("MyDetails");
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
		}
		// GET: Users/Delete/5
		public ActionResult MyDelete()
		{// users can delete their own accounts.
			UserBLL item = null;
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{// to make sure no shanannigans are at foot we grab the userID by User.Identity.Name
					item = ctx.UserFindByName(User.Identity.Name);
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

		// POST: Users/Delete/5
		[HttpPost]
		public ActionResult MyDelete(UserBLL Me )
		{// because we dont want anyone to delete an account thats not theirs we dont even look at the info 
			// instead we get the info from the user.identity and make it harder to bypass our security
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					UserBLL me = ctx.UserFindByName(User.Identity.Name);
					ctx.UserDelete(me.UserID);
				}// when they deleted their account we redirect them to the home index, where they could make
				// a new account or contemplate the errors in their ways for leaving us.
				return RedirectToAction("Logout", "Home");
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
		}
	}
}
