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

#using <mscorlib.dll>
#using <System.dll>
#using <System.Data.dll>
#using <System.EnterpriseServices.dll>


using namespace System;
using namespace System::Data;
using namespace System::Reflection;
using namespace System::Data::SqlClient;
using namespace System::EnterpriseServices;

[assembly: AssemblyKeyFileAttribute("keyfile.snk")];
[TransactionAttribute(TransactionOption::Required)]
public __gc class myServicedComponent : public ServicedComponent
{
private:
	SqlConnection * m_rConnection;

public:
	myServicedComponent()
	{
	}

  __property SqlConnection * get_SqlConn() { return m_rConnection; }
  

  __property ConnectionState * get_State()  { return __box (m_rConnection->State); }


  void myServicedComponentConnect(String * ConnectionString)
  {
    m_rConnection = new SqlConnection(ConnectionString);
    m_rConnection->Open();
  }

  void myServicedComponentClose()
  {
	  if (m_rConnection != 0)
        m_rConnection->Close();
  }

  void myServicedComponentDispose()
  {
      if (m_rConnection != 0)
          m_rConnection->Dispose();
  }

  void myServicedComponentChangeDatabase(String * DBName)
  {
      if (m_rConnection != 0)
          m_rConnection->ChangeDatabase(DBName);
  }

  SqlCommand * myServicedComponentCreateCommand()
  {
    return new SqlCommand(0, m_rConnection);
  }

  void myServicedComponentSetComplete()  // to commit changes
  {
	Console::WriteLine("Committing connection\'s transaction.");
	ContextUtil::SetComplete();
    Console::WriteLine("SetComplete");
  }

  void myServicedComponentSetAbort()     // to rollback the distributed transaction
  {
    Console::WriteLine("Aborting connection\'s transaction.");
	ContextUtil::SetAbort();
    Console::WriteLine("SetAbort");
  }
};

__gc class distribtransaction
{
public:

  void Run()
  {
    SqlCommand * mySqlCommand;
    myServicedComponent * mySC = new myServicedComponent();

    mySC->myServicedComponentConnect(S"server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind");
    Console::Write("connection state is: ");
    Console::WriteLine(mySC->State);

    mySqlCommand = new SqlCommand(0, mySC->SqlConn);

    try
    {
      // Clean up the database to restore to its original state.
      mySqlCommand->CommandText = "if exists (select * from sysobjects where name = 'TestTable' and type = 'U') drop table TestTable";
      mySqlCommand->ExecuteNonQuery();

      // Create table "TestTable".
      Console::WriteLine("Creating table TestTable.");
      mySqlCommand->CommandText = "create table TestTable (c1 int identity, c2 int)";
      mySqlCommand->ExecuteNonQuery();

      // Create unique index ss on TestTable.
      Console::WriteLine("Creating unique index ss on TestTable.");
      mySqlCommand->CommandText = "create unique index ss on TestTable(c1)";
      mySqlCommand->ExecuteNonQuery();

      // Insert into TestTable values.
      Console::WriteLine("Inserting into TestTable values.");
      mySqlCommand->CommandText = "insert into TestTable values (11)";
      mySqlCommand->ExecuteNonQuery();

      // Commit the transaction.
      mySC->myServicedComponentSetComplete();
    }
    catch (Exception * e)
    {
      Console::Write(e->ToString());

      // Rollback the transaction.
      mySC->myServicedComponentSetAbort();
    }
    __finally
    {
      //mySC->myServicedComponentClose();
      //Console::WriteLine("connection state is: " + mySC->State);
    }
  }
};

void main()
{
  distribtransaction * mydistribtransaction = new distribtransaction();
  mydistribtransaction->Run();
}


