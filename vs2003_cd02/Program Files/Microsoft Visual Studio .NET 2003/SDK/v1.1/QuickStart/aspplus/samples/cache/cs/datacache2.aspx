<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data" %>

<html>

<script language="C#" runat="server">

    void Page_Load(Object Src, EventArgs E ) {

        if(!IsPostBack) {
            LoadData();
        }
    }

    void NewAuthorBtn_Click(Object sender, EventArgs E) {

        if(!Page.IsValid) {
            AuthorMsg.Text = "Some required fields are missing";
            return;
        }

        DataSet ds = new DataSet();

        // check to see if the file exists in the temp dir first since the ASPNET
        // process does not have permissions to write in the current directory
        String authorsFile = Environment.GetEnvironmentVariable("TEMP") + "\\authorsCS.xml";
        if (!File.Exists(authorsFile)) {
            File.Copy(Server.MapPath("authors.xml"), authorsFile);
        }

        // open the file and read the current data
        FileStream fs = new FileStream(authorsFile, FileMode.Open, 
            FileAccess.Read, FileShare.ReadWrite);
        StreamReader reader = new StreamReader(fs);
        ds.ReadXml(reader);
        fs.Close();

        // append a row
        try {
            DataRow newAuthor = ds.Tables[0].NewRow();
            newAuthor["au_id"] = AuthorId.Text;
            newAuthor["au_lname"] = LastName.Text;
            newAuthor["au_fname"] = FirstName.Text;
            newAuthor["phone"] = Phone.Text;
            newAuthor["address"] = Address.Text;
            newAuthor["city"] = City.Text;
            newAuthor["state"] = State.Text;
            newAuthor["zip"] = PostalCode.Text;
            newAuthor["contract"] = Contract.Checked;
            ds.Tables[0].Rows.Add(newAuthor);
        } catch(Exception) {
            CacheMsg.Text = "Failed to create author with id = (" + 
                AuthorId.Text + ")<br>" + "Author already exists.";
            return;
        }

        // rewrite the data file
        fs = new FileStream(authorsFile, FileMode.Create, FileAccess.ReadWrite, 
            FileShare.ReadWrite);
        TextWriter writer = new StreamWriter(fs);
        writer = TextWriter.Synchronized(writer);
        ds.WriteXml(writer);
        writer.Close();

        Cache.Remove("MyData");
        LoadData();
    }

    void RefreshBtn_Click(Object sender, EventArgs e) {

        LoadData();
    }

    void LoadData() {

        DataView Source = (DataView)Cache["MyData"];

        if(Source == null) {

            // read the data from the XML source
            DataSet ds = new DataSet();

            // check to see if the file exists in the temp dir 
            // first since the ASPNET process does not have permissions 
            // to write in the current directory
            String authorsFile = Environment.GetEnvironmentVariable("TEMP") + 
                "\\authorsCS.xml";
            if (!File.Exists(authorsFile)) {
                File.Copy(Server.MapPath("authors.xml"), authorsFile);
            }

            FileStream fs = new FileStream(authorsFile, 
                FileMode.Open,FileAccess.Read);
            StreamReader reader = new StreamReader(fs);
            ds.ReadXml(reader);
            fs.Close();

            Source = new DataView(ds.Tables[0]);

            // cache it for future use
            Cache.Insert("MyData", Source, new CacheDependency(authorsFile));

            // we created the data explicitly, so advertise that fact
            CacheMsg.Text = "Dataset created explicitly";
        }
        else {
            CacheMsg.Text = "Dataset retrieved from cache";
        }

        MyDataGrid.DataSource = Source;
        MyDataGrid.DataBind();
    }
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
          <td><ASP:TextBox id=State Text="WA" runat=server/></td>
          <td><ASP:RequiredFieldValidator ControlToValidate="State" ErrorMessage="*" Display="Static" runat=server/></td>
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
