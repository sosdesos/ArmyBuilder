using BusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BusinessLogicLayer
{
	public class FullArmyData : ArmyBLL
	{// combines info from the army, and all models in it.
		public List<ArmyModelBLL> models { get; set; }
		public int JackPoints { get; set; }
		public int ArmyCost { get; set; }
		public string EncounterLevel { get; set; }// future idea calculate the "name" of the encounter 
												  //level by army pointcost
		public FullArmyData(ArmyBLL army, List<ArmyModelBLL> RetrievedModels)
		{   // we can populate the class with values from the Data access layer
			models = RetrievedModels;
			ArmyID = army.ArmyID;
			ArmyName = army.ArmyName;
			UserID = army.UserID;
			UserName = army.UserName;
			Comments = army.Comments;
			FactionID = army.FactionID;
			FactionName = army.FactionName;
			JackPoints = AvailablePoints(models);// calculates the available points for warjacks
			ArmyCost = CalculateArmyCost(models);// calculates the army cost
		}
		public FullArmyData()
		{
			//default constructor required for MVC
		}
		#region Meaningfull calculations
		public int AvailablePoints(List<ArmyModelBLL> models)
		{// Warcasters add points to your army that you can only use for warjacks. this calculates how 
			//many points are left. this value should never go below 0.
			int WarcasterPoints = 0;
			int WarjackPoints = 0;
			int ReturnValue = 0;
			foreach (ArmyModelBLL model in models)
			{// we check the type of the model. Casters add points, Warjacks cost points.Troops/solo are ignored
				int SwitchCase = model.ModelType;
				switch (SwitchCase)
				{
					case 0:// typically a warcaster is a character and can be fielded once. but who knows what the future will bring us so i check for quantity too.
						WarcasterPoints = WarcasterPoints + (model.PointCost * model.Quantity);
						break;
					case 1:
						WarjackPoints = WarjackPoints + (model.PointCost * model.Quantity);
						break;
					default:
						//only warjacks and Warcasters are relevent for this.
						break;
				}
			}
			ReturnValue = WarcasterPoints - WarjackPoints;
			if (0 > ReturnValue)
			{// can't be a negative number.
				ReturnValue = 0;
			}
			return ReturnValue;
		}
		public int CalculateArmyCost(List<ArmyModelBLL> models)
		{   // warcasters add points that warjacks can use, troops can't use these. 
			//warcaster points - warjack cost will always 0 or higher, then the troop cost is added.
			int WarcasterPoints = 0;
			int WarjackPoints   = 0;
			int TroopCost       = 0;// includes solo's too.
			int ReturnValue     = 0;
			foreach (ArmyModelBLL model in models)
			{
				int SwitchCase = model.ModelType;
				switch (SwitchCase)
				{
					case 0://as above, taking quantity in for future possibilities.
						WarcasterPoints = WarcasterPoints + (model.PointCost * model.Quantity);
						break;
					case 1:
						WarjackPoints = WarjackPoints + (model.PointCost * model.Quantity);
						break;
					default:// troops can be normal or full crew cost. we just add the difference per full squat plus the normal cost per unit.
						TroopCost = TroopCost + (model.PointCost * model.Quantity)+ (model.FullSquats*(model.FullCrewPointCost-model.PointCost));
						break;
				}
			}
			ReturnValue = WarjackPoints - WarcasterPoints;
			if (0 > ReturnValue)
			{// this value can never be negative, when you dont use all points they can't be used for troops
				ReturnValue = 0;
			}
			ReturnValue = ReturnValue + TroopCost;// we add the troop cost to the Warjack/Warcaster total
			return ReturnValue;
		}
		#endregion Meaningfull calculations
	}
}
