using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace ErrorLogger
{
	static public class Error
	{
		// the connection string is only loaded one time, at the start of the application
		static string connectionstring;
		// this is a static constructor.  It is used to initialize the static connectionstring    
		static Error()
		{
			try
			{// retrieving the connectionstring from web.config (added a reference in references)
				connectionstring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
				//connectionstring = "bob";

			}
			catch (Exception ex)
			{
				throw new Exception("Something went wrong while getting the DefaultConnectionString for Logger" + ex);
			}
		}
		public static bool Log(Exception Oops)
		{// we return a bool to let the logger be used in a while loop and pass the exception up next level
			try
			{// in case our error logger gives an errors and we want to see what error log the error logger logs
				using (SqlConnection con = new SqlConnection(connectionstring))
				{
					con.Open();
					using (var com = con.CreateCommand())
					{
						com.CommandText = "LogError";
						com.CommandType = System.Data.CommandType.StoredProcedure;
						com.Parameters.AddWithValue("@ErrorMessage", Oops.Message);
						com.Parameters.AddWithValue("@Trace", Oops.StackTrace.ToString());
						com.ExecuteNonQuery();
					}
				}
			}
			catch (Exception exc)
			{// if we have a problem with the database we make a file(ErrorLog.Log) in the WebApp folder
				var p = HttpContext.Current.Server.MapPath("~");
				p += @"ErrorLog.Log";
				System.IO.File.AppendAllText(p, "while attempting to record the original exception to the database, this exception occurred\r\n");
				System.IO.File.AppendAllText(p, exc.ToString());
				System.IO.File.AppendAllText(p, "This is the Original Exception that was attempting to be written to the database\r\n");
				System.IO.File.AppendAllText(p, Oops.ToString());
			}
			return false;// so we can use a while and pass the error to the next level drom the DAL
		}
	}
}
