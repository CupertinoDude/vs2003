<%@ Import Namespace="System.Data" %>

<html>
<script language="VB" runat="server">

    Function CreateDataSource() As ICollection

        Dim dt As DataTable
        Dim dr As DataRow
        Dim i As Integer

        'create a DataTable
        dt = New DataTable
        dt.Columns.Add(New DataColumn("IntegerValue", GetType(Integer)))
        dt.Columns.Add(New DataColumn("StringValue", GetType(String)))
        dt.Columns.Add(New DataColumn("DateTimeValue", GetType(DateTime)))
        dt.Columns.Add(New DataColumn("BoolValue", GetType(Boolean)))

        'Make some rows and put some sample data in
        For i = 1 To 200
            dr = dt.NewRow()
            dr(0) = i
            dr(1) = "Item " + i.ToString()
            dr(2) = DateTime.Now.ToShortTimeString
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

        If chk1.Checked Then
            MyDataGrid.PagerStyle.Mode = PagerMode.NumericPages
        Else
            MyDataGrid.PagerStyle.Mode = PagerMode.NextPrev
        End If

        BindGrid
    End Sub

    Sub MyDataGrid_Page(sender As Object, e As DataGridPageChangedEventArgs)
        MyDataGrid.CurrentPageIndex = e.NewPageIndex
        BindGrid
    End Sub

    Sub BindGrid()
        MyDataGrid.DataSource = CreateDataSource()
        MyDataGrid.DataBind
        ShowStats
    End Sub

    Sub ShowStats()
        lblCurrentIndex.Text = "CurrentPageIndex is " & MyDataGrid.CurrentPageIndex
        lblPageCount.Text = "PageCount is " & MyDataGrid.PageCount
    End Sub


</script>

<body>

    <h3><font face="Verdana">Basic Paging with DataGrid</font></h3>

    <form runat=server>

      <ASP:DataGrid id="MyDataGrid" runat="server"
        AllowPaging="True"
        PageSize="10"
        PagerStyle-Mode="NumericPages"
        PagerStyle-HorizontalAlign="Right"
        PagerStyle-NextPageText="Next"
        PagerStyle-PrevPageText="Prev"
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
      <asp:Checkbox id="chk1" runat="server"
        Text="Show numeric page navigation buttons"
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
