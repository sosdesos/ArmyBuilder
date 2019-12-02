using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer
{
	public class ArmyModelRecordBLL
	{// this class contains the info we need for the many to many table.
		// we only use this to go down to DAL=>SQL, up we want the info for the miniature too.
		public int ArmyID { get; set; }
		public int ModelID { get; set; }
		public int Quantity { get; set; }
		public int FullSquats { get; set; }
	public ArmyModelRecordBLL()
		{
		//Default constructor required for MVC
		}

		public ArmyModelRecordDAL ToDAL()
		{	//this makes it easy to transfer the data down to the DAL
			ArmyModelRecordDAL ReturnValue = new ArmyModelRecordDAL();
			ReturnValue.ArmyID		= ArmyID;
			ReturnValue.ModelID		= ModelID;
			ReturnValue.Quantity	= Quantity;
			ReturnValue.FullSquats	= FullSquats;
			return ReturnValue;
		}

	}
}
