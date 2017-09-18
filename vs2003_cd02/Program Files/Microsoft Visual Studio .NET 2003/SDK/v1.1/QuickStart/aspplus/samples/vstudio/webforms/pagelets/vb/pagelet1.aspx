<%@ Page CodeBehind="pagelet1.aspx.vb" Language="vb" AutoEventWireup="false" Inherits="Pagelets.Vb.pagelet1" %>
<%@ Register TagPrefix="uc1" TagName="pagelet1" Src="pagelet1.ascx" %>

<html>
<body style="font: 10pt verdana">

  <h3>A Simple User Control</h3>

  <uc1:pagelet1 id=SimpleControl runat="server"/>

</body>
</html>