<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>

<html>

<script language="VB" runat="server">

    Sub Page_Load(Src As Object, E As EventArgs)

        Dim dsn As String = ConfigurationSettings.AppSettings("pubs")

        Dim MyConnection As SqlConnection
        Dim MyCommand As SqlDataAdapter

        MyConnection = New SqlConnection(DSN)
        MyCommand = New SqlDataAdapter("select * from Authors", MyConnection)

        Dim DS As New DataSet
        MyCommand.Fill(DS, "Authors")

        MyDataGrid.DataSource= New DataView(DS.Tables(0))
        MyDataGrid.DataBind()
    End Sub

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
