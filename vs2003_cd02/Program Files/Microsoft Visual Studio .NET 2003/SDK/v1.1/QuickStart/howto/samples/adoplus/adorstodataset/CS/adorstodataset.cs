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
using System.Data.OleDb;
using System.Reflection;

public class adorstodataset
{
  public static void Main()
  {
    adorstodataset myadorstodataset = new adorstodataset();
    myadorstodataset.Run();
  }

  public void Run()
  {
    Type rsType = Type.GetTypeFromProgID("ADODB.RecordSet");
    object rsObj = Activator.CreateInstance(rsType);

    String constr = "server=(local)\\NetSDK;Integrated Security=SSPI;database=Northwind;provider=sqloledb";
    object[] values = new object[] {"Region", constr, /*adOpenForwardOnly*/0, /*adLockReadOnly*/1, 0x200};
    rsType.InvokeMember("Open", BindingFlags.InvokeMethod, null, rsObj, values);

    try
    {
        DataSet myDataSet = new DataSet();
        OleDbDataAdapter adapter = new OleDbDataAdapter();
        adapter.MissingSchemaAction = MissingSchemaAction.AddWithKey;
        int count = adapter.Fill(myDataSet, rsObj, "ADODB.RecordSet");
        Console.WriteLine("FillCount=" + (count));
        Console.WriteLine();
        Console.WriteLine(myDataSet.GetXml());
    }
    catch(Exception e)
    {
      Console.Write(e.ToString());
    }
    finally
    {
      try
      {
          //rsType.InvokeMember("Close", BindingFlags.InvokeMethod, null, rsObj, new object[0]);
      }
      catch(Exception e)
      {
          Console.Write(e.ToString());
      }
    }
  }
}

}
