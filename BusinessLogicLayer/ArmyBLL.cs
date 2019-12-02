using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
	public class ArmyBLL
	{// info from the army table.
		public int ArmyID			{ get; set; }
		[Required]
		public string ArmyName		{ get; set; }
		public int UserID			{ get; set; }
		public string UserName		{ get; set; }
		[Required]
		public string Comments		{ get; set; }
		public int FactionID		{ get; set; }
		public string FactionName	{ get; set; }

		public ArmyBLL(ArmyDAL army)
		{   // we can populate the class with values from the Data access layer
			ArmyID      = army.ArmyID;
			ArmyName    = army.ArmyName;
			UserID      = army.UserID;
			UserName    = army.UserName;
			Comments    = army.Comments;
			FactionID   = army.FactionID;
			FactionName = army.FactionName;
		}
		public ArmyBLL(FullArmyData army)
		{   // we can populate the class with values from the Data access layer or from MVC.
			ArmyID    = army.ArmyID;
			ArmyName = army.ArmyName;
			UserID = army.UserID;
			Comments  = army.Comments;
			FactionID = army.FactionID;
		}
		public ArmyBLL()
		{
			//The default constructor(required for MVC)
		}
		public ArmyDAL ToDAL()
		{   //Makest it easy to pass values back to the data access layer
			ArmyDAL ReturnValue     = new ArmyDAL();
			ReturnValue.ArmyID      = ArmyID;
			ReturnValue.ArmyName    = ArmyName;
			ReturnValue.UserID      = UserID;
			ReturnValue.UserName    = UserName;
			ReturnValue.Comments    = Comments;
			ReturnValue.FactionID   = FactionID;
			ReturnValue.FactionName = FactionName;
			return ReturnValue;
		}

	}
}

