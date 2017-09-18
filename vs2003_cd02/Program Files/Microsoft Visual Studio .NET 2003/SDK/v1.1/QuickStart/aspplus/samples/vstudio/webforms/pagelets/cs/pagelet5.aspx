<%@ Register TagPrefix="uc1" TagName="pagelet5" Src="pagelet5.ascx" %>
<%@ Page CodeBehind="pagelet5.aspx.cs" Language="c#" AutoEventWireup="false" Inherits="Pagelets.Cs.pagelet5" %>

<HTML>
	<body style="font: 10pt verdana">
		<h3>A Login User Control</h3>
		<form runat="server">
			<uc1:pagelet5 id="MyLogin" BackColor="beige" runat="server"/>
		</form>
		<asp:Label id="MyLabel" runat="server"/>
	</body>
</HTML>