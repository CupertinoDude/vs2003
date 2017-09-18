
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>
<script language="VB" runat="server">

    Dim MyConnection As SqlConnection

    Sub Page_Load(Sender As Object, E As EventArgs) 

        MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")

        If Not (IsPostBack)
            BindGrid("au_id")
        End If
    End Sub

    Sub MyDataGrid_Sort(Sender As Object, E As DataGridSortCommandEventArgs) 

        BindGrid(E.SortExpression)
    End Sub

    Sub BindGrid(SortField As String) 

        Dim DS As DataSet
        Dim MyCommand As SqlDataAdapter
        MyCommand = New SqlDataAdapter("select * from Authors", MyConnection)

        DS = new DataSet()
        MyCommand.Fill(DS, "Authors")

        Dim Source As DataView = DS.Tables("Authors").DefaultView
        Source.Sort = SortField

        MyDataGrid.DataSource = Source
        MyDataGrid.DataBind()
    End Sub

</script>

<body>

  <h3><font face="Verdana">Sorting Data in a DataGrid Control</font></h3>

  <form runat="server">

    <ASP:DataGrid id="MyDataGrid" runat="server" OnSortCommand="MyDataGrid_Sort"
      Width="700"
      BackColor="#ccccff" 
      BorderColor="black"
      ShowFooter="false" 
      CellPadding=3 
      CellSpacing="0"
      Font-Name="Verdana"
      Font-Size="8pt"
      HeaderStyle-BackColor="#aaaadd"
      AllowSorting="true" 
    />

  </form>

</body>
</html>
