using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
	public class RoleMapper : Mapper
	{
		int OffsetToRoleID;     // Column 0 (hopefully)
		int OffsetToRoleName;   // Column 1 (hopefully)
		public RoleMapper(SqlDataReader reader)
		{   //Check if the offset is as expected and return that value if so.
			//We run this once so we don't have to compare string to string everytime we get info
			OffsetToRoleID   = CheckOffset(reader, "RoleID", 0);
			OffsetToRoleName = CheckOffset(reader, "RoleName", 1);

		}
		public RoleDAL ToRole(SqlDataReader reader)
		{	// use the checked offset to write the info to appropriate fields
			RoleDAL ReturnValue = new RoleDAL();
			ReturnValue.RoleID = reader.GetInt32(OffsetToRoleID);
			ReturnValue.RoleName = reader.GetString(OffsetToRoleName);
			return ReturnValue;
		}
	}
}
