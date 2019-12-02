using ErrorLogger;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DataAccessLayer
{
	public class ContextDAL : IDisposable
	{
		#region General Context (connection and dispose stuff)
		//connection to Database stuff like dispose and checkconnection
		SqlConnection _con = new SqlConnection();
		public void Dispose()
		{
			_con.Dispose();
		}
		void CheckConnection()
		{       // checks connection status and (re)opens connection when needed
			try
			{
				switch (_con.State)
				{
					case (System.Data.ConnectionState.Closed):
						_con.Open();
						break;
					case (System.Data.ConnectionState.Broken):
						_con.Close();
						_con.Open();
						break;
					case (System.Data.ConnectionState.Open):
						// no action needed. (but who left the gate open?)
						break;
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
		}
		public string ConnectionString
		{   // The connectionstring will be provided from the configmanager through the BLL
			get { return _con.ConnectionString; }
			set { _con.ConnectionString = value; }
		}
		#endregion General Context

		#region Role CRUD
		public int RoleCreate(string RoleName)
		{// create a new role, return the new RoleID
			int ReturnValue = 0;
			try
			{
				CheckConnection();
				using (SqlCommand command = new SqlCommand("RoleCreate", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@RoleName", RoleName);
					ReturnValue = Convert.ToInt32(command.ExecuteScalar());
				}
			}
			catch(Exception oops) when (Error.Log(oops))
			{
				//it's all done in the logger
			}
			return ReturnValue;
		}
		public List<RoleDAL> RoleGetAll(int Skip, int Take)
		{// retrieves all Roles
			List<RoleDAL> ReturnValue = new List<RoleDAL>();
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("RolesGetAll", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@skip", Skip);
					command.Parameters.AddWithValue("@take", Take);
					using (SqlDataReader reader = command.ExecuteReader())
					{
						RoleMapper rm = new RoleMapper(reader);
						while (reader.Read())
						{
							RoleDAL item = rm.ToRole(reader);
							ReturnValue.Add(item);
						}
					}
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
			return ReturnValue;
		}
		public int RolesObtainCount()
		{//howmany roles are there? (a nice example of aggregation (if you ask me))
			int ReturnValue = 0;
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("RolesObtainCount", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;

					ReturnValue = (int)command.ExecuteScalar();
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
			return ReturnValue;
		}
		public RoleDAL RoleFindByID(int RoleID)
		{// retrieve a role by ID (we dont expect multiple records here)
			RoleDAL ReturnValue = null;
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("RoleFindByID", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@RoleID", RoleID);
					using (SqlDataReader reader = command.ExecuteReader())
					{
						RoleMapper rm = new RoleMapper(reader);
						int count = 0;
						while (reader.Read())
						{
							ReturnValue = rm.ToRole(reader);
							count++;
						}
						if (count > 1)
						{
							throw new Exception($"{count} Multiple Roles found for ID {RoleID}");
						}
					}
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
			return ReturnValue;
		}
		public void RoleUpdate(int RoleID, string RoleName)
		{// pretty straightforward. Overwrites data of record of given RoleID(no output)
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("RoleUpdate", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@RoleID", RoleID);
					command.Parameters.AddWithValue("@RoleName", RoleName);
					object datareturned = command.ExecuteNonQuery();
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
		}
		public void RoleDelete(int RoleID)
		{
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("RoleDelete", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@RoleID", RoleID);
					command.ExecuteNonQuery();
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
		}
		#endregion Role CRUD

		#region User CRUD
		public int UserCreate(UserDAL user)
		{// create a new User, return the new RoleID
			int ReturnValue = 0;
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("UserCreate", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@UserName", user.UserName);
					command.Parameters.AddWithValue("@Hash", user.Hash);
					command.Parameters.AddWithValue("@Salt", user.Salt);
					command.Parameters.AddWithValue("@EmailAdress", user.EmailAdress);
					command.Parameters.AddWithValue("@RoleID", user.RoleID);
					ReturnValue = Convert.ToInt32(command.ExecuteScalar());
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
			return ReturnValue;
		}
		public List<UserDAL> UserGetAll(int Skip, int Take)
		{// retrieves all Roles
			List<UserDAL> ReturnValue = new List<UserDAL>();
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("UsersGetAll", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@skip", Skip);
					command.Parameters.AddWithValue("@take", Take);
					using (SqlDataReader reader = command.ExecuteReader())
					{
						UserMapper rm = new UserMapper(reader);
						while (reader.Read())
						{
							UserDAL item = rm.ToUser(reader);
							ReturnValue.Add(item);
						}
					}
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
			return ReturnValue;
		}
		public int UsersObtainCount()
		{//howmany roles are there? 
			int ReturnValue = 0;
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("UsersObtainCount", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;

					ReturnValue = (int)command.ExecuteScalar();
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
			return ReturnValue;
		}
		public UserDAL UserFindByID(int UserID)
		{// retrieve a role by ID (we dont expect multiple records here)
			UserDAL ReturnValue = null;
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("UserFindByID", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@UserID", UserID);

					using (SqlDataReader reader = command.ExecuteReader())
					{
						UserMapper um = new UserMapper(reader);
						int count = 0;
						while (reader.Read())
						{
							ReturnValue = um.ToUser(reader);
							count++;
						}
						if (count > 1)
						{
							throw new Exception($"{count} Multiple Roles found for ID {UserID}");
						}
					}
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
			return ReturnValue;
		}
		public UserDAL UserFindByName(String UserName)
		{// retrieve a role by user name (we dont expect multiple records here)
			UserDAL ReturnValue = null;
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("UserFindByName", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@UserName", UserName);

					using (SqlDataReader reader = command.ExecuteReader())
					{
						UserMapper rm = new UserMapper(reader);
						int count = 0;
						while (reader.Read())
						{
							ReturnValue = rm.ToUser(reader);
							count++;
						}
						if (count > 1)
						{
							throw new Exception($"{count} Multiple Roles found for ID {UserName}");
						}
					}
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
				return ReturnValue;
		}
		public void UserUpdate(UserDAL user)
		{// pretty straightforward. Overwrites data of record of given UserID(no output)
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("UserUpdate", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@UserID", user.UserID);
					command.Parameters.AddWithValue("@UserName", user.UserName);
					command.Parameters.AddWithValue("@Hash", user.Hash);
					command.Parameters.AddWithValue("@Salt", user.Salt);
					command.Parameters.AddWithValue("@EmailAdress", user.EmailAdress);
					command.Parameters.AddWithValue("@RoleID", user.RoleID);
					object datareturned = command.ExecuteNonQuery();
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
			}
		public void UserDelete(int UserID)
		{
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("UserDelete", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@UserID", UserID);
					command.ExecuteNonQuery();
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
			}
			#endregion User CRUD

		#region Faction CRUD
		public int FactionCreate(FactionDAL NewFaction)
		{// create a new Faction, return the new FactionID
			int ReturnValue = 0;
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("FactionCreate", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@FactionName", NewFaction.FactionName);
					command.Parameters.AddWithValue("@BackGround", NewFaction.BackGround);
					ReturnValue = Convert.ToInt32(command.ExecuteScalar());
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
				return ReturnValue;
		}
		public List<FactionDAL> FactionsGetAll(int Skip, int Take)
		{// retrieves all Factions
			List<FactionDAL> ReturnValue = new List<FactionDAL>();
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("FactionsGetAll", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@skip", Skip);
					command.Parameters.AddWithValue("@take", Take);
					using (SqlDataReader reader = command.ExecuteReader())
					{
						FactionMapper fm = new FactionMapper(reader);
						while (reader.Read())
						{
							FactionDAL item = fm.ToFaction(reader);
							ReturnValue.Add(item);
						}
					}
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
				return ReturnValue;
		}
		public int FactionsObtainCount()
		{//howmany Faction are there? Aggregate!
			int ReturnValue = 0;
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("FactionObtainCount", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;

					ReturnValue = (int)command.ExecuteScalar();
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
				return ReturnValue;
		}
		public FactionDAL FactionFindByID(int FactionID)
		{// retrieve a Faction by ID (we dont expect multiple records here)
			FactionDAL ReturnValue = null;
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("FactionFindByID", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@FactionID", FactionID);
					using (SqlDataReader reader = command.ExecuteReader())
					{// check for multiple records, throw oops if so. We should only get one
						FactionMapper fm = new FactionMapper(reader);
						int count = 0;
						while (reader.Read())
						{
							ReturnValue = fm.ToFaction(reader);
							count++;
						}
						if (count > 1)
						{
							throw new Exception($"{count} Multiple Factions found for ID {FactionID}");
						}
					}
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
				return ReturnValue;
		}
		public void FactionUpdate(FactionDAL Faction)
		{// pretty straightforward. Overwrites data of record of given FactionID(no output)
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("FactionUpdate", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@FactionID", Faction.FactionID);
					command.Parameters.AddWithValue("@FactionName", Faction.FactionName);
					command.Parameters.AddWithValue("@BackGround", Faction.BackGround);
					object datareturned = command.ExecuteNonQuery();
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
			}
		public void FactionDelete(int FactionID)
		{// deletes Faction record. 
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("FactionDelete", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@FactionID", FactionID);
					command.ExecuteNonQuery();
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log

			}
		}
			#endregion Faction CRUD

		#region Army CRUD
		public int ArmyCreate(ArmyDAL army)
		{// create a new Army, return the new ArmyID
			int ReturnValue = 0;
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("ArmyCreate", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@ArmyName", army.ArmyName);
					command.Parameters.AddWithValue("@UserID", army.UserID);
					command.Parameters.AddWithValue("@Comments", army.Comments);
					command.Parameters.AddWithValue("@FactionID", army.FactionID);
					ReturnValue = Convert.ToInt32(command.ExecuteScalar());
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
				return ReturnValue;
		}
		public List<ArmyDAL> ArmiesGetAll(int Skip, int Take)
		{// retrieves all Armies
			List<ArmyDAL> ReturnValue = new List<ArmyDAL>();
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("ArmiesGetAll", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@skip", Skip);
					command.Parameters.AddWithValue("@take", Take);
					using (SqlDataReader reader = command.ExecuteReader())
					{
						ArmyMapper am = new ArmyMapper(reader);
						while (reader.Read())
						{
							ReturnValue.Add(am.ToArmy(reader));
						}
					}
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
				return ReturnValue;
		}
		public int ArmiesObtainCount()
		{//howmany armies are there? 
			int ReturnValue = 0;
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("ArmiesObtainCount", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;

					ReturnValue = (int)command.ExecuteScalar();
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
				return ReturnValue;
		}
		public ArmyDAL ArmyFindByID(int ArmyID)
		{// retrieve a Army by ID (we dont expect multiple records here)
			ArmyDAL ReturnValue = null;
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("ArmyFindByID", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@ArmyID", ArmyID);

					using (SqlDataReader reader = command.ExecuteReader())
					{
						ArmyMapper am = new ArmyMapper(reader);
						int count = 0;
						while (reader.Read())
						{
							ReturnValue = am.ToArmy(reader);
							count++;
						}
						if (count > 1)
						{
							throw new Exception($"{count} Multiple Army found for ID {ArmyID}");
						}
					}
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
				return ReturnValue;
		}
		public List<ArmyDAL> ArmiesFindByUserID(int UserID, int Skip, int Take)
		{// retrieve armies by userID (we expect multiple records here)
			List<ArmyDAL> ReturnValue = new List<ArmyDAL>();
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("ArmiesFindByUserID", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@UserID", UserID);
					command.Parameters.AddWithValue("@Skip"  , Skip);
					command.Parameters.AddWithValue("@Take"  , Take);


					using (SqlDataReader reader = command.ExecuteReader())
					{
						ArmyMapper am = new ArmyMapper(reader);
						while (reader.Read())
						{
							ReturnValue.Add(am.ToArmy(reader));
						}
					}
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
				return ReturnValue;
		}
		public void ArmyUpdate(ArmyDAL army)
		{// pretty straightforward. Overwrites data of record of given ArmyID(no output)
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("ArmyUpdate", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@ArmyID", army.ArmyID);
					command.Parameters.AddWithValue("@ArmyName", army.ArmyName);
					command.Parameters.AddWithValue("@UserID", army.UserID);
					command.Parameters.AddWithValue("@Comments", army.Comments);
					command.Parameters.AddWithValue("@FactionID", army.FactionID);
					object datareturned = command.ExecuteNonQuery();
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
			}
		public void ArmyDelete(int ArmyID)
		{
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("ArmyDelete", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@ArmyID", ArmyID);
					command.ExecuteNonQuery();
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
		}
			#endregion Army CRUD

		#region ModelCrud
		public int ModelCreate(ModelDAL model)
		{// create a new Model, return the new ModelID
			int ReturnValue = 0;
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("ModelCreate", _con))
				{// we use a stored procedure, models take a ton of parameters.
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@ModelName", model.ModelName);
					command.Parameters.AddWithValue("@FactionID", model.FactionID);
					command.Parameters.AddWithValue("@ModelType", model.ModelType);
					command.Parameters.AddWithValue("@PointCost", model.PointCost);
					command.Parameters.AddWithValue("@FullCrewPointCost", model.FullCrewPointCost);
					command.Parameters.AddWithValue("@AttachesToModelID", model.AttachesToModelID);
					command.Parameters.AddWithValue("@FieldAllowence", model.FieldAllowence);
					command.Parameters.AddWithValue("@Speed", model.Speed);
					command.Parameters.AddWithValue("@MAT", model.MAT);
					command.Parameters.AddWithValue("@RAT", model.RAT);
					command.Parameters.AddWithValue("@DEF", model.DEF);
					command.Parameters.AddWithValue("@ARM", model.ARM);
					command.Parameters.AddWithValue("@RangedRNG1", model.RangedRNG1);
					command.Parameters.AddWithValue("@RangedRNG2", model.RangedRNG2);
					command.Parameters.AddWithValue("@ROF1", model.ROF1);
					command.Parameters.AddWithValue("@ROF2", model.ROF2);
					command.Parameters.AddWithValue("@AOE1", model.AOE1);
					command.Parameters.AddWithValue("@AOE2", model.AOE2);
					command.Parameters.AddWithValue("@RangedPOW1", model.RangedPOW1);
					command.Parameters.AddWithValue("@RangedPOW2", model.RangedPOW2);
					command.Parameters.AddWithValue("@MeleeRNG1", model.MeleeRNG1);
					command.Parameters.AddWithValue("@MeleeRNG2", model.MeleeRNG2);
					command.Parameters.AddWithValue("@MeleePOW1", model.MeleePOW1);
					command.Parameters.AddWithValue("@MeleePOW2", model.MeleePOW2);
					ReturnValue = Convert.ToInt32(command.ExecuteScalar());
				}//we get the new ModelID as a return value
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
				return ReturnValue;
		}
		public List<ModelDAL> ModelsGetAll(int Skip, int Take)
		{// retrieves all Models, skip/take are for future paging
			List<ModelDAL> ReturnValue = new List<ModelDAL>();
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("ModelsGetAll", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@skip", Skip);
					command.Parameters.AddWithValue("@take", Take);
					using (SqlDataReader reader = command.ExecuteReader())
					{
						ModelMapper mm = new ModelMapper(reader);
						while (reader.Read())
						{
							ModelDAL item = mm.ToModel(reader);
							ReturnValue.Add(item);
						}
					}
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
				return ReturnValue;
		}
		public int ModelsObtainCount()
		{//howmany Models are there? Agregate :)
			int ReturnValue = 0;
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("ModelObtainCount", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;

					ReturnValue = (int)command.ExecuteScalar();
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
				return ReturnValue;
		}
		public ModelDAL ModelFindByID(int ModelID)
		{// retrieve a Model by ID (we dont expect multiple records here)
			ModelDAL ReturnValue = null;
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("ModelFindByID", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@ModelID", ModelID);

					using (SqlDataReader reader = command.ExecuteReader())
					{
						ModelMapper mm = new ModelMapper(reader);
						int count = 0;
						while (reader.Read())
						{
							ReturnValue = mm.ToModel(reader);
							count++;
						}
						if (count > 1)
						{
							throw new Exception($"{count} Multiple Models found for ID {ModelID}");
						}
					}
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
				return ReturnValue;
		}
		public List<ModelDAL> ModelsFindByFactionID(int FactionID, int Skip, int Take)
		{// retrieve all Models by FactionID (we expect multiple records here)
			List<ModelDAL> ReturnValue = new List<ModelDAL>();
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("ModelsFindByFactionID", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@FactionID", FactionID);
					command.Parameters.AddWithValue("@Skip", Skip);
					command.Parameters.AddWithValue("@Take", Take);
					using (SqlDataReader reader = command.ExecuteReader())
					{
						ModelMapper mm = new ModelMapper(reader);
						while (reader.Read())
						{
							ModelDAL item = mm.ToModel(reader);
							ReturnValue.Add(item);
						}
					}
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
				return ReturnValue;
		}
		public void ModelUpdate(ModelDAL model)
		{// pretty straightforward. Overwrites data of record of given ModelID(no output)
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("ModelUpdate", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@ModelID", model.ModelID);
					command.Parameters.AddWithValue("@ModelName", model.ModelName);
					command.Parameters.AddWithValue("@FactionID", model.FactionID);
					command.Parameters.AddWithValue("@ModelType", model.ModelType);
					command.Parameters.AddWithValue("@PointCost", model.PointCost);
					command.Parameters.AddWithValue("@FullCrewPointCost", model.FullCrewPointCost);
					command.Parameters.AddWithValue("@AttachesToModelID", model.AttachesToModelID);
					command.Parameters.AddWithValue("@FieldAllowence", model.FieldAllowence);
					command.Parameters.AddWithValue("@Speed", model.Speed);
					command.Parameters.AddWithValue("@MAT", model.MAT);
					command.Parameters.AddWithValue("@RAT", model.RAT);
					command.Parameters.AddWithValue("@DEF", model.DEF);
					command.Parameters.AddWithValue("@ARM", model.ARM);
					command.Parameters.AddWithValue("@RangedRNG1", model.RangedRNG1);
					command.Parameters.AddWithValue("@RangedRNG2", model.RangedRNG2);
					command.Parameters.AddWithValue("@ROF1", model.ROF1);
					command.Parameters.AddWithValue("@ROF2", model.ROF2);
					command.Parameters.AddWithValue("@AOE1", model.AOE1);
					command.Parameters.AddWithValue("@AOE2", model.AOE2);
					command.Parameters.AddWithValue("@RangedPOW1", model.RangedPOW1);
					command.Parameters.AddWithValue("@RangedPOW2", model.RangedPOW2);
					command.Parameters.AddWithValue("@MeleeRNG1", model.MeleeRNG1);
					command.Parameters.AddWithValue("@MeleeRNG2", model.MeleeRNG2);
					command.Parameters.AddWithValue("@MeleePOW1", model.MeleePOW1);
					command.Parameters.AddWithValue("@MeleePOW2", model.MeleePOW2);
					object datareturned = command.ExecuteNonQuery();
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
			}
		public void ModelDelete(int ModelID)
		{
			CheckConnection();
			try
			{
				using (SqlCommand command = new SqlCommand("ModelDelete", _con))
				{
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@ModelID", ModelID);
					command.ExecuteNonQuery();
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log

			}
		}
			#endregion Model CRUD

		#region ArmyModels CRD
		public void ArmyModelCreate(ArmyModelDAL Record)
		{// create a new entry into the many to many table ArmyModels, No Return.
			CheckConnection();
			try
			{//try is to catch any problems that could happen when using the SQL connection and log them.
				using (SqlCommand command = new SqlCommand("ArmyModelRecordCreate", _con))
				{//Using is used to make sure the heavy recources are disposed properly with dispose
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@ArmyID", Record.ArmyID);
					command.Parameters.AddWithValue("@ModelID", Record.ModelID);
					command.Parameters.AddWithValue("@Quantity", Record.Quantity);
					command.Parameters.AddWithValue("@FullSquats", Record.FullSquats);
					Convert.ToInt32(command.ExecuteNonQuery());// the many to many doesn't return a unique ID
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
		}

		public List<ArmyModelDAL> ArmyModelsFindByFactionID(int ArmyID, int FactionID, int Skip, int Take)
		{//this will bring back all the models of a certain faction, with quantities if possible
		 //Outer join used to show all models possible in the army that is being edited in MVC
		 //skip / take is for future implementation of paging @ToDo
			List<ArmyModelDAL> ReturnValue = new List<ArmyModelDAL>();
			CheckConnection();
			using (SqlCommand command = new SqlCommand("ArmyModelsFindByFactionID", _con))
			{//try is to catch any problems that could happen when using the SQL connection and log them.
				command.CommandType = System.Data.CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@ArmyID"	, ArmyID);
				command.Parameters.AddWithValue("@FactionID", FactionID);
				command.Parameters.AddWithValue("@Skip"		, Skip);
				command.Parameters.AddWithValue("@Take"		, Take);
					using (SqlDataReader reader = command.ExecuteReader())
					{//Using is used to make sure the heavy recources are disposed properly with dispose
						ArmyModelMapper am = new ArmyModelMapper(reader);
						while (reader.Read())
						{
							ReturnValue.Add(am.ToArmyModel(reader));
						}
					}
			}
			return ReturnValue;
		}

		public List<ArmyModelDAL>ArmyModelsFindByArmyID(int ArmyID, int Skip, int Take)
		{//this will bring back all the models of a certain army, with quantities.
			//for showing an army detail page
			List<ArmyModelDAL> ReturnValue = new List<ArmyModelDAL>();
			CheckConnection();
			try
			{//try is to catch any problems that could happen when using the SQL connection and log them.
				using (SqlCommand command = new SqlCommand("ArmyModelsFindByArmyID", _con))
				{//Using is used to make sure the heavy recources are disposed properly with dispose
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@ArmyID", ArmyID);
					command.Parameters.AddWithValue("@Skip", Skip);
					command.Parameters.AddWithValue("@Take", Take);
					using (SqlDataReader reader = command.ExecuteReader())
					{
						ArmyModelMapper am = new ArmyModelMapper(reader);
						while (reader.Read())
						{
							ReturnValue.Add(am.ToArmyModel(reader));
						}
					}
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
				return ReturnValue;
		}
		public ArmyModelDAL ArmyModelsFindByArmyIDAndModelID(int ArmyID, int ModelID)
		{//this will bring back a certain model of a certain army, with it's quantities. (expect 1)
			ArmyModelDAL ReturnValue = new ArmyModelDAL();
			CheckConnection();
			try
			{//try is to catch any problems that could happen when using the SQL connection and log them.
				using (SqlCommand command = new SqlCommand("ArmyModelFindByArmyIDAndModelID", _con))
				{//Using is used to make sure the heavy recources are disposed properly with dispose
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@ArmyID", ArmyID);
					command.Parameters.AddWithValue("@ModelID", ModelID);
					using (SqlDataReader reader = command.ExecuteReader())
					{
						ArmyModelMapper amm = new ArmyModelMapper(reader);
						int count = 0;
						while (reader.Read())
						{
							ReturnValue = amm.ToArmyModel(reader);
							count++;
						}
						if (count > 1)
						{
							throw new Exception($"{count} Multiple Models found for ID {ModelID} & {ArmyID}");
						}
					}
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
			return ReturnValue;
		}
		public void ArmyModelsDeleteByArmyID(int ArmyID)
		{
			CheckConnection();
			try
			{//try is to catch any problems that could happen when using the SQL connection and log them.
				using (SqlCommand command = new SqlCommand("ArmyModelsDeleteByArmyID", _con))
				{//Using is used to make sure the heavy recources are disposed properly with dispose
					command.CommandType = System.Data.CommandType.StoredProcedure;
					command.Parameters.AddWithValue("@ArmyID", ArmyID);
					command.ExecuteNonQuery();
				}
			}
			catch (Exception oops) when (Error.Log(oops))
			{
				//it's all done in the error.log
			}
		}

		#endregion ArmyModels
	}
}
