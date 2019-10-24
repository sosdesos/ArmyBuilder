using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
	public class ModelMapper : Mapper
	{
		public List<int> Offsets = new List<int>();
		//ModelDAL ReturnValue = new ModelDAL();
		//public Type ModelDalType = typeof(ModelDAL);
		//		System.Reflection.PropertyInfo[] Properties = ModelDalType.GetProperties();
		//	{
		//	OffsetToModelID, OffsetToModelName, OffsetToFactionID, OffsetToFactionName,
		//	OffsetToJackPoints, OffsetToPointCost, OffsetToFullCrewPointCost,
		//	OffsetToFieldAllowence, OffsetToSpeed, OffsetToMAT, OffsetToRAT, OffsetToDEF,
		//	OffsetToARM, OffsetToRangedRNG1, OffsetToRangedRNG2, OffsetToROF1, OffsetToROF2,
		//	OffsetToAOE1, OffsetToAOE2, OffsetToRangedPOW1, OffsetToRangedPOW2,
		//	OffsetToMeleeRNG1, OffsetToMeleeRNG2, OffsetToMeleePOW1, OffsetToMeleePOW2
		//};

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

		public ModelMapper(SqlDataReader reader)
		{   //Check if the offset is as expected and return that value if so.
			//We run this once so we know the mapper is workin as expected
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

			Type ModelDalType = typeof(ModelDAL);
			System.Reflection.PropertyInfo[] Properties = ModelDalType.GetProperties();
			for (int i = 0; i < Properties.Length; i++)
			{
				Offsets.Add( CheckOffset(reader, $"{Properties[i].Name}", i));
			}
		}
		public ModelDAL ToModel(SqlDataReader reader)
		{   // lets use the checked column numbers to write the info to appropriate fields
				ModelDAL ReturnValue = new ModelDAL();
			//	ReturnValue.UserID = reader.GetInt32(OffsetToUserID);
			//	ReturnValue.UserName = reader.GetString(OffsetToUserName);
			//	ReturnValue.Hash = reader.GetString(OffsetToHash);
			//	ReturnValue.Salt = reader.GetString(OffsetToSalt);
			//	ReturnValue.EmailAdress = reader.GetString(OffsetToEmailAdress);
			//	ReturnValue.RoleID = reader.GetInt32(OffsetToRoleID);
			//	ReturnValue.Rolename = reader.GetString(OffsetToRoleName);
			ReturnValue.ModelID			  = GetCleanValue(reader, Offsets[0],ReturnValue.ModelID );
			ReturnValue.ModelName		  = GetCleanValue(reader, Offsets[1],ReturnValue.ModelName );
			ReturnValue.FactionID		  = GetCleanValue(reader, Offsets[2],ReturnValue.FactionID );
			ReturnValue.FactionName		  = GetCleanValue(reader, Offsets[3],ReturnValue.FactionName );
			ReturnValue.JackPoints		  = GetCleanValue(reader, Offsets[4],ReturnValue.JackPoints );
			ReturnValue.PointCost		  = GetCleanValue(reader, Offsets[5],ReturnValue.PointCost );
			ReturnValue.FullCrewPointCost = GetCleanValue(reader, Offsets[6],ReturnValue.FullCrewPointCost );
			ReturnValue.AttachesToModelID = GetCleanValue(reader, Offsets[7], ReturnValue.AttachesToModelID);
			ReturnValue.FieldAllowence	  = GetCleanValue(reader, Offsets[8],ReturnValue.FieldAllowence );
			ReturnValue.Speed			  = GetCleanValue(reader, Offsets[9],ReturnValue.Speed );
			ReturnValue.MAT				  = GetCleanValue(reader, Offsets[10],ReturnValue.MAT );
			ReturnValue.RAT				  = GetCleanValue(reader, Offsets[11],ReturnValue.RAT );
			ReturnValue.DEF				  = GetCleanValue(reader, Offsets[12],ReturnValue.DEF );
			ReturnValue.ARM				  = GetCleanValue(reader, Offsets[13],ReturnValue.ARM );
			ReturnValue.RangedRNG1		  = GetCleanValue(reader, Offsets[14],ReturnValue.RangedRNG1 );
			ReturnValue.RangedRNG2		  = GetCleanValue(reader, Offsets[15],ReturnValue.RangedRNG2 );
			ReturnValue.ROF1			  = GetCleanValue(reader, Offsets[16],ReturnValue.ROF1 );
			ReturnValue.ROF2			  = GetCleanValue(reader, Offsets[17],ReturnValue.ROF2 );
			ReturnValue.AOE1			  = GetCleanValue(reader, Offsets[18],ReturnValue.AOE1 );
			ReturnValue.AOE2			  = GetCleanValue(reader, Offsets[19],ReturnValue.AOE2 );
			ReturnValue.RangedPOW1		  = GetCleanValue(reader, Offsets[20],ReturnValue.RangedPOW1 );
			ReturnValue.RangedPOW2		  = GetCleanValue(reader, Offsets[21],ReturnValue.RangedPOW2 );
			ReturnValue.MeleeRNG1		  = GetCleanValue(reader, Offsets[22],ReturnValue.MeleeRNG1 );
			ReturnValue.MeleeRNG2		  = GetCleanValue(reader, Offsets[23],ReturnValue.MeleeRNG2 );
			ReturnValue.MeleePOW1		  = GetCleanValue(reader, Offsets[24],ReturnValue.MeleePOW1 );
			ReturnValue.MeleePOW2         = GetCleanValue(reader, Offsets[25], ReturnValue.MeleePOW2);
			return ReturnValue;
		}
	}
}