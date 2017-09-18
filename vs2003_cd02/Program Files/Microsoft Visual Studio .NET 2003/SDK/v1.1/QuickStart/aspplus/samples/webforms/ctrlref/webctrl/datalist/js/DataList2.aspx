<%@ Import Namespace="System.Data" %>

<html>
<head>

    <script language="JScript" runat="server">

    function CreateDataSource() : ICollection {
        var dt:DataTable = new DataTable();
        var dr:DataRow;

        dt.Columns.Add(new DataColumn("IntegerValue", System.Int32));
        dt.Columns.Add(new DataColumn("StringValue", System.String));
        dt.Columns.Add(new DataColumn("DateTimeValue", System.DateTime));

        for (var i:int = 0; i < 9; i++) {
            dr = dt.NewRow();

            dr[0] = i;
            dr[1] = "Item " + i.ToString();
            dr[2] = DateTime.Now;

            dt.Rows.Add(dr);
        }

        var dv:DataView = new DataView(dt);
        return dv;
    }

    function Page_Load(sender:Object, e:EventArgs) : void {
        if (!IsPostBack)
            BindList();
    }

    function BindList() : void {
        DataList1.DataSource= CreateDataSource();
        DataList1.DataBind();
    }

    function DataList_ItemCommand(sender:Object, e:DataListCommandEventArgs) : void {
        var cmd:String = LinkButton(e.CommandSource).CommandName;
        if (cmd == "select")
            DataList1.SelectedIndex = e.Item.ItemIndex;
        BindList();
    }

    </script>

</head>
<body>

    <h3><font face="Verdana">Using a SelectedItemTemplate with DataList</font></h3>

    <form runat=server>
    <font face="Verdana" size="-1">

        <asp:DataList id="DataList1" runat="server"
            BorderColor="black"
            BorderWidth="1"
            GridLines="Both"
            CellPadding="3"
            Font-Name="Verdana"
            Font-Size="8pt"
            Width="150px"
            HeaderStyle-BackColor="#aaaadd"
            AlternatingItemStyle-BackColor="Gainsboro"
            SelectedItemStyle-BackColor="yellow"
            OnItemCommand="DataList_ItemCommand"
            >
              <HeaderTemplate>
                Items
              </HeaderTemplate>
              <ItemTemplate>
                <asp:LinkButton id="button1" runat="server" Text="Show details" CommandName="select" />
                <%# DataBinder.Eval(Container.DataItem, "StringValue") %>
              </ItemTemplate>
              <SelectedItemTemplate>
                Item:
                <%# Container.DataItem("StringValue")  %>
                <br>
                Order Date:
                <%# DataBinder.Eval(Container.DataItem, "DateTimeValue", "{0:d}") %>
                <br>
                Quantity:
                <%# DataBinder.Eval(Container.DataItem, "IntegerValue", "{0:N1}") %>
                <br>
              </SelectedItemTemplate>

        </asp:DataList>

    </font>
    </form>

</body>
</html>


