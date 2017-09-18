<%@ Import Namespace="System.Data" %>

<html>
<script language="C#" runat="server">

    DataView CartView;
    Double runningTotal = 0;
    
    //Cart is a property on the Page    
    DataTable Cart {
        get {
            if (Session["DGC_ShoppingCart"] == null) {
                DataTable tmpCart = new DataTable();
                tmpCart.Columns.Add(new DataColumn("Qty", typeof(string)));
                tmpCart.Columns.Add(new DataColumn("Product", typeof(string)));
                tmpCart.Columns.Add(new DataColumn("Price", typeof(Double)));
                tmpCart.Columns.Add(new DataColumn("GiftWrap", typeof(bool)));
                Session["DGC_ShoppingCart"] = tmpCart;

                // first load -- prepopulate with some data
                for (int i=1; i<=6; i++) {
                    DataRow dr = tmpCart.NewRow();
                    dr[0] = "1";
                    dr[1] = "Product " + i.ToString();
                    dr[2] = 1.23 * (i+1);
                    dr[3] = false;
                    tmpCart.Rows.Add(dr);
                }
                return tmpCart;
            }
            else
                return (DataTable)Session["DGC_ShoppingCart"];
        }    
    }

    void Page_Init(Object sender, EventArgs e) {
        MyDataGrid.EnableViewState=true;
    }

    void Page_Load(Object sender, EventArgs e) {
        CartView = Cart.DefaultView;
        if (!IsPostBack)
            BindGrid();
    }

    void BindGrid() {
        MyDataGrid.DataSource = CartView;
        MyDataGrid.DataBind();
    }

    void btnUpdate_click(Object sender, EventArgs e) {
    
        for (int i=0; i<MyDataGrid.Items.Count; i++) {
    
            DataGridItem _item = MyDataGrid.Items[i];
            System.Web.UI.WebControls.TextBox qtyTextBox = 
                (System.Web.UI.WebControls.TextBox)_item.FindControl("txtQty");
            CheckBox giftCheckBox = (CheckBox)_item.FindControl("chkGift");

            // with a database, we'd use an update command.  
            // since this is an in-memory datatable, we'll just change the in-memory row.
            DataRow dr = Cart.Rows[i];
            dr[0] = qtyTextBox.Text;
            dr[3] = giftCheckBox.Checked;
        }
        BindGrid();
    }


    Double CalcTotal (int count, Double price) {
        Double total = count * price;
        runningTotal += total;
        
        return(total);
    }
    
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
                        Text='<%# DataBinder.Eval(Container, "DataItem.Qty") %>'
                        Width="40px"
                        />
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:BoundColumn HeaderText="Product" DataField="Product"/>
            <asp:BoundColumn HeaderText="Price" DataField="Price" 
                DataFormatString="{0:c}" />
            <asp:TemplateColumn HeaderText="Gift Wrap?">
                <ItemTemplate>
                    <center>
                    <asp:CheckBox id=chkGift runat="server" 
                        Checked='<%# (bool)(((DataRowView)Container.DataItem)["GiftWrap"]) %>' 
                        />
                    </center>    
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="SubTotal">
                <ItemTemplate>
                    <p align="right">
                    <asp:Label runat="server"
                        Text='<%# String.Format("{0:c}",CalcTotal((Int32.Parse((string)
                            (((DataRowView)Container.DataItem)["Qty"]))),((Double)
                            (((DataRowView)Container.DataItem)["Price"])))) %>'
                        />
                    </p>
                </ItemTemplate>
                <FooterTemplate>
                    <p align="right"><b>
                    <asp:Label runat="server"
                        Text='<%# String.Format("{0:c}", runningTotal) %></b>'
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
