<%@ Import Namespace="System.Data" %>

<html>

<script language="JScript" runat="server">

    function Page_Load(sender:Object, e:EventArgs) : void {

        var dt:DataTable = new DataTable();
        var dr:DataRow;

        dt.Columns.Add(new DataColumn("IntegerValue", System.Int32));
        dt.Columns.Add(new DataColumn("StringValue", System.String));
        dt.Columns.Add(new DataColumn("DateTimeValue", System.DateTime));
        dt.Columns.Add(new DataColumn("BoolValue", System.Boolean));
        dt.Columns.Add(new DataColumn("CurrencyValue", System.Double));

        for (var i:int = 0; i < 9; i++) {

            dr = dt.NewRow();

            dr[0] = i;
            dr[1] = "Item " + i.ToString();
            dr[2] = DateTime.Now;
            dr[3] = (i % 2 != 0) ? true : false;
            dr[4] = 1.23 * (i+1);

            dt.Rows.Add(dr);
        }

        MyRepeater.DataSource=new DataView(dt);
        MyRepeater.DataBind();
    }

</script>

<body>

    <h3><font face="Verdana">DataBinding HtmlAnchor</font></h3>

    <p>

    <form runat=server>

        <asp:Repeater id="MyRepeater" runat="server">

            <ItemTemplate>

                Link for

                <asp:HyperLink id=HyperLink1 Text='<%# DataBinder.Eval(Container.DataItem, "StringValue") %>' NavigateUrl='<%# "detailspage.aspx?id=" + HttpUtility.UrlEncode(DataBinder.Eval(Container.DataItem,"StringValue")) %>' runat="server" />

                <p>

            </ItemTemplate>

        </asp:Repeater>

    </form>

</body>
</html>


