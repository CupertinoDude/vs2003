<%@ Import Namespace="System.Data" %>

<html>
<script language="JScript" runat="server">

    var startIndex:Int32;

    function CreateDataSource() : ICollection {
        var dt:DataTable = new DataTable();
        var dr:DataRow;

        dt.Columns.Add(new DataColumn("IntegerValue", Type.GetType("System.Int32,mscorlib")));
        dt.Columns.Add(new DataColumn("StringValue", Type.GetType("System.String,mscorlib")));
        dt.Columns.Add(new DataColumn("DateTimeValue", Type.GetType("System.DateTime,mscorlib")));
        dt.Columns.Add(new DataColumn("BoolValue", Type.GetType("System.Boolean,mscorlib")));

        //"query" should return one page of data, beginning at the start index
        for (var i:int = startIndex; i < startIndex+MyDataGrid.PageSize; i++) {
            dr = dt.NewRow();

            dr[0] = i;
            dr[1] = "Item " + i.ToString();
            dr[2] = DateTime.Now.ToShortDateString();
            dr[3] = (i % 2 != 0) ? true : false;

            dt.Rows.Add(dr);
        }

        var dv:DataView = new DataView(dt);
        return dv;
    }

    function Page_Load(sender:Object, e:EventArgs) : void {
        if (!IsPostBack) {
            startIndex=0;
            MyDataGrid.VirtualItemCount=200;
        }
        BindGrid();
    }

    function MyDataGrid_Page(sender:Object, e:DataGridPageChangedEventArgs) : void {
        startIndex=(e.NewPageIndex*MyDataGrid.PageSize);
        MyDataGrid.CurrentPageIndex = e.NewPageIndex;
        BindGrid();
    }

    function BindGrid() : void {
        MyDataGrid.DataSource = CreateDataSource();
        MyDataGrid.DataBind();
        ShowStats();
    }

    function ShowStats() : void {
        lblEnabled.Text = "AllowPaging is " + MyDataGrid.AllowPaging;
        lblCustom.Text = "AllowCustomPaging is " + MyDataGrid.AllowCustomPaging;
        lblCurrentIndex.Text = "CurrentPageIndex is " + MyDataGrid.CurrentPageIndex;
        lblPageCount.Text = "PageCount is " + MyDataGrid.PageCount;
        lblVirtual.Text = "VirtualItemCount is " + MyDataGrid.VirtualItemCount;
        lblPageSize.Text = "PageSize is " + MyDataGrid.PageSize;
    }


</script>

<body>

    <h3><font face="Verdana">Custom Paging with DataGrid</font></h3>

    <form runat=server>

      <ASP:DataGrid id="MyDataGrid" runat="server"
        AllowPaging="True"
        AllowCustomPaging="True"
        PageSize="10"
        PagerStyle-Mode="NumericPages"
        PagerStyle-HorizontalAlign="Right"
        OnPageIndexChanged="MyDataGrid_Page"
        BorderColor="black"
        BorderWidth="1"
        GridLines="Both"
        CellPadding="3"
        CellSpacing="0"
        Font-Name="Verdana"
        Font-Size="8pt"
        HeaderStyle-BackColor="#aaaadd"
        AlternatingItemStyle-BackColor="#eeeeee"
        />

      <p>
      <table bgcolor="#eeeeee" cellpadding="6"><tr><td nowrap><font face="Verdana" size="-2">

        <asp:Label id="lblEnabled" runat="server" /><br>
        <asp:Label id="lblCurrentIndex" runat="server" /><br>
        <asp:Label id="lblPageCount" runat="server" /><br>
        <hr noshade color="#cccccc">
        <asp:Label id="lblCustom" runat="server" /><br>
        <asp:Label id="lblPageSize" runat="server" /><br>
        <asp:Label id="lblVirtual" runat="server" />

      </font></td></tr></table>
  </form>

</body>
</html>
