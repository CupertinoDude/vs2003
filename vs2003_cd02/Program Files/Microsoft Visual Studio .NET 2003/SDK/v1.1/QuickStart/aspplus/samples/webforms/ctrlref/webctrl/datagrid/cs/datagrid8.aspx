<%@ Import Namespace="System.Data" %>

<html>
<script language="C#" runat="server">

    string SortField;

    ICollection CreateDataSource() {
        DataTable dt = new DataTable();
        DataRow dr;

        dt.Columns.Add(new DataColumn("IntegerValue", typeof(Int32)));
        dt.Columns.Add(new DataColumn("StringValue", typeof(string)));
        dt.Columns.Add(new DataColumn("DateTimeValue", typeof(DateTime)));
        dt.Columns.Add(new DataColumn("BoolValue", typeof(bool)));
        dt.Columns.Add(new DataColumn("CurrencyValue", typeof(double)));

        for (int i = 0; i < 9; i++) {
            dr = dt.NewRow();

            dr[0] = 9-i;
            dr[1] = "Item " + i.ToString();
            dr[2] = DateTime.Now;
            dr[3] = (i % 2 != 0) ? true : false;
            dr[4] = 1.23 * (i+1);

            dt.Rows.Add(dr);
        }

        DataView dv = new DataView(dt);
        dv.Sort = SortField;
        return dv;
    }

    void Page_Load(Object sender, EventArgs e) {
        if (!IsPostBack) {
            if (SortField == "") {
                SortField = "IntegerValue";
            }    
            BindGrid();
        }    
    }

    void MyDataGrid_Sort(Object sender, DataGridSortCommandEventArgs e) {
        SortField = (string)e.SortExpression;
        BindGrid();
    }

    void BindGrid() {
        MyDataGrid.DataSource = CreateDataSource();
        MyDataGrid.DataBind();
    }


</script>

<body>

    <h3><font face="Verdana">Basic Sorting in DataGrid</font></h3>

    <form runat=server>

      <ASP:DataGrid id="MyDataGrid" runat="server"
        AllowSorting="true"
        OnSortCommand="MyDataGrid_Sort"
        BorderColor="black"
        BorderWidth="1"
        CellPadding="3"
        Font-Name="Verdana"
        Font-Size="8pt"
        HeaderStyle-BackColor="#ccccff"
        HeaderStyle-ForeColor="black"
      />

  </form>

</body>
</html>
