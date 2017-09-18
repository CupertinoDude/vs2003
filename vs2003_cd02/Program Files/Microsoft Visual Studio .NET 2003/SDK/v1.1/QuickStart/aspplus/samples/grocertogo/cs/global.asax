<%@ Import Namespace="Market" %>

<script language="C#" runat=server>

    public void Session_Start() {

       if (Session["ShoppingCart"] == null) {
          Session["ShoppingCart"] = new Market.OrderList();
       }
    }

</script>