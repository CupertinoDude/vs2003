<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>

<html>

<script language="C#" runat="server">

    void Page_Load(Object Src, EventArgs E ) {

        String dsn = ConfigurationSettings.AppSettings["pubs"];

        SqlConnection myConnection = new SqlConnection(dsn);
        SqlDataAdapter myCommand = new SqlDataAdapter("select * from Authors", myConnection);

        DataSet ds = new DataSet();
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
