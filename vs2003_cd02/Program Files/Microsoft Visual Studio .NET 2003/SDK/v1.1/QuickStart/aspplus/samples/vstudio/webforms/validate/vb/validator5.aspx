<%@ Page clienttarget="downlevel" CodeBehind="validator5.aspx.vb" Language="vb" AutoEventWireup="false" Inherits="Validate.Vb.validator5" %>

<html>
<body>

    <h3><font face="Verdana">RangeValidator Sample</font></h3>
    <p>

    <form runat="server">

      <table bgcolor="#eeeeee" cellpadding=10>
      <tr valign="top">
        <td>
            <h5><font face="Verdana">Value to Check:</font></h5>
            <asp:TextBox id="txtComp" runat="server"/>
        </td>
        <td>
            <h5><font face="Verdana">Data Type:</font></h5>
            <asp:DropDownList id="lstType" runat=server>
                <asp:ListItem Selected Value="String" >String</asp:ListItem>
                <asp:ListItem Value="Integer" >Integer</asp:ListItem>
                <asp:ListItem Value="Double" >Double</asp:ListItem>
                <asp:ListItem Value="Date" >Date</asp:ListItem>
                <asp:ListItem Value="Currency" >Currency</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td>
            <h5><font face="Verdana">Minimum Value:</font></h5>
            <asp:TextBox id="txtMin" runat="server" />
        </td>
        <td>
            <h5><font face="Verdana">Maximum Value:</font></h5>
            <asp:TextBox id="txtMax" runat="server" /><p>
            <asp:Button Text="Validate" ID="ValidateBtn" runat="server" /></p>
        </td>
      </tr>
     </table>

     <asp:RangeValidator id="rangeVal" Type="String" ControlToValidate="txtComp" MaximumControl="txtMax" MinimumControl="txtMin" runat="server"/>

     <br>

     <asp:Label id="lblOutput" Font-Name="verdana" Font-Size="10pt" runat="server" />

    </form></p>

</body>
 </html>
