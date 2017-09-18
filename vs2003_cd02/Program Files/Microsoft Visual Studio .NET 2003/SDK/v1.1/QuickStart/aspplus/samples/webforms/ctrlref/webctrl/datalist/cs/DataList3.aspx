<%@ Import Namespace="System.Data" %>

<html>
<head>

    <script language="C#" runat="server">

    public DataTable Cart;
    public DataView CartView;

    void Page_Load(Object Sender, EventArgs E) {
        if (Session["DL3_ShoppingCart"] == null) {
            Cart = new DataTable();
            Cart.Columns.Add(new DataColumn("Qty", typeof(string)));
            Cart.Columns.Add(new DataColumn("Item", typeof(string)));
            Cart.Columns.Add(new DataColumn("Price", typeof(string)));
            Session["DL3_ShoppingCart"] = Cart;

            // first load -- prepopulate with some data
            for (int i=1; i<5; i++) {
                DataRow dr = Cart.NewRow();
                dr[0] = ((int)((i%2)+1)).ToString();
                dr[1] = "Item " + i.ToString();
                dr[2] = ((double)(1.23 * (i+1))).ToString();
                Cart.Rows.Add(dr);
            }
        }
        else
            Cart = (DataTable)Session["DL3_ShoppingCart"];

        CartView = new DataView(Cart);
        CartView.Sort = "Item";
        if (!IsPostBack)
            BindList();
    }

    void BindList() {
        DataList1.DataSource= CartView;
        DataList1.DataBind();
    }

    void DataList_EditCommand(Object Sender, DataListCommandEventArgs e) {
        DataList1.EditItemIndex = (int)e.Item.ItemIndex;
        BindList();
    }

    protected void DataList_CancelCommand(Object Sender, DataListCommandEventArgs e) {
        DataList1.EditItemIndex = -1;
        BindList();
    }

    protected void DataList_UpdateCommand(Object Sender, DataListCommandEventArgs e) {
        string item = ((System.Web.UI.WebControls.Label)e.Item.FindControl("Label1")).Text;
        string qty = ((System.Web.UI.WebControls.TextBox)e.Item.FindControl("Text1")).Text;
        string price = ((System.Web.UI.WebControls.TextBox)e.Item.FindControl("Text2")).Text;

        // with a database, we'd use an update command.  Since we're using an in-memory
        // DataTable, we'll delete the old row and replace it with a new one
        //remove old entry
        CartView.RowFilter = "Item='"+item+"'";
        if (CartView.Count > 0) //item exists in cart
            CartView.Delete(0);
        CartView.RowFilter = "";

        //add new entry
        DataRow dr = Cart.NewRow();
        dr[0] = qty;
        dr[1] = item;
        dr[2] = price;
        Cart.Rows.Add(dr);

        DataList1.EditItemIndex = -1;
        BindList();
    }

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
                <%# DataBinder.Eval(Container.DataItem, "Item") %>
              </ItemTemplate>
              <EditItemTemplate>
                Item:
                <asp:Label id="Label1" runat="server" 
                    Text='<%# DataBinder.Eval(Container.DataItem, "Item") %>' />
                <br>
                Quantity:
                <asp:TextBox id="Text1" runat="server" 
                    Text='<%# DataBinder.Eval(Container.DataItem, "Qty") %>' />
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


