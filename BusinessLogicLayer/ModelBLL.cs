using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
	public class ModelBLL
	{// data from the Models table.
		public int ModelID {			get; set; }
		public string ModelName {		get; set; }
		public int FactionID {			get; set; }
		public string FactionName {		get; set; }
		public int ModelType {			get; set; }
		public int PointCost {			get; set; }
		public int FullCrewPointCost {	get; set; }
		public int AttachesToModelID  { get; set; }
		public int FieldAllowence {		get; set; }
		public int Speed {				get; set; }
		public int MAT {				get; set; }
		public int RAT {				get; set; }
		public int DEF {				get; set; }
		public int ARM {				get; set; }
		public string RangedRNG1 {		get; set; }
		public string RangedRNG2 {		get; set; }
		public int ROF1 {				get; set; }
		public int ROF2 {				get; set; }
		public int AOE1 {				get; set; }
		public int AOE2 {				get; set; }
		public int RangedPOW1 {			get; set; }
		public int RangedPOW2 {			get; set; }
		public double MeleeRNG1 {		get; set; }
		public double MeleeRNG2 {		get; set; }
		public int MeleePOW1 {			get; set; }
		public int MeleePOW2 {			get; set; }

		public ModelBLL(ModelDAL Model)
		{   // we can populate the class with values from the Data access layer
			ModelID           = Model.ModelID;
			ModelName         = Model.ModelName;
			FactionID         = Model.FactionID;
			FactionName       = Model.FactionName;
			ModelType		  = Model.ModelType;
			PointCost         = Model.PointCost;
			FullCrewPointCost = Model.FullCrewPointCost;
			AttachesToModelID = Model.AttachesToModelID;
			FieldAllowence    = Model.FieldAllowence;
			Speed             = Model.Speed;
			MAT               = Model.MAT;
			RAT               = Model.RAT;
			DEF               = Model.DEF;
			ARM               = Model.ARM;
			RangedRNG1        = Model.RangedRNG1;
			RangedRNG2        = Model.RangedRNG2;
			ROF1              = Model.ROF1;
			ROF2              = Model.ROF2;
			AOE1              = Model.AOE1;
			AOE2              = Model.AOE2;
			RangedPOW1        = Model.RangedPOW1;
			RangedPOW2        = Model.RangedPOW2;
			MeleeRNG1         = Model.MeleeRNG1;
			MeleeRNG2         = Model.MeleeRNG2;
			MeleePOW1         = Model.MeleePOW1;
			MeleePOW2         = Model.MeleePOW2;
		}
		public ModelBLL()
		{
			//The default constructor(required for MVC)
		}
		public ModelDAL ToDAL()
		{   //Makest it easy to pass values back to the data access layer
			ModelDAL ReturnValue = new ModelDAL();
			ReturnValue.AttachesToModelID = AttachesToModelID;
			ReturnValue.ModelID           = ModelID;
			ReturnValue.ModelName         = ModelName;
			ReturnValue.FactionID         = FactionID;
			ReturnValue.FactionName       = FactionName;
			ReturnValue.ModelType		  = ModelType;
			ReturnValue.PointCost         = PointCost;
			ReturnValue.FullCrewPointCost = FullCrewPointCost;
			ReturnValue.FieldAllowence    = FieldAllowence;
			ReturnValue.Speed             = Speed;
			ReturnValue.MAT               = MAT;
			ReturnValue.RAT               = RAT;
			ReturnValue.DEF               = DEF;
			ReturnValue.ARM               = ARM;
			ReturnValue.RangedRNG1        = RangedRNG1;
			ReturnValue.RangedRNG2        = RangedRNG2;
			ReturnValue.ROF1              = ROF1;
			ReturnValue.ROF2              = ROF2;
			ReturnValue.AOE1              = AOE1;
			ReturnValue.AOE2              = AOE2;
			ReturnValue.RangedPOW1        = RangedPOW1;
			ReturnValue.RangedPOW2        = RangedPOW2;
			ReturnValue.MeleeRNG1         = MeleeRNG1;
			ReturnValue.MeleeRNG2         = MeleeRNG2;
			ReturnValue.MeleePOW1         = MeleePOW1;
			ReturnValue.MeleePOW2         = MeleePOW2;
			return ReturnValue;
		}
	}
}