
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>
<script language="VB" runat="server">

    Sub Page_Load(Sender As Object, E As EventArgs)

        Dim MyConnection As SqlConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")
        Dim MyCommand As SqlCommand = New SqlCommand("select * from Authors", MyConnection)

        MyConnection.Open()

        Dim dr As SqlDataReader = MyCommand.ExecuteReader()

        MyDataGrid.DataSource = dr
        MyDataGrid.DataBind()

        MyConnection.Close()
    End Sub

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
