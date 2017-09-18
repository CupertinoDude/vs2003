<%@ Import Namespace="System.Data" %>

<html>
<script language="JScript" runat="server">

    var CartView:DataView;
    var runningTotal:Double = 0;

    //Cart is a property on the Page
    public function get Cart() : DataTable {
            if (Session["DGC_ShoppingCart"] == null) {
                var tmpCart:DataTable = new DataTable();
                tmpCart.Columns.Add(new DataColumn("Qty", Type.GetType("System.String,mscorlib")));
                tmpCart.Columns.Add(new DataColumn("Product", Type.GetType("System.String,mscorlib")));
                tmpCart.Columns.Add(new DataColumn("Price", Type.GetType("System.Double,mscorlib")));
                tmpCart.Columns.Add(new DataColumn("GiftWrap", Type.GetType("System.Boolean,mscorlib")));
                Session["DGC_ShoppingCart"] = tmpCart;

                // first load -- prepopulate with some data
                for (var i:int=1; i<=6; i++) {
                    var dr:DataRow = tmpCart.NewRow();
                    dr[0] = "1";
                    dr[1] = "Product " + i.ToString();
                    dr[2] = 1.23 * (i+1);
                    dr[3] = false;
                    tmpCart.Rows.Add(dr);
                }
                return tmpCart;
            }
            else
                return DataTable(Session["DGC_ShoppingCart"]);
    }

    function Page_Init(sender:Object, e:EventArgs) : void {
        MyDataGrid.EnableViewState=true;
    }

    function Page_Load(sender:Object, e:EventArgs) : void {
        CartView = Cart.DefaultView;
        if (!IsPostBack)
            BindGrid();
    }

    function BindGrid() : void {
        MyDataGrid.DataSource = CartView;
        MyDataGrid.DataBind();
    }

    function btnUpdate_click(sender:Object, e:EventArgs) : void {

        for (var i:int=0; i<MyDataGrid.Items.Count; i++) {

            var _item:DataGridItem = MyDataGrid.Items[i];
            var qtyTextBox:TextBox = TextBox(_item.FindControl("txtQty"));
            var giftCheckBox:CheckBox = CheckBox(_item.FindControl("chkGift"));

            // with a database, we'd use an update command.
            // since this is an in-memory datatable, we'll just change the in-memory row.
            var dr:DataRow = Cart.Rows[i];
            dr[0] = qtyTextBox.Text;
            dr[3] = giftCheckBox.Checked;
        }
        BindGrid();
    }


    function CalcTotal (count:int, price:Double) : Double {
        var total:Double = count * price;
        runningTotal += total;

        return total;
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
            <asp:BoundColumn HeaderText="Price" DataField="Price" DataFormatString="{0:c}" />
            <asp:TemplateColumn HeaderText="Gift Wrap?">
                <ItemTemplate>
                    <center>
                    <asp:CheckBox id=chkGift runat="server"
                        Checked='<%# Boolean(DataBinder.Eval(Container.DataItem, "GiftWrap")) %>'
                        />
                    </center>
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="SubTotal">
                <ItemTemplate>
                    <p align="right">
                    <asp:Label runat="server"
                        Text='<%# String.Format("{0:c}",CalcTotal(Int32.Parse(String(DataBinder.Eval(Container.DataItem, "Qty"))),Double(DataBinder.Eval(Container.DataItem, "Price")))) %>'
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
