using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
	public class ArmyModelDAL : ModelDAL
	{
		public int Quantity {	get; set; }
		public int FullSquats { get; set; }
		public int ArmyID { get; set; }
		public override string ToString()
		{
			return $"{ModelID,5} {ModelName,15} {FactionName,10} {ModelType,5} {PointCost,5} {Quantity,5} {FullSquats,5}";
		}
	}
}
