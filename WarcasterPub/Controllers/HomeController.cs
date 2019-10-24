using BusinessLogicLayer;
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
            ld.Message   = TempData["Message"]?.ToString()??"";
            ld.ReturnURL = TempData["ReturnURL"]?.ToString()??@"~/Home";
            ld.UserName  = "genericuser";
			ld.Password  = "genericpassword";
 
            return View(ld);
        }
		[HttpPost]

		public ActionResult Login(LoginData logininfo)
        {
            using (ContextBLL ctx = new ContextBLL())
            {
                UserBLL user = ctx.UserFindByName(logininfo.UserName);
                if (user == null) 
                          {
					logininfo.Message = $"The Username '{logininfo.UserName}' does not exist in the database";
                             return View(logininfo);
}
                string actual = user.Hash;
                //string potential = user.Salt + info.Password;
                  string potential = logininfo.Password;
                //bool validateduser = System.Web.Helpers.Crypto.VerifyHashedPassword(actual,potential);
                  bool validateduser = potential == actual;
                if (validateduser)
                {
                    Session["AUTHUsername"] = user.UserName;
                    Session["AUTHRoles"] = user.RoleID;
                    return Redirect(logininfo.ReturnURL);
                }
				logininfo.Message = "The password was incorrect";  
                return View(logininfo);           
            }
        }

	}
}