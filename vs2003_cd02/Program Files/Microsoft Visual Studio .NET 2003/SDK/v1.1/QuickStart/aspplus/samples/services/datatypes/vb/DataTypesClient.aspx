<%@ Import Namespace="DataTypesVB" %>

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

<script language="VB" runat="server">

    Public Sub Page_Load(Sender As Object, E As EventArgs)

        Dim D As DataTypesVB.DataTypes = New DataTypesVB.DataTypes()
        D.Credentials = System.Net.CredentialCache.DefaultCredentials
        Message1.InnerHtml = D.SayHello()
        Message1.InnerHtml = Message1.InnerHtml & D.SayHelloName("Bob")

        Message3.InnerHtml = Message3.InnerHtml & D.GetMode()

        Dim MyIntArray As Integer() = D.GetIntArray()
        Dim MyString As String = "Contents of the Array:<BR>"
        Dim I As Integer
        For I = 0 To MyIntArray.Length - 1
            MyString = MyString & MyIntArray(I) & "<BR>"
        Next

        Message2.InnerHtml = Message2.InnerHtml & MyString

        Dim MyOrder As Order = D.GetOrder()
        Message4.InnerHtml = Message4.InnerHtml & "<BR>OrderID: " & MyOrder.OrderID
        Message4.InnerHtml = Message4.InnerHtml & "<BR>Price: " & MyOrder.Price

        Dim MyOrders As Order() = D.GetOrders()
        For I = 0 To myOrders.Length - 1
            If i > 0 Then Message5.InnerHtml &= "<BR>"
            Message5.InnerHtml &= "<BR>Order#: " & i
            Message5.InnerHtml &= "<BR>OrderID: " & myOrders(0).OrderID
            Message5.InnerHtml &= "<BR>Price: " & myOrders(0).Price
        Next
    End Sub

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


