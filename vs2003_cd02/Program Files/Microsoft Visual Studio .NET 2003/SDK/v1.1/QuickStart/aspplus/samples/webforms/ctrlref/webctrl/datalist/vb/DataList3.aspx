<%@ Import Namespace="System.Data" %>

<html>
<head>

    <script language="VB" runat="server">

    Dim Cart As DataTable
    Dim CartView As DataView

    Sub Page_Load(sender As Object, e As EventArgs)

        Dim dr As DataRow
        Dim I As Integer

        If Session("DL3VB_ShoppingCart") Is Nothing Then

            Cart = New DataTable()
            Cart.Columns.Add(new DataColumn("Qty", GetType(String)))
            Cart.Columns.Add(new DataColumn("Item", GetType(String)))
            Cart.Columns.Add(new DataColumn("Price", GetType(String)))
            Session("DL3VB_ShoppingCart") = Cart

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
            Cart = Session("DL3VB_ShoppingCart")
        End If

        CartView = New DataView(Cart)
        CartView.Sort="Item"
        If Not IsPostBack Then
            ' need to load this data only once
            BindList
        End If

    End Sub

    Sub BindList()
        DataList1.DataSource= CartView
        DataList1.DataBind
    End Sub

    Sub DataList_EditCommand(sender As Object, e As DataListCommandEventArgs)
        DataList1.EditItemIndex = e.Item.ItemIndex
        BindList
    End Sub

    Sub DataList_CancelCommand(sender As Object, e As DataListCommandEventArgs)
        DataList1.EditItemIndex = -1
        BindList
    End Sub

    Sub DataList_UpdateCommand(sender As Object, e As DataListCommandEventArgs)
        Dim itemLabel As System.Web.UI.WebControls.Label = e.Item.FindControl("Label1")
        Dim qtyText As System.Web.UI.WebControls.TextBox = e.Item.FindControl("Text1")
        Dim priceText As System.Web.UI.WebControls.TextBox = e.Item.FindControl("Text2")

        Dim item As String = itemLabel.Text
        Dim qty As String = qtyText.Text
        Dim price As String = priceText.Text

        ' with a database, we'd use an update command.  Since we're using an in-memory
        ' DataTable, we'll delete the old row and replace it with a new one
        'remove old entry
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

        DataList1.EditItemIndex = -1
        BindList
    End Sub

    </script>

</head>
<body>

    <h3><font face="Verdana">Editing DataList Items</font></h3>
    <p></p>

    <form runat=server>
    <font face="Verdana" size="-1">

        <asp:DataList id="DataList1" runat="server"
            BorderColor="black"
            BorderWidth="1"
            GridLines="Both"
            CellPadding="3"
            CellSpacing="0"
            Font-Name="Verdana"
            Font-Size="8pt"
            Width="150px"
            HeaderStyle-BackColor="#aaaadd"
            AlternatingItemStyle-BackColor="Gainsboro"
            EditItemStyle-BackColor="lightgreen"
            OnEditCommand="DataList_EditCommand"
            OnUpdateCommand="DataList_UpdateCommand"
            OnCancelCommand="DataList_CancelCommand"
            >
              <HeaderTemplate>
                Items
              </HeaderTemplate>
              <ItemTemplate>
                <asp:LinkButton id="button1" runat="server" Text="Edit" CommandName="edit" />
                <%# DataBinder.Eval(Container.DataItem, "Item")  %>
              </ItemTemplate>
              <EditItemTemplate>
                Item:
                <asp:Label id="Label1" runat="server" 
                    Text='<%# DataBinder.Eval(Container.DataItem, "Item")  %>' />
                <br>
                Quantity:
                <asp:TextBox id="Text1" runat="server" 
                    Text='<%# DataBinder.Eval(Container.DataItem, "Qty")  %>' />
                <br>
                Price:
                <asp:TextBox id="Text2" runat="server" 
                    Text='<%# DataBinder.Eval(Container.DataItem, "Price") %>' />
                <br>
                <asp:LinkButton id="button2" runat="server" Text="Update" 
                    CommandName="update" />
                <asp:LinkButton id="button3" runat="server" Text="Cancel" 
                    CommandName="cancel" />
              </EditItemTemplate>

        </asp:DataList>

    </font>
    </form>

</body>
</html>


