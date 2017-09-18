
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data" %>

<html>
<script language="C#" runat="server">

    protected void Page_Load(Object Src, EventArgs E) {
        DataSet ds = new DataSet();

        FileStream fs = new FileStream(Server.MapPath("schemadata.xml"),FileMode.Open,FileAccess.Read);
        StreamReader reader = new StreamReader(fs);
        ds.ReadXml(reader);
        fs.Close();

        DataView Source = new DataView(ds.Tables[0]);

        MyLiteral.Text = Source.Table.TableName;
        MyDataGrid.DataSource = Source;
        MyDataGrid.DataBind();
    }

</script>

<body>

  <h3><font face="Verdana">XML Data for Table: <asp:Literal id="MyLiteral" runat="server" /></font></h3>

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
    EnableViewState="false"
  />

</body>
</html>

