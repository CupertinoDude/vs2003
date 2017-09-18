<%@ Import namespace="System.Data" %>

<html>
<head>

    <script language="JScript" runat="server">

        function Page_Load(Src : Object, E : EventArgs) : void {

            if (!Page.IsPostBack) {

                var dt : DataTable = new DataTable();
                var dr : DataRow;

                dt.Columns.Add(new DataColumn("IntegerValue", System.Int32));
                dt.Columns.Add(new DataColumn("StringValue", System.String));
                dt.Columns.Add(new DataColumn("DateTimeValue", System.DateTime));
                dt.Columns.Add(new DataColumn("BooleanValue", System.Boolean));

                var i : int;
                for (i = 1; i < 10; i++) {

                    dr = dt.NewRow();

                    dr[0] = i;
                    dr[1] = "Item " + i.ToString();
                    dr[2] = DateTime.Now;
                    dr[3] = (i % 2 != 0) ? true : false;

                    dt.Rows.Add(dr);
                }

                dataGrid1.DataSource = new DataView(dt);
                dataGrid1.DataBind();
            }
        }

    </script>

</head>
<body>

    <h3><font face="Verdana">Databinding to a DataView</font></h3>

    <form runat=server>

        <asp:DataGrid id=dataGrid1 runat="server"
          BorderColor="black"
          BorderWidth="1"
          GridLines="Both"
          CellPadding="3"
          CellSpacing="0"
          HeaderStyle-BackColor="#aaaadd"
        />

    </form>

</body>
</html>
