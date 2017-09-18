<%@ Import Namespace="System.Data" %>

<html>

<script language="JScript" runat="server">

    var Cart:DataTable;
    var CartView:DataView;

    function Page_Load(sender:Object, e:EventArgs) : void {
        if (Session["DG6_ShoppingCart"] == null)     {
            Cart = new DataTable();
            Cart.Columns.Add(new DataColumn("Qty", Type.GetType("System.String,mscorlib")));
            Cart.Columns.Add(new DataColumn("Item", Type.GetType("System.String,mscorlib")));
            Cart.Columns.Add(new DataColumn("Price", Type.GetType("System.String,mscorlib")));
            Session["DG6_ShoppingCart"] = Cart;

            // first load -- prepopulate with some data
            for (var i:int=1; i<5; i++) {
                var dr:DataRow = Cart.NewRow();
                dr[0] = Int32((i%2)+1).ToString();
                dr[1] = "Item " + i.ToString();
                dr[2] = Double(1.23 * (i+1)).ToString();
                Cart.Rows.Add(dr);
            }
        }
        else {
            Cart = DataTable(Session["DG6_ShoppingCart"]);
        }

        CartView = new DataView(Cart);
        CartView.Sort = "Item";
        if (!IsPostBack) {
            BindGrid();
        }
    }

    public function MyDataGrid_Edit(sender:Object, e:DataGridCommandEventArgs) : void {
        MyDataGrid.EditItemIndex = Int32(e.Item.ItemIndex);
        BindGrid();
    }

    public function MyDataGrid_Cancel(sender:Object, e:DataGridCommandEventArgs) : void {
        MyDataGrid.EditItemIndex = -1;
        BindGrid();
    }

    public function MyDataGrid_Update(sender:Object, e:DataGridCommandEventArgs) : void {
        // For bound columns the edited value is stored in a textbox,
        // and the textbox is the 0th element in the column's cell
        var item:String = e.Item.Cells[1].Text;
        var qty:String = TextBox(e.Item.Cells[2].Controls[0]).Text;
        var price:String = TextBox(e.Item.Cells[3].Controls[0]).Text;

        // with a database, we'd use an update command.  Since we're using an in-memory
        // DataTable, we'll delete the old row and replace it with a new one
        //remove old entry
        CartView.RowFilter = "Item='"+item+"'";
        if (CartView.Count > 0) {
            //item exists in cart
            CartView.Delete(0);
        }
        CartView.RowFilter = "";

        //add new entry
        var dr:DataRow = Cart.NewRow();
        dr[0] = qty;
        dr[1] = item;
        dr[2] = price;
        Cart.Rows.Add(dr);

        MyDataGrid.EditItemIndex = -1;
        BindGrid();
    }

    public function BindGrid() : void {
        MyDataGrid.DataSource = CartView;
        MyDataGrid.DataBind();
    }

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
