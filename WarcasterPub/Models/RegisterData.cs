using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WarcasterPub.Models
{
	public class RegisterData
	{
		public string Message { get; set; }
		[Required]
		public string UserName { get; set; }
		[Required]
		[StringLength(Constants.MaxPasswordLength,
			ErrorMessage = "The {0} must be between {2} and {1} characters long.",
			MinimumLength = Constants.MinPasswordLength)]
		[RegularExpression(Constants.PasswordRequirements,
			ErrorMessage = Constants.PasswordRequirementsMessage)]
		[DataType(DataType.Password)]
		[Display(Name = "Password")]
		public string Password { get; set; }
		[Required]
		[DataType(DataType.Password)]
		[Display(Name = "Confirmation Password")]
		public string ConfirmPassword { get; set; }
		public string EmailAddress { get; set; }

	}
}