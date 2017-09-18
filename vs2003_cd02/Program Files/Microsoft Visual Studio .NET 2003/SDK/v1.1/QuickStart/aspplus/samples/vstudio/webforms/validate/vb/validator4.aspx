<%@ Page clienttarget="downlevel" CodeBehind="validator4.aspx.vb" Language="vb" AutoEventWireup="false" Inherits="Validate.Vb.validator4" %>

<html>
<body>

    <h3><font face="Verdana">CompareValidator Example</font></h3>
    <p>Type a value in each textbox, select a comparison operator, then click "Validate" to test.</p>

    <form runat=server>

      <table bgcolor="#eeeeee" cellpadding=10>
      <tr valign="top">
        <td>
            <h5><font face="Verdana">String 1:</font></h5>
            <asp:TextBox id="txtComp" runat="server"></asp:TextBox>
        </td>
        <td>
            <h5><font face="Verdana">Comparison Operator:</font></h5>

            <asp:ListBox id="lstOperator" runat="server">
                    <asp:ListItem Selected Value="Equal" >Equal</asp:ListItem>
                    <asp:ListItem Value="NotEqual" >NotEqual</asp:ListItem>
                    <asp:ListItem Value="GreaterThan" >GreaterThan</asp:ListItem>
                    <asp:ListItem Value="GreaterThanEqual" >GreaterThanEqual</asp:ListItem>
                    <asp:ListItem Value="LessThan" >LessThan</asp:ListItem>
                    <asp:ListItem Value="LessThanEqual" >LessThanEqual</asp:ListItem>
            </asp:ListBox>
        </td>
        <td>
            <h5><font face="Verdana">String 2:</font></h5>
            <asp:TextBox id="txtCompTo" runat="server"></asp:TextBox><p>
            <asp:Button runat=server Text="Validate" ID="ValidateBtn"/></p>
        </td>
      </tr>
      </table>

      <asp:CompareValidator id="comp1" ControlToValidate="txtComp" ControlToCompare = "txtCompTo" Type="String" runat="server"/>

      <br>

      <asp:Label ID="lblOutput" Font-Name="verdana" Font-Size="10pt" runat="server"/>

    </form>

</body>
 </html>
