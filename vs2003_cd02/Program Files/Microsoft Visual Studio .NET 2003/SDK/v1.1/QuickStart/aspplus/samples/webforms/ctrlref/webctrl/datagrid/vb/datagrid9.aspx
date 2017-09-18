<%@ Import Namespace="System.Data" %>

<html>
<script language="VB" runat="server">

    Dim SortField As String

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
        dt.Columns.Add(new DataColumn("CurrencyValue", GetType(Double)))

        'Make some rows and put some sample data in
        For i = 1 To 9
            dr = dt.NewRow()
            dr(0) = 9-i
            dr(1) = "Item " & i.ToString()
            dr(2) = DateTime.Now.ToShortTimeString
            If (i Mod 2 <> 0) Then
                dr(3) = True
            Else
                dr(3) = False
            End If
            dr(4) = 1.23 * (i + 1)
            'add the row to the datatable
            dt.Rows.Add(dr)
        Next

        'return a DataView to the DataTable
        Dim dv as DataView = New DataView(dt)
        dv.Sort = SortField
        CreateDataSource = dv
    End Function        

    Sub Page_Load(sender As Object, e As EventArgs) 
        If Not IsPostBack Then
            If SortField = "" Then
                SortField = "IntegerValue"
            End If    
            BindGrid
        End If
    End Sub

    Sub MyDataGrid_Sort(sender As Object, e As DataGridSortCommandEventArgs)
        SortField = e.SortExpression
        BindGrid
    End Sub

    Sub BindGrid()
        MyDataGrid.DataSource = CreateDataSource()
        MyDataGrid.DataBind
    End Sub


</script>

<body>

    <h3><font face="Verdana">Custom Sorting in DataGrid</font></h3>

    <form runat=server>

      <ASP:DataGrid id="MyDataGrid" runat="server"
        BorderColor="black"
        BorderWidth="1"
        CellPadding="3"
        Font-Name="Verdana"
        Font-Size="8pt"
        HeaderStyle-BackColor="#cccccc"
        HeaderStyle-ForeColor="black"
        AutoGenerateColumns="false"
        AllowSorting="true"
        OnSortCommand="MyDataGrid_Sort"
      >
          <Columns>
            <asp:BoundColumn HeaderText="Sortable" DataField="IntegerValue" SortExpression="IntegerValue"/>
            <asp:BoundColumn HeaderText="Not Sortable" DataField="DateTimeValue" />
            <asp:TemplateColumn
                SortExpression="StringValue">
                <HeaderTemplate>
                    Click to sort -->
                    <asp:ImageButton id=SortButton1 runat="server"
                        CommandName="sort"
                        ImageUrl="/quickstart/aspplus/images/arrow1.gif"
                        />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label runat="server"
                        Text='<%# DataBinder.Eval(Container, "DataItem.StringValue") %>' />
                </ItemTemplate>
            </asp:TemplateColumn>
          </Columns>

      </asp:DataGrid>

  </form>

</body>
</html>
