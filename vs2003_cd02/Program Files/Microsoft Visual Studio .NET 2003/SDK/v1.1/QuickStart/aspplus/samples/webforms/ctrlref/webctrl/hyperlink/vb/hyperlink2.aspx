<%@ Import Namespace="System.Data" %>

<html>

    <script language="VB" runat="server">

    Sub Page_Load(sender As Object, e As EventArgs)

        Dim dt As DataTable
        Dim dr As DataRow
        Dim i As Integer

        'create a DataTable
        dt = New DataTable
        dt.Columns.Add(New DataColumn("IntegerValue", GetType(Integer)))
        dt.Columns.Add(New DataColumn("StringValue", GetType(String)))
        dt.Columns.Add(New DataColumn("DateTimeValue", GetType(DateTime)))

        'Make some rows and put some sample data in
        For i = 1 To 9
            dr = dt.NewRow()
            dr(0) = i
            dr(1) = "Item " & i.ToString()
            dr(2) = DateTime.Now.ToShortTimeString
            dt.Rows.Add(dr)
        Next

        MyRepeater.DataSource=new DataView(dt)
        MyRepeater.DataBind

    End Sub

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


