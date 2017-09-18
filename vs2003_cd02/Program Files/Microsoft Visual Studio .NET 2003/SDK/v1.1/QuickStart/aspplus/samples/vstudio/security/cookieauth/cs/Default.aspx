<%@ Page language="c#" Codebehind="Default.aspx.cs" AutoEventWireup="false" Inherits="CookieAuth.Cs.Default" %>

 <html>
  <head>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET">
    <meta name="CODE_LANGUAGE" Content="C#">
  </head>
  <body>
	
    <h3><font face="Verdana">Using Cookie Authentication</font></h3>

    <form runat=server ID=Form1>

      <h3><asp:label id="Welcome" runat="server"></asp:label></h3>

      <asp:button text="Signout" runat=server ID=Button1></asp:button>

    </form>
	
  </body>
 </html>
