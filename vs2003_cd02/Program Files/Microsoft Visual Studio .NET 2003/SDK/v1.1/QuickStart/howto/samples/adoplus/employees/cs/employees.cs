//-----------------------------------------------------------------------
//  This file is part of the Microsoft .NET SDK Code Samples.
// 
//  Copyright (C) Microsoft Corporation.  All rights reserved.
// 
//This source code is intended only as a supplement to Microsoft
//Development Tools and/or on-line documentation.  See these other
//materials for detailed information regarding Microsoft code samples.
// 
//THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
//KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
//PARTICULAR PURPOSE.
//-----------------------------------------------------------------------

namespace HowTo.Samples.ADONET
{

using System;
using System.Data;
using System.Data.SqlClient;
using System.Xml;

public class employees
{
  public static void Main()
  {
    employees myemployees = new employees();
    myemployees.Run();
  }

  public void Run()
  {

    SqlConnection mySqlConnection = new SqlConnection("server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind");
    mySqlConnection.Open();
    SqlCommand mySqlCommand = new SqlCommand("select * from employees order by EmployeeID", mySqlConnection);

    try
    {
      SqlDataReader myReader = mySqlCommand.ExecuteReader();

			int record = 0;
      int photoColumn = myReader.GetOrdinal("Photo");

			while (myReader.Read()) 
			{
				record++;
        Console.Write("\n************************ Employee number " + record.ToString() + " ************************\n");
        
        // Display each column and value, skipping the "Photo" column
        for (int column=0; column<myReader.FieldCount; column++) {
					if (column != photoColumn) {
						Console.Write(myReader.GetName(column) + ":\t" + myReader.GetValue(column).ToString() + "\n");
					}
				}
      }
    }
    catch (Exception e)
    {
      Console.Write(e.ToString());
    }
    finally{
      mySqlConnection.Close();
    }
  }
}

}

