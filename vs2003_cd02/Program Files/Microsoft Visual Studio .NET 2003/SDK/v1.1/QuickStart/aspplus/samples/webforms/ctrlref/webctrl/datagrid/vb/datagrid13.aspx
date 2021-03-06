<%@ Import Namespace="System.Data" %>

<html>
<script language="VB" runat="server">

    Dim CartView As DataView
    Dim runningTotal As Double = 0

    'Cart is a property on the Page
    ReadOnly Property Cart As DataTable
        Get
            Dim tmpCart As DataTable
            Dim i As Integer
            Dim dr As DataRow

            If Session("DG_ShoppingCart") Is Nothing Then
                tmpCart = new DataTable()
                tmpCart.Columns.Add(new DataColumn("Qty", GetType(String)))
                tmpCart.Columns.Add(new DataColumn("Product", GetType(String)))
                tmpCart.Columns.Add(new DataColumn("Price", GetType(Double)))
                tmpCart.Columns.Add(new DataColumn("GiftWrap", GetType(Boolean)))
                Session("DG_ShoppingCart") = tmpCart

                ' first load -- prepopulate with some data
                For i= 1 to 6
                    dr = tmpCart.NewRow()
                    dr(0) = "1"
                    dr(1) = "Product " & i.ToString
                    dr(2) = 1.23 * (i+1)
                    dr(3) = false
                    tmpCart.Rows.Add(dr)
                Next
                Return tmpCart
            Else
                Return Session("DG_ShoppingCart")
            End If
        End Get
    End Property

    'Sub Page_Init(sender As Object, e As EventArgs)
    '    MyDataGrid.EnableViewState = true
    'End Sub

    Sub Page_Load(sender As Object, e As EventArgs)
        CartView = Cart.DefaultView
        If Not IsPostBack Then
            BindGrid
        End If
    End Sub

    Sub BindGrid()
        MyDataGrid.DataSource = CartView
        MyDataGrid.DataBind()
    End Sub

    Sub btnUpdate_click(sender As Object, e As EventArgs)
        Dim i As Integer
        Dim _item As DataGridItem
        Dim dr As DataRow

        For i = 0 To MyDataGrid.Items.Count - 1

            _item = MyDataGrid.Items(i)
            Dim qtyTextBox As System.Web.UI.WebControls.TextBox= _item.FindControl("txtQty")
            Dim giftCheckBox As CheckBox = _item.FindControl("chkGIft")

            ' with a database, we'd use an update command.
            ' since this is an in-memory datatable, we'll just change the in-memory row.
            dr = Cart.Rows(i)
            dr(0) = qtyTextBox.Text
            dr(3) = giftCheckBox.Checked
        Next
        BindGrid
    End Sub


    Function CalcTotal (count As Integer, price As Double) As Double
        Dim total As Double

        total = count * price
        runningTotal += total

        CalcTotal = total
    End Function

</script>

<body>

    <h3><font face="Verdana">Custom Editing with DataGrid</font></h3>

    <form runat=server>

      <ASP:DataGrid id="MyDataGrid" runat="server"
        BorderColor="black"
        BorderWidth="1"
        GridLines="none"
        CellPadding="4"
        Font-Name="Verdana"
        Font-Size="8pt"
        HeaderStyle-BackColor="#aaaadd"
        AutoGenerateColumns="false"
      >
          <Columns>
            <asp:TemplateColumn HeaderText="Quantity">
                <ItemTemplate>
                    <asp:TextBox id=txtQty runat="server"
                        Text='<%# DataBinder.Eval(Container.DataItem, "Qty") %>'
                        Width="40px"
                        />
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:BoundColumn HeaderText="Product" DataField="Product"/>
            <asp:BoundColumn HeaderText="Price" DataField="Price" DataFormatString="{0:c}" />
            <asp:TemplateColumn HeaderText="GIft Wrap?">
                <ItemTemplate>
                    <center>
                    <asp:CheckBox id=chkGIft runat="server"
                        Checked='<%# DataBinder.Eval(Container.DataItem, "GiftWrap") %>'
                        />
                    </center>
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="SubTotal">
                <ItemTemplate>
                    <p align="right">
                    <asp:Label runat="server"
                        Text='<%# System.String.Format("{0:c}", _
                            CalcTotal(Int32.Parse(DataBinder.Eval(Container.DataItem, "Qty")), _
                            DataBinder.Eval(Container.DataItem, "Price"))) %>'
                        />
                    </p>
                </ItemTemplate>
                <FooterTemplate>
                    <p align="right"><b>
                    <asp:Label runat="server"
                        Text='<%# System.String.Format("{0:c}", runningTotal) %>'
                        />
                    </b></p>
                </FooterTemplate>

            </asp:TemplateColumn>
          </Columns>

      </asp:DataGrid>

    <asp:LinkButton id=btnUpdate runat="server"
        Text="Update Totals"
        Font-Name="Verdana"
        Font-Size="8pt"
        onClick="btnUpdate_click"
        />

  </form>

</body>
</html>
