using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
	public class ArmyMapper : Mapper
	{
		int OffsetToArmyID;     // Column 0 (hopefully)
		int OffsetToArmyName;   // Column 1 and so on(hopefully) 
		int OffsetToUserID;
		int OffsetToUserName;
		int OffsetToComments;
		int OffsetToFactionID;
		int OffsetToFactionName;
		public ArmyMapper(SqlDataReader reader)
		{   //Check if the offset is as expected and return that value if so.
			//We run this once so we know the mapper is workin as expected
			OffsetToArmyID		= CheckOffset(reader, "ArmyID",      0);
			OffsetToArmyName	= CheckOffset(reader, "ArmyName",    1);
			OffsetToUserID		= CheckOffset(reader, "UserID",      2);
			OffsetToUserName	= CheckOffset(reader, "UserName",    3);
			OffsetToComments	= CheckOffset(reader, "Comments",    4);
			OffsetToFactionID	= CheckOffset(reader, "FactionID",   5);
			OffsetToFactionName = CheckOffset(reader, "FactionName", 6);
		}
		public ArmyDAL ToArmy(SqlDataReader reader)
		{   // lets use the checked column numbers to write the info to appropriate fields
			ArmyDAL ReturnValue = new ArmyDAL();
			ReturnValue.ArmyID      = reader.GetInt32( OffsetToArmyID);
			ReturnValue.ArmyName    = reader.GetString(OffsetToArmyName);
			ReturnValue.UserID      = reader.GetInt32( OffsetToUserID);
			ReturnValue.UserName    = reader.GetString(OffsetToUserName);
			ReturnValue.Comments    = reader.GetString(OffsetToComments);
			ReturnValue.FactionID   = reader.GetInt32( OffsetToFactionID);
			ReturnValue.FactionName = reader.GetString(OffsetToFactionName);
			return ReturnValue;
		}
	}
}