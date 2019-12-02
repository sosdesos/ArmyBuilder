using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using BusinessLogicLayer;
using DataAccessLayer;
// This is a test console app where I try to acces the BLL and experiment with new methods 
// to manipulate data and test stored procedures.

namespace ArmyBuilder
{
	class Program
	{
		static void Main(string[] args)
		{
			while (true)
			{
				int SwitchCase = 0;
				int RoleID = 0;
				ContextDAL DalContext = new ContextDAL();
				List<RoleBLL> RoleList = new List<RoleBLL>();
				ContextBLL Context = new ContextBLL();
				RoleList = Context.RoleGetAll(0, 100);
				for (int i = 0; i < RoleList.Count; i++)
				{
					Console.WriteLine(RoleList[i]);
				}

				Console.WriteLine("\n\nPress 1 to create a new entry");
				Console.WriteLine("Press 2 to edit an entry");
				Console.WriteLine("Press 3 to delete an entry");
				Console.WriteLine("Press 4 to see the propertyNames of ModelDAL");
				Console.WriteLine("Press 5 to see the items of Army 1");


				while (!int.TryParse(Console.ReadLine(), out SwitchCase))
				{
					Console.WriteLine("Please enter a number");
				}

				switch (SwitchCase)
				{
					case 1:
						Console.WriteLine("please enter a new RoleName");
						string RoleName = Console.ReadLine();
						int NewRoleID = Context.RoleCreate(RoleName);
						Console.WriteLine($"Role nr{NewRoleID} has been created. Press a key");
						Console.ReadKey();
						break;
					case 2:
						Console.WriteLine("What roleNR do you want to change?");
						while (!int.TryParse(Console.ReadLine(), out RoleID))
						{
							Console.WriteLine("Please enter a number");
						}
						Console.WriteLine("please enter a new RoleName");
						RoleName = Console.ReadLine();
						Context.RoleUpdate(RoleID, RoleName);
						Console.WriteLine($"Role nr{RoleID} has been edited. Press a key");
						Console.ReadKey();
						break;
					case 3:
						Console.WriteLine("What roleNR do you want to delete?");
						while (!int.TryParse(Console.ReadLine(), out RoleID))
						{
							Console.WriteLine("Please enter a number");
						}
						Context.RoleDelete(RoleID);
						Console.WriteLine($"Role nr{RoleID} has been deleted. Press a key");
						Console.ReadKey();
						break;
					case 4:
						Console.WriteLine("\r\n\r\n");
						var type = typeof(ModelDAL);
						System.Reflection.PropertyInfo[] Properties = type.GetProperties();
						for (int i = 0; i <Properties.Length; i++)
						{
							Console.WriteLine(Properties[i].Name);
						}
						Console.ReadKey();
						break;
					case 5:
						Console.WriteLine("\r\n\r\n");
						List<ArmyModelBLL> Army = new List<ArmyModelBLL>();
							Army = Context.ArmyModelsFindByFactionID(1,1, 0, 100);
						for (int i = 0; i < Army.Count; i++)
						{
							Console.WriteLine(Army[i].ToString());
						}
						Console.ReadKey();
						break;
					default:
						Console.WriteLine("please enter a valid number");
						Console.ReadKey();
						break;
				}
				Console.Clear();
			}
		}
	}
}





