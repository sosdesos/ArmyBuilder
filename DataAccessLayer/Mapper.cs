using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using ErrorLogger;

namespace DataAccessLayer
{
    public class Mapper
    {
		public void Assert(bool condition, string message)
		{       // Assert will throw an Exception when we enter a false result.
			try
			{
				if (condition)
				{
					// This is what should happen
				}
				else
				{   //  this is the message entered used for the exception.
					throw new Exception(message);
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
		}

		public int CheckOffset(SqlDataReader reader,string ColumnName, int ExpectedOffset)
		{    // this checks the offset of a column name against an expected offset then returns
			 //the real offset if we get the expected result. 
			 //(got tired of copy pasting and checking if all the values where correct)
			int Offset = 0;
			try { 
			Offset = reader.GetOrdinal(ColumnName);	//we get the position in the shape of the data from SQL
			Assert(ExpectedOffset == Offset,
				$"The {ColumnName} is {Offset}, not {ExpectedOffset} as expected");
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
			return Offset;
		}

		#region GetCleanValue
		//This will retrieve the data in a primitive type
		// using the GetInt32 and so on to create less garbage
		//it also makes it so i dont have to remmeber the datatype per property.
		//First parameter is the reader, second is the position in the shape and
		//the last one is to sort what type to return. I put the var that we return this to in the third 
		// parameter to sort through the types. added bonus, it replaces null on int with 0.
		public int GetCleanValue(SqlDataReader reader, int Offset, int convertTo)
		{	// this version will try to get a int from reader. because an int can't take value of null  
			// we will return a 0 if we get a null from reader.
			int ReturnValue = 0;
			try
			{
				if (!reader.IsDBNull(Offset))
				{
					ReturnValue = reader.GetInt32(Offset);
				}
				else
				{
					ReturnValue = 0;
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}

			return ReturnValue;
		}
		public string GetCleanValue(SqlDataReader reader, int Offset, string convertTo)
		{
			string ReturnValue = "";
			try
			{
				ReturnValue = reader.GetString(Offset);
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
			return ReturnValue;
		}

		public char GetCleanValue(SqlDataReader reader, int Offset, char convertTo)
		{
			char ReturnValue = ' ';
			try { 
			return reader.GetChar(Offset);
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
			return ReturnValue;
		}
		public bool GetCleanValue(SqlDataReader reader, int Offset, bool convertTo)
		{
			bool ReturnValue = false;
			try
			{
				return reader.GetBoolean(Offset);
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
			return ReturnValue;
		}
		public double GetCleanValue(SqlDataReader reader, int Offset, double convertTo)
		{
			double ReturnValue = 0;
			try
			{
				if (!reader.IsDBNull(Offset))
				{
					return reader.GetDouble(Offset);
				}
				else
				{
				//ReturnValue stays 0
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
			return ReturnValue;
		}
		#endregion end GetCleanValue
	}
}
