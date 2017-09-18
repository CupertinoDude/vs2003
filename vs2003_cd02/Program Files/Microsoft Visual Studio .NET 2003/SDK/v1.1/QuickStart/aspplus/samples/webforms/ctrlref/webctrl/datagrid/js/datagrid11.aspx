<%@ Import Namespace="System.Data" %>

<html>
<script language="JScript" runat="server">

    public function CreateDataSource() : ICollection {
        var dt:DataTable = new DataTable();
        var dr:DataRow;

        dt.Columns.Add(new DataColumn("IntegerValue", Type.GetType("System.Int32,mscorlib")));
        dt.Columns.Add(new DataColumn("StringValue", Type.GetType("System.String,mscorlib")));
        dt.Columns.Add(new DataColumn("DateTimeValue", Type.GetType("System.DateTime,mscorlib")));
        dt.Columns.Add(new DataColumn("BoolValue", Type.GetType("System.Boolean,mscorlib")));

        for (var i:int = 0; i < 200; i++) {
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
        if (chk1.Checked) {
            MyDataGrid.PagerStyle.Visible=true;
        }
        else {
            MyDataGrid.PagerStyle.Visible=false;
        }

        BindGrid();
    }

    function PagerButtonClick(sender:Object, e:EventArgs) : void {
        //used by external paging UI
        var arg:String = LinkButton(sender).CommandArgument;

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

    function MyDataGrid_Page(sender:Object, e:DataGridPageChangedEventArgs) : void {
        //used by built-in pager.  CurrentPageIndex already set
        MyDataGrid.CurrentPageIndex = e.NewPageIndex;
        BindGrid();
    }

    function BindGrid() : void {
        MyDataGrid.DataSource = CreateDataSource();
        MyDataGrid.DataBind();
        ShowStats();
    }

    function ShowStats() : void {
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
