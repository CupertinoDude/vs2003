
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<html>
<script language="C#" runat="server">

    SqlConnection myConnection;

    protected void Page_Load(Object sender, EventArgs e) 
    {
        myConnection = new SqlConnection("server=(local)\\NetSDK;database=pubs;Integrated Security=SSPI");

        if (!IsPostBack)
            BindGrid("au_id");
    }

    protected void MyDataGrid_Sort(Object sender, DataGridSortCommandEventArgs e) 
    {
        BindGrid(e.SortExpression);
    }

    public void BindGrid(String sortfield) 
    {
        SqlDataAdapter myCommand = new SqlDataAdapter("select * from Authors", myConnection);

        DataSet ds = new DataSet();
        myCommand.Fill(ds, "Authors");

        DataView Source = ds.Tables["Authors"].DefaultView;
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
