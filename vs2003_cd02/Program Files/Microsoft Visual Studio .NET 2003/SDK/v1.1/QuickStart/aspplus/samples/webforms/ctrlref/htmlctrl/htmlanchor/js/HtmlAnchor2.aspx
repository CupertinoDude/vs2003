<%@ Import Namespace="System.Data" %>

<html>
<script language="JScript" runat="server">

    public function Page_Load(Src:Object, E:EventArgs) : void {

        var dt:DataTable = new DataTable();
        var dr:DataRow;

        dt.Columns.Add(new DataColumn("IntegerValue",  System.Type.GetType("System.Int32")));
        dt.Columns.Add(new DataColumn("StringValue",   System.Type.GetType("System.String")));
        dt.Columns.Add(new DataColumn("DateTimeValue", System.Type.GetType("System.DateTime")));
        dt.Columns.Add(new DataColumn("BoolValue",     System.Type.GetType("System.Boolean")));
        dt.Columns.Add(new DataColumn("CurrencyValue", System.Type.GetType("System.Double")));

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
    <font face="Verdana" size="-1">

        <asp:Repeater id="MyRepeater" runat="server">

            <ItemTemplate>

                Link for

                <a href='<%# "detailspage.aspx?id=" + HttpUtility.UrlEncode(DataBinder.Eval(Container,"DataItem.StringValue")) %>' runat="server">
                    <%# DataBinder.Eval(Container, "DataItem.StringValue") %>
                </a>

                <p>

            </ItemTemplate>

        </asp:Repeater>

    </font>
    </form>

</body>
</html>


