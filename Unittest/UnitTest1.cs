using System;
using System.Collections.Generic;
using BusinessLogicLayer;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Unittest
{
	[TestClass]
	public class MeaningfullCalculationTest
	{
		#region TestData
		public ArmyModelBLL Warcaster()
		{// sample warcaster with info required to test
			ArmyModelBLL ReturnValue = new ArmyModelBLL();
			ReturnValue.Quantity = 1;
			ReturnValue.PointCost = 30;
			ReturnValue.FullCrewPointCost = 0;
			ReturnValue.FullSquats = 0;
			ReturnValue.ModelType = 0;
			return ReturnValue;
		}
		public ArmyModelBLL WarJack()
		{//sample warjack with info required to test
			ArmyModelBLL ReturnValue = new ArmyModelBLL();
			ReturnValue.Quantity = 1;
			ReturnValue.PointCost = 10;
			ReturnValue.FullCrewPointCost = 0;
			ReturnValue.FullSquats = 0;
			ReturnValue.ModelType = 1;
			return ReturnValue;
		}
		public ArmyModelBLL Troop()
		{//sample troop with info required to test
			ArmyModelBLL ReturnValue = new ArmyModelBLL();
			ReturnValue.Quantity = 1;
			ReturnValue.PointCost = 10;
			ReturnValue.FullCrewPointCost = 15;
			ReturnValue.FullSquats = 0;
			ReturnValue.ModelType = 2;
			return ReturnValue;
		}
		public ArmyModelBLL FullTroop()
		{//sample full troop with info to test
			ArmyModelBLL ReturnValue = new ArmyModelBLL();
			ReturnValue.Quantity = 1;
			ReturnValue.PointCost = 10;
			ReturnValue.FullCrewPointCost = 15;
			ReturnValue.FullSquats = 1;
			ReturnValue.ModelType = 2;
			return ReturnValue;
		}
		public FullArmyData TestArmy(int WarcasterQty, int warjackQty, int TroopQty, int FullTroopQty)
		{// testarmy we can populate with predictable info to run a clean test. 
			FullArmyData ReturnValue = new FullArmyData();
			List<ArmyModelBLL> models = new List<ArmyModelBLL>();
			for(int i = 0; i< WarcasterQty; i++)
			{//add X amount of casters
				models.Add(Warcaster());
			}
			for (int i = 0; i < warjackQty; i++)
			{//add X amount of jacks
				models.Add(WarJack());
			}
			for (int i = 0; i < TroopQty; i++)
			{//add X amount of troops
				models.Add(Troop());
			}
			for (int i = 0; i < FullTroopQty; i++)
			{//adds X amount of full troops
				models.Add(FullTroop());
			}
			ReturnValue.models = models;
			return ReturnValue;
		}
		#endregion TestData

		[TestMethod]
		public void CalculateArmyCost_0_WithJackpointsAvailable()
		{
			// arrange
			var NegativeTestArmy = TestArmy(1,1,0,0);

			int expected = 0;
			// act
			int actual = NegativeTestArmy.CalculateArmyCost(NegativeTestArmy.models);
			// assert
			Assert.AreEqual(expected, actual);
		}
		[TestMethod]
		public void CalculateArmyCost_0_WithJackpointsOnly()
		{
			// arrange
			var ZeroPointsTestArmy = TestArmy(1, 3, 0, 0);

			int expected = 0;
			// act
			int actual = ZeroPointsTestArmy.CalculateArmyCost(ZeroPointsTestArmy.models);
			// assert
			Assert.AreEqual(expected, actual);
		}
		[TestMethod]
		public void CalculateArmyCost_20_WithJackpointsAndTroops()
		{
			// arrange
			var ZeroPointsTestArmy = TestArmy(1, 3, 2, 0);

			int expected = 20;
			// act
			int actual = ZeroPointsTestArmy.CalculateArmyCost(ZeroPointsTestArmy.models);
			// assert
			Assert.AreEqual(expected, actual);
		}
		[TestMethod]
		public void CalculateArmyCost_30_WithTroopsOnly()
		{
			// arrange
			var ZeroPointsTestArmy = TestArmy(1, 0, 3, 0);

			int expected = 30;
			// act
			int actual = ZeroPointsTestArmy.CalculateArmyCost(ZeroPointsTestArmy.models);
			// assert
			Assert.AreEqual(expected, actual);
		}
		[TestMethod]
		public void CalculateArmyCost_30_WithWarjacksAndTroops()
		{
			// arrange
			var ZeroPointsTestArmy = TestArmy(1, 3, 3, 0);

			int expected = 30;
			// act
			int actual = ZeroPointsTestArmy.CalculateArmyCost(ZeroPointsTestArmy.models);
			// assert
			Assert.AreEqual(expected, actual);
		}
		[TestMethod]
		public void CalculateArmyCost_30_WithWarjacksAndFullTroops()
		{
			// arrange
			var ZeroPointsTestArmy = TestArmy(1, 3, 0, 2);

			int expected = 30;
			// act
			int actual = ZeroPointsTestArmy.CalculateArmyCost(ZeroPointsTestArmy.models);
			// assert
			Assert.AreEqual(expected, actual);
		}
		[TestMethod]
		public void CalculateArmyCost_25_With1WarjackTroopAndFullTroop()
		{
			// arrange
			var ZeroPointsTestArmy = TestArmy(1, 1, 1, 1);

			int expected = 25;
			// act
			int actual = ZeroPointsTestArmy.CalculateArmyCost(ZeroPointsTestArmy.models);
			// assert
			Assert.AreEqual(expected, actual);
		}
		[TestMethod]
		public void CalculateArmyCost_50_With2WarjacksTroopsAndFullTroops()
		{
			// arrange
			var ZeroPointsTestArmy = TestArmy(1, 2, 2, 2);

			int expected = 50;
			// act
			int actual = ZeroPointsTestArmy.CalculateArmyCost(ZeroPointsTestArmy.models);
			// assert
			Assert.AreEqual(expected, actual);
		}
		[TestMethod]
		public void CalculateArmyCost_75_With3WarjacksTroopsAndFullTroops()
		{
			// arrange
			var ZeroPointsTestArmy = TestArmy(1, 3, 3, 3);

			int expected = 75;
			// act
			int actual = ZeroPointsTestArmy.CalculateArmyCost(ZeroPointsTestArmy.models);
			// assert
			Assert.AreEqual(expected, actual);
		}
		[TestMethod]
		public void CalculateArmyCost_110_With4WarjacksTroopsAndFullTroops()
		{
			// arrange
			var ZeroPointsTestArmy = TestArmy(1, 4, 4, 4);

			int expected = 110;
			// act
			int actual = ZeroPointsTestArmy.CalculateArmyCost(ZeroPointsTestArmy.models);
			// assert
			Assert.AreEqual(expected, actual);
		}
		[TestMethod]
		public void AvailablePoints_30_With0WarjackAndPointsLeft()
		{
			// arrange
			var ZeroPointsTestArmy = TestArmy(1, 0, 0, 0);

			int expected = 30;
			// act
			int actual = ZeroPointsTestArmy.AvailablePoints(ZeroPointsTestArmy.models);
			// assert
			Assert.AreEqual(expected, actual);
		}
		[TestMethod]
		public void AvailablePoints_20_With1WarjackAndPointsLeft()
		{
			// arrange
			var ZeroPointsTestArmy = TestArmy(1, 1, 0, 0);

			int expected = 20;
			// act
			int actual = ZeroPointsTestArmy.AvailablePoints(ZeroPointsTestArmy.models);
			// assert
			Assert.AreEqual(expected, actual);
		}
		[TestMethod]
		public void AvailablePoints_10_With2WarjacksAndPointsLeft()
		{
			// arrange
			var ZeroPointsTestArmy = TestArmy(1, 2, 0, 0);

			int expected = 10;
			// act
			int actual = ZeroPointsTestArmy.AvailablePoints(ZeroPointsTestArmy.models);
			// assert
			Assert.AreEqual(expected, actual);
		}
		[TestMethod]
		public void AvailablePoints_0_With3WarjacksAndNoPointsLeft()
		{
			// arrange
			var ZeroPointsTestArmy = TestArmy(1, 3, 0, 0);

			int expected = 0;
			// act
			int actual = ZeroPointsTestArmy.AvailablePoints(ZeroPointsTestArmy.models);
			// assert
			Assert.AreEqual(expected, actual);
		}
		[TestMethod]
		public void AvailablePoints_0_With4Warjacks()
		{
			// arrange
			var ZeroPointsTestArmy = TestArmy(1, 4, 0, 0);

			int expected = 00;
			// act
			int actual = ZeroPointsTestArmy.AvailablePoints(ZeroPointsTestArmy.models);
			// assert
			Assert.AreEqual(expected, actual);
		}
		[TestMethod]
		public void AvailablePoints_30_WithNoWarjacksAnd1Troop()
		{
			// arrange
			var ZeroPointsTestArmy = TestArmy(1, 0, 1, 0);

			int expected = 30;
			// act
			int actual = ZeroPointsTestArmy.AvailablePoints(ZeroPointsTestArmy.models);
			// assert
			Assert.AreEqual(expected, actual);
		}
		[TestMethod]
		public void AvailablePoints_30_WithNoWarjacksAnd10Troops()
		{
			// arrange
			var ZeroPointsTestArmy = TestArmy(1, 0, 10, 0);

			int expected = 30;
			// act
			int actual = ZeroPointsTestArmy.AvailablePoints(ZeroPointsTestArmy.models);
			// assert
			Assert.AreEqual(expected, actual);
		}
		[TestMethod]
		public void AvailablePoints_30_WithNoWarjacksAnd10FullTroop()
		{
			// arrange
			var ZeroPointsTestArmy = TestArmy(1, 0, 0, 10);

			int expected = 30;
			// act
			int actual = ZeroPointsTestArmy.AvailablePoints(ZeroPointsTestArmy.models);
			// assert
			Assert.AreEqual(expected, actual);
		}
		[TestMethod]
		public void AvailablePoints_0_With10Warjacks10TroopsAnd10FullTroop()
		{
			// arrange
			var ZeroPointsTestArmy = TestArmy(1, 10, 10, 10);

			int expected = 0;
			// act
			int actual = ZeroPointsTestArmy.AvailablePoints(ZeroPointsTestArmy.models);
			// assert
			Assert.AreEqual(expected, actual);
		}

	}
}
