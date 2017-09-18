<%@ Page CodeBehind="pagelet3.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="Pagelets.Cs.pagelet3" %>
<%@ Register TagPrefix="uc1" TagName="pagelet3" Src="pagelet3.ascx" %>

<html>
<body style="font: 10pt verdana">

  <h3>A Simple User Control w/ Properties</h3>

  <form runat="server">

    <uc1:pagelet3 id="ShipAddr" Caption="Shipping Address" Address="One Microsoft Way" City="Redmond" State="WA" Zip="98052" runat="server"/>

    <p>

    <uc1:pagelet3 id="BillAddr" Caption="Billing Address" runat="server" />

    <p>

    <asp:button id="SubmitBtn" Text="Submit Form" runat=server />

  </form>

  <asp:Label id="MyLabel" runat="server" />

</body>
</html>