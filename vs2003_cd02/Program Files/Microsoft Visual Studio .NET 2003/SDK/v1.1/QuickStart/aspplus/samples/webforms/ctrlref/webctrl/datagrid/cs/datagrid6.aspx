<%@ Import Namespace="System.Data" %>

<html>

<script language="C#" runat="server">

    DataTable Cart;
    DataView CartView;

    void Page_Load(Object sender, EventArgs e) {
        if (Session["DG6_ShoppingCart"] == null)     {
            Cart = new DataTable();
            Cart.Columns.Add(new DataColumn("Qty", typeof(string)));
            Cart.Columns.Add(new DataColumn("Item", typeof(string)));
            Cart.Columns.Add(new DataColumn("Price", typeof(string)));
            Session["DG6_ShoppingCart"] = Cart;

            // first load -- prepopulate with some data
            for (int i=1; i<5; i++) {
                DataRow dr = Cart.NewRow();
                dr[0] = ((int)(i%2)+1).ToString();
                dr[1] = "Item " + i.ToString();
                dr[2] = ((double)(1.23 * (i+1))).ToString();
                Cart.Rows.Add(dr);
            }
        }
        else {
            Cart = (DataTable)Session["DG6_ShoppingCart"];
        }

        CartView = new DataView(Cart);
        CartView.Sort = "Item";
        if (!IsPostBack) {
            BindGrid();
        }
    }

    public void MyDataGrid_Edit(Object sender, DataGridCommandEventArgs e) {
        MyDataGrid.EditItemIndex = (int)e.Item.ItemIndex;
        BindGrid();
    }

    public void MyDataGrid_Cancel(Object sender, DataGridCommandEventArgs e) {
        MyDataGrid.EditItemIndex = -1;
        BindGrid();
    }

    public void MyDataGrid_Update(Object sender, DataGridCommandEventArgs e) {
        // For bound columns the edited value is stored in a textbox,
        // and the textbox is the 0th element in the column's cell
        string item = e.Item.Cells[1].Text;
        string qty = ((System.Web.UI.WebControls.TextBox)
            e.Item.Cells[2].Controls[0]).Text;
        string price = ((System.Web.UI.WebControls.TextBox)
            e.Item.Cells[3].Controls[0]).Text;

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
        DataRow dr = Cart.NewRow();
        dr[0] = qty;
        dr[1] = item;
        dr[2] = price;
        Cart.Rows.Add(dr);

        MyDataGrid.EditItemIndex = -1;
        BindGrid();
    }

    public void BindGrid() {
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
