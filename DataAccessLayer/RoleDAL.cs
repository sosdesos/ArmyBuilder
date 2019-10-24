using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
	public class RoleDAL
	{	//this class stores all the data from the Roles table
		public int	  RoleID {	 get; set; }
		public string RoleName { get; set; }

		public override string ToString()
		{
			return $"{RoleID,5} {RoleName}";
		}
	}
}
