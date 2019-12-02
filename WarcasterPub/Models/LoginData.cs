using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WarcasterPub.Models
{
	public class LoginData
	{
		//[Required]
		public string UserName { get; set; }
		//[Required]
		[DataType(DataType.Password)]
		[Display(Name = "Password")]
		public string Password { get; set; }
		public string Message { get; set; }
		public string ReturnURL { get; set; }

	}
}