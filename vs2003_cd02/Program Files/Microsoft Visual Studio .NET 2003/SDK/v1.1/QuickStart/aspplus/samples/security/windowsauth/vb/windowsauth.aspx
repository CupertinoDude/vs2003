<html>

  <script language="VB" runat=server>

    Sub Page_Load(Src As Object, E As EventArgs)
        AuthUser.Text = User.Identity.Name
        AuthType.Text = User.Identity.AuthenticationType
    End Sub

  </script>

  <body>

    <h3><font face="Verdana">Using Windows Authentication</font></h3>

    <table Width="700" rules="all" bordercolor="Black" style="background-color:#ccccff;bordercolor:black;font-family:Verdana;font-size:8pt;border-collapse:collapse;">
      <tr>
        <td>User:</td>
        <td><asp:label id=AuthUser runat=server/>
      </tr>
      <tr>
        <td>Authentication Type:</td>
        <td><asp:label id=AuthType runat=server/>
      </tr>
    </table>

  </body>

</html>