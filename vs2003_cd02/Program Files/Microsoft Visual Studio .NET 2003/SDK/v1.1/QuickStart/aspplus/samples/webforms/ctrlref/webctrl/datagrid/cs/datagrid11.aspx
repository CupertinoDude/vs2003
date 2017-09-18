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
            MyDataGrid.PagerStyle.Visible=true;
        }
        else {
            MyDataGrid.PagerStyle.Visible=false;
        }

        BindGrid();
    }

    void PagerButtonClick(Object sender, EventArgs e) {
        //used by external paging UI
        String arg = ((LinkButton)sender).CommandArgument;

        switch(arg)
        {
            case ("next"):
                if (MyDataGrid.CurrentPageIndex < (MyDataGrid.PageCount - 1))
                    MyDataGrid.CurrentPageIndex ++;
                break;
            case ("prev"):
                if (MyDataGrid.CurrentPageIndex > 0)
                    MyDataGrid.CurrentPageIndex --;
                break;
            case ("last"):
                MyDataGrid.CurrentPageIndex = (MyDataGrid.PageCount - 1);
                break;
            default:
                //page number
                MyDataGrid.CurrentPageIndex = Convert.ToInt32(arg);
                break;
        }
        BindGrid();
    }

    void MyDataGrid_Page(Object sender, DataGridPageChangedEventArgs e) {
        //used by built-in pager.  CurrentPageIndex already set
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

    <h3><font face="Verdana">Providing Alternate Paging UI</font></h3>

    <form runat=server>

      <ASP:DataGrid id="MyDataGrid" runat="server"
        AllowPaging="True"
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
      <asp:LinkButton id="btnPrev" runat="server"
        Text="Previous page"
        CommandArgument="prev"
        ForeColor="navy"
        Font-Name="verdana" Font-size="8pt"
        OnClick="PagerButtonClick"
        />
      &nbsp;
      <asp:LinkButton id="btnNext" runat="server"
        Text="Next page"
        CommandArgument="next"
        ForeColor="navy"
        Font-Name="verdana" Font-size="8pt"
        OnClick="PagerButtonClick"
        />
      &nbsp;
      <asp:LinkButton id="btnPage8" runat="server"
        Text="Go to Page 8"
        CommandArgument="7"
        ForeColor="navy"
        Font-Name="verdana" Font-size="8pt"
        OnClick="PagerButtonClick"
        />
      &nbsp;
      <asp:LinkButton id="btnFirst" runat="server"
        Text="Go to the first page"
        CommandArgument="0"
        ForeColor="navy"
        Font-Name="verdana" Font-size="8pt"
        OnClick="PagerButtonClick"
        />
      &nbsp;
      <asp:LinkButton id="btnLast" runat="server"
        Text="Go to the last page"
        CommandArgument="last"
        ForeColor="navy"
        Font-Name="verdana" Font-size="8pt"
        OnClick="PagerButtonClick"
        />


      <p>
      <asp:Checkbox id="chk1" runat="server"
        Text="Show built-in pager"
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
