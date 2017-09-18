<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>

<html>

<script language="JScript" runat="server">

    function Page_Load(sender:Object, e:EventArgs) : void {

        var dsn:String = ConfigurationSettings.AppSettings["pubs"];

        var myConnection:SqlConnection = new SqlConnection(dsn);
        var myCommand:SqlDataAdapter = new SqlDataAdapter("select * from Authors", myConnection);

        var ds:DataSet = new DataSet();
        myCommand.Fill(ds, "Authors");

        MyDataGrid.DataSource=new DataView(ds.Tables[0]);
        MyDataGrid.DataBind();
    }

</script>

<body>

  <h3><font face="Verdana">Retrieving Configuration Data</font></h3>

  <ASP:DataGrid id="MyDataGrid" runat="server"
    BackColor="#ccccff"
    BorderColor="black"
    ShowFooter="false"
    CellPadding=3
    CellSpacing="0"
    Font-Name="Verdana"
    Font-Size="8pt"
    HeaderStyle-BackColor="#aaaadd"
  />

</body>
</html>
