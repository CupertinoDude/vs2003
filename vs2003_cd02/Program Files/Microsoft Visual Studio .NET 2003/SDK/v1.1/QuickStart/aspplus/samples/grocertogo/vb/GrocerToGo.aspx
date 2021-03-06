<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Market" %>

<html>
<head>
    <title>GrocerToGo</title>
    <link rel="stylesheet"href="grocerstyle.css">

    <style>
        div.details { background-color:ffffcc; padding-top:15; padding-bottom:20; }
        div.details table { width:375; }
        div.details table td { font-family:Verdana; font-size:8pt; }
    </style>

    <script language="VB" runat=server>

        public Sub Page_Load(sender As Object, e As EventArgs)

           if (Not IsPostBack) Then

              ProductListing.SelectedIndex = 0

              UpdateProducts()
              UpdateShoppingCart()
           End If
        End Sub


        public Sub CategoryList_Select(sender As Object, e As EventArgs)
           CurrentCategory.Text = CategoryList.Items(CategoryList.SelectedIndex).Text
           UpdateProducts()
        End Sub


        public Sub ProductListing_Select(sender As Object, e As EventArgs)
           UpdateProducts()
        End Sub


        public Sub AddBtn_Click(sender As Object, e As ImageClickEventArgs)
           Dim productID As Integer
           productID = Int32.Parse(ProductListing.DataKeys(ProductListing.SelectedIndex).ToString())

           Dim market As InventoryDB
           market = new InventoryDB()

           Dim product As DataRow
           product = market.GetProduct(productID)

           Dim shoppingCart As Market.OrderList
           shoppingCart = Ctype(Session("ShoppingCart"), Market.OrderList)

           shoppingCart.Add(new Market.OrderItem(productID, CStr(product("ProductName")), Double.Parse(product("UnitPrice").ToString()), 1))

           UpdateShoppingCart()
        End Sub


        public Sub Recalculate_Click(sender As Object, e As ImageClickEventArgs)

           ' Obtain Shopping Cart From Session State

           Dim shoppingCart As Market.OrderList
           shoppingCart = Ctype(Session("ShoppingCart"), Market.OrderList)

           ' Iterate over items in shopping cart (update cart with current row qty textbox value

           Dim i As Integer
           Dim qty As HtmlInputText

           for i = 0 To ShoppingCartList.Items.Count - 1
              qty = Ctype(ShoppingCartList.Items(i).FindControl("Qty"), HtmlInputText)
              Try
                shoppingCart(CStr(ShoppingCartList.DataKeys(i))).Quantity = CInt(qty.Value)
              Catch exc As Exception
              End Try
           Next i

           UpdateShoppingCart()
        End Sub


        public Sub ClearCart_Click(sender As Object, e As ImageClickEventArgs)

           ' Obtain access to Shopping Cart From Session State

           Dim shoppingCart As Market.OrderList
           shoppingCart = Ctype(Session("ShoppingCart"), Market.OrderList)

           ' Clear Items From Shopping Cart and then Update UI

           shoppingCart.ClearCart()
           UpdateShoppingCart()
        End Sub

        Sub UpdateProducts()

           Dim market As New InventoryDB

           ' Update Product Listing at Bottom of Page

           Dim categoryID As Integer
           categoryID = Int32.Parse(CategoryList.Items(CategoryList.SelectedIndex).Value)
           ProductListing.DataSource = market.GetProducts(categoryID).DefaultView
           ProductListing.DataBind()

           ' Update Product Information

           Dim productID As Integer
           productID = Int32.Parse(ProductListing.DataKeys(ProductListing.SelectedIndex).ToString())

           Dim product As DataRow
           product = market.GetProduct(productID)

           Name.Text = product("ProductName").ToString()
           SelectedProdPicture.Src = product("ImagePath").ToString()
           ServingSize.Text = product("ServingSize").ToString()
           Servings.Text = product("Servings").ToString()

           ' Update Product Calory Information

           DetailsListing.DataSource = market.GetProductCalories(productID).DefaultView
           DetailsListing.DataBind()
        End Sub

        Sub UpdateShoppingCart()

           ' Update Shopping Cart UI from Basket Stored in Session State

           Dim shoppingCart As Market.OrderList
           shoppingCart = Ctype(Session("ShoppingCart"), Market.OrderList)

           SubTotal.Text = System.String.Format("{0:C}", shoppingCart.SubTotal)
           Tax.Text = System.String.Format("{0:C}", shoppingCart.Tax)
           Total.Text = System.String.Format("{0:C}", shoppingCart.Total)

           ShoppingCartList.DataSource = shoppingCart.Values
           ShoppingCartList.DataBind()
        End Sub

    </script>

