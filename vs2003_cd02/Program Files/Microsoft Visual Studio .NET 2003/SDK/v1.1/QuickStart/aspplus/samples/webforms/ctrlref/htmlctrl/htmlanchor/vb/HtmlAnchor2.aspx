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
        dt.Columns.Add(New DataColumn("BoolValue", GetType(Boolean)))
        dt.Columns.Add(new DataColumn("CurrencyValue", GetType(Double)))

        'Make some rows and put some sample data in
        For i = 1 To 9
            dr = dt.NewRow()
            dr(0) = i
            dr(1) = "Item " + i.ToString()
            dr(2) = DateTime.Now.ToShortTimeString
            If (i Mod 2 <> 0) Then
                dr(3) = True
            Else
                dr(3) = False
            End If
            dr(4) = 1.23 * (i+1)
            'add the row to the datatable
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
    <font face="Verdana" size="-1">

        <asp:Repeater id="MyRepeater" runat="server">

            <ItemTemplate>

                Link for

                <a href='<%# "detailspage.aspx?id=" & HttpUtility.UrlEncode(DataBinder.Eval(Container,"DataItem.StringValue")) %>' runat="server">
                    <%# DataBinder.Eval(Container, "DataItem.StringValue") %>
                </a>

                <p>

            </ItemTemplate>

        </asp:Repeater>

    </font>
    </form>

</body>
</html>


