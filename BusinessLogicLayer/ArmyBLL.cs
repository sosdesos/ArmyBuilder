using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
	public class ArmyBLL
	{
		public int ArmyID { get; set; }
		public string ArmyName { get; set; }
		public int UserID { get; set; }
		public string UserName { get; set; }
		public string Comments { get; set; }

		public ArmyBLL(ArmyDAL army)
		{   // we can populate the class with values from the Data access layer
			ArmyID   = army.ArmyID;
			ArmyName = army.ArmyName;
			UserID   = army.UserID;
			UserName = army.UserName;
			Comments = army.Comments;

		}
		public ArmyBLL()
		{
			//The default constructor(required for MVC)
		}
		public ArmyDAL ToDAL()
		{   //Makest it easy to pass values back to the data access layer
			ArmyDAL ReturnValue  = new ArmyDAL();
			ReturnValue.ArmyID   = ArmyID;
			ReturnValue.ArmyName = ArmyName;
			ReturnValue.UserID   = UserID;
			ReturnValue.UserName = UserName;
			ReturnValue.Comments = Comments;
			return ReturnValue;
		}

	}
}

