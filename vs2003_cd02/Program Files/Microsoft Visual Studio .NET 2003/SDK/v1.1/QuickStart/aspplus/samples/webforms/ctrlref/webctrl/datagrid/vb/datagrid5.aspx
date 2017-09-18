<%@ Import Namespace="System.Data" %>

<html>
<script language="VB" runat="server">

    Dim Cart As DataTable
    Dim CartView As DataView

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
            dr(0) = i
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
        CreateDataSource = New DataView(dt)

    End Function

    Sub Page_Load(sender As Object, e As EventArgs)

        If Session("DG5VB_ShoppingCart") Is Nothing Then
            Cart = New DataTable()
            Cart.Columns.Add(new DataColumn("Item", GetType(string)))
            Cart.Columns.Add(new DataColumn("Price", GetType(string)))
            Session("DG5VB_ShoppingCart") = Cart
        Else
            Cart = Session("DG5VB_ShoppingCart")
        End If
        CartView = New DataView(Cart)
        ShoppingCart.DataSource = CartView
        CartView.Sort="Item"
        ShoppingCart.DataBind

        MyDataGrid.DataSource = CreateDataSource()
        MyDataGrid.DataBind
    End Sub

    Sub Grid_CartCommand(sender As Object, e As DataGridCommandEventArgs)

        Dim dr As DataRow = Cart.NewRow()

        ' e.Item is the row of the table where the command fired
        ' For bound columns the value is stored in the Text property of TableCell
        Dim itemCell As TableCell = e.Item.Cells(1)
        Dim priceCell As TableCell = e.Item.Cells(2)
        Dim item As String = itemCell.Text
        Dim price As String = priceCell.Text

        If e.CommandSource.CommandName = "AddToCart" Then
            dr(0) = item
            dr(1) = price
            Cart.Rows.Add(dr)
        Else   'Remove from Cart

            CartView.RowFilter = "Item='" & item & "'"
            If CartView.Count > 0 Then
                CartView.Delete(0)
            End If
            CartView.RowFilter = ""
        End If
        ShoppingCart.DataBind()

    End Sub


</script>

<body>

    <h3><font face="Verdana">Using a Template Column in DataGrid</font></h3>

    <form runat=server>

    <table cellpadding="5">
    <tr valign="top">
    <td>

    <b>Product List</b>
    <asp:DataGrid id="MyDataGrid" runat="server"
        BorderColor="black"
        BorderWidth="1"
        GridLines="Both"
        CellPadding="3"
        CellSpacing="0"
        Font-Name="Verdana"
        Font-Size="8pt"
        HeaderStyle-BackColor="#aaaadd"
        AutoGenerateColumns="false"
        OnItemCommand="Grid_CartCommand"
        >
        <Columns>
            <asp:TemplateColumn HeaderText="Add/Remove">
                <ItemTemplate>
                    <asp:LinkButton ID=AddButton Text="Add" CommandName="AddToCart" ForeColor="blue" runat="server" />&nbsp;
                    <asp:LinkButton ID=RemoveButton Text="Remove" CommandName="RemoveFromCart" ForeColor="blue" runat="server" />
                </ItemTemplate>
            </asp:TemplateColumn>

            <asp:BoundColumn HeaderText="Item" DataField="StringValue"/>

            <asp:BoundColumn HeaderText="Price" DataField="CurrencyValue" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="right" />

            <asp:TemplateColumn HeaderText="Assembly required?">
                <ItemTemplate>
                    <asp:CheckBox ID=Chk1 Checked='<%# DataBinder.Eval(Container.DataItem, "BoolValue") %>' Enabled="false" runat="server" />
                </ItemTemplate>
            </asp:TemplateColumn>
        </Columns>
    </asp:DataGrid>

    </td><td>

    <b>Shopping Cart</b>
    <asp:DataGrid id="ShoppingCart" runat="server"
        BorderColor="black"
        BorderWidth="1"
        CellPadding="3"
        Font-Name="Verdana"
        Font-Size="8pt"
        HeaderStyle-BackColor="#aaaadd"
        />

    </td>
    </tr>
    </table>

  </form>

</body>
</html>
