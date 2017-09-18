<%@ Import Namespace="DataTypesJS" %>

<html>
<style>

    div
    {
        font: 8pt verdana;
        background-color:cccccc;
        border-color:black;
        border-width:1;
        border-style:solid;
        padding:10,10,10,10;
    }

</style>

<script language="JScript" runat="server">
    public function Page_Load(sender:Object, E:EventArgs) : void
    {
        var d:DataTypes = new DataTypes ();
        d.Credentials = System.Net.CredentialCache.DefaultCredentials;
        var i:int;

        Message1.InnerHtml = d.SayHello();
        Message1.InnerHtml = Message1.InnerHtml + d.SayHelloName("Bob");

        Message3.InnerHtml = Message3.InnerHtml + d.GetMode();

        var myIntArray:int[] = d.GetIntArray();
        var myString:String = "Contents of the Array:<BR>";
        for( i=0; i<myIntArray.Length; i++)
        {
            myString = myString + myIntArray[i] + "<BR>";
        }
        Message2.InnerHtml = Message2.InnerHtml + myString;

        var myOrder:Order =  d.GetOrder();
        Message4.InnerHtml = Message4.InnerHtml + "<BR>OrderID: " + myOrder.OrderID;
        Message4.InnerHtml = Message4.InnerHtml + "<BR>Price: " + myOrder.Price;

        var myOrders:Order[] = d.GetOrders();
        for( i=0; i<myOrders.Length; i++ ) {
            if ( i > 0 ) { Message5.InnerHtml += "<BR>"; }
            Message5.InnerHtml += "<BR>Order#: " + i;
            Message5.InnerHtml += "<BR>OrderID: " + myOrders[i].OrderID;
            Message5.InnerHtml += "<BR>Price: " + myOrders[i].Price;
        }
    }
</script>

<body style="font: 10pt verdana">
<H4>Using DataTypes with XML Web services</H4>

  <h5>Methods that return a Primitive (String): </h5>
  <div id="Message1" runat="server"/>

  <h5>Methods that return an Array of Primitives (Integers): </h5>
  <div id="Message2" runat="server"/>

  <h5>Method that returns an Enum: </h5>
  <div id="Message3" runat="server"/>

  <h5>Method that returns a Class/Struct: </h5>
  <div id="Message4" runat="server"/>

  <h5>Method that returns an array of Classes/Structs: </h5>
  <div id="Message5" runat="server"/>



</body>
</html>


