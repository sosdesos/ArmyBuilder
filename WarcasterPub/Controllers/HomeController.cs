using BusinessLogicLayer;
using ErrorLogger;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WarcasterPub.Models;

namespace WarcasterPub.Controllers
{
	public class HomeController : Controller
	{
		public ActionResult Index()
		{
			return View();
		}

		public ActionResult About()
		{
			ViewBag.Message = "Your application description page.";
			return View();
		}

		public ActionResult Contact()
		{
			ViewBag.Message = "Your contact page.";

			return View();
		}

        [HttpGet]
        public ActionResult Login()
        {
			// displays empty login screen with predefined returnURL
			LoginData ld = new LoginData(); 
			ld.Message = TempData["Message"]?.ToString() ?? "";
            ld.ReturnURL = TempData["ReturnURL"]?.ToString()??@"~/Home";
   //         ld.UserName  = "genericuser";
			//ld.Password  = "genericpassword";
 
            return View(ld);
        }
		[HttpPost]
		public ActionResult Login(LoginData LogIn)
		{
			if (!ModelState.IsValid)
			{
				return View(LogIn);
			}
			// check for username
			if (null == LogIn.UserName )
			{
				LogIn.Message = "Please enter a Username";
				return View(LogIn);
			}
			try
			{
				using (ContextBLL ctx = new ContextBLL())
				{
					UserBLL user = ctx.UserFindByName(LogIn.UserName);
					if (user == null)
					{
						LogIn.Message = $"The Username and password do not match.";
						return View(LogIn);
					}
					string actual = user.Hash;
					//string potential = info.Password + user.Salt ;
					//bool validateduser = System.Web.Helpers.Crypto.VerifyHashedPassword(actual, potential);
					string RetrievedPassword = LogIn.Password;
					string ValidationType = $"ClearText:({user.UserID})";
					bool validateduser = actual == RetrievedPassword;
					if (!validateduser)
					{
						RetrievedPassword = LogIn.Password + user.Salt;
						try
						{
							// this try catches the event where a cleartext user types the 
							// wrong password.  The VerifyHashedPassword will throw exception 
							// because salt is invalid.
							validateduser = System.Web.Helpers.Crypto.VerifyHashedPassword(actual, RetrievedPassword);
							ValidationType = $"HASHED:({user.UserID})";
						}
						catch (Exception)
						{
							validateduser = false;
							ValidationType = $"HASHED:({user.UserID})";

						}
					}
					if (validateduser)
					{
						Session["AUTHUsername"] = user.UserName;
						Session["AUTHRoles"] = user.Rolename;
						Session["AUTHTYPE"] = ValidationType;
						return Redirect(LogIn.ReturnURL);
					}
					LogIn.Message = "The username and Password do not match.";
					return View(LogIn);
				}
			}
			catch (Exception oops)
			{
				Error.Log(oops);
				return View("Error", oops);
			}
		}
		//		public ActionResult Login(LoginData logininfo)
		//        {
		//            using (ContextBLL ctx = new ContextBLL())
		//            {
		//                UserBLL user = ctx.UserFindByName(logininfo.UserName);
		//                if (user == null) 
		//                          {
		//					logininfo.Message = $"The Username '{logininfo.UserName}' does not exist in the database";
		//                             return View(logininfo);
		//}
		//                string actual = user.Hash;
		//                //string potential = user.Salt + info.Password;
		//                  string potential = logininfo.Password;
		//                //bool validateduser = System.Web.Helpers.Crypto.VerifyHashedPassword(actual,potential);
		//                if (potential == actual)
		//                {
		//                    Session["AUTHUsername"] = user.UserName;
		//                    Session["AUTHRoles"] = user.RoleID;
		//                    return Redirect(logininfo.ReturnURL);
		//                }
		//				logininfo.Message = "The password was incorrect";  
		//                return View(logininfo);           
		//            }
		//        }
		[HttpGet]
		public ActionResult Register()
		{
			RegisterData rd = new RegisterData();

			if (rd.Password != rd.ConfirmPassword)
			{
				rd.Message = "The password did not match with confirmation password";
			}

			return View(rd);
		}
		[HttpPost]
		public ActionResult Register(RegisterData NewUser)
		{
			if (!ModelState.IsValid)
			{
				return View(NewUser);
			}
			if (NewUser.UserName == null)
			{
				NewUser.Message = "Please enter a valid Username";
				return View(NewUser);
			}
			else if (NewUser.EmailAddress == null)
			{
				NewUser.Message = "Please enter a valid Emailadress";
				return View(NewUser);
			}
			else if (NewUser.Password != NewUser.ConfirmPassword)
			{
				NewUser.Message = "The password did not match with the confirmation password";
				return View(NewUser);
			}
			else
			{
				try
				{
					using (ContextBLL ctx = new ContextBLL())
					{
						UserBLL User = ctx.UserFindByName(NewUser.UserName);
						if (User != null)
						{
							NewUser.Message = $"Your username '{NewUser.UserName}' already exists in the database";
							return View(NewUser);
						}
						User = new UserBLL();
						User.UserName = NewUser.UserName;
						User.EmailAddress = NewUser.EmailAddress;
						User.RoleID = 6;
						User.Rolename = "User";
						User.Salt = System.Web.Helpers.Crypto.GenerateSalt(Constants.SaltSize);
						User.Hash = System.Web.Helpers.Crypto.HashPassword(NewUser.Password + User.Salt);
						int id = ctx.UserCreate(User);
						Session["AUTHUsername"] = User.UserName;
						Session["AUTHRoles"] = User.Rolename;
						Session["AUTHTYPE"] = "HASHED";
					}
				}
				catch (Exception oops)
				{
					Error.Log(oops);
					return View("Error", oops);
				}
				return RedirectToAction("Index");
			}
		}
		[HttpGet]
		public ActionResult Logout()
		{
			Session.Remove("AUTHUsername");
			Session.Remove("AUTHRoles");
			return RedirectToAction("Index");
		}

	}
}