<%@ Import Namespace="System.Data" %>

<html>
<script language="C#" runat="server">

    DataTable Cart;
    DataView CartView;

    ICollection CreateDataSource() {
        DataTable dt = new DataTable();
        DataRow dr;

        dt.Columns.Add(new DataColumn("IntegerValue", typeof(Int32)));
        dt.Columns.Add(new DataColumn("StringValue", typeof(string)));
        dt.Columns.Add(new DataColumn("DateTimeValue", typeof(DateTime)));
        dt.Columns.Add(new DataColumn("BoolValue", typeof(bool)));
        dt.Columns.Add(new DataColumn("CurrencyValue", typeof(double)));

        for (int i = 0; i < 9; i++) {
            dr = dt.NewRow();
            dr[0] = i;
            dr[1] = "Item " + i.ToString();
            dr[2] = DateTime.Now;
            dr[3] = (i % 2 != 0) ? true : false;
            dr[4] = 1.23 * (i+1);

            dt.Rows.Add(dr);
        }

        DataView dv = new DataView(dt);
        return dv;
    }

    void Page_Load(Object sender, EventArgs e) {
    
        if (Session["DG4_ShoppingCart"] == null) {
            Cart = new DataTable();
            Cart.Columns.Add(new DataColumn("Item", typeof(string)));
            Cart.Columns.Add(new DataColumn("Price", typeof(string)));
            Session["DG4_ShoppingCart"] = Cart;
        }
        else {
            Cart = (DataTable)Session["DG4_ShoppingCart"];
        }    
        CartView = new DataView(Cart);
        ShoppingCart.DataSource = CartView;
        ShoppingCart.DataBind();

        if (!IsPostBack) {
            // need to load this data only once
            MyDataGrid.DataSource= CreateDataSource();
            MyDataGrid.DataBind();
        }
    }

    void Grid_CartCommand(Object sender, DataGridCommandEventArgs e) {
    
        DataRow dr = Cart.NewRow();
        
        // e.Item is the row of the table where the command fired
        // For bound columns the value is stored in the Text property of TableCell
        TableCell itemCell = e.Item.Cells[2];
        TableCell priceCell = e.Item.Cells[3];
        string item = itemCell.Text;
        string price = priceCell.Text;
        
        if (((LinkButton)e.CommandSource).CommandName == "AddToCart") {
            dr[0] = item;
            dr[1] = price;
            Cart.Rows.Add(dr);
        }
        else {   //Remove from Cart
        
            CartView.RowFilter = "Item='"+item+"'";
            if (CartView.Count > 0) {    
                CartView.Delete(0);
            }
            CartView.RowFilter = "";
        }
        ShoppingCart.DataBind();

    }


</script>

<body>

    <h3><font face="Verdana">Using a ButtonColumn in DataGrid</font></h3>

    <form runat=server>

    <table cellpadding="5">
    <tr valign="top"><td>

    <b>Product List</b>
    <ASP:DataGrid id="MyDataGrid" runat="server"
        BorderColor="black"
        BorderWidth="1"
        CellPadding="3"
        Font-Name="Verdana"
        Font-Size="8pt"
        HeaderStyle-BackColor="#aaaadd"
        AutoGenerateColumns="false"
        OnItemCommand="Grid_CartCommand"
        >
        <Columns>
            <asp:ButtonColumn HeaderText="Add to cart" Text="Add" CommandName="AddToCart" />
            <asp:ButtonColumn HeaderText="Remove from cart" Text="Remove" CommandName="RemoveFromCart" />
            <asp:BoundColumn HeaderText="Item" DataField="StringValue"/>
            <asp:BoundColumn HeaderText="Price" DataField="CurrencyValue" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="right" />
            <asp:BoundColumn HeaderText="Assembly required?" DataField="BoolValue"/>
        </Columns>
    </asp:DataGrid>

    </td><td>

    <b>Shopping Cart</b>
    <ASP:DataGrid id="ShoppingCart" runat="server"
        BorderColor="black"
        BorderWidth="1"
        GridLines="Both"
        ShowFooter="false"
        CellPadding="3"
        CellSpacing="0"
        Font-Name="Verdana"
        Font-Size="8pt"
        HeaderStyle-BackColor="#aaaadd"
        />

    </td></tr>
    </table>

  </form>

</body>
</html>
