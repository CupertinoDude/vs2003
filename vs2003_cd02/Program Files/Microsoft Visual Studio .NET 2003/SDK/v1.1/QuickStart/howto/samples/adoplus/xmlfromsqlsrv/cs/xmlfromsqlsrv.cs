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

public class xmlfromsqlsrv
{
  public static void Main()
  {
    xmlfromsqlsrv myxmlfromsqlsrv = new xmlfromsqlsrv();
    myxmlfromsqlsrv.Run();
  }

  public void Run()
  {

    String sConnection = "server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind";
    SqlConnection mySqlConnection = new SqlConnection(sConnection);
    SqlCommand mySqlCommand = new SqlCommand("select * from customers FOR XML AUTO, XMLDATA", mySqlConnection);
    mySqlCommand.CommandTimeout = 15;

    try
    {
      mySqlConnection.Open();

      // Now create the DataSet and fill it with xml data.
      DataSet myDataSet1 = new DataSet();
      myDataSet1.ReadXml((XmlTextReader)mySqlCommand.ExecuteXmlReader(), XmlReadMode.Fragment);

      // Modify to match the other dataset
      myDataSet1.DataSetName = "NewDataSet";


      // Get the same data through the provider.
      SqlDataAdapter mySqlDataAdapter = new SqlDataAdapter("select * from customers", sConnection);
      DataSet myDataSet2 = new DataSet();
      mySqlDataAdapter.Fill(myDataSet2);

      // Write data to files: data1.xml and data2.xml for comparison.
      myDataSet1.WriteXml("data1.xml");
      myDataSet2.WriteXml("data2.xml");
      Console.WriteLine ("Data has been writen to the output files: data1.xml and data2.xml");
      Console.WriteLine ();
      Console.WriteLine ("********************data1.xml********************");
      Console.WriteLine (myDataSet1.GetXml());
      Console.WriteLine ();
      Console.WriteLine ("********************data2.xml********************");
      Console.WriteLine (myDataSet2.GetXml());
    }
    catch(Exception e)
    {
      Console.WriteLine(e.ToString());
    }
    finally
    {
      mySqlConnection.Close();
    }
  }
}

}

