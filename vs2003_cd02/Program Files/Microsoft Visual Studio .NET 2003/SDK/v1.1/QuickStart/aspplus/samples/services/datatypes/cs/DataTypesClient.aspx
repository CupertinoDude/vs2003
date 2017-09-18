<%@ Import Namespace="DataTypes" %>

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

<script language="C#" runat="server">

    public void Page_Load(Object sender, EventArgs E)
    {
        DataTypes  d = new DataTypes ();
        d.Credentials = System.Net.CredentialCache.DefaultCredentials;
        Message1.InnerHtml = d.SayHello();
        Message1.InnerHtml = Message1.InnerHtml + d.SayHelloName("Bob");

        Message3.InnerHtml = Message3.InnerHtml + d.GetMode();

        int[] myIntArray = d.GetIntArray();
        String myString = "Contents of the Array:<BR>";
        for( int i=0; i<myIntArray.Length; i++)
        {
            myString = myString + myIntArray[i] + "<BR>";
        }
        Message2.InnerHtml = Message2.InnerHtml + myString;

        Order myOrder =  d.GetOrder();
        Message4.InnerHtml = Message4.InnerHtml + "<BR>OrderID: " + myOrder.OrderID;
        Message4.InnerHtml = Message4.InnerHtml + "<BR>Price: " + myOrder.Price;

        Order[] myOrders = d.GetOrders();
        for( int i=0; i<myOrders.Length; i++) {
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


