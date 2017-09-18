<%@ Import Namespace="System.Data" %>

<html>
<script language="C#" runat="server">

    int startIndex;

    ICollection CreateDataSource() {
        DataTable dt = new DataTable();
        DataRow dr;

        dt.Columns.Add(new DataColumn("IntegerValue", typeof(Int32)));
        dt.Columns.Add(new DataColumn("StringValue", typeof(string)));
        dt.Columns.Add(new DataColumn("DateTimeValue", typeof(string)));
        dt.Columns.Add(new DataColumn("BoolValue", typeof(bool)));

        //"query" should return one page of data, beginning at the start index
        for (int i = startIndex; i < startIndex+MyDataGrid.PageSize; i++) {
            dr = dt.NewRow();

            dr[0] = i;
            dr[1] = "Item " + i.ToString();
            dr[2] = DateTime.Now.ToShortDateString();
            dr[3] = (i % 2 != 0) ? true : false;

            dt.Rows.Add(dr);
        }

        DataView dv = new DataView(dt);
        return dv;
    }

    void Page_Load(Object sender, EventArgs E ) {
        if (!IsPostBack) {
            startIndex=0;
            MyDataGrid.VirtualItemCount=200;
        }
        BindGrid();
    }

    void MyDataGrid_Page(Object sender, DataGridPageChangedEventArgs e) {
        startIndex = e.NewPageIndex * MyDataGrid.PageSize;
        MyDataGrid.CurrentPageIndex = e.NewPageIndex;
        BindGrid();
    }

    void BindGrid() {
        MyDataGrid.DataSource = CreateDataSource();
        MyDataGrid.DataBind();
        ShowStats();
    }

    void ShowStats() {
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
