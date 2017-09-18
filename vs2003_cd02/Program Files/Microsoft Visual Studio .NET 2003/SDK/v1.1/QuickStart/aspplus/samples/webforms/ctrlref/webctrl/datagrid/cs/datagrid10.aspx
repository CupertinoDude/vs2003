<%@ Import Namespace="System.Data" %>

<html>
<script language="C#" runat="server">

    ICollection CreateDataSource() {
        DataTable dt = new DataTable();
        DataRow dr;

        dt.Columns.Add(new DataColumn("IntegerValue", typeof(Int32)));
        dt.Columns.Add(new DataColumn("StringValue", typeof(string)));
        dt.Columns.Add(new DataColumn("DateTimeValue", typeof(string)));
        dt.Columns.Add(new DataColumn("BoolValue", typeof(bool)));

        for (int i = 0; i < 200; i++) {
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

    void Page_Load(Object sender, EventArgs e) {
        if (chk1.Checked) {
            MyDataGrid.PagerStyle.Mode=PagerMode.NumericPages;
        }
        else {
            MyDataGrid.PagerStyle.Mode=PagerMode.NextPrev;
        }

        BindGrid();
    }

    void MyDataGrid_Page(Object sender, DataGridPageChangedEventArgs e) {
        MyDataGrid.CurrentPageIndex = e.NewPageIndex;

        BindGrid();
    }

    void BindGrid() {
        MyDataGrid.DataSource = CreateDataSource();
        MyDataGrid.DataBind();
        ShowStats();
    }

    void ShowStats() {
        lblCurrentIndex.Text = "CurrentPageIndex is " + MyDataGrid.CurrentPageIndex;
        lblPageCount.Text = "PageCount is " + MyDataGrid.PageCount;
    }


</script>

<body>

    <h3><font face="Verdana">Basic Paging with DataGrid</font></h3>

    <form runat=server>

      <ASP:DataGrid id="MyDataGrid" runat="server"
        AllowPaging="True"
        PageSize="10"
        PagerStyle-Mode="NumericPages"
        PagerStyle-HorizontalAlign="Right"
        PagerStyle-NextPageText="Next"
        PagerStyle-PrevPageText="Prev"
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
      <asp:Checkbox id="chk1" runat="server"
        Text="Show numeric page navigation buttons"
        Font-Name="Verdana"
        Font-Size="8pt"
        AutoPostBack="true"
        />

      <p>
      <table bgcolor="#eeeeee" cellpadding="6"><tr><td nowrap><font face="Verdana" size="-2">

        <asp:Label id="lblCurrentIndex" runat="server" /><br>
        <asp:Label id="lblPageCount" runat="server" /><br>

      </font></td></tr></table>
  </form>

</body>
</html>
