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

public class adooverview4
{
  public static void Main()
  {
    adooverview4 myadooverview4 = new adooverview4();
    myadooverview4.Run();
  }

  public void Run()
  {
    // Create a new Connection and SqlDataAdapter

    SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind");
    SqlDataAdapter mySqlDataAdapter = new SqlDataAdapter("Select * from Region", myConnection);
    SqlParameter workParam = null;

    // Restore database to it's original condition so sample will work correctly.
    Cleanup();

    // Build the insert Command
    mySqlDataAdapter.InsertCommand = new SqlCommand("Insert into Region (RegionID, RegionDescription) VALUES (@RegionID, @RegionDescription)", myConnection);

    workParam = mySqlDataAdapter.InsertCommand.Parameters.Add("@RegionID", SqlDbType.Int);
    workParam.SourceColumn = "RegionID";
    workParam.SourceVersion = DataRowVersion.Current;

    workParam = mySqlDataAdapter.InsertCommand.Parameters.Add("@RegionDescription", SqlDbType.NChar, 50);
    workParam.SourceVersion = DataRowVersion.Current;
    workParam.SourceColumn = "RegionDescription";

    // Build the update command
    mySqlDataAdapter.UpdateCommand = new SqlCommand("Update Region Set RegionDescription = @RegionDescription WHERE RegionID = @RegionID" , myConnection);

    workParam = mySqlDataAdapter.UpdateCommand.Parameters.Add("@RegionID", SqlDbType.Int);
    workParam.SourceColumn = "RegionID";
    workParam.SourceVersion = DataRowVersion.Original;

    workParam = mySqlDataAdapter.UpdateCommand.Parameters.Add("@RegionDescription", SqlDbType.NChar, 50);
    workParam.SourceVersion = DataRowVersion.Current;
    workParam.SourceColumn = "RegionDescription";

    DataSet myDataSet = new DataSet();

    // Set the MissingSchemaAction property to AddWithKey because Fill will not cause primary key & unique key information to be retrieved unless AddWithKey is specified.
    mySqlDataAdapter.MissingSchemaAction = MissingSchemaAction.AddWithKey;
    mySqlDataAdapter.Fill(myDataSet, "Region");

    DataRow myDataRow1 = myDataSet.Tables["Region"].Rows.Find(2);
    myDataRow1[1] = "Changed this region desc";

    DataRow myDataRow2 = myDataSet.Tables["Region"].NewRow();
    myDataRow2[0] = 901;
    myDataRow2[1] = "A new region";
    myDataSet.Tables["Region"].Rows.Add(myDataRow2);

    try
    {
      mySqlDataAdapter.Update(myDataSet, "Region");
      Console.Write("Updating DataSet succeeded!");
    }
    catch(Exception e)
    {
      Console.Write(e.ToString());
    }
  }

  public void Cleanup()
  {
    SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind");

    try
    {
      // Restore database to it's original condition so sample will work correctly.
      myConnection.Open();
      SqlCommand CleanupCommand = new SqlCommand("DELETE FROM Region WHERE RegionID = '901'", myConnection);
      CleanupCommand.ExecuteNonQuery();
    }
    catch(Exception e)
    {
      Console.Write(e.ToString());
    }
    finally
    {
      myConnection.Close();
    }
  }
}

}