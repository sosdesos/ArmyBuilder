using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
	public class UserMapper : Mapper
	{
		int OffsetToUserID;     // Column 0 (hopefully)
		int OffsetToUserName;   // Column 1 and so on(hopefully) 
		int OffsetToHash;
		int OffsetToSalt;
		int OffsetToEmailAdress;
		int OffsetToRoleID;
		int OffsetToRoleName;

		public UserMapper(SqlDataReader reader)
		{   //Check if the offset is as expected and return that value if so.
			//We run this once so we know the mapper is workin as expected
			OffsetToUserID		= CheckOffset(reader, "UserID"		, 0);
			OffsetToUserName    = CheckOffset(reader, "UserName"	, 1);
			OffsetToHash		= CheckOffset(reader, "Hash"		, 2);
			OffsetToSalt		= CheckOffset(reader, "Salt"		, 3);
			OffsetToEmailAdress = CheckOffset(reader, "EmailAdress"	, 4);
			OffsetToRoleID		= CheckOffset(reader, "RoleID"		, 5);
			OffsetToRoleName	= CheckOffset(reader, "RoleName"	, 6);
		}
		public UserDAL ToUser(SqlDataReader reader)
		{   // lets use the checked column numbers to write the info to appropriate fields
			UserDAL ReturnValue		= new UserDAL();
			ReturnValue.UserID		= reader.GetInt32( OffsetToUserID);
			ReturnValue.UserName	= reader.GetString(OffsetToUserName);
			ReturnValue.Hash		= reader.GetString(OffsetToHash);
			ReturnValue.Salt		= reader.GetString(OffsetToSalt);
			ReturnValue.EmailAdress = reader.GetString(OffsetToEmailAdress);
			//ReturnValue.RoleID		= reader.GetInt32( OffsetToRoleID);
			//ReturnValue.Rolename	= reader.GetString(OffsetToRoleName);
			ReturnValue.RoleID   = GetCleanValue(reader,OffsetToRoleID, ReturnValue.RoleID);
			ReturnValue.Rolename = GetCleanValue(reader,OffsetToRoleName, ReturnValue.Rolename);

			return ReturnValue;
		}
	}
}