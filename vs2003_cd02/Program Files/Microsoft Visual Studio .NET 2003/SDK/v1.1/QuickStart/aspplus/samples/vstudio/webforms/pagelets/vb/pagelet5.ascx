<%@ Control CodeBehind="pagelet5.ascx.vb" Language="vb" AutoEventWireup="false" Inherits="Pagelets.Vb.UserControls.pagelet5"%>
<table style="background-color:<%=BackColor%>;font: 10pt verdana;border-width:1;border-style:solid;border-color:black;" cellspacing=15>
  <tr>
    <td><b>Login: </b></td>
    <td><ASP:TextBox id="UserName" runat="server"/></td>
  </tr>
  <tr>
    <td><b>Password: </b></td>
    <td><ASP:TextBox id="Pass" TextMode="Password" runat="server"/></td>
  </tr>
  <tr>
    <td></td>
    <td><ASP:Button Text="Submit" id="SubmitBtn" runat="server"/></td>
  </tr>
  <tr>
    <td align="center" valign="top" colspan="2">
    
      <asp:RegularExpressionValidator id="Validator1"
          ASPClass="RegularExpressionValidator" ControlToValidate="Pass"
          ValidationExpression="[0-9a-zA-Z]{5,}"
          Display="Dynamic"
          Font-Size="8pt"
          runat=server>
          Password must be >= 5 alphanum chars<br>
      </asp:RegularExpressionValidator>
      
      <asp:RequiredFieldValidator id="Validator2"
          ControlToValidate="UserName"
          Font-Size="8pt"
          Display="Dynamic"
          runat=server>
          UserId cannot be blank<br>
      </asp:RequiredFieldValidator>
      
      <asp:RequiredFieldValidator id="Validator3"
          ControlToValidate="Pass"
          Font-Size="8pt"
          Display="Dynamic"
          runat=server>
          Password cannot be blank<br>
      </asp:RequiredFieldValidator>
      
    </td>
  </tr>
</table>


