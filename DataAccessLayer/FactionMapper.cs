using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
	public class FactionMapper : Mapper
	{
		int OffsetToFactionID;     // Column 0 (hopefully)
		int OffsetToFactionName;   // Column 1 (hopefully)
		int OffsetToBackGround;    // Column 2 (Hopefully)
		public FactionMapper(SqlDataReader reader)
		{   //Check if the offset is as expected and return that value if so.
			//We run this once so we know the mapper is workin as expected
			OffsetToFactionID   = CheckOffset(reader, "FactionID", 0);
			OffsetToFactionName = CheckOffset(reader, "FactionName", 1);
			OffsetToBackGround  = CheckOffset(reader, "BackGround", 2);
		}
		public FactionDAL ToFaction(SqlDataReader reader)
		{   // use the checked offset to write the info to appropriate fields
			FactionDAL ReturnValue = new FactionDAL();
			ReturnValue.FactionID   = reader.GetInt32(OffsetToFactionID);
			ReturnValue.FactionName = reader.GetString(OffsetToFactionName);
			ReturnValue.BackGround = reader.GetString(OffsetToBackGround);
			return ReturnValue;
		}
	}
}
