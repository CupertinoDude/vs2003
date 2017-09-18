<%@ Control CodeBehind="pagelet3.ascx.vb" Language="vb" AutoEventWireup="false" Inherits="Pagelets.Vb.UserControls.pagelet3"%>
<p>
<table style="font: 10pt verdana">
  <tr>
    <td colspan="6" style="padding-bottom:10">
      <b><%=Caption%></b>
    </td>
  </tr>
  <tr>
    <td>
      Address: 
    </td>
    <td colspan="5">
      <input id="TxtAddress" size="50" type="text" runat="server">
    </td>
  </tr>
  <tr>
    <td>
      City: 
    </td>
    <td>
      <input id="TxtCity" type="text" runat="server">
    </td>
    <td>
      State: 
    </td>
    <td>
      <input id="TxtState" size="2" type="text" runat="server">
    </td>
    <td>
      Zip: 
    </td>
    <td>
      <input id="TxtZip" size="5" type="text" runat="server">
    </td>
  </tr>
</table>