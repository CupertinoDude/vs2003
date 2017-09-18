<%@ Import Namespace="System.Web.Security " %>

<html>

  <script language="VB" runat=server>
    Sub Login_Click(Src As Object, E As EventArgs)

        ' authenticate user: this samples accepts only one user with
        ' a name of someone@www.contoso.com and a password of 'password'

        If UserEmail.Value = "someone@www.contoso.com" And UserPass.Value = "password"
            FormsAuthentication.RedirectFromLoginPage(UserEmail.Value, PersistCookie.Checked)
        Else
            Msg.Text = "Invalid Credentials: Please try again"
        End If
    End Sub
  </script>

  <body>

    <form runat=server>

      <h3><font face="Verdana">Login Page</font></h3>

      <table>
        <tr>
          <td>Email:</td>
          <td><input id="UserEmail" type="text" runat=server/></td>
          <td><ASP:RequiredFieldValidator ControlToValidate="UserEmail" Display="Static" ErrorMessage="*" runat=server/></td>
        </tr>
        <tr>
          <td>Password:</td>
          <td><input id="UserPass" type=password runat=server/></td>
          <td><ASP:RequiredFieldValidator ControlToValidate="UserPass" Display="Static" ErrorMessage="*" runat=server/></td>
        </tr>
        <tr>
          <td>Persistent Cookie:</td>
          <td><ASP:CheckBox id=PersistCookie runat="server" /> </td>
          <td></td>
        </tr>
      </table>

      <asp:button text="Login" OnClick="Login_Click" runat=server/>

      <p>

      <asp:Label id="Msg" ForeColor="red" Font-Name="Verdana" Font-Size="10" runat=server />

    </form>
  </body>

</html>