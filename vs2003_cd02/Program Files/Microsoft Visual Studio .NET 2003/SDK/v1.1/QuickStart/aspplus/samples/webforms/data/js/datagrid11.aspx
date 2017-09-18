
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>
<script language="JScript" runat="server">

    var myConnection : SqlConnection;

    protected function Page_Load(sender : Object, e : EventArgs) : void 
    {
        myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");

        if (!IsPostBack)
            BindGrid("au_id");
    }

    protected function MyDataGrid_Sort(sender : Object, e : DataGridSortCommandEventArgs) : void 
    {
        BindGrid(e.SortExpression);
    }

    public function BindGrid(sortfield : String) : void 
    {
        var myCommand : SqlDataAdapter = new SqlDataAdapter("select * from Authors", myConnection);

        var ds : DataSet = new DataSet();
        myCommand.Fill(ds, "Authors");

        var Source : DataView = ds.Tables("Authors").DefaultView;
        Source.Sort = sortfield;

        MyDataGrid.DataSource=Source;
        MyDataGrid.DataBind();
    }

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
