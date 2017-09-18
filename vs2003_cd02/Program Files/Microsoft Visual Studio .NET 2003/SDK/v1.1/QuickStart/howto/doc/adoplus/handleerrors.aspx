    <%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
    <%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>
    
    <!-- #include virtual="/quickstart/howto/include/dataheader.inc" -->
    
    <h4>ADO.NET: Handle Errors</h4>
    
    In addition to Try/Catch and exceptions, the new ADO.NET data architecture allows you to add error messages to each row of Data in a DataSet. <b>SqlDataAdapters</b> attach error messages to Rows if updates or other actions fail. Furthermore, you can filter for rows in error to present them to the user, or pass them to error handling functions.
    <p>
    Errors persist with the DataSet even when being transferred using XML or XML Web services. You can use the <b>RowError</b> property to set the Error message of a DataRow in a DataSet.
    <p>
    
    <Acme:TabControl runat="server">
    <Tab Name="C#">
    myDataSet.Tables["Customers"].Rows[0].RowError = "An error was added";
    myDataSet.Tables["Customers"].Rows[1].RowError = "This is another error message";
    </Tab>
    <Tab Name="VB">
    myDataSet.Tables("Customers").Rows(0).RowError = "An error was added"
    myDataSet.Tables("Customers").Rows(1).RowError = "This is another error message"
    </Tab>
    <Tab Name="C++">
    myDataSet->Tables->Item["Customers"]->Rows->Item[0]->RowError = "An Error was added";
    myDataSet->Tables->Item["Customers"]->Rows->Item[1]->RowError = "This is another error message";
    </Tab>
    </Acme:TabControl>
    
    <p>
    Now you can walk the error in a DataTable with the <b>GetErrors()</b> method. You can also test for errors using <b>HasErrors</b>.
    
    <Acme:TabControl runat="server">
    <Tab Name="C#">
    if ( myDataSet.Tables["Customers"].HasErrors )
    {
      DataRow[] ErrDataRows = myDataSet.Tables["Customers"].GetErrors();
      Console.WriteLine("DataTable " + myDataSet.Tables["Customers"].TableName + " has " + ErrDataRows.Length.ToString() + " Error(s)!");
    
      for (int i = 0; i <= ErrDataRows.Length -1; i++)
      {
        Console.WriteLine("Row Error for row " + ErrDataRows[i]["CustomerID"].ToString() + " --  Error Msg="  + ErrDataRows[i].RowError);
      }
    }
    else
    {
      Console.WriteLine("=================");
      Console.WriteLine("DataTable " + myDataSet.Tables["Customers"].TableName + " Has no errors");
    }
    </Tab>
    <Tab Name="VB">
    if myDataSet.Tables("Customers").HasErrors then
      Dim ErrDataRows as DataRow()
      ErrDataRows = myDataSet.Tables("Customers").GetErrors()
      Console.WriteLine("DataTable " + myDataSet.Tables("Customers").TableName + " has " + ErrDataRows.Length.ToString() + " Error(s)!")
    
      Dim i as integer
      for i = 0 to ErrDataRows.Length -1
        Console.WriteLine("Row Error for row " + ErrDataRows(i)("CustomerID").ToString() + " --  Error Msg="  + ErrDataRows(i).RowError)
      next
    else
      Console.WriteLine("=================")
      Console.WriteLine("DataTable " + myDataSet.Tables("Customers").TableName + " Has no errors")
    end if
    </Tab>
    <Tab Name="C++">
    if ( myDataSet->Tables->Item["Customers"]->HasErrors )
    {
      DataRow * ErrDataRows[] = myDataSet->Tables->Item["Customers"]->GetErrors();
      Console::Write("DataTable ");
	  Console::Write(myDataSet->Tables->Item["Customers"]->TableName); 
	  Console::Write(" has ");
	  Console::Write(ErrDataRows->Count.ToString());
	  Console::WriteLine(" Error(s)!");

      for (int i = 0; i <= ErrDataRows->Length -1; i++)
      {
        Console::Write("Row Error for row ");
		Console::Write(ErrDataRows[i]->Item["CustomerID"]->ToString());
		Console::Write(" --  Error Msg=");
		Console::WriteLine(ErrDataRows[i]->RowError);
      }
    }
    else
    {
      Console::WriteLine("=================");
      Console::Write("DataTable ");
	  Console::Write(myDataSet->Tables->Item["Customers"]->TableName);
	  Console::Write(" Has no errors");
    }
    </Tab>
    </Acme:TabControl>
    
    <p>
    The following example loads a DataSet, sets some errors, and then shows the Errors in the Rows.
    <p>
    
    
    <Acme:LangSwitch runat="server">
      <CsTemplate>
    <Acme:SourceRef
      RunSample="/quickstart/howto/samples/adoplus/HandleErrors/cs/HandleErrors.aspx"
      ViewSource="/quickstart/howto/samples/adoplus/HandleErrors/HandleErrors.src"
      Icon="/quickstart/images/genicon.gif"
      Caption="C# HandleErrors.aspx"
      runat="server" />
      </CsTemplate>
      <VbTemplate>
    <Acme:SourceRef
      RunSample="/quickstart/howto/samples/adoplus/HandleErrors/vb/HandleErrors.aspx"
      ViewSource="/quickstart/howto/samples/adoplus/HandleErrors/HandleErrors.src"
      Icon="/quickstart/images/genicon.gif"
      Caption="VB HandleErrors.aspx"
      runat="server" />
      </VbTemplate>
      <CpTemplate>
    <Acme:SourceRef
      RunSample="/quickstart/howto/samples/adoplus/HandleErrors/CP"
      ViewSource="/quickstart/howto/samples/adoplus/HandleErrors/HandleErrors.src"
      Icon="/quickstart/images/genicon.gif"
      Caption="C++ HandleErrors.exe"
      MapRunSamplePath=true
      runat="server" />
      </CpTemplate>
    </Acme:LangSwitch>
    
    <p>
    <!-- #include virtual="/quickstart/include/footer.inc" -->

