using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
	public class FactionDAL
	{   //this class stores all the data from the Factions table
		public int FactionID { get; set; }
		public string FactionName { get; set; }

		public override string ToString()
		{
			return $"{FactionID,5} {FactionName}";
		}
	}
}

