    <%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
    <%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>
    
    <!-- #include virtual="/quickstart/howto/include/dataheader.inc" -->
    
    <h4>ADO.NET: Use Database Transactions</h4>
    
    Database transactions are used to control data commitment to databases.  For example, in
    standard account procedures, it is necessary to debit one account and credit another at
    the same time.  Since computers break down on occasion (power outages, network outages, and so on)
    there is the potential for one record to be updated or added, but not the other. To
    avoid these situations, transactions are used. Transactions in ADO.NET are, just as in ADO,
    handled at the database level:  your database must support transactions.
    
    <p>There are three basic commands for transactions: <b>BeginTransaction</b>, <b>Commit</b>, and <b>Rollback</b>.  <b>BeginTransaction</b>
    marks the beginning of a transaction.  Anything that happens between the <b>BeginTransaction</b> and the next
    command (either <b>Rollback</b> or <b>Commit</b>) is considered part of the transaction.  The following code example demonstrates using transactions.</p>
    
    <Acme:TabControl runat="server">
    <Tab Name="C#">

    SqlConnection myConnection = new SqlConnection("server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind");
    SqlCommand myCommand = new SqlCommand();
    SqlTransaction myTrans;
    
    // Open the connection.
    myConnection.Open();
    
    // Assign the connection property.
    myCommand.Connection  = myConnection;
    
    // Begin the transaction.
    myTrans = myConnection.BeginTransaction();
    
    // Assign transaction object for a pending local transaction
    myCommand.Transaction = myTrans;
    
    try
    {
      // Restore database to near its original condition so sample will work correctly.
      myCommand.CommandText = "DELETE FROM Region WHERE (RegionID = 100) OR (RegionID = 101)";
      myCommand.ExecuteNonQuery();
    
      // Insert the first record.
      myCommand.CommandText = "Insert into Region (RegionID, RegionDescription) VALUES (100, 'MidWestern')";
      myCommand.ExecuteNonQuery();
    
      // Insert the second record.
      myCommand.CommandText = "Insert into Region (RegionID, RegionDescription) VALUES (101, 'MidEastern')";
      myCommand.ExecuteNonQuery();
    
      myTrans.Commit();
      Console.WriteLine("Both Records are written to the database!");
    }
    catch(Exception e)
    {
      myTrans.Rollback();
      Console.WriteLine(e.ToString());
      Console.WriteLine("Neither record is written to the database!");
    }
    finally
    {
      myConnection.Close();
    }
    </Tab>
    <Tab Name="VB">

    Dim myConnection as SQLConnection = new SQLConnection("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind")
    Dim myCommand as SQLCommand = new SqlCommand()
    Dim myTrans as SqlTransaction
    
    ' Open the connection.
    myConnection.Open()
    
    ' Assign the connection property.
    myCommand.Connection  = myConnection
    
    ' Begin the transaction.
    myTrans = myConnection.BeginTransaction()
    
    ' Assign transaction object for a pending local transaction
    myCommand.Transaction = myTrans
    
    try
      ' Restore database to its original condition so sample will work correctly.
      myCommand.CommandText = "DELETE FROM Region WHERE (RegionID = 100) OR (RegionID = 101)"
      myCommand.ExecuteNonQuery()
    
      ' Insert the first record.
      myCommand.CommandText = "Insert into Region (RegionID, RegionDescription) VALUES (100, 'MidWestern')"
      myCommand.ExecuteNonQuery()
    
      ' Insert the second record.
      myCommand.CommandText = "Insert into Region (RegionID, RegionDescription) VALUES (101, 'MidEastern')"
      myCommand.ExecuteNonQuery()
    
      myTrans.Commit()
      Console.Write("Both Records are written to the database!")
    catch e as Exception
      myTrans.Rollback()
      Console.WriteLine(e.ToString())
      Console.Write("Neither record is written to the database!")
    finally
      myConnection.Close()
    end try
    </Tab>
    <Tab Name="C++">

    SqlConnection * myConnection = new SqlConnection(S"server=(local)\\NetSDK;Trusted_Connection=yes;database=northwind;provider=sqloledb");
    SqlCommand * mySqlCommand;
    SqlTransaction * myTransaction;

    // Restore database to near it's original condifition so sample will work correctly.
    myConnection->Open();
    mySqlCommand = new SqlCommand(S"DELETE FROM Region WHERE (RegionID = 100) OR (RegionID = 101)", myConnection);
    mySqlCommand->ExecuteNonQuery();

    myTransaction = myConnection->BeginTransaction();

    // Assign transaction object for a pending local transaction
    mySqlCommand->Transaction = myTransaction;

    try
    {
      mySqlCommand->CommandText = S"Insert into Region (RegionID, RegionDescription) VALUES (100, 'Description')";
      mySqlCommand->ExecuteNonQuery();
      mySqlCommand->CommandText = S"Insert into Region (RegionID, RegionDescription) VALUES (101, 'Description')";
      mySqlCommand->ExecuteNonQuery();
      myTransaction->Commit();
	  Console::WriteLine(S"Both Records written to database");
    }
    catch(Exception * e)
    {
      myTransaction->Rollback();
	  Console::WriteLine(e->ToString());
	  Console::WriteLine(S"Neither record written to database.");
    }
    __finally
    {
      myConnection->Close();
    }
    </Tab>
    </Acme:TabControl>
    
    
    <p>The example shows that if either insert fails, both are rolled back to their original states. If
    each succeeds, then the transaction is committed.</p>
    
    <p>As in classic ADO, you can control transactions through the <b>connection</b> object. In fact, when you
    use the <b>OleDbConnection</b>, it uses the same underlying OLE DB transaction model.  Thus, if you were
    able to commit transactions against your database with ADO classic, you can still commit them with ADO.NET. The following code example demonstrates using the <b>SqlConnection</b> and <b>SqlCommand</b> to insert two records into "Region" table. If
    either fails, then the changes are rolled back.</p>
    
   <p>The <b>DataSet</b> object also has a commit model (AcceptChanges,RejectChanges) but it does
    not affect the database.  The commit model is for the cache of data in the DataSet alone.
    To submit the Data from the DataSet into the database, use the <b>Update</b> method on the <b>SqlDataAdapter</b>.</p>
    
    
    <Acme:LangSwitch runat="server">
      <CsTemplate>
          <Acme:SourceRef
            RunSample="/quickstart/howto/samples/adoplus/dbtransactionswithacommand/cs/dbtransactionswithacommand.aspx"
            ViewSource="/quickstart/howto/samples/adoplus/dbtransactionswithacommand/dbtransactionswithacommand.src"
            Icon="/quickstart/images/genicon.gif"
            Caption="C# DBTransactionsWithACommand.aspx"
            runat="server" />
      </CsTemplate>
      <VbTemplate>
          <Acme:SourceRef
            RunSample="/quickstart/howto/samples/adoplus/dbtransactionswithacommand/vb/dbtransactionswithacommand.aspx"
            ViewSource="/quickstart/howto/samples/adoplus/dbtransactionswithacommand/dbtransactionswithacommand.src"
            Icon="/quickstart/images/genicon.gif"
            Caption="VB DBTransactionsWithACommand.aspx"
            runat="server" />
      </VbTemplate>
      <CpTemplate>
          <Acme:SourceRef
            RunSample="/quickstart/howto/samples/adoplus/dbtransactionswithacommand/CP"
            ViewSource="/quickstart/howto/samples/adoplus/dbtransactionswithacommand/dbtransactionswithacommand.src"
            Icon="/quickstart/images/genicon.gif"
            Caption="C++ DBTransactionsWithACommand.exe"
	    MapRunSamplePath = true
            runat="server" />
      </CpTemplate>
    </Acme:LangSwitch>
    
    <p>
    <!-- #include virtual="/quickstart/include/footer.inc" -->
