using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Reflection;
using ErrorLogger;

namespace DataAccessLayer
{
	public class ModelMapper : Mapper
	{
		//we create a dictionary for the Auto Mapper
		Dictionary<int , string > PropertyOffsets = new Dictionary< int , string >();
		#region commented out old code
		//public List<int> Offsets = new List<int>();
		//ModelDAL ReturnValue = new ModelDAL();
		//public Type ModelDalType = typeof(ModelDAL);

		//int OffsetToModelID;                 // Column 0 (hopefully)
		//int OffsetToModelName;               // Column 1 and so on(hopefully) 
		//int OffsetToFactionID;
		//int OffsetToFactionName;
		//int OffsetToJackPoints;
		//int OffsetToPointCost;
		//int OffsetToFullCrewPointCost;
		//int OffsetToFieldAllowence;
		//int OffsetToSpeed;
		//int OffsetToMAT;
		//int OffsetToRAT;
		//int OffsetToDEF;
		//int OffsetToARM;
		//int OffsetToRangedRNG1;
		//int OffsetToRangedRNG2;
		//int OffsetToROF1;
		//int OffsetToROF2;
		//int OffsetToAOE1;
		//int OffsetToAOE2;
		//int OffsetToRangedPOW1;
		//int OffsetToRangedPOW2;
		//int OffsetToMeleeRNG1;
		//int OffsetToMeleeRNG2;
		//int OffsetToMeleePOW1;
		//int OffsetToMeleePOW2;
		#endregion commented out old code

