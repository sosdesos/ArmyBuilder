using ErrorLogger;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
	public class ArmyModelMapper : Mapper
	{
		Dictionary<int, string> PropertyOffsets = new Dictionary<int, string>();

		public ArmyModelMapper(SqlDataReader reader)
		{   //Check if the offset is as expected and return that value if so.
			//We run this once so we know the mapper is workin as expected
			Type ArmyModelDalType = typeof(ArmyModelDAL);
			PropertyInfo[] Properties = ArmyModelDalType.GetProperties();
			for (int i = 0; i < Properties.Length; i++)
			{
				try
				{
					PropertyOffsets.Add(reader.GetOrdinal(Properties[i].Name), Properties[i].ToString());
				}
				catch (Exception oops) when (Error.Log(oops))
				{
					//it's all done in the error.log
				}
			}
		}
		public ArmyModelDAL ToArmyModel(SqlDataReader reader)
		{   // lets use the checked offset to write the info to appropriate property
			ArmyModelDAL ReturnValue = new ArmyModelDAL();
			try
			{
				for (int i = 0; i < PropertyOffsets.Count; i++)
				{//we check the type of the property and use the appropriate "get" to minimize garbage
					string[] property = PropertyOffsets[i].Split(' ');
					switch (property[0])    //property contains the type and the name. I split it to check the type
					{
						case "Int32":
								if (!reader.IsDBNull(i))
								{
									typeof(ArmyModelDAL).GetProperty(property[1]).SetValue(ReturnValue, reader.GetInt32(i));
								}
								else
								{
									typeof(ArmyModelDAL).GetProperty(property[1]).SetValue(ReturnValue, 0);
								}
							break;
						case "System.String":
							typeof(ArmyModelDAL).GetProperty(property[1]).SetValue(ReturnValue, reader.GetString(i));
							break;
						case "Double":
							typeof(ArmyModelDAL).GetProperty(property[1]).SetValue(ReturnValue, reader.GetDouble(i));
							break;
						case "Char":
							typeof(ArmyModelDAL).GetProperty(property[1]).SetValue(ReturnValue, reader.GetChar(i));
							break;
						default:
							throw new Exception($"no matching type{property[0]} to sort to in ArmyModelmapper");
							//break;
					}
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
			return ReturnValue;
		}
	}
}

//		public List<int> Offsets = new List<int>();	//will contain a list of the offsets  

//		public ArmyModelMapper(SqlDataReader reader)
//		{   //Check if the offset is as expected and return that value if so.
//			//We run this once so we know the mapper is workin as expected

//			Type ArmyModelDAL = typeof(ArmyModelDAL);
//			System.Reflection.PropertyInfo[] Properties = ArmyModelDAL.GetProperties();
//			Properties = ArmyModelDAL.GetProperties();
//			for (int i = 0; i < Properties.Length; i++)
//			{
//				Offsets.Add(CheckOffset(reader, $"{Properties[i].Name}", i));
//			}
//		}
//		public ArmyModelDAL ToArmyModel(SqlDataReader reader)
//		{   // lets use the checked column numbers to write the info to appropriate fields
//			ArmyModelDAL ReturnValue = new ArmyModelDAL();

//			ReturnValue.Quantity		  = GetCleanValue(reader, Offsets[0],  ReturnValue.Quantity );
//			ReturnValue.FullSquats        = GetCleanValue(reader, Offsets[1],  ReturnValue.FullSquats);
//			ReturnValue.ModelID			  = GetCleanValue(reader, Offsets[2],  ReturnValue.ModelID);
//			ReturnValue.ModelName		  = GetCleanValue(reader, Offsets[3],  ReturnValue.ModelName);
//			ReturnValue.FactionID		  = GetCleanValue(reader, Offsets[4],  ReturnValue.FactionID);
//			ReturnValue.FactionName		  = GetCleanValue(reader, Offsets[5],  ReturnValue.FactionName);
//			ReturnValue.ModelType		  = GetCleanValue(reader, Offsets[6],  ReturnValue.ModelType);
//			ReturnValue.PointCost		  = GetCleanValue(reader, Offsets[7],  ReturnValue.PointCost);
//			ReturnValue.FullCrewPointCost = GetCleanValue(reader, Offsets[8],  ReturnValue.FullCrewPointCost);
//			ReturnValue.AttachesToModelID = GetCleanValue(reader, Offsets[9],  ReturnValue.AttachesToModelID);
//			ReturnValue.FieldAllowence    = GetCleanValue(reader, Offsets[10], ReturnValue.FieldAllowence);
//			ReturnValue.Speed			  = GetCleanValue(reader, Offsets[11], ReturnValue.Speed);
//			ReturnValue.MAT				  = GetCleanValue(reader, Offsets[12], ReturnValue.MAT);
//			ReturnValue.RAT				  = GetCleanValue(reader, Offsets[13], ReturnValue.RAT);
//			ReturnValue.DEF				  = GetCleanValue(reader, Offsets[14], ReturnValue.DEF);
//			ReturnValue.ARM				  = GetCleanValue(reader, Offsets[15], ReturnValue.ARM);
//			ReturnValue.RangedRNG1        = GetCleanValue(reader, Offsets[16], ReturnValue.RangedRNG1);
//			ReturnValue.RangedRNG2        = GetCleanValue(reader, Offsets[17], ReturnValue.RangedRNG2);
//			ReturnValue.ROF1              = GetCleanValue(reader, Offsets[18], ReturnValue.ROF1);
//			ReturnValue.ROF2              = GetCleanValue(reader, Offsets[19], ReturnValue.ROF2);
//			ReturnValue.AOE1              = GetCleanValue(reader, Offsets[20], ReturnValue.AOE1);
//			ReturnValue.AOE2              = GetCleanValue(reader, Offsets[21], ReturnValue.AOE2);
//			ReturnValue.RangedPOW1        = GetCleanValue(reader, Offsets[22], ReturnValue.RangedPOW1);
//			ReturnValue.RangedPOW2        = GetCleanValue(reader, Offsets[23], ReturnValue.RangedPOW2);
//			ReturnValue.MeleeRNG1		  = GetCleanValue(reader, Offsets[24], ReturnValue.MeleeRNG1);
//			ReturnValue.MeleeRNG2		  = GetCleanValue(reader, Offsets[25], ReturnValue.MeleeRNG2);
//			ReturnValue.MeleePOW1		  = GetCleanValue(reader, Offsets[26], ReturnValue.MeleePOW1);
//			ReturnValue.MeleePOW2		  = GetCleanValue(reader, Offsets[27], ReturnValue.MeleePOW2);
//			return ReturnValue;
//		}
//	}
//}
