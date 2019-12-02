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
		// this is required to create a connection to SQL through the DAL
		private ContextDAL _context = new ContextDAL();
		public ContextBLL()
		{// connectionstring is stored in the Web.Config in the MVC layer
			_context.ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
		}
		public void Dispose()
		{//this stuff takes a lot of resources and should be disposed of correctly. We use Using and this dispose to make sure we dont get stuck with the bill.
			_context.Dispose();
		}
		#endregion General Context

		#region Role CRUD
		public int RoleCreate(string RoleName)
		{
			return _context.RoleCreate(RoleName);
		}
		public List<RoleBLL> RoleGetAll(int skip, int take)
		{// skip and take are for when we want to add paging in the future.
			List<RoleBLL> ReturnValue = new List<RoleBLL>();
			List<RoleDAL> items = _context.RoleGetAll(skip, take);
			foreach (RoleDAL item in items)
			{// we loop through all the RoleDAL items and use the constructor to put it in the UserBLL
				RoleBLL CorrectedItem = new RoleBLL(item);
				ReturnValue.Add(CorrectedItem);
			}
			return ReturnValue;
		}
		public int RolesObtainCount()
		{//Aggregate? I think so.
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
		{//passes the userinfo down to DAL
			UserDAL User = new UserDAL();
			User = InputUser.ToDAL();
			return _context.UserCreate(User);
		}
		public List<UserBLL> UserGetAll(int skip, int take)
		{
			List<UserBLL> ReturnValue = new List<UserBLL>();
			List<UserDAL> items = _context.UserGetAll(skip, take);
			foreach (UserDAL item in items)
			{// we use a loop to put the info into the UserBLL by using the constructor.
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
			return _context.FactionCreate(InputFaction.ToDAL());
		}
		public List<FactionBLL> FactionsGetAll(int skip, int take)
		{// added skip/take for future paging 
			List<FactionBLL> ReturnValue = new List<FactionBLL>();
			List<FactionDAL> items = _context.FactionsGetAll(skip, take);
			foreach (FactionDAL item in items)
			{// looping through the DAL items and putting the info into the DAL by constructor
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
		{// skip take are for future paging functionality
			List<ArmyBLL> ReturnValue = new List<ArmyBLL>();
			List<ArmyDAL> items = _context.ArmiesGetAll(skip, take);
			foreach (ArmyDAL item in items)
			{// using a loop and the constructor to transfer info up.
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
		{//retrieve army by armyID
			ArmyBLL ReturnValue = null;
			ArmyDAL item = _context.ArmyFindByID(ArmyID);
			if (item != null)
			{
				ReturnValue = new ArmyBLL(item);
			}
			return ReturnValue;
		}
		public List<ArmyBLL> ArmiesFindByUserID(int UserID, int Skip, int Take)
		{// retrieves all armies by userID, skip/take are for future functionality
			List<ArmyBLL> ReturnValue = new List<ArmyBLL>();
			List<ArmyDAL> items = _context.ArmiesFindByUserID(UserID, Skip, Take);
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
		{// skip/take are for future paging
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
		{//aggregate :)
			return _context.ModelsObtainCount();
		}
		public ModelBLL ModelFindByID(int ModelID)
		{//finding a model by it's ID
			ModelBLL ReturnValue = null;
			ModelDAL item = _context.ModelFindByID(ModelID);
			if (item != null)
			{
				ReturnValue = new ModelBLL(item);
			}
			return ReturnValue;
		}
		public List<ModelBLL> ModelsFindByFactionID(int FactionID, int Skip, int Take)
		{// finding all models of a certain faction, skip/take is for future paging
			List<ModelBLL> ReturnValue = new List<ModelBLL>() ;
			List<ModelDAL> items = _context.ModelsFindByFactionID(FactionID, Skip, Take);
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

		#region ArmyModels crd
		public List<ArmyModelBLL> ArmyModelsFindByFactionID(int ArmyID, int FactionID, int Skip, int Take)
		{//we use this to create a list of models we can add to our army. this is a mix of ArmyModel and
			// models tables including QTY of models in army and how many full squats.
			List<ArmyModelBLL> ReturnValue = new List<ArmyModelBLL>();
			List<ArmyModelDAL> items = _context.ArmyModelsFindByFactionID( ArmyID, FactionID, Skip, Take);
			foreach (ArmyModelDAL item in items)
			{// adding info to the list by feeding DAL to BLL constructor
				ArmyModelBLL NewItem = new ArmyModelBLL(item);
				ReturnValue.Add(NewItem);
			}
			return ReturnValue;
		}

		public ArmyModelBLL ArmyModelsFindByArmyIDAndModelID(int ArmyID, int ModelID)
		{//grabs a single record from out many to many (ArmyModels) table
			ArmyModelDAL item = _context.ArmyModelsFindByArmyIDAndModelID(ArmyID, ModelID);
			ArmyModelBLL ReturnValue = new ArmyModelBLL(item);
			return ReturnValue;
		}

		public List<ArmyModelBLL> ArmyModelsFindByArmyID(int ArmyID, int Skip, int Take)
		{// grabs a list of models that are included in given army by armyID
			List<ArmyModelBLL> ReturnValue = new List<ArmyModelBLL>();
			List<ArmyModelDAL> items = _context.ArmyModelsFindByArmyID(ArmyID, Skip, Take);
			foreach (ArmyModelDAL item in items)
			{
				ArmyModelBLL NewItem = new ArmyModelBLL(item);
				ReturnValue.Add(NewItem);
			}
			return ReturnValue;
		}

		public void ArmyModelCreate(ArmyModelBLL Record)
		{//creates a single record in the many to many (ArmyModels) table
			ArmyModelDAL NewRecord = new ArmyModelDAL();
			NewRecord = Record.ToDAL();
			_context.ArmyModelCreate(NewRecord);
		}

		public void ArmyModelsDeleteByArmyID(int ArmyID)
		{//Wipes all records ofminiatures in an army on ArmyModels table by armyID 
			_context.ArmyModelsDeleteByArmyID(ArmyID);
		}

		//// Not used, decided to go for the delete the list and create a new list instead of 
		////grabbing all records, comparing new to old, then delete, update and creating records.
		//public void UpdateArmyModels(int ArmyID, List<ArmyModelBLL> Models)
		//{
		//	foreach(ArmyModelBLL model in Models)
		//	{

		//	}

		//}

		#endregion ArmyModels crd
	}
}