</head>
<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">

    <form runat="server">

        <table cellspacing=0 cellpadding=3 bgcolor="DC6035" border=0 width="100%">
            <tr>
                <td align="left"><img src="images/logo.gif"></td>
                <td align="right">
                    <a><img border=0 src="images/home.gif"></a>
                </td>
            </tr>
            <tr>
                <td align="right" class="select" colspan="2">

                    <b>Select Category: &nbsp;</b>

                    <select id="CategoryList" style="width:75" runat="server">
                        <option selected value="1">Milk</option>
                        <option value="2">Cereal</option>
                        <option value="3">Soda</option>
                    </select>

                    <asp:button text="Select" OnClick="CategoryList_Select" runat=server/>

                </td>
            </tr>
        </table>

        <table border=0 width=100% cellspacing=0 cellpadding=15 bgcolor="ffffcc">
            <tr>

                <td valign=top bgcolor=ffffcc>

                    <p>

                    <h3>
                        <b>Product Category: <asp:label id="CurrentCategory" runat=server>Milk</asp:label><b>
                    </h3>

                    <table width="100%" cellpadding=0 cellspacing=0 >
                        <tr style="padding-left:12" >
                            <td align="center" style="border-style:inset;" bgcolor="EDBE7B" width=140>
                                <img id="SelectedProdPicture" runat=server>
                            </td>
                            <td align="center" bgcolor="ffffcc" style="padding-right:0;">

                            <div class="details">

                               <table cellpadding=1 >
                                  <tr>
                                     <td colspan=3>
                                        <b><font face="Verdana" size=3><asp:label id="Name" runat=server> </asp:label></font></b>
                                     </td>
                                     <td align=right>
                                        <asp:imagebutton ImageUrl="images/addcart.gif" OnClick="AddBtn_Click" runat=server/>
                                     </td>
                                  </tr>
                                  <tr>
                                     <td colspan=4 >
                                        Serving Size <asp:label id="ServingSize" runat=server>  </asp:label>
                                     </td>
                                  </tr>
                                  <tr>
                                     <td colspan=4>
                                        Servings Per Container <asp:label id="Servings" runat=server> </asp:label>
                                     </td>
                                  </tr>
                                  <tr>
                                     <td height=5 colspan=4 bgcolor="000000"></td>
                                  </tr>
                                </table>

                                <asp:repeater id="DetailsListing"  runat="server">

                                    <ItemTemplate>
                                       <table cellpadding=0>
                                          <tr>
                                             <td colspan=3>
                                                <b><%# DataBinder.Eval(Container.DataItem, "Name") %></b>
                                                <%# DataBinder.Eval(Container.DataItem, "Grams") %>
                                             </td>
                                             <td align=right>
                                                <b><%# DataBinder.Eval(Container.DataItem, "Percent") %>%</b>
                                             </td>
                                          </tr>
                                       </table>
                                    </ItemTemplate>

                                    <SeparatorTemplate>
                                       <table cellpadding=0 >
                                         <tr>
                                            <td colspan=4 height=1 bgcolor="000000"></td>
                                         </tr>
                                       </table>
                                    </SeparatorTemplate>

                                    <FooterTemplate>
                                       <table cellpadding=0 >
                                          <tr>
                                             <td colspan=4 height=5 bgcolor="000000"></td>
                                          </tr>
                                       </table>
                                    </FooterTemplate>

                                </asp:repeater>

                               </div>
                            </td>
                        </tr>
                    </table>

                    <p>

                    <table>
                        <tr>
                            <td class="products">

                                <asp:datalist id="ProductListing" DataKeyField="ProductID" showheader=false showfooter=false OnSelectedIndexChanged="ProductListing_Select" repeatdirection="horizontal" borderwidth=0 runat="server">

                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td width="150">

                                                    <asp:imagebutton borderwidth=6 bordercolor="#ffffcc" commandname="Select" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "ImagePath") %>' runat=server/>

                                                    <p>

                                                    <%# DataBinder.Eval(Container.DataItem, "ProductName") %> <br>
                                                    <%# DataBinder.Eval(Container.DataItem, "UnitPrice", "{0:C}") %><br>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>

                                    <SelectedItemTemplate>
                                        <table>
                                            <tr>
                                                <td width="150">

                                                    <asp:imagebutton borderwidth=6 bordercolor="red" commandname="select" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "ImagePath") %>' runat=server/>

                                                    <p>

                                                    <%# DataBinder.Eval(Container.DataItem, "ProductName") %><br>
                                                    <%# DataBinder.Eval(Container.DataItem, "UnitPrice", "{0:C}") %><br>
                                                </td>
                                            </tr>
                                        </table>
                                    </SelectedItemTemplate>

                                </asp:datalist>

                            </td>
                        </tr>
                    </table>

                </td>

                <td width="315" valign=top class="cart" bgcolor="#EDBE7B">

                      <h3>Your Shopping Cart</h3>

                                <asp:datalist id="ShoppingCartList" DataKeyField="Name" borderwidth=0 runat="server">

                                    <HeaderTemplate>

                                       <table width="100%">
                                          <tr>
                                             <td width=35>
                                                <b>Qty</b>
                                             </td>
                                             <td width=175>
                                                <b>Product</b>
                                             </td>
                                             <td width=50>
                                                <b>Price</b>
                                             </td>
                                             <td align="right" style="padding-right:10">
                                                <b>Total</b>
                                             </td>
                                          </tr>

                                    </HeaderTemplate>

                                    <ItemTemplate>

                                          <tr>
                                             <td width=35>
                                                <input type=text size=1 id="Qty" runat=server value='<%# DataBinder.Eval(Container.DataItem, "Quantity") %>'>
                                             </td>
                                             <td width=175>
                                                 <%# DataBinder.Eval(Container.DataItem, "Name") %>
                                             </td>
                                             <td width=50>
                                                 <%# DataBinder.Eval(Container.DataItem, "Price", "{0:C}") %>
                                             </td>
                                             <td align=right style="padding-right:10">
                                                 <%# DataBinder.Eval(Container.DataItem, "Total", "{0:C}") %>
                                             </td>
                                          </tr>

                                    </ItemTemplate>

                                    <FooterTemplate>

                                       </table>

                                    </FooterTemplate>

                                </asp:datalist>

                                <table border=0 width="100%">
                                   <tr>
                                      <td colspan=4><hr></td>
                                   </tr>
                                   <tr>
                                      <td width=52></td>
                                      <td width=225 colspan="2" align="left">
                                        <b>Subtotal</b>
                                      </td>
                                      <td align="right" style="padding-right:10">
                                        <asp:label id="SubTotal" runat=server/>
                                      </td>
                                   </tr>
                                <tr>
                                   <td width=52></td>
                                   <td width=225 colspan="2" align="left">
                                     <b>Tax</b>
                                   </td>
                                   <td align="right" style="padding-right:10">
                                     <asp:label id="Tax" runat=server/>
                                   </td>
                                </tr>
                                <tr>
                                   <td width=52></td>
                                   <td width=225 colspan="2" align="left">
                                      <b>Grand Total</b>
                                   </td>
                                   <td align="right" style="padding-right:10">
                                      <b><asp:label id="Total" runat=server/></b>
                                   </td>
                                </tr>
                              </table>

                              <p>

                              <div id="CheckoutPanel" runat="server">
                                 <center>
                                    <asp:imagebutton borderwidth=0 OnClick="Recalculate_Click" ImageUrl='images\recalculate.gif' runat=server/>
                                    <asp:imagebutton borderwidth=0 ImageUrl='images\checkout.gif' runat=server/>
                                    <asp:imagebutton borderwidth=0 OnClick="ClearCart_Click" ImageUrl='images\clear_cart.gif' runat=server/>
                                 </center>
                              </div>

                        </td>
                  </tr>
          </table>
    </form>

</body>
</html>