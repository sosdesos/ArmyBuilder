using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WarcasterPub
{
	public static class Constants
	{
		#region Roles info
		public const int DeveloperRole = 1;                     //RoleID in Table
		public const string DeveloperRoleName = "Developer";//RoleName in Table
		public const int AdministratorRole = 2;                         //RoleID in Table
		public const string AdministratorRoleName = "Developer,Administrator";//RoleName in Tbl
		public const int PressgangerRole = 3;                               //RoleID in Table
		public const string PressgangerRoleName = "Developer,Administrator,Privateer Pressganger";  //RoleName in Table
		public const int NormalRole = 6;                //RoleID in Table
		public const string NormalRoleName = "Developer,Administrator,Privateer Pressganger,User";    //RoleName in Table
		#endregion Roles Info

		#region Miniature types
		//this part wont ever change so i put it in constant intead of a database
		public static readonly Dictionary<int, string> MiniatureTypes = new Dictionary<int, string> {
			{ 0, "Warcaster" },
			{ 1, "Warjack" },
			{ 2, "Troops" },
			{ 3, "Solo" }
		};
		#endregion

		#region Default settings
		public const int DefaultNewUserRole = NormalRole;   //new users will be set as "User" role
		public const int DefaultPageSize = 1000;
		public const int DefaultPageNumber = 0;
		public const int MaxIndexCommentSize = 30;// to cap large fields in index
		#endregion Default settings

		#region Password settings
		public const int MinPasswordLength = 8;
		public const int MaxPasswordLength = 20;
		public const int SaltSize = 20;
		public const string PasswordRequirementsMessage = "The Password must contain at Least One Capital letter, One special character and a number";
		public const string PasswordRequirements = @"^((?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])(?=.*[!@#$%^&*()+=:;.,\-])).+$";
		#endregion Password settings
	}
}