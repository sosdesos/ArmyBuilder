using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WarcasterPub.Models
{
	public class LoginData
	{
		public string UserName { get; set; }
		public string Password { get; set; }
		public string Message { get; set; }
		public string ReturnURL { get; set; }

	}
}