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
		SqlConnection _con = new SqlConnection();
		public void Dispose()
		{
			_con.Dispose();
		}
		void CheckConnection()
		{       // checks connection status and (re)opens connection when needed
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
		public string ConnectionString
		{   // The connectionstring will be provided from the configmanager through the BLL
			get { return _con.ConnectionString; }
			set { _con.ConnectionString = value; }
		}
		#endregion General Context

		#region Role CRUD
		public int RoleCreate(string RoleName)
		{// create a new role, return the new RoleID
			int proposedReturnValue = 0;
			CheckConnection();
			using (SqlCommand command = new SqlCommand("RoleCreate", _con))
			{
				command.CommandType = System.Data.CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@RoleName", RoleName);
				proposedReturnValue = Convert.ToInt32(command.ExecuteScalar());
			}
			return proposedReturnValue;
		}
		public List<RoleDAL> RoleGetAll(int Skip, int Take)
		{// retrieves all Roles
			List<RoleDAL> proposedReturnValue = new List<RoleDAL>();
			CheckConnection();
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
						proposedReturnValue.Add(item);
					}
				}
			}
			return proposedReturnValue;
		}
		public int RolesObtainCount()
		{//howmany roles are there? (a nice example of aggregation (if you ask me))
			int proposedReturnValue = 0;
			CheckConnection();
			using (SqlCommand command = new SqlCommand("RolesObtainCount", _con))
			{
				command.CommandType = System.Data.CommandType.StoredProcedure;

				proposedReturnValue = (int)command.ExecuteScalar();
			}
			return proposedReturnValue;
		}
		public RoleDAL RoleFindByID(int RoleID)
		{// retrieve a role by ID (we dont expect multiple records here)
			RoleDAL proposedReturnValue = null;
			CheckConnection();
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
						proposedReturnValue = rm.ToRole(reader);
						count++;
					}
					if (count > 1)
					{
						throw new Exception($"{count} Multiple Roles found for ID {RoleID}");
					}
				}
			}
			return proposedReturnValue;
		}
		public void RoleUpdate(int RoleID, string RoleName)
		{// pretty straightforward. Overwrites data of record of given RoleID(no output)
			CheckConnection();
			using (SqlCommand command = new SqlCommand("RoleUpdate", _con))
			{
				command.CommandType = System.Data.CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@RoleID", RoleID);
				command.Parameters.AddWithValue("@RoleName", RoleName);
				object datareturned = command.ExecuteNonQuery();
			}
		}
		public void RoleDelete(int RoleID)
		{
			CheckConnection();
			using (SqlCommand command = new SqlCommand("RoleDelete", _con))
			{
				command.CommandType = System.Data.CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@RoleID", RoleID);
				command.ExecuteNonQuery();
			}
		}
		#endregion Role CRUD

		#region User CRUD
		public int UserCreate(UserDAL user)
		{// create a new User, return the new RoleID
			int ReturnValue = 0;
			CheckConnection();
			using (SqlCommand command = new SqlCommand("UserCreate", _con))
			{
				command.CommandType = System.Data.CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@UserName",    user.UserName);
				command.Parameters.AddWithValue("@Hash",        user.Hash);
				command.Parameters.AddWithValue("@Salt",        user.Salt);
				command.Parameters.AddWithValue("@EmailAdress", user.EmailAdress);
				command.Parameters.AddWithValue("@RoleID",      user.RoleID);
				ReturnValue = Convert.ToInt32(command.ExecuteScalar());
			}
			return ReturnValue;
		}
		public List<UserDAL> UserGetAll(int Skip, int Take)
		{// retrieves all Roles
			List<UserDAL> ReturnValue = new List<UserDAL>();
			CheckConnection();
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
			return ReturnValue;
		}
		public int UsersObtainCount()
		{//howmany roles are there? 
			int ReturnValue = 0;
			CheckConnection();
			using (SqlCommand command = new SqlCommand("UsersObtainCount", _con))
			{
				command.CommandType = System.Data.CommandType.StoredProcedure;

				ReturnValue = (int)command.ExecuteScalar();
			}
			return ReturnValue;
		}
		public UserDAL UserFindByID(int UserID)
		{// retrieve a role by ID (we dont expect multiple records here)
			UserDAL ReturnValue = null;
			CheckConnection();
			using (SqlCommand command = new SqlCommand("UserFindByID", _con))
			{
				command.CommandType = System.Data.CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@UserID"   , UserID);

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
			return ReturnValue;
		}
		public UserDAL UserFindByName(String UserName)
		{// retrieve a role by user name (we dont expect multiple records here)
			UserDAL ReturnValue = null;
			CheckConnection();
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
			return ReturnValue;
		}
		public void UserUpdate(UserDAL user)
		{// pretty straightforward. Overwrites data of record of given UserID(no output)
			CheckConnection();
			using (SqlCommand command = new SqlCommand("UserUpdate", _con))
			{
				command.CommandType = System.Data.CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@UserID"     , user.UserID);
				command.Parameters.AddWithValue("@UserName"   , user.UserName);
				command.Parameters.AddWithValue("@Hash"       , user.Hash);
				command.Parameters.AddWithValue("@Salt"       , user.Salt);
				command.Parameters.AddWithValue("@EmailAdress", user.EmailAdress);
				command.Parameters.AddWithValue("@RoleID"     , user.RoleID);
				object datareturned = command.ExecuteNonQuery();
			}
		}
		public void UserDelete(int UserID)
		{
			CheckConnection();
			using (SqlCommand command = new SqlCommand("UserDelete", _con))
			{
				command.CommandType = System.Data.CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@UserID", UserID);
				command.ExecuteNonQuery();
			}
		}
		#endregion User CRUD

		#region Faction CRUD
		public int FactionCreate(FactionDAL InputName)
		{// create a new Faction, return the new FactionID
			int ReturnValue = 0;
			CheckConnection();
			using (SqlCommand command = new SqlCommand("FactionCreate", _con))
			{
				command.CommandType = System.Data.CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@FactionName", InputName.FactionName);
				ReturnValue = Convert.ToInt32(command.ExecuteScalar());
			}
			return ReturnValue;
		}
		public List<FactionDAL> FactionsGetAll(int Skip, int Take)
		{// retrieves all Faction
			List<FactionDAL> ReturnValue = new List<FactionDAL>();
			CheckConnection();
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
			return ReturnValue;
		}
		public int FactionsObtainCount()
		{//howmany Faction are there? 
			int ReturnValue = 0;
			CheckConnection();
			using (SqlCommand command = new SqlCommand("FactionObtainCount", _con))
			{
				command.CommandType = System.Data.CommandType.StoredProcedure;

				ReturnValue = (int)command.ExecuteScalar();
			}
			return ReturnValue;
		}
		public FactionDAL FactionFindByID(int FactionID)
		{// retrieve a Faction by ID (we dont expect multiple records here)
			FactionDAL ReturnValue = null;
			CheckConnection();
			using (SqlCommand command = new SqlCommand("FactionFindByID", _con))
			{
				command.CommandType = System.Data.CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@FactionID", FactionID);
				using (SqlDataReader reader = command.ExecuteReader())
				{
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
			return ReturnValue;
		}
		public void FactionUpdate(FactionDAL Faction)
		{// pretty straightforward. Overwrites data of record of given FactionID(no output)
			CheckConnection();
			using (SqlCommand command = new SqlCommand("FactionUpdate", _con))
			{
				command.CommandType = System.Data.CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@FactionID",   Faction.FactionID);
				command.Parameters.AddWithValue("@FactionName", Faction.FactionName);
				object datareturned = command.ExecuteNonQuery();
			}
		}
		public void FactionDelete(int FactionID)
		{
			CheckConnection();
			using (SqlCommand command = new SqlCommand("FactionDelete", _con))
			{
				command.CommandType = System.Data.CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@FactionID", FactionID);
				command.ExecuteNonQuery();
			}
		}
		#endregion Faction CRUD

		#region Army CRUD
		public int ArmyCreate(ArmyDAL army)
		{// create a new Army, return the new ArmyID
			int ReturnValue = 0;
			CheckConnection();
			using (SqlCommand command = new SqlCommand("ArmyCreate", _con))
			{
				command.CommandType = System.Data.CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@ArmyName", army.ArmyName);
				command.Parameters.AddWithValue("@UserID", army.UserID);
				command.Parameters.AddWithValue("@Comments", army.Comments);

				ReturnValue = Convert.ToInt32(command.ExecuteScalar());
			}
			return ReturnValue;
		}
		public List<ArmyDAL> ArmiesGetAll(int Skip, int Take)
		{// retrieves all Armies
			List<ArmyDAL> ReturnValue = new List<ArmyDAL>();
			CheckConnection();
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
			return ReturnValue;
		}
		public int ArmiesObtainCount()
		{//howmany armies are there? 
			int ReturnValue = 0;
			CheckConnection();
			using (SqlCommand command = new SqlCommand("ArmiesObtainCount", _con))
			{
				command.CommandType = System.Data.CommandType.StoredProcedure;

				ReturnValue = (int)command.ExecuteScalar();
			}
			return ReturnValue;
		}
		public ArmyDAL ArmyFindByID(int ArmyID)
		{// retrieve a Army by ID (we dont expect multiple records here)
			ArmyDAL ReturnValue = null;
			CheckConnection();
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
			return ReturnValue;
		}
		public List<ArmyDAL> ArmiesFindByUserID(int UserID)
		{// retrieve armies by userID (we expect multiple records here)
			List<ArmyDAL> ReturnValue = new List<ArmyDAL>();
			CheckConnection();
			using (SqlCommand command = new SqlCommand("ArmiesFindByUserID", _con))
			{
				command.CommandType = System.Data.CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@UserID", UserID);

				using (SqlDataReader reader = command.ExecuteReader())
				{
					ArmyMapper am = new ArmyMapper(reader);
					while (reader.Read())
					{
						ReturnValue.Add(am.ToArmy(reader));
					}
				}
			}
			return ReturnValue;
		}
		public void ArmyUpdate(ArmyDAL army)
		{// pretty straightforward. Overwrites data of record of given ArmyID(no output)
			CheckConnection();
			using (SqlCommand command = new SqlCommand("ArmyUpdate", _con))
			{
				command.CommandType = System.Data.CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@ArmyID", army.ArmyID);
				command.Parameters.AddWithValue("@ArmyName", army.ArmyName);
				command.Parameters.AddWithValue("@UserID", army.UserID);
				command.Parameters.AddWithValue("@Comments", army.Comments);
				object datareturned = command.ExecuteNonQuery();
			}
		}
		public void ArmyDelete(int ArmyID)
		{
			CheckConnection();
			using (SqlCommand command = new SqlCommand("ArmyDelete", _con))
			{
				command.CommandType = System.Data.CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@ArmyID", ArmyID);
				command.ExecuteNonQuery();
			}
		}
		#endregion Army CRUD

		#region ModelCrud
		public int ModelCreate(ModelDAL model)
		{// create a new User, return the new RoleID
			int ReturnValue = 0;
			CheckConnection();
			using (SqlCommand command = new SqlCommand("ModelCreate", _con))
			{
				command.CommandType = System.Data.CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@ModelName",         model.ModelName);
				command.Parameters.AddWithValue("@FactionID",         model.FactionID);
				command.Parameters.AddWithValue("@JackPoints",        model.JackPoints);
				command.Parameters.AddWithValue("@PointCost",         model.PointCost);
				command.Parameters.AddWithValue("@FullCrewPointCost", model.FullCrewPointCost);
				command.Parameters.AddWithValue("@AttachesToModelID", model.AttachesToModelID);
				command.Parameters.AddWithValue("@FieldAllowence",    model.FieldAllowence);
				command.Parameters.AddWithValue("@Speed",             model.Speed);
				command.Parameters.AddWithValue("@MAT",               model.MAT);
				command.Parameters.AddWithValue("@RAT",               model.RAT);
				command.Parameters.AddWithValue("@DEF",               model.DEF);
				command.Parameters.AddWithValue("@ARM",               model.ARM);
				command.Parameters.AddWithValue("@RangedRNG1",        model.RangedRNG1);
				command.Parameters.AddWithValue("@RangedRNG2",        model.RangedRNG2);
				command.Parameters.AddWithValue("@ROF1",              model.ROF1);
				command.Parameters.AddWithValue("@ROF2",              model.ROF2);
				command.Parameters.AddWithValue("@AOE1",              model.AOE1);
				command.Parameters.AddWithValue("@AOE2",              model.AOE2);
				command.Parameters.AddWithValue("@RangedPOW1",        model.RangedPOW1);
				command.Parameters.AddWithValue("@RangedPOW2",        model.RangedPOW2);
				command.Parameters.AddWithValue("@MeleeRNG1",         model.MeleeRNG1);
				command.Parameters.AddWithValue("@MeleeRNG2",         model.MeleeRNG2);
				command.Parameters.AddWithValue("@MeleePOW1",         model.MeleePOW1);
				command.Parameters.AddWithValue("@MeleePOW2",         model.MeleePOW2);
				ReturnValue = Convert.ToInt32(command.ExecuteScalar());
			}
			return ReturnValue;
		}
		public List<ModelDAL> ModelsGetAll(int Skip, int Take)
		{// retrieves all Mode
			List<ModelDAL> ReturnValue = new List<ModelDAL>();
			CheckConnection();
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
			return ReturnValue;
		}
		public int ModelsObtainCount()
		{//howmany Models are there? 
			int ReturnValue = 0;
			CheckConnection();
			using (SqlCommand command = new SqlCommand("ModelObtainCount", _con))
			{
				command.CommandType = System.Data.CommandType.StoredProcedure;

				ReturnValue = (int)command.ExecuteScalar();
			}
			return ReturnValue;
		}
		public ModelDAL ModelFindByID(int ModelID)
		{// retrieve a Model by ID (we dont expect multiple records here)
			ModelDAL ReturnValue = null;
			CheckConnection();
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
			return ReturnValue;
		}
		public List<ModelDAL> ModelsFindByFactionID(int FactionID)
		{// retrieve all Models by FactionID (we expect multiple records here)
			List<ModelDAL> ReturnValue = new List<ModelDAL>();
			CheckConnection();
			using (SqlCommand command = new SqlCommand("ModelsFindByFactionID", _con))
			{
				command.CommandType = System.Data.CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@FactionID", FactionID);

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
			return ReturnValue;
		}
		public void ModelUpdate(ModelDAL model)
		{// pretty straightforward. Overwrites data of record of given ModelID(no output)
			CheckConnection();
			using (SqlCommand command = new SqlCommand("ModelUpdate", _con))
			{
				command.CommandType = System.Data.CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@ModelID",           model.ModelID);
				command.Parameters.AddWithValue("@ModelName",         model.ModelName);
				command.Parameters.AddWithValue("@FactionID",         model.FactionID);
				command.Parameters.AddWithValue("@JackPoints",        model.JackPoints);
				command.Parameters.AddWithValue("@PointCost",         model.PointCost);
				command.Parameters.AddWithValue("@FullCrewPointCost", model.FullCrewPointCost);
				command.Parameters.AddWithValue("@AttachesToModelID", model.AttachesToModelID);
				command.Parameters.AddWithValue("@FieldAllowence",    model.FieldAllowence);
				command.Parameters.AddWithValue("@Speed",             model.Speed);
				command.Parameters.AddWithValue("@MAT",               model.MAT);
				command.Parameters.AddWithValue("@RAT",               model.RAT);
				command.Parameters.AddWithValue("@DEF",               model.DEF);
				command.Parameters.AddWithValue("@ARM",               model.ARM);
				command.Parameters.AddWithValue("@RangedRNG1",        model.RangedRNG1);
				command.Parameters.AddWithValue("@RangedRNG2",        model.RangedRNG2);
				command.Parameters.AddWithValue("@ROF1",              model.ROF1);
				command.Parameters.AddWithValue("@ROF2",              model.ROF2);
				command.Parameters.AddWithValue("@AOE1",              model.AOE1);
				command.Parameters.AddWithValue("@AOE2",              model.AOE2);
				command.Parameters.AddWithValue("@RangedPOW1",        model.RangedPOW1);
				command.Parameters.AddWithValue("@RangedPOW2",        model.RangedPOW2);
				command.Parameters.AddWithValue("@MeleeRNG1",         model.MeleeRNG1);
				command.Parameters.AddWithValue("@MeleeRNG2",         model.MeleeRNG2);
				command.Parameters.AddWithValue("@MeleePOW1",         model.MeleePOW1);
				command.Parameters.AddWithValue("@MeleePOW2",         model.MeleePOW2);
				object datareturned = command.ExecuteNonQuery();
			}
		}
		public void ModelDelete(int ModelID)
		{
			CheckConnection();
			using (SqlCommand command = new SqlCommand("ModelDelete", _con))
			{
				command.CommandType = System.Data.CommandType.StoredProcedure;
				command.Parameters.AddWithValue("@ModelID", ModelID);
				command.ExecuteNonQuery();
			}
		}
		#endregion Model CRUD
	}
}
