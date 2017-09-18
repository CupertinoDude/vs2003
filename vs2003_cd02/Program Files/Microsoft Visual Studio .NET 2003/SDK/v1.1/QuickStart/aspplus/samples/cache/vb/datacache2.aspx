<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data" %>

<html>

  <script language="VB" runat="server">

    Sub Page_Load(Src As Object, E As EventArgs)
        If Not IsPostBack
            LoadData()
        End If
    End Sub

    Sub NewAuthorBtn_Click(Src As Object, E As EventArgs)
        If Not Page.IsValid
            AuthorMsg.Text = "Some required fields are missing"
        Else
            Dim fs As FileStream
            Dim reader As StreamReader
            Dim ds As DataSet
            Dim newAuthor As DataRow
            Dim writer As TextWriter
            Dim authorsFile as String

            ' open the file and read the current authors
            ds = New DataSet
     
            ' check to see if the file exists in the temp dir first since the ASPNET
            ' process does not have permissions to write in the current directory
            authorsFile = Environment.GetEnvironmentVariable("TEMP") & "\\authorsVB.xml"
            If Not File.Exists(authorsFile)
                File.Copy(Server.MapPath("authors.xml"), authorsFile)
            End If

            fs = New FileStream(authorsFile, FileMode.Open, FileAccess.Read, _
                FileShare.ReadWrite)
            reader = New StreamReader(fs)
            ds.ReadXml(reader)
            fs.Close()

            ' append a row
            Try
                newAuthor = ds.Tables(0).NewRow()
                newAuthor("au_id") = AuthorId.Text
                newAuthor("au_lname") = LastName.Text
                newAuthor("au_fname") = FirstName.Text
                newAuthor("phone") = Phone.Text
                newAuthor("address") = Address.Text
                newAuthor("city") = City.Text
                newAuthor("state") = AddressState.Text
                newAuthor("zip") = PostalCode.Text
                newAuthor("contract") = Contract.Checked
                ds.Tables(0).Rows.Add(newAuthor)
            Catch Exc As Exception
                CacheMsg.Text = "Failed to create author with id = (" & _
                    AuthorId.Text & ")<br>" & "Author already exists."
                Return
            End Try

            ' rewrite the data file
            fs = New FileStream(authorsFile, FileMode.Create, FileAccess.ReadWrite, _
                FileShare.ReadWrite)
            writer = New StreamWriter(fs)
            writer = TextWriter.Synchronized(writer)
            ds.WriteXml(writer)
            writer.Close()

            Cache.Remove("MyData")
            LoadData()
        End If
    End Sub

    Sub RefreshBtn_Click(Src As Object, E As EventArgs)
        LoadData()
    End Sub

    Sub LoadData
        Dim Source As DataView

        Source = Cache("MyData")
        If Source Is Nothing
            Dim ds As DataSet
            Dim fs As FileStream
            Dim reader As StreamReader
            Dim authorsFile as String

            ' read the data from the XML source
            ds = New DataSet()

            ' check to see if the file exists in the temp dir first since the ASPNET
            ' process does not have permissions to write in the current directory
            authorsFile = Environment.GetEnvironmentVariable("TEMP") & "\\authorsVB.xml"
            If Not File.Exists(authorsFile)
                File.Copy(Server.MapPath("authors.xml"), authorsFile)
            End If

            fs = New FileStream(authorsFile, FileMode.Open,FileAccess.Read)
            reader = New StreamReader(fs)
            ds.ReadXml(reader)
            fs.Close()

            Source = New DataView(ds.Tables(0))

            ' cache it for future use
            Cache.Insert("MyData", Source, New CacheDependency(authorsFile))

            ' we created the data explicitly, so advertise that fact
            CacheMsg.Text = "Dataset created explicitly"
        Else
            CacheMsg.Text = "Dataset retrieved from cache"
        End If

        MyDataGrid.DataSource = Source
        MyDataGrid.DataBind()
    End Sub

  </script>

  <body>

    <form runat="server">

      <h3><font face="Verdana">File Dependencies</font></h3>

      <ASP:DataGrid id="MyDataGrid" runat="server"
        Width="900"
        BackColor="#ccccff"
        BorderColor="black"
        ShowFooter="false"
        CellPadding=3
        CellSpacing="0"
        Font-Name="Verdana"
        Font-Size="8pt"
        HeaderStyle-BackColor="#aaaadd"
      />

      <hr>

      <h3><font face="Verdana">Add New Author</font></h3>

      <asp:Label ID="AuthorMsg" Text="Fill in the required fields below to add a new author" ForeColor="red" Font-Name="Verdana" Font-Size="10" runat=server />

      <p>

      <table>
        <tr>
          <td>Author Id:</td>
          <td><ASP:TextBox id=AuthorId Text="111-11-1111" runat=server/></td>
          <td><ASP:RequiredFieldValidator ControlToValidate="AuthorId" Display="Static" ErrorMessage="*" runat=server/></td>
        </tr>
        <tr>
          <td>Last Name:</td>
          <td><ASP:TextBox id=LastName Text="Doe" runat=server/></td>
          <td><ASP:RequiredFieldValidator ControlToValidate="LastName" Display="Static" ErrorMessage="*" runat=server/></td>
        </tr>
        <tr>
          <td>First Name:</td>
          <td><ASP:TextBox id=FirstName Text="John" runat=server/></td>
          <td><ASP:RequiredFieldValidator ControlToValidate="FirstName" Display="Static" ErrorMessage="*" runat=server/></td>
        </tr>
        <tr>
          <td>Phone:</td>
          <td><ASP:TextBox id=Phone Text="555 555-5050" runat=server/></td>
          <td><ASP:RequiredFieldValidator ControlToValidate="Phone" Display="Static" ErrorMessage="*" runat=server/></td>
        </tr>
        <tr>
          <td>Address:</td>
          <td><ASP:TextBox id=Address Text="One Microsoft Way" runat=server/></td>
          <td><ASP:RequiredFieldValidator ControlToValidate="Address" ErrorMessage="*" Display="Static" runat=server/></td>
        </tr>
        <tr>
          <td>City:</td>
          <td><ASP:TextBox id=City Text="Redmond" runat=server/></td>
          <td><ASP:RequiredFieldValidator ControlToValidate="City" ErrorMessage="*" Display="Static" runat=server/></td>
        </tr>
        <tr>
          <td>State:</td>
          <td><ASP:TextBox id=AddressState Text="WA" runat=server/></td>
          <td><ASP:RequiredFieldValidator ControlToValidate="AddressState" ErrorMessage="*" Display="Static" runat=server/></td>
        </tr>
        <tr>
          <td>Postal Code:</td>
          <td><ASP:TextBox id=PostalCode Text="98052" runat=server/></td>
          <td><ASP:RequiredFieldValidator ControlToValidate="PostalCode" ErrorMessage="*" Display="Static" runat=server/></td>
        </tr>
        <tr>
          <td>Contract:</td>
          <td><ASP:CheckBox id=Contract Checked runat="server"/></td>
          <td></td>
        </tr>
      </table>

      <asp:button Text="Add New Author" OnClick="NewAuthorBtn_Click" runat=server/> <asp:button Text="Refresh List" OnClick="RefreshBtn_Click" runat=server/>

      <p>

      <hr>

      <p>

      <i><asp:label id="CacheMsg" runat="server"/></i></p>

    </form>
  </body>
</html>
