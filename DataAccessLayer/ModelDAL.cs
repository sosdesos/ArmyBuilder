using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
	public class ModelDAL
	{   //this class stores all the data from the Models table
		public int    ModelID {			  get; set; }
		public string ModelName {		  get; set; }
		public int    FactionID {		  get; set; }
		public string FactionName {		  get; set; }
		public int    ModelType {		  get; set; }
		public int    PointCost {		  get; set; }
		public int    FullCrewPointCost { get; set; }
		public int	  AttachesToModelID { get; set; }
		public int    FieldAllowence {    get; set; }
		public int    Speed {			  get; set; }
		public int    MAT {				  get; set; }
		public int    RAT {				  get; set; }
		public int    DEF {				  get; set; }
		public int    ARM {				  get; set; }
		public string RangedRNG1 {        get; set; }
		public string RangedRNG2 {        get; set; }
		public int    ROF1 {              get; set; }
		public int    ROF2 {              get; set; }
		public int    AOE1 {              get; set; }
		public int    AOE2 {              get; set; }
		public int    RangedPOW1 {        get; set; }
		public int    RangedPOW2 {        get; set; }
		public double MeleeRNG1 {         get; set; }
		public double MeleeRNG2 {         get; set; }
		public int    MeleePOW1 {         get; set; }
		public int    MeleePOW2 {         get; set; }


		public override string ToString()
		{
			return $"{ModelID,5} {ModelName,20} {FactionName,10} {ModelType,5} {PointCost,5} {FieldAllowence,5}";
		}
	}
}
