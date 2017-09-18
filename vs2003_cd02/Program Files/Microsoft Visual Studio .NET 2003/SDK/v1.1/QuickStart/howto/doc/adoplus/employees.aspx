    <%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
    <%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>
    
    <!-- #include virtual="/quickstart/howto/include/dataheader.inc" -->
    
    <h4>ADO.NET: Convert an ADO Application to ADO.NET</h4>
    
   This is an example of an ADO application that has been ported to .NET without the original graphical 
   interface.  It also shows the usage of a forward-only read-only fast DataReader. It shows how to use a <b>DataView</b> class to take a table from a DataSet and operate
   on it in a fashion similar to the old ADO Recordset model. Remember an ADO Recordset only holds data for one
   table, but an ADO.NET <b>DataSet</b> can hold multiple tables and therefore is very flexible.
    <p>
    The original ADO sample is
    the employee sample in SQL Server 2000. The original sample uses an ADO Recordset to manage the
    resulting data returned from the SQL query. The new sample shows how to use the SqlDataAdapter to
    fill a DataSet in a model similar to the ADO Recordset.
    Also, the original sample uses a dialog window (.cpp) or a form
    (.frm) to display the output of the employee table of the Northwind database. However, this .NET example
    only uses the Console window to output the non-image type data in the sample.
    
    <p>
    The main topics covered in this sample are:<p>
    <LI>Connection to the database
    <LI>Usage of a light-weight read-only, forward-only reader
    <LI>Execution of the SQL query and resulting ADO Recordset or ADO.NET <b>DataSet</b>
    <LI>Accessing individual records in the ADO Recordset or ADO.NET <b>DataSet</b>
    </li>
    
    <p>
    
    <Acme:LangSwitch runat="server" ID=LangSwitch1>
      <CsTemplate>
    <Acme:SourceRef
    RunSample="/quickstart/howto/samples/adoplus/employees/CS/employees.aspx"
    ViewSource="/quickstart/howto/samples/adoplus/employees/employees.src"
    Icon = "/quickstart/images/genicon.gif"
    Caption="C# employees.aspx"
    runat="server" ID=SourceRef1/>
      </CsTemplate>
      <VbTemplate>
    <Acme:SourceRef
    ViewSource="/quickstart/howto/samples/adoplus/employees/employees.src"
    RunSample="/quickstart/howto/samples/adoplus/employees/VB/employees.aspx"
    Icon = "/quickstart/images/genicon.gif"
    Caption="VB employees.aspx"
    runat="server" ID=SourceRef2/>
     </VbTemplate>
    </Acme:LangSwitch>
    
    <p>
    Typically in an ADO application there is a connection to the database and execution of the SQL query
    and resulting ADO Recordset.
    <p>
    In the original code used in the Visual Basic version of Employee, a connection is opened to
    the SQL Server database 'Northwind' using an ADO connection object and a connection
    string "server=(local)\NetSDK;Integrated Security=SSPI;database=northwind;provider=sqloledb".
    A Recordset is then returned using the ADO <b>Recordset.Open</b> method with a SQL
    'SELECT' query.
    <p>
    Then, the <b>FillDataFields</b> function is called to retrieve individual record values.
    <p>
    <div class="code">
    <pre>
    ' Open the database.

    cn.Open("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind;provider=sqloledb")
    
    ' Open the Recordset.
    Set rs = New ADODB.Recordset
    rs.Open "select * from Employees", cn, adOpenKeyset, adLockPessimistic
    
    ' Move to the first record and display the data.
    rs.MoveFirst
    FillDataFields
    </pre>
    </div>
    </p>
    In the .NET implementation the steps are very similar. A connection is opened to
    the SQL Server database 'Northwind' using a <b>SqlConnection</b> object and a connection
    string "server=(local)\NetSDK;Integrated Security=SSPI;database=northwind".
    A Reader is then used to cycle through the data returned on execution of the query. This reader 
    read-only, forward-only DataReader is more performant than its native ADO counterpart.

    A <b>DataSet</b> is then populated using <b>SqlDataAdapter</b> with a SQL
    'SELECT' query and the <b>SqlDataAdapter</b> <b>Fill</b> method.
    <p>
    <Acme:TabControl runat="server" >
    <Tab Name="C#">
    SqlConnection mySqlConnection = new SqlConnection("server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind");
    SqlDataAdapter mySqlDataAdapter = new SqlDataAdapter("select * from employees", mySqlConnection);
    DataSet myDataSet = new DataSet();
    mySqlDataAdapter.Fill(myDataSet,"Employees");
    </Tab>
    <Tab Name="VB">
    Dim mySqlConnection as SqlConnection = new SqlConnection("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind")
    Dim mySqlDataAdapter as SqlDataAdapter = new SqlDataAdapter("select * from employees", mySqlConnection)
    Dim myDataSet as DataSet = new DataSet()
    mySqlDataAdapter.Fill(myDataSet,"Employees")
    </Tab>
    </Acme:TabControl>
    <p>
    Then in an ADO application there is some function that moves among the Recordset getting data from each record
    and field combination. This would typically be accomplished using calls to the Recordset
    <b>MoveFirst</b>, <b>MoveLast</b>, <b>MovePrevious</b>, and <b>MoveNext</b> methods. For Example:
    <p>
    <div class="code">
    <pre>
    If rs.EOF = False Then
        If rs.BOF = True Then
             rs.MoveFirst
        End If
        rs.MoveNext
    End If
    If rs.EOF = False Then
        FillDataFields
    End If
    </pre>
    </div>
    </p>
    <p>
    Then data would be extracted from each current record in a Recordset using individual field accessors. For Example:
    <p>
    <div class="code">
    <pre>
    For Each fld In Flds
        FieldSize = fld.ActualSize
        If FieldSize > 0 Then
            Select Case fld.Name
                Case "EmployeeID"
                    txtEID.Text = Str(fld.Value)
                Case "LastName"
                    txtLastName.Text = fld.Value
                Case "FirstName"
                    txtFirstName.Text = fld.Value
                Case "Title"
                    txtTitle.Text = fld.Value
                ...
            End Select
        End If
    Next
    </pre>
    </div>
    <p>
    In this example, the
    DataSet Table "Employee" is specifically assigned to a <b>DataView</b> and the resulting
    <b>DataView</b> iterated over to extract the data values. By using a <b>DataView</b> you can
    turn any table in a <b>DataSet</b> into an object that functions similarly to the old
    ADO Recordset.
    </p>
    <Acme:TabControl runat="server" ID=TabControl1>
    <Tab Name="C#">
    // Create a new dataview instance on the Employees table that was just created
    DataView myDataView = new DataView(myDataSet.Tables["Employees"]);
    
    // Sort the view based on the first column name.
    myDataView.Sort = "EmployeeID";
    
    int iReportsTo;
    
    for (int i = 0; i < myDataView.Count; i++)
    {
      Console.Write("\n************************ Employee number " + (i+1).ToString() + " ************************\n");
      Console.Write("EmployeeID:\t" + myDataView[i]["EmployeeID"].ToString() + "\n" +
                    "FirstName:\t" + myDataView[i]["FirstName"].ToString() + "\n" +
                    "LastName:\t" + myDataView[i]["LastName"].ToString() + "\n" +
                    "Title:\t\t" + myDataView[i]["Title"].ToString() + "\n" +
                    "TitleOfCourtesy:" + myDataView[i]["TitleOfCourtesy"].ToString() + "\n" +
      ...
    }
    </Tab>
    <Tab Name="VB">
    ' Create a new dataview instance on the Employees table that was just created
    Dim myDataView as DataView = new DataView(myDataSet.Tables("Employees"))
    
    ' Sort the view based on the first column name.
    myDataView.Sort = "EmployeeID"
    
    Dim iReportsTo as integer
    Dim i as integer
    
    for i = 0 to myDataView.Count -1
      Console.Write(Chr(10) & "************************ Employee number " & (i+1).ToString() + " ************************" & Chr(10))
      Console.Write("EmployeeID:" & Chr(9) & myDataView(i)("EmployeeID").ToString() + Chr(10) & _
                    "FirstName:" & Chr(9) & myDataView(i)("FirstName").ToString() + Chr(10) & _
                    "LastName:" & Chr(9) & myDataView(i)("LastName").ToString() + Chr(10) & _
                    "Title:" & Chr(9) & Chr(9) & myDataView(i)("Title").ToString() + Chr(10) & _
                    "TitleOfCourtesy:" & myDataView(i)("TitleOfCourtesy").ToString() + Chr(10) & _
      ...
    next
    
    </Tab>
    </Acme:TabControl>
  <p>
    <!-- #include virtual="/quickstart/include/footer.inc" -->