		public ModelMapper(SqlDataReader reader)
		{   //Check if the offset is as expected and return that value if so.
			//We run this once so we know the mapper is workin as expected
			#region commented out old code

			//OffsetToModelID			  = CheckOffset(reader, "UserID", 0);
			//OffsetToModelName		  = CheckOffset(reader, "UserID", 1);
			//OffsetToFactionID		  = CheckOffset(reader, "UserID", 2);
			//OffsetToFactionName		  = CheckOffset(reader, "UserID", 3);
			//OffsetToJackPoints		  = CheckOffset(reader, "UserID", 4);
			//OffsetToPointCost		  = CheckOffset(reader, "UserID", 5);
			//OffsetToFullCrewPointCost = CheckOffset(reader, "UserID", 6);
			//OffsetToFieldAllowence	  = CheckOffset(reader, "UserID", 7);
			//OffsetToSpeed			  = CheckOffset(reader, "UserID", 8);
			//OffsetToMAT				  = CheckOffset(reader, "UserID", 9);
			//OffsetToRAT				  = CheckOffset(reader, "UserID", 10);
			//OffsetToDEF				  = CheckOffset(reader, "UserID", 11);
			//OffsetToARM				  = CheckOffset(reader, "UserID", 12);
			//OffsetToRangedRNG1		  = CheckOffset(reader, "UserID", 13);
			//OffsetToRangedRNG2		  = CheckOffset(reader, "UserID", 14);
			//OffsetToROF1			  = CheckOffset(reader, "UserID", 15);
			//OffsetToROF2			  = CheckOffset(reader, "UserID", 16);
			//OffsetToAOE1			  = CheckOffset(reader, "UserID", 17);
			//OffsetToAOE2			  = CheckOffset(reader, "UserID", 18);
			//OffsetToRangedPOW1		  = CheckOffset(reader, "UserID", 19);
			//OffsetToRangedPOW2		  = CheckOffset(reader, "UserID", 20);
			//OffsetToMeleeRNG1		  = CheckOffset(reader, "UserID", 21);
			//OffsetToMeleeRNG2		  = CheckOffset(reader, "UserID", 22);
			//OffsetToMeleePOW1		  = CheckOffset(reader, "UserID", 23);
			//OffsetToMeleePOW2         = CheckOffset(reader, "UserID", 24);
			#endregion commented out old code
			// instead of typing every line out I experimented with a auto mapper that
			//will join up the offset and property {type & name} using reflection
			Type ModelDalType = typeof(ModelDAL);
			PropertyInfo[] Properties = ModelDalType.GetProperties();
			//Properties = ModelDalType.GetProperties();
			for (int i = 0; i < Properties.Length; i++)
			{//we loop through the items from the reader and pair up the shape to the offset.
				//this way the order of items will match up automaticly when we retrieve it. 
				try { 
				PropertyOffsets.Add(reader.GetOrdinal(Properties[i].Name), Properties[i].ToString());
				}
				catch (Exception oops) when (Error.Log(oops))
				{
					//it's all done in the error.log
				}
			}
		}
		public ModelDAL ToModel(SqlDataReader reader)
		{   // lets use the checked offset to write the info to appropriate property
				ModelDAL ReturnValue = new ModelDAL();
			try
			{// we'll loop through all the info retrieved and let the automapped info sort it for us.
				for (int i = 0; i < PropertyOffsets.Count; i++)
				{//we check the type of the property and use the appropriate "get" to minimize garbage
					string[] property = PropertyOffsets[i].Split(' ');
					switch (property[0])    
					{//property contains the type and the name. I split it to check the type
						case "Int32":
							typeof(ModelDAL).GetProperty(property[1]).SetValue(ReturnValue, reader.GetInt32(i));
							break;
						case "System.String":
							typeof(ModelDAL).GetProperty(property[1]).SetValue(ReturnValue, reader.GetString(i));
							break;
						case "Double":
							typeof(ModelDAL).GetProperty(property[1]).SetValue(ReturnValue, reader.GetDouble(i));
							break;
						case "Char":
							typeof(ModelDAL).GetProperty(property[1]).SetValue(ReturnValue, reader.GetChar(i));
							break;
						default:
							throw new Exception($"no matching type{property[0]} to sort to in Modelmapper");
							//break;
					}
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
			#region commented out old code

			//ReturnValue.ModelID			  = GetCleanValue(reader, Offsets[0],  ReturnValue.ModelID );
			//ReturnValue.ModelName		  = GetCleanValue(reader, Offsets[1],  ReturnValue.ModelName );
			//ReturnValue.FactionID		  = GetCleanValue(reader, Offsets[2],  ReturnValue.FactionID );
			//ReturnValue.FactionName		  = GetCleanValue(reader, Offsets[3],  ReturnValue.FactionName );
			//ReturnValue.ModelType		  = GetCleanValue(reader, Offsets[4],  ReturnValue.ModelType);
			//ReturnValue.PointCost		  = GetCleanValue(reader, Offsets[5],  ReturnValue.PointCost );
			//ReturnValue.FullCrewPointCost = GetCleanValue(reader, Offsets[6],  ReturnValue.FullCrewPointCost );
			//ReturnValue.AttachesToModelID = GetCleanValue(reader, Offsets[7],  ReturnValue.AttachesToModelID);
			//ReturnValue.FieldAllowence	  = GetCleanValue(reader, Offsets[8],  ReturnValue.FieldAllowence );
			//ReturnValue.Speed			  = GetCleanValue(reader, Offsets[9],  ReturnValue.Speed );
			//ReturnValue.MAT				  = GetCleanValue(reader, Offsets[10], ReturnValue.MAT );
			//ReturnValue.RAT				  = GetCleanValue(reader, Offsets[11], ReturnValue.RAT );
			//ReturnValue.DEF				  = GetCleanValue(reader, Offsets[12], ReturnValue.DEF );
			//ReturnValue.ARM				  = GetCleanValue(reader, Offsets[13], ReturnValue.ARM );
			//ReturnValue.RangedRNG1		  = GetCleanValue(reader, Offsets[14], ReturnValue.RangedRNG1 );
			//ReturnValue.RangedRNG2		  = GetCleanValue(reader, Offsets[15], ReturnValue.RangedRNG2 );
			//ReturnValue.ROF1			  = GetCleanValue(reader, Offsets[16], ReturnValue.ROF1 );
			//ReturnValue.ROF2			  = GetCleanValue(reader, Offsets[17], ReturnValue.ROF2 );
			//ReturnValue.AOE1			  = GetCleanValue(reader, Offsets[18], ReturnValue.AOE1 );
			//ReturnValue.AOE2			  = GetCleanValue(reader, Offsets[19], ReturnValue.AOE2 );
			//ReturnValue.RangedPOW1		  = GetCleanValue(reader, Offsets[20], ReturnValue.RangedPOW1 );
			//ReturnValue.RangedPOW2		  = GetCleanValue(reader, Offsets[21], ReturnValue.RangedPOW2 );
			//ReturnValue.MeleeRNG1		  = GetCleanValue(reader, Offsets[22], ReturnValue.MeleeRNG1 );
			//ReturnValue.MeleeRNG2		  = GetCleanValue(reader, Offsets[23], ReturnValue.MeleeRNG2 );
			//ReturnValue.MeleePOW1		  = GetCleanValue(reader, Offsets[24], ReturnValue.MeleePOW1 );
			//ReturnValue.MeleePOW2         = GetCleanValue(reader, Offsets[25], ReturnValue.MeleePOW2);
			#endregion commented out old code
			return ReturnValue;
		}
	}
}