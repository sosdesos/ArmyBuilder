using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
	public class ArmyDAL
	{   //this class stores all the data from the Armies table
		public int ArmyID			{ get; set; }
		public string ArmyName		{ get; set; }
		public int UserID			{ get; set; }
		public string UserName		{ get; set; }
		public string Comments		{ get; set; }
		public int FactionID		{ get; set; }
		public string FactionName	{ get; set; }

		public override string ToString()
		{
			return $"{ArmyID,5} {ArmyName,15} {UserName,10} {Comments,10} {FactionName, 10}";
		}
	}
}
