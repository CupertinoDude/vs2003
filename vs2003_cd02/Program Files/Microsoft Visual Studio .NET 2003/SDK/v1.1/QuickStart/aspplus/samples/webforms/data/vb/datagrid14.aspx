
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>
<script language="VB" runat="server">

    Sub Page_Load(Sender As Object, E As EventArgs) 

        Dim DS As DataSet
        Dim MyConnection As SqlConnection
        Dim MyCommand As SqlDataAdapter

        MyConnection = New SqlConnection("server=(local)\NetSDK;database=northwind;Integrated Security=SSPI")
        MyCommand = New SqlDataAdapter("Ten Most Expensive Products", MyConnection)

        MyCommand.SelectCommand.CommandType = CommandType.StoredProcedure

        DS = new DataSet()
        MyCommand.Fill(DS, "Products")

        MyDataGrid.DataSource=DS.Tables("Products").DefaultView
        MyDataGrid.DataBind()
    End Sub

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
