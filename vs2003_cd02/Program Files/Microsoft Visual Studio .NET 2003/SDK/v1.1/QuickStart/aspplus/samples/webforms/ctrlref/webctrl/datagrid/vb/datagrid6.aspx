<%@ Import Namespace="System.Data" %>

<html>
<script language="VB" runat="server">

    Dim Cart As DataTable
    Dim CartView As DataView

    Sub Page_Load(sender As Object, e As EventArgs)
        Dim dr As DataRow
        Dim I As Integer

        If Session("DG6VB_ShoppingCart") Is Nothing Then
            Cart = New DataTable()
            Cart.Columns.Add(new DataColumn("Qty", GetType(String)))
            Cart.Columns.Add(new DataColumn("Item", GetType(String)))
            Cart.Columns.Add(new DataColumn("Price", GetType(String)))
            Session("DG6VB_ShoppingCart") = Cart

            'Make some rows and put some sample data in
            For I = 1 To 4
                dr = Cart.NewRow()
                If (i Mod 2 <> 0) Then
                    dr(0) = "2"
                Else
                    dr(0) = "1"
                End If
                dr(1) = "Item " & i.ToString
                dr(2) = (1.23 * (i + 1)).ToString
                Cart.Rows.Add(dr)
            Next
        Else
            Cart = Session("DG6VB_ShoppingCart")
        End If

        CartView = New DataView(Cart)
        CartView.Sort="Item"
        If Not IsPostBack Then
            ' need to load this data only once
            BindGrid
        End If

    End Sub

    Sub MyDataGrid_Edit(sender As Object, e As DataGridCommandEventArgs)
        MyDataGrid.EditItemIndex = e.Item.ItemIndex
        BindGrid
    End Sub

    Sub MyDataGrid_Cancel(sender As Object, e As DataGridCommandEventArgs)
        MyDataGrid.EditItemIndex = -1
        BindGrid
    End Sub

    Sub MyDataGrid_Update(sender As Object, e As DataGridCommandEventArgs)
        ' For bound columns the edited value is stored in a textbox,
        ' and the textbox is the 0th element in the column's cell
        Dim qtyText As System.Web.UI.WebControls.TextBox = e.Item.Cells(2).Controls(0)
        Dim priceText As System.Web.UI.WebControls.TextBox = e.Item.Cells(3).Controls(0)

        Dim item As String = e.Item.Cells(1).Text
        Dim qty As String = qtyText.Text
        Dim price As String = priceText.Text

        ' with a database, we'd use an update command.  Since we're using an in-memory
        ' DataTable, we'll delete the old row and replace it with a new one
        ' remove old entry
        CartView.RowFilter = "Item='" & item & "'"
        If CartView.Count > 0 Then
            CartView.Delete(0)
        End If
        CartView.RowFilter = ""

        'add new entry
        Dim dr As DataRow = Cart.NewRow()
        dr(0) = qty
        dr(1) = item
        dr(2) = price
        Cart.Rows.Add(dr)

        MyDataGrid.EditItemIndex = -1
        BindGrid
    End Sub

    Sub BindGrid()
        MyDataGrid.DataSource = CartView
        MyDataGrid.DataBind
    End Sub

</script>

<body style="font: 10pt verdana">

  <form runat="server">

    <h3><font face="Verdana">Using an Edit Command Column in DataGrid</font></h3>

    <asp:DataGrid id="MyDataGrid" runat="server"
        BorderColor="black"
        BorderWidth="1"
        CellPadding="3"
        Font-Name="Verdana"
        Font-Size="8pt"
        HeaderStyle-BackColor="#aaaadd"
        OnEditCommand="MyDataGrid_Edit"
        OnCancelCommand="MyDataGrid_Cancel"
        OnUpdateCommand="MyDataGrid_Update"
        AutoGenerateColumns="false"
        >

        <Columns>
            <asp:EditCommandColumn
                EditText="Edit"
                CancelText="Cancel"
                UpdateText="Update"
                ItemStyle-Wrap="false"
                HeaderText="Edit Command Column"
                HeaderStyle-Wrap="false"
                />
            <asp:BoundColumn HeaderText="Item" ReadOnly="true" DataField="Item"/>
            <asp:BoundColumn HeaderText="Quantity" DataField="Qty"/>
            <asp:BoundColumn HeaderText="Price" DataField="Price"/>
        </Columns>
    </asp:DataGrid>

  </form>

</body>
</html>
