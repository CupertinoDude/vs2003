<%@ Page Debug="true" %>
<%@ Import Namespace="System.Data" %>

<html>
<script language="JScript" runat="server">

    var SortField:String;

    function CreateDataSource() : ICollection {
        var dt:DataTable = new DataTable();
        var dr:DataRow;

        dt.Columns.Add(new DataColumn("IntegerValue", Type.GetType("System.Int32,mscorlib")));
        dt.Columns.Add(new DataColumn("StringValue", Type.GetType("System.String,mscorlib")));
        dt.Columns.Add(new DataColumn("DateTimeValue", Type.GetType("System.DateTime,mscorlib")));
        dt.Columns.Add(new DataColumn("BoolValue", Type.GetType("System.Boolean,mscorlib")));
        dt.Columns.Add(new DataColumn("CurrencyValue", Type.GetType("System.Double,mscorlib")));

        for (var i:int = 0; i < 9; i++) {
            dr = dt.NewRow();

            dr[0] = 9-i;
            dr[1] = "Item " + i.ToString();
            dr[2] = new DateTime(2000,1,1);
            dr[3] = (i % 2 != 0) ? true : false;
            dr[4] = 1.23 * (i+1);

            dt.Rows.Add(dr);
        }

        var dv:DataView = new DataView(dt);
        dv.Sort = SortField;
        return dv;
    }

    function Page_Load(sender:Object, e:EventArgs) : void {
        if (!IsPostBack) {
            if (SortField == "") {
                SortField = "IntegerValue";
            }
            BindGrid();
        }
    }

    protected function MyDataGrid_Sort(sender:Object, e:DataGridSortCommandEventArgs) : void {
        SortField = String(e.SortExpression);
        BindGrid();
    }

    public function BindGrid() : void {
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
