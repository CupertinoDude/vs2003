<%@ Import namespace="System.Data" %>

<html>
<head>

    <script language="JScript" runat="server">

        function Page_Load(sender : Object, e : EventArgs) : void {

            if (!Page.IsPostBack) {

                var dt : DataTable = new DataTable();
                var dr : DataRow;

                dt.Columns.Add(new DataColumn("IntegerValue", System.Int32));
                dt.Columns.Add(new DataColumn("StringValue", System.String));
                dt.Columns.Add(new DataColumn("DateTimeValue", System.DateTime));
                dt.Columns.Add(new DataColumn("BoolValue", System.Boolean));

                var i : int
                for (i = 0; i < 9; i++) {

                    dr = dt.NewRow();

                    dr[0] = i;
                    dr[1] = "Item " + i.ToString();
                    dr[2] = DateTime.Now;
                    dr[3] = (i % 2 != 0) ? true : false;

                    dt.Rows.Add(dr);
                }

                dataList1.DataSource = new DataView(dt);
                dataList1.DataBind();
            }
        }

    </script>

</head>
<body>

    <h3><font face="Verdana">Databinding Using DataBinder.Eval</font></h3>

    <form runat=server>

        <asp:DataList id=dataList1 runat=server
          RepeatColumns="3"
          Width="80%"
          BorderColor="black"
          BorderWidth="1"
          GridLines="Both"
          CellPadding="4"
          CellSpacing="0"
          >

            <ItemTemplate>

                Order Date: <%# DataBinder.Eval(Container.DataItem, "DateTimeValue", "{0:d}") %>

                <p>

                Quantity: <%# DataBinder.Eval(Container.DataItem, "IntegerValue", "{0:N2}") %>

                <p>

                Item: <%# DataBinder.Eval(Container.DataItem, "StringValue") %>

                Order Date: <asp:CheckBox id=chk1 Checked='<%# DataBinder.Eval(Container.DataItem, "BoolValue") %>' runat=server/>

                <p>

            </ItemTemplate>

        </asp:Datalist>

    </form>

</body>
</html>
