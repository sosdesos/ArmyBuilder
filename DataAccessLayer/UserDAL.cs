using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
	public class UserDAL
	{   //this class stores all the data from the Users table
		public int    UserID {		get; set; }
		public string UserName {	get; set; }
		public string Hash {		get; set; }
		public string Salt {		get; set; }
		public string EmailAdress { get; set; }
		public int	  RoleID {		get; set; }
		public string Rolename {	get; set; }

		public override string ToString()
		{
			return $"{UserID,5} {UserName, 15} {Hash,10} {Salt,10} {EmailAdress,15} {RoleID,5} {Rolename, 10}";
		}
	}
}
