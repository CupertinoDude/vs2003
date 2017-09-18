<%@ Page CodeBehind="pagelet2.aspx.vb" Language="vb" AutoEventWireup="false" Inherits="Pagelets.Vb.pagelet2" %>
<%@ Register TagPrefix="uc1" TagName="pagelet2" Src="pagelet2.ascx" %>

<html>
<body style="font: 10pt verdana">

  <h3>A Simple User Control w/ Properties</h3>

  <form runat="server">

    <uc1:pagelet2 id="MyMessage" MessageText="This is a custom message!" Color="blue" runat="server" />

    <p>

    <asp:button id="SubmitBtn" text="Change Properties" runat=server />

  </form>

</body>
</html>