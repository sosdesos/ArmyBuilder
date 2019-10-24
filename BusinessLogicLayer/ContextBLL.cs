using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace BusinessLogicLayer
{
	public class ContextBLL : IDisposable
	{
		#region General Context (connection and dispose stuff)
		private ContextDAL _context = new ContextDAL();
		public ContextBLL()
		{
			_context.ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
		}
		public void Dispose()
		{
			_context.Dispose();
		}
		#endregion General Context

		#region Role CRUD
		public int RoleCreate(string RoleName)
		{
			return _context.RoleCreate(RoleName);
		}
		public List<RoleBLL> RoleGetAll(int skip, int take)
		{
			List<RoleBLL> ReturnValue = new List<RoleBLL>();
			List<RoleDAL> items = _context.RoleGetAll(skip, take);
			foreach (RoleDAL item in items)
			{
				RoleBLL CorrectedItem = new RoleBLL(item);
				ReturnValue.Add(CorrectedItem);
			}
			return ReturnValue;
		}
		public int RolesObtainCount()
		{
			return _context.RolesObtainCount();
		}
		public RoleBLL RoleFindByID(int RoleID)
		{
			RoleBLL ReturnValue = null;
			RoleDAL item = _context.RoleFindByID(RoleID);
			if (item != null)
			{
				ReturnValue = new RoleBLL(item);
			}
			return ReturnValue;
		}
		public void RoleUpdate(int RoleID, string RoleName)
		{
			_context.RoleUpdate(RoleID, RoleName);
		}
		public void RoleDelete(int RoleID)
		{
			_context.RoleDelete(RoleID);
		}
		#endregion Role Crud

		#region User Crud
		public int UserCreate(UserBLL InputUser)
		{
			UserDAL User = new UserDAL();
			User = InputUser.ToDAL();
			return _context.UserCreate(User);
		}
		public List<UserBLL> UserGetAll(int skip, int take)
		{
			List<UserBLL> ReturnValue = new List<UserBLL>();
			List<UserDAL> items = _context.UserGetAll(skip, take);
			foreach (UserDAL item in items)
			{
				UserBLL CorrectedItem = new UserBLL(item);
				ReturnValue.Add(CorrectedItem);
			}
			return ReturnValue;
		}
		public int UserObtainCount()
		{
			return _context.UsersObtainCount();
		}
		public UserBLL UserFindByID(int UserID)
		{
			UserBLL ReturnValue = null;
			UserDAL item = _context.UserFindByID(UserID);
			if (item != null)
			{
				ReturnValue = new UserBLL(item);
			}
			return ReturnValue;
		}
		public UserBLL UserFindByName(string UserName)
		{
			UserBLL ReturnValue = null;
			UserDAL item = _context.UserFindByName(UserName);
			if (item != null)
			{
				ReturnValue = new UserBLL(item);
			}
			return ReturnValue;
		}
		public void UserUpdate(UserBLL UserToEdit)
		{
			UserDAL User = new UserDAL();
			User = UserToEdit.ToDAL();
			_context.UserUpdate(User);
		}
		public void UserDelete(int UserID)
		{
			_context.UserDelete(UserID);
		}
		#endregion User Crud

		#region Faction Crud
		public int FactionCreate(FactionBLL InputFaction)
		{
			FactionDAL faction = new FactionDAL();
			faction = InputFaction.ToDAL();
			return _context.FactionCreate(faction);
		}
		public List<FactionBLL> FactionsGetAll(int skip, int take)
		{
			List<FactionBLL> ReturnValue = new List<FactionBLL>();
			List<FactionDAL> items = _context.FactionsGetAll(skip, take);
			foreach (FactionDAL item in items)
			{
				FactionBLL CorrectedItem = new FactionBLL(item);
				ReturnValue.Add(CorrectedItem);
			}
			return ReturnValue;
		}
		public int FactionsObtainCount()
		{
			return _context.FactionsObtainCount();
		}
		public FactionBLL FactionFindByID(int FactionID)
		{
			FactionBLL ReturnValue = null;
			FactionDAL item = _context.FactionFindByID(FactionID);
			if (item != null)
			{
				ReturnValue = new FactionBLL(item);
			}
			return ReturnValue;
		}
		public void FactionUpdate(FactionBLL FactionToEdit)
		{
			FactionDAL Faction = new FactionDAL();
			Faction = FactionToEdit.ToDAL();
			_context.FactionUpdate(Faction);
		}
		public void FactionDelete(int FactionID)
		{
			_context.FactionDelete(FactionID);
		}
		#endregion Faction Crud

		#region Army Crud
		public int ArmyCreate(ArmyBLL InputArmy)
		{
			ArmyDAL Army = new ArmyDAL();
			Army = InputArmy.ToDAL();
			return _context.ArmyCreate(Army);
		}
		public List<ArmyBLL> ArmiesGetAll(int skip, int take)
		{
			List<ArmyBLL> ReturnValue = new List<ArmyBLL>();
			List<ArmyDAL> items = _context.ArmiesGetAll(skip, take);
			foreach (ArmyDAL item in items)
			{
				ArmyBLL NewItem = new ArmyBLL(item);
				ReturnValue.Add(NewItem);
			}
			return ReturnValue;
		}
		public int ArmiesObtainCount()
		{
			return _context.ArmiesObtainCount();
		}
		public ArmyBLL ArmyFindByID(int ArmyID)
		{
			ArmyBLL ReturnValue = null;
			ArmyDAL item = _context.ArmyFindByID(ArmyID);
			if (item != null)
			{
				ReturnValue = new ArmyBLL(item);
			}
			return ReturnValue;
		}
		public List<ArmyBLL> ArmiesFindByUserID(int UserID)
		{
			List<ArmyBLL> ReturnValue = new List<ArmyBLL>();
			List<ArmyDAL> items = _context.ArmiesFindByUserID(UserID);
			foreach (ArmyDAL item in items)
			{
				ArmyBLL NewItem = new ArmyBLL(item);
				ReturnValue.Add(NewItem);
			}
			return ReturnValue;
		}
		public void ArmyUpdate(ArmyBLL ArmyToEdit)
		{
			ArmyDAL Army = new ArmyDAL();
			Army = ArmyToEdit.ToDAL();
			_context.ArmyUpdate(Army);
		}
		public void ArmyDelete(int ArmyID)
		{
			_context.ArmyDelete(ArmyID);
		}
		#endregion Army Crud

		#region Model Crud
		public int ModelCreate(ModelBLL InputModel)
		{
			ModelDAL Model = new ModelDAL();
			Model = InputModel.ToDAL();
			return _context.ModelCreate(Model);
		}
		public List<ModelBLL> ModelsGetAll(int skip, int take)
		{
			List<ModelBLL> ReturnValue = new List<ModelBLL>();
			List<ModelDAL> items = _context.ModelsGetAll(skip, take);
			foreach (ModelDAL item in items)
			{
				ModelBLL NewItem = new ModelBLL(item);
				ReturnValue.Add(NewItem);
			}
			return ReturnValue;
		}
		public int ModelObtainCount()
		{
			return _context.ModelsObtainCount();
		}
		public ModelBLL ModelFindByID(int ModelID)
		{
			ModelBLL ReturnValue = null;
			ModelDAL item = _context.ModelFindByID(ModelID);
			if (item != null)
			{
				ReturnValue = new ModelBLL(item);
			}
			return ReturnValue;
		}
		public List<ModelBLL> ModelsFindByFactionID(int FactionID)
		{
			List<ModelBLL> ReturnValue = null;
			List<ModelDAL> items = _context.ModelsFindByFactionID(FactionID);
			foreach (ModelDAL item in items)
			{
				ModelBLL NewItem = new ModelBLL(item);
				ReturnValue.Add(NewItem);
			}
			return ReturnValue;
		}
		public void ModelUpdate(ModelBLL ModelToEdit)
		{
			ModelDAL Model = new ModelDAL();
			Model = ModelToEdit.ToDAL();
			_context.ModelUpdate(Model);
		}
		public void ModelDelete(int ModelID)
		{
			_context.ModelDelete(ModelID);
		}
		#endregion Model Crud
	}
}
