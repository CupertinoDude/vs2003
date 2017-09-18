<%@ Page CodeBehind="pagelet2.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="Pagelets.Cs.pagelet2" %>
<%@ Register TagPrefix="uc1" TagName="pagelet2" Src="pagelet2.ascx" %>

 <html>
  <head>
</head>
<body style="FONT: 10pt verdana">

  <h3>A Simple User Control w/ Properties</h3>
  <form runat="server">

	<uc1:pagelet2 id="MyMessage" Text="This is a custom message!" Color="blue" runat="server"></uc1:pagelet2>
	
    <p>

    <asp:button text="Change Properties" id=SubmitBtn runat="server"></asp:button>

  </form>

</body>
</html></asp:button></P></FORM>

</BODY></HTML>
