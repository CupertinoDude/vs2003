<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Login.aspx.vb" Inherits="CookieAuth.Vb.Login"%>

 <html>
  <head>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.0">
    <meta name="CODE_LANGUAGE" content="Visual Basic .NET">
  </head>
  <body>

    <form id="Login" method="post" runat="server">
      
      <h3><font face="Verdana">Login Page</font></h3>

      <table>
        <tr>
          <td>Email:</td>
          <td><input id="UserEmail" type="text" runat=server ></td>
          <td><ASP:RequiredFieldValidator ControlToValidate="UserEmail" Display="Static" ErrorMessage="*" runat=server ID=RequiredFieldValidator1 /></td>
        </tr>
        <tr>
          <td>Password:</td>
          <td><input id="UserPass" type=password runat=server ></td>
          <td><ASP:RequiredFieldValidator ControlToValidate="UserPass" Display="Static" ErrorMessage="*" runat=server ID=RequiredFieldValidator2 /></td>
        </tr>
        <tr>
          <td>Persistent Cookie:</td>
          <td><ASP:CheckBox id=PersistCookie runat="server" /> </td>
          <td></td>
        </tr>
      </table>

      <asp:button text="Login" runat=server ID=LoginBtn />

      <p>

      <asp:Label id="Msg" ForeColor="red" Font-Name="Verdana" Font-Size="10" runat=server />

    </form></P>

  </body>
 </html>
