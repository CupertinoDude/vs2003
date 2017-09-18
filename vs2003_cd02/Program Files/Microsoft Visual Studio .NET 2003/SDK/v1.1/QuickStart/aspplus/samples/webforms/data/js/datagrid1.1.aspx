
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>
<script language="JScript" runat="server">

    protected function Page_Load(sender : Object, e : EventArgs) : void
    {
        var myConnection : SqlConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");
        var myCommand : SqlCommand = new SqlCommand("select * from Authors", myConnection);

        myConnection.Open();

        var dr : SqlDataReader;
        dr = myCommand.ExecuteReader();

        MyDataGrid.DataSource = dr;
        MyDataGrid.DataBind();

        myConnection.Close();
    }

</script>

<body>

  <h3><font face="Verdana">Simple Select to a DataGrid Control</font></h3>

  <ASP:DataGrid id="MyDataGrid" runat="server"
    Width="700"
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

