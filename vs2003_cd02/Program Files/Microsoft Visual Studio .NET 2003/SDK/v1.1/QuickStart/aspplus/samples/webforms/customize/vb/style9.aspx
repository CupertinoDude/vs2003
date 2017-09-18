<%@ Import Namespace="System.Drawing" %>

<html>

<head>

  <style>

    .beige { background-color:beige }

  </style>

</head>

<script language="VB" runat="server">

    Sub Page_Load(Src As Object, E As EventArgs)

        Dim MyStyle As System.Web.UI.WebControls.Style

        MyStyle = New System.Web.UI.WebControls.Style()
        MyStyle.BorderColor = Color.Black
        MyStyle.BorderStyle = BorderStyle.Dashed
        MyStyle.BorderWidth = New Unit(1)

        MyLogin.ApplyStyle (MyStyle)
        MyPassword.ApplyStyle (MyStyle)
        MySubmit.ApplyStyle (MyStyle)
    End Sub

</script>

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
