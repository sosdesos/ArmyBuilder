using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
	public class UserBLL
	{
		public int    UserID {      get; set; }
		public string UserName {    get; set; }
		public string Hash {        get; set; }
		public string Salt {        get; set; }
		public string EmailAdress { get; set; }
		public int    RoleID {      get; set; }
		public string Rolename {    get; set; }
		public UserBLL(UserDAL User)
		{	// we can populate the class with values from the Data access layer
			UserID =      User.UserID;
			UserName =    User.UserName;
			Hash =        User.Hash;
			Salt =        User.Salt;
			EmailAdress = User.EmailAdress;
			RoleID =      User.RoleID;
			Rolename =    User.Rolename;
		}
		public UserBLL()
		{
			//The default constructor(required for MVC)
		}
		public UserDAL ToDAL()
		{	//Makest it easy to pass values back to the data access layer
			UserDAL ReturnValue = new UserDAL();
			ReturnValue.UserID      = UserID;
			ReturnValue.UserName    = UserName;
			ReturnValue.Hash        = Hash;
			ReturnValue.Salt        = Salt;
			ReturnValue.EmailAdress = EmailAdress;
			ReturnValue.RoleID      = RoleID;
			return ReturnValue;
		}

	}
}
