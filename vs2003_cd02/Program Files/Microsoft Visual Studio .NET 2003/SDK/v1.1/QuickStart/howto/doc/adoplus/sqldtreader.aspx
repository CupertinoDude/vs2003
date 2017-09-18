    <%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
    <%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>
    
    <!-- #include virtual="/quickstart/howto/include/dataheader.inc" -->
    
    <h4>ADO.NET: Retrieve Data from SQL Server</h4>
    
    This sample illustrates how to read data from SQL Server using the <B>SqlDataReader</B> class.
    This class provides a way of reading a forward-only stream of data records from a data 
    source. If you want to work with databases that have OLE DB interfaces or
    versions of SQL Server prior to SQL Server 7.0, see
    <a href="adodtreader.aspx">Retrieve Data Using OLE DB</a>.
    
    <p>The <B>SqlDataReader</B> is created by calling the <b>ExecuteReader</b> method
    of the <b>SqlCommand</b>, not
    through direct use of the constructor.
    While the <B>SqlDataReader</B> is in use, the associated <B>SqlConnection</B> is
    busy serving the <B>SqlDataReader</B>. While in this state, no other
    operations can be performed on the <B>SqlConnection</B> other than closing it.
    This is the case until the <b>Close</b> method
    of the <B>SqlDataReader</B> is called.<p>
    
    <Acme:LangSwitch runat="server" ID=LangSwitch1>
      <CsTemplate>
    <Acme:SourceRef
    RunSample="/quickstart/howto/samples/adoplus/sqldtreader/CS/sqldtreader.aspx"
    ViewSource="/quickstart/howto/samples/adoplus/sqldtreader/sqldtreader.src"
    Icon = "/quickstart/images/genicon.gif"
    Caption="C# sqldtreader.aspx"
    runat="server" ID=SourceRef1/>
      </CsTemplate>
      <VbTemplate>
    <Acme:SourceRef
    ViewSource="/quickstart/howto/samples/adoplus/sqldtreader/sqldtreader.src"
    RunSample="/quickstart/howto/samples/adoplus/sqldtreader/VB/sqldtreader.aspx"
    Icon = "/quickstart/images/genicon.gif"
    Caption="VB sqldtreader.aspx"
    runat="server" ID=SourceRef2/>
      </VbTemplate>
      <CpTemplate>
    <Acme:SourceRef
    ViewSource="/quickstart/howto/samples/adoplus/sqldtreader/sqldtreader.src"
    RunSample="/quickstart/howto/samples/adoplus/sqldtreader/CP"
    Icon = "/quickstart/images/genicon.gif"
    Caption="C++ sqldtreader.exe"
    MapRunSamplePath=true
    runat="server" ID=SourceRef2/>
      </CpTemplate>
    </Acme:LangSwitch>
    
    <p>
    <B>SqlDataReader</B> provides a means of reading a forward-only stream of data records from a SQL Server data source.
    For more interactive operations such as scrolling, filtering, navigating, and remoting, use the DataSet.
    <p>
    The example creates a SqlConnection to the Northwind database. The 
    <b>SqlCommand</b> selecting items from the employee table is then executed using the <b>SqlCommand ExecuteReader</b> method.
    The results of this command are passed to the <B>SqlDataReader</B>.
    <Acme:TabControl runat="server" >
    <Tab Name="C#">
    SqlDataReader myDataReader = null;

    SqlConnection mySqlConnection = new SqlConnection("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind");
    SqlCommand mySqlCommand = new SqlCommand("SELECT EmployeeID, LastName, FirstName, Title, ReportsTo FROM Employees", mySqlConnection);
    ...
    mySqlConnection.Open();
    myDataReader = mySqlCommand.ExecuteReader(CommandBehavior.CloseConnection);
    </Tab>
    <Tab Name="VB">
    Dim myDataReader as SqlDataReader
    Dim mySqlConnection as SqlConnection
    Dim mySqlCommand as SqlCommand
    

    mySqlConnection = new SqlConnection("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind")
    mySqlCommand = new SqlCommand("SELECT EmployeeID, LastName, FirstName, Title, ReportsTo FROM Employees", mySqlConnection)
    ...
    mySqlConnection.Open()
    myDataReader = mySqlCommand.ExecuteReader(CommandBehavior.CloseConnection)
    </Tab>
    <Tab Name="C++">
    SqlDataReader * myDataReader = 0;

    SqlConnection * mySqlConnection = new SqlConnection(S"server=(local)\\NetSDK;Trusted_Connection=yes;database=northwind;provider=sqloledb");
    SqlCommand * mySqlCommand = new SqlCommand("SELECT EmployeeID, LastName, FirstName, Title, ReportsTo FROM Employees", mySqlConnection);
    ...
    mySqlConnection->Open();
    myDataReader = mySqlCommand->ExecuteReader();
    </Tab>
    </Acme:TabControl>
    
    The example reads through the data using the <B>SqlDataReader Read</b> method and
    writing the data elements out to the console.
    <Acme:TabControl runat="server" >
    <Tab Name="C#">
    while (myDataReader.Read())
    {
      Console.Write(myDataReader.GetInt32(0) + "\t");
      Console.Write(myDataReader.GetString(2) + " " + myDataReader.GetString(1) + "\t");
      Console.Write(myDataReader.GetString(3) + "\t");
      if (myDataReader.IsDBNull(4))
        Console.Write("N/A\n");
      else
        Console.Write(myDataReader.GetInt32(4) + "\n");
    }
    </Tab>
    <Tab Name="VB">
    do while (myDataReader.Read())
      Console.Write(myDataReader.GetInt32(0).ToString() + Chr(9))
      Console.Write(myDataReader.GetString(2) + " " + myDataReader.GetString(1) + Chr(9))
      Console.Write(myDataReader.GetString(3) + Chr(9))
      if (myDataReader.IsDBNull(4)) then
        Console.Write("N/A" + Chr(10))
      else
        Console.Write(myDataReader.GetInt32(4).ToString() + Chr(10))
      end if
    loop
     </Tab>
    <Tab Name="C++">
      while (myDataReader->Read())
      {
        Console::Write(myDataReader->GetInt32(0));
		Console::Write("\t\t");
        Console::Write(myDataReader->GetString(2));
		Console::Write(" ");
		Console::Write(myDataReader->GetString(1));
		Console::Write("\t");
        Console::Write(myDataReader->GetString(3));
		Console::Write("\t");
        if (myDataReader->IsDBNull(4))
          Console::Write("N/A\n");
        else
          Console::WriteLine(myDataReader->GetInt32(4));
      }
    </Tab>
    </Acme:TabControl>
    
    <p>
    Finally, the example closes the <B>SqlDataReader</B>, then
    the <B>SqlConnection</B>.
    </p>
    <p>
    <Acme:TabControl runat="server" >
    <Tab Name="C#">
    // Always call Close when done reading.
    myDataReader.Close();
    
    // Close the connection when done with it.
    mySqlConnection.Close();
    </Tab>
    <Tab Name="VB">
    ' Always call Close when done reading.
    myDataReader.Close()
    
    ' Close the connection when done with it.
    mySqlConnection.Close()
    </Tab>
    <Tab Name="C++">
    // Always call Close when done reading.
    myDataReader->Close();
    
    // Close the connection when done with it.
    mySqlConnection->Close();
    </Tab>
    </Acme:TabControl>
    <p>
    
    
    <p>
    
    <H4>Summary</H4>
    <OL>
    <LI>A <B>SqlDataReader</B> is for reading a forward-only stream of data records from SQL Server.
    <LI>Remember to close the <B>SqlDataReader</B> and then the <B>SqlConnection</B>.
    <LI>There can be only one <B>SqlDataReader</B> open at a time on the <B>SqlConnection</B>.  If the <B>SqlDataReader</B> is in use, the associated <B>SqlConnection</B> is
    busy serving the <B>SqlDataReader</B> and while in this state, no other
    operations can be performed on the <B>SqlConnection</B> other than closing it.
    
    </LI>
    </OL>
    <p>
    <!-- #include virtual="/quickstart/include/footer.inc" -->
