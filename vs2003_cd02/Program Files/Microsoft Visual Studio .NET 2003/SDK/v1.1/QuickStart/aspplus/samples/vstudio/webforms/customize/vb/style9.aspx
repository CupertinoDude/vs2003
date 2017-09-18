<%@ Page CodeBehind="style9.aspx.vb" Language="vb" AutoEventWireup="false" Inherits="Customize.Vb.style9" %>
<%@ Import Namespace="System.Drawing" %>

<html>

<head>

  <style>

    .beige { background-color:beige }

  </style>

</head>
<body>

  <form runat="server">

      <h3><font face="verdana">Applying Styles to Web Controls</font></h3>

      <p><font face="verdana"><h4>Applying Styles Programmatically</h4></font><p>

      <table style="font: 10pt verdana; background-color:tan" cellspacing=15>
        <tr>
          <td><b>Login: </b></td>
          <td><ASP:TextBox id="MyLogin" runat="server" class="beige" style="font-weight:700;"/></td>
        </tr>
        <tr>
          <td><b>Password: </b></td>
          <td><ASP:TextBox id="MyPassword" TextMode="Password" runat="server" class="beige"/></td>
        </tr>
        <tr>
          <td><b>Select a View: </b></td>
          <td>
            <ASP:DropDownList id="MySelect" class="beige" runat="server">
                <ASP:ListItem>Default Desktop</ASP:ListItem>
                <ASP:ListItem>My Stock Portfolio</ASP:ListItem>
                <ASP:ListItem>My Contact List</ASP:ListItem>
            </ASP:DropDownList>
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><ASP:Button id="MySubmit" Text="Submit" runat="server" class="beige"/></td>
        </tr>
      </table>

    </form>

</body>
</html>