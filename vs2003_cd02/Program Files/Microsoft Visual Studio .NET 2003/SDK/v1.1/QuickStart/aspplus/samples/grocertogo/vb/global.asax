<%@ Import Namespace="Market" %>

<script language="VB" runat=server>

    public Sub Session_Start()

       If Microsoft.VisualBasic.IsNothing(Session("ShoppingCart")) Then
          Session("ShoppingCart") = new Market.OrderList()
       End If
    End Sub

</script>