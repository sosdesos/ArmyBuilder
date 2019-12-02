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
	{// data from the factions table.
		public int FactionID { get; set; }
		[Required]
		public string FactionName { get; set; }
		[Required]
		public string BackGround { get; set; }
		public FactionBLL(FactionDAL Faction)
		{// populate properties from the DAL
			FactionID   = Faction.FactionID;
			FactionName = Faction.FactionName;
			BackGround  = Faction.BackGround;
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
			ReturnValue.BackGround  = BackGround;
			return ReturnValue;
		}
	}
}
