<%@ Page Language="VB" %>
<%@ Assembly Name="Hello" %>
<%@ Import Namespace="Hello" %>

<html>
<head>
    <script runat="server">
    Private nameField As String
    Private greetingField As String
    
    Sub name_change(Src As Object, E As EventArgs)
        Dim helloService As New HelloService()
        nameField = Name.Value
        greetingField = helloService.ReturnGreeting(nameField)
    End Sub 'name_change 
    </script>
</head>

<body style="font: 10pt verdana">
<h3>MyHello - Hello.HelloMethod </h3>

<form runat="server">
    <font face="Verdana"><b>Please enter your name: </b>
    <INPUT id="Name" VALUE="" TYPE="TEXT" runat="server" OnServerChange = "name_change">
    <p>
    </font>
</form>

<h3>Greeting : <%=greetingField%></h3>

<h4><SOAP XML Request Message></h4>
