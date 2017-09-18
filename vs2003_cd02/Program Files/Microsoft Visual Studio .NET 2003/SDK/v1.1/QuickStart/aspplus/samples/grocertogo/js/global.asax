<%@ Import Namespace="Market" %>
<%@ Import Namespace="Microsoft.JScript" %>

<script language="JScript" runat=server>

    public function Session_Start() : void {

       if (Session["ShoppingCart"] == null) {
          Session["ShoppingCart"] = new Market.OrderList();
       }
    }

</script>