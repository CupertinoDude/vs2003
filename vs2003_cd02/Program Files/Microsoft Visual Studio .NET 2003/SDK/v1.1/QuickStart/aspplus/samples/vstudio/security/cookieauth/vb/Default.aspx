<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Default.aspx.vb" Inherits="CookieAuth.Vb.VbDefault"%>

 <html>
  <head>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.0">
    <meta name="CODE_LANGUAGE" content="Visual Basic .NET">
  </head>
  <body>

    <form id="Default" method="post" runat="server">

	  <h3><font face="Verdana">Using Cookie Authentication</font></h3>

      <h3><asp:label id="Welcome" runat=server /></h3>

      <asp:button text="Signout" runat=server ID=SignoutBtn />

    </form>

  </body>
 </html>
