
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data" %>

<html>
<script language="JScript" runat="server">

    protected function Page_Load(sender : Object, e : EventArgs) : void {
        var ds : DataSet = new DataSet();

        var fs : FileStream = new FileStream(Server.MapPath("schemadata.xml"),FileMode.Open,FileAccess.Read);
        var reader : StreamReader = new StreamReader(fs);
        ds.ReadXml(reader);
        fs.Close();

        var Source : DataView = new DataView(ds.Tables(0));

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

