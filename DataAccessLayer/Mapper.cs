using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;


namespace DataAccessLayer
{
    public class Mapper
    {
		public void Assert(bool condition, string message)
		{		// Assert will throw an Exception when we enter a false result. 
			if (condition)
			{
				// This is what should happen
			}
			else
			{   //  this is the message entered used for the exception.
				throw new Exception(message);
			}
		}

		public int CheckOffset(SqlDataReader reader,string ColumnName, int ExpectedOffset)
		{    // this checks the offset of a column name against an expected offset then returns
			 //the real offset if we get the expected result. 
			 //(got tired of copy pasting and checking if all the values where correct)
			int Offset = reader.GetOrdinal(ColumnName);
			Assert(ExpectedOffset == Offset,
				$"The {ColumnName} is {Offset}, not {ExpectedOffset} as expected");
			return Offset;
		}

		#region GetCleanValue
		// I want to create a automapper for my tables and need to auto convert the SQL data appropriatly
		// using the GetInt32 and so on to create less garbage
		public int GetCleanValue(SqlDataReader reader, int Offset, int convertTo)
		{
			int ReturnValue = 0;
			if (!reader.IsDBNull(Offset))
			{
				ReturnValue = reader.GetInt32(Offset);
			}

			return ReturnValue;
		}
		public string GetCleanValue(SqlDataReader reader, int Offset, string convertTo)
		{
			return reader.GetString(Offset);
		}

		public char GetCleanValue(SqlDataReader reader, int Offset, char convertTo)
		{
			return reader.GetChar(Offset);
		}
		public bool GetCleanValue(SqlDataReader reader, int Offset, bool convertTo)
		{
			return reader.GetBoolean(Offset);
		}
		public double GetCleanValue(SqlDataReader reader, int Offset, double convertTo)
		{
			return reader.GetDouble(Offset);
		}
		#endregion end GetCleanValue
	}
}
