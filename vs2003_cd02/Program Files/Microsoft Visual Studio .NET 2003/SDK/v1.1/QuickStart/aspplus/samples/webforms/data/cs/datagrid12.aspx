
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

  <h3><font face="Verdana">Sorting Data in a DataGrid Control w/ Bound Columns</font></h3>

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
      AutoGenerateColumns="false"
    >

      <Columns>
        <asp:BoundColumn HeaderText="au_id" SortExpression="au_id" DataField="au_id" ItemStyle-Wrap="false"/>
        <asp:BoundColumn HeaderText="au_lname" SortExpression="au_lname" DataField="au_lname"/>
        <asp:BoundColumn HeaderText="au_fname" SortExpression="au_fname" DataField="au_fname"/>
        <asp:BoundColumn HeaderText="phone" SortExpression="phone" DataField="phone"/>
        <asp:BoundColumn HeaderText="address" SortExpression="address" DataField="address"/>
        <asp:BoundColumn HeaderText="city" SortExpression="city" DataField="city"/>
        <asp:BoundColumn HeaderText="state" SortExpression="state" DataField="state"/>
        <asp:BoundColumn HeaderText="zip" SortExpression="zip" DataField="zip"/>
        <asp:BoundColumn HeaderText="contract" SortExpression="contract" DataField="contract"/>
      </Columns>

    </ASP:DataGrid>

  </form>

</body>
</html>
