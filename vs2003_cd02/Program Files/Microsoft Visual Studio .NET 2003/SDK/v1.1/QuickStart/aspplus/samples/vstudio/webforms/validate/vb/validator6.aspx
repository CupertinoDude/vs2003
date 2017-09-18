<%@ Page CodeBehind="validator6.aspx.vb" Language="vb" AutoEventWireup="false" Inherits="Validate.Vb.validator6" %>

<html>
<body>

<h3><font face="Verdana">Simple RegularExpressionValidator Sample</font></h3>
<p>

<form runat="server">

    <table bgcolor="#eeeeee" cellpadding=10>
    <tr valign="top">
      <td colspan=3>
        <asp:Label ID="lblOutput" Text="Enter a 5 digit zip code" Font-Name="Verdana" Font-Size="10pt" runat="server"/>
      </td>
    </tr>

    <tr>
      <td colspan=3>
      <font face=Verdana size=2><b>Personal Information</b></font>
      </td>
    </tr>
    <tr>
      <td align=right>
        <font face=Verdana size=2>Zip Code:</font>
      </td>
      <td>
        <ASP:TextBox id=TextBox1 runat=server />
      </td>
      <td>
        <asp:RequiredFieldValidator id="RequiredFieldValidator1"
            ControlToValidate="TextBox1"
            Display="Static"
            Width="100%" runat=server>
            *
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server"
            ControlToValidate="TextBox1"
            ValidationExpression="^\d{5}$"
            Display="Static"
            Font-Name="verdana" 
            Font-Size="10pt">
               Zip code must be 5 numeric digits
        </asp:RegularExpressionValidator>
      </td>
    </tr>
    <tr>
      <td></td>
      <td>
        <ASP:Button id=ValidateBtn text="Validate" runat=server />
      </td>
      <td></td>
    </tr>
    </table>

</form></p>

</body>
 </html>
