
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>
<script language="JScript" runat="server">

    protected function Page_Load(sender : Object, e : EventArgs) : void
    {
        var myConnection : SqlConnection = new SqlConnection("server=(local)\\NetSDK;database=northwind;Integrated Security=SSPI");
        var myCommand : SqlDataAdapter = new SqlDataAdapter("Ten Most Expensive Products", myConnection);

        myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;

        var ds : DataSet = new DataSet();
        myCommand.Fill(ds, "Products");

        MyDataGrid.DataSource=ds.Tables("Products").DefaultView;
        MyDataGrid.DataBind();
    }

</script>

<body>

  <h3><font face="Verdana">Simple Stored Proc Select to a DataGrid Control</font></h3>

  <ASP:DataGrid id="MyDataGrid" runat="server"
    Width="360"
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
