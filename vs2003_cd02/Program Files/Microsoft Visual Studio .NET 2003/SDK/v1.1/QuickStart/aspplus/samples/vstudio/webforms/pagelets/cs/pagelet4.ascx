<%@ Control CodeBehind="pagelet4.ascx.cs" Language="c#" AutoEventWireup="false" Inherits="Pagelets.Cs.UserControls.pagelet4"%>
<table style="background-color:<%=BackColor%>;font: 10pt verdana;border-width:1;border-style:solid;border-color:black;" cellspacing=15>
  <tr>
    <td><b>Login: </b></td>
    <td><ASP:TextBox id="User" runat="server"/></td>
  </tr>
  <tr>
    <td><b>Password: </b></td>
    <td><ASP:TextBox id="Pass" TextMode="Password" runat="server"/></td>
  </tr>
  <tr>
    <td></td>
    <td><ASP:Button Text="Submit" id="SubmitBtn" runat="server"/></td>
  </tr>
</table>
