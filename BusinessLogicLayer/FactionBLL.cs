using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
	public class FactionBLL
	{
		public int FactionID { get; set; }
		public string FactionName { get; set; }
		public FactionBLL(FactionDAL Faction)
		{
			FactionID   = Faction.FactionID;
			FactionName = Faction.FactionName;
		}
		public FactionBLL()
		{
			//The default constructor(required for MVC)
		}
		public FactionDAL ToDAL()
		{   //Makest it easy to pass values back to the data access layer
			FactionDAL ReturnValue = new FactionDAL();
			ReturnValue.FactionID   = FactionID;
			ReturnValue.FactionName = FactionName;
			return ReturnValue;
		}
	}
}
