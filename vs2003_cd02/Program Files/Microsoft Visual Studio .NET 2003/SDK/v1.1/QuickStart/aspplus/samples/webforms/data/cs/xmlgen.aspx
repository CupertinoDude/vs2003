<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<html>
<head>

    <script language="C#" runat="server">

        public DataView Source;
        public DataSet ds;
        public bool getSchema, getData;
        
        private static string originalString = "server=(local)\\NetSDK;database=;Integrated Security=SSPI";
        private string connectString = originalString;
        private string selectString = "";
        
        string[][] tables = new string[][]
            {
                new string[] {"authors", "discounts", "employee", "jobs", "publishers", "sales", "stores", "titleauthor", "titles"},
                new string[] {"Categories", "Customers", "Employees", "Orders", "Products", "Region", "Shippers", "Suppliers", "Territories"},
                new string[] {"Categories", "Customers", "ProductDetails", "Products"},
                new string[] {"Modules", "Personalization", "SiteDirectory", "UserData"}
            };
        
        public void Page_Load(object sender, EventArgs e)
        {
            if ( !IsPostBack )
            {
                database_SelectedIndexChanged(database, null);
            }
            
            Init();
        }
        
        private void Init()
        {
            connectString = originalString.Replace("database=", "database=" + database.SelectedItem.Text);
            selectString = "select * from " + table.SelectedItem.Text;
            
            connect.Text = connectString;
            query.Text = selectString;
        }
        
        public void database_SelectedIndexChanged(Object sender, EventArgs e)
        {
            table.DataSource = tables[database.SelectedIndex];
            table.DataBind();

            Init();
        }
        
        public void table_SelectedIndexChanged(Object sender, EventArgs e)
        {
            Init();
        }

        public void Submit_Click(Object sender, EventArgs evt) {
            if (IsPostBack)
            {
                if ( table.SelectedIndex > -1 && database.SelectedIndex > -1 )
                {
                    SqlConnection myConnection = new SqlConnection(connectString);
                    SqlDataAdapter myCommand = new SqlDataAdapter(selectString, myConnection);

                    ds = new DataSet();
                    myCommand.Fill(ds, "Table");

                    Source = new DataView(ds.Tables[0]);

                    getSchema = GetSchema.Checked;
                    getData = GetData.Checked;

                    MyDataGrid.DataSource=Source;
                    MyDataGrid.DataBind();
                }
            }
         }

    </script>

</head>
<body bgcolor="ffffcc">

    <h3><font face="Verdana">SQL to XML Generator</font></h3>

    <form runat="server">

        <table border=0 cellpadding=5 style="font:10pt verdana">
        <tr>
          <td colspan="2">
            <b>Connect String:</b><br>
            <asp:Label runat="server" id="connect" />
          </td>
        </tr>
        <tr>
          <td>
            <b>Table Properties</b><br>
            Database:<br>
            Table:
          </td>
          <td>
            <br>
            <asp:DropDownList
             runat="server"
             id="database"
             AutoPostBack="true"
             OnSelectedIndexChanged="database_SelectedIndexChanged">
              <asp:ListItem>Pubs</asp:ListItem>
              <asp:ListItem>Northwind</asp:ListItem>
              <asp:ListItem>GrocerToGo</asp:ListItem>
              <asp:ListItem>Portal</asp:ListItem>
            </asp:DropDownList><br>
            <asp:DropDownList
             runat="server"
             id="table"
             AutoPostBack="true"
             OnSelectedIndexChanged="table_SelectedIndexChanged" />
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <b>Query:</b><br>
            <asp:Label runat="server" id="query" />
          </td>
        <tr>
          <td>
            <input type="radio" id="GetSchema" name="Mode" runat="server"/>Get XML Schema<br>
            <input type="radio" id="GetData" name="Mode" runat="server"/>Get XML Data<br>
            <input type="radio" id="GetBoth" name="Mode" checked runat="server"/>Get Both
          </td>
          <td valign="top">
            <input type="submit" runat="server" OnServerClick="Submit_Click">
          </td>
        </tr>
        <tr>
          <td colspan="2">

              <%  if (Page.IsPostBack && ds != null) {  %>
                  <b>Result:</b><br>
                  <textarea cols=80 rows=25>
              <%
                  if (getSchema)
                      ds.WriteXmlSchema(Response.Output);
                  else if (getData)
                      ds.WriteXml(Response.Output, XmlWriteMode.IgnoreSchema);
                  else
                      ds.WriteXml(Response.Output, XmlWriteMode.WriteSchema);
              %>
                  </textarea>
              <%  }  %>

          </td>
        </tr>
        <tr>
          <td colspan="2">

              <%  if (Page.IsPostBack && ds != null) {  %>
                  <b>Data:</b><br>
              <%  }  %>

              <ASP:DataGrid id="MyDataGrid"
                BackColor="#EDBE7B"
                BorderColor="black"
                ShowFooter="false"
                CellPadding=3
                CellSpacing="0"
                Font-Name="Verdana"
                Font-Size="8pt"
                HeaderStyle-BackColor="#DC6035"
                EnableViewState="false"
                runat="server"
              />

          </td>
        <tr>
        </table>

    </form>

</body>
</html>

