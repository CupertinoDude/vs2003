<%@ Import Namespace="System.Data" %>

<html>
<script language="VB" runat="server">

    Dim startIndex As Integer

    Function CreateDataSource() As ICollection

        Dim dt As DataTable
        Dim dr As DataRow
        Dim i As Integer

        'create a DataTable
        dt = New DataTable
        dt.Columns.Add(New DataColumn("IntegerValue", GetType(Integer)))
        dt.Columns.Add(New DataColumn("StringValue", GetType(String)))
        dt.Columns.Add(New DataColumn("DateTimeValue", GetType(String)))
        dt.Columns.Add(New DataColumn("BoolValue", GetType(Boolean)))

        ' "query" should return one page of data, beginning at the start index
        For i = startIndex to (startIndex + MyDataGrid.PageSize)
            dr = dt.NewRow()
            dr(0) = i
            dr(1) = "Item " + i.ToString()
            dr(2) = DateTime.Now.ToShortDateString
            If (i Mod 2 <> 0) Then
                dr(3) = True
            Else
                dr(3) = False
            End If
            dt.Rows.Add(dr)
        Next

        'return a DataView to the DataTable
        CreateDataSource = New DataView(dt)
    End Function

    Sub Page_Load(sender As Object, e As EventArgs)
        If Not IsPostBack Then
            startIndex = 0
            MyDataGrid.VirtualItemCount = 200
        End If
        BindGrid
    End Sub

    Sub MyDataGrid_Page(sender As Object, e As DataGridPageChangedEventArgs)
        startIndex = e.NewPageIndex * MyDataGrid.PageSize
        MyDataGrid.CurrentPageIndex = e.NewPageIndex
        BindGrid
    End Sub

    Sub BindGrid()
        MyDataGrid.DataSource = CreateDataSource()
        MyDataGrid.DataBind
        ShowStats
    End Sub

    Sub ShowStats()
        lblEnabled.Text = "AllowPaging is " & MyDataGrid.AllowPaging
        lblCustom.Text = "AllowCustomPaging is " & MyDataGrid.AllowCustomPaging
        lblCurrentIndex.Text = "CurrentPageIndex is " & MyDataGrid.CurrentPageIndex
        lblPageCount.Text = "PageCount is " & MyDataGrid.PageCount
        lblVirtual.Text = "VirtualItemCount is " & MyDataGrid.VirtualItemCount
        lblPageSize.Text = "PageSize is " & MyDataGrid.PageSize
    End Sub


</script>

<body>

    <h3><font face="Verdana">Custom Paging with DataGrid</font></h3>

    <form runat=server>

      <ASP:DataGrid id="MyDataGrid" runat="server"
        AllowPaging="True"
        AllowCustomPaging="True"
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
      <table bgcolor="#eeeeee" cellpadding="6"><tr><td nowrap><font face="Verdana" size="-2">

        <asp:Label id="lblEnabled" runat="server" /><br>
        <asp:Label id="lblCurrentIndex" runat="server" /><br>
        <asp:Label id="lblPageCount" runat="server" /><br>
        <hr noshade color="#cccccc">
        <asp:Label id="lblCustom" runat="server" /><br>
        <asp:Label id="lblPageSize" runat="server" /><br>
        <asp:Label id="lblVirtual" runat="server" />

      </font></td></tr></table>
  </form>

</body>
</html>
