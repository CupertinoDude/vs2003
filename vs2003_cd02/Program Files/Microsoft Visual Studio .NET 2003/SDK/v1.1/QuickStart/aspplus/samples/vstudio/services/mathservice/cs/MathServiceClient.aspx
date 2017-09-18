<%@ Page CodeBehind="MathServiceClient.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="Services.MathService.Cs.MathServiceClient" %>
<html>
<body style="font: 10pt verdana">

  <h4>Using a Simple Math Service </h4>

  <form runat="server">  

  <div style="padding:15,15,15,15;background-color:beige;width:300;border-color:black;border-width:1;border-style:solid">

    Operand 1: <br><asp:TextBox id="Operand1" Text="15" runat="server"/><br>
    Operand 2: <br><asp:TextBox id="Operand2" Text="5" runat="server"/><p>

    <input type="submit" id="Add" value="Add" runat="server">
    <input type="submit" id="Subtract" value="Subtract" runat="server">
    <input type="submit" id="Multiply" value="Multiply" runat="server">
    <input type="submit" id="Divide" value="Divide" runat="server">

    <p>

    <asp:Label id="Result" runat="server"/>

  </div>

  </form>

</body>
</html>
