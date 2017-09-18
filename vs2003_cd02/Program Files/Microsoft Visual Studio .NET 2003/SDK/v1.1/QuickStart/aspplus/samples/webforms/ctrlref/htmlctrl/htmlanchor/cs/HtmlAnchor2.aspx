<%@ Import Namespace="System.Data" %>

<html>
<script language="C#" runat="server">

    void Page_Load(Object Src, EventArgs E) {

        DataTable dt = new DataTable();
        DataRow dr;

        dt.Columns.Add(new DataColumn("IntegerValue", typeof(Int32)));
        dt.Columns.Add(new DataColumn("StringValue", typeof(string)));
        dt.Columns.Add(new DataColumn("DateTimeValue", typeof(DateTime)));
        dt.Columns.Add(new DataColumn("BoolValue", typeof(bool)));
        dt.Columns.Add(new DataColumn("CurrencyValue", typeof(double)));

        for (int i = 0; i < 9; i++) {

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

                <a href='<%# "detailspage.aspx?id=" + HttpUtility.UrlEncode(DataBinder.Eval(Container,"DataItem.StringValue").ToString()) %>' runat="server">
                    <%# DataBinder.Eval(Container, "DataItem.StringValue") %>
                </a>

                <p>

            </ItemTemplate>

        </asp:Repeater>

    </font>
    </form>

</body>
</html>


