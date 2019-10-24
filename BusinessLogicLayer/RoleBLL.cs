using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
	public class RoleBLL
	{
		public int RoleID { get; set; }
		public string RoleName { get; set; }
		public RoleBLL(DataAccessLayer.RoleDAL role)
		{
			RoleID = role.RoleID;
			RoleName = role.RoleName;
		}
		public RoleBLL()
		{
			//The default constructor(required for MVC)
		}
		public RoleDAL ToDAL()
		{   //Makest it easy to pass values back to the data access layer
			RoleDAL ReturnValue = new RoleDAL();
			ReturnValue.RoleID   = RoleID;
			ReturnValue.RoleName = RoleName;
			return ReturnValue;
		}
		public override string ToString()
		{// I use this to test my BLL in console testing
			return $"{RoleID,5} {RoleName}";
		}
	}
}
