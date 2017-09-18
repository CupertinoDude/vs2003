<%@ Page CodeBehind="pagelet4.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="Pagelets.Cs.pagelet4" %>
<%@ Register TagPrefix="uc1" TagName="pagelet4" Src="pagelet4.ascx" %>

<html>
<body style="font: 10pt verdana">

  <h3>A Login User Control</h3>

  <form runat="server">

    <uc1:pagelet4 id="MyLogin" UserId="John Doe" Password="Secret" BackColor="beige" runat="server"/>

  </form>

  <asp:Label id="MyLabel" runat="server"/>

</body>
</html>
