<%@ Import Namespace="System.Web.Security " %>

<html>

  <script language="VB" runat=server>

    Sub Page_Load(Src As Object, E As EventArgs)
        Welcome.Text = "Hello, " + User.Identity.Name
    End Sub

    Sub Signout_Click(Src As Object, E As EventArgs)
        FormsAuthentication.SignOut()
        Response.Redirect("login.aspx")
    End Sub

  </script>

  <body>

    <h3><font face="Verdana">Using Cookie Authentication</font></h3>

    <form runat=server>

      <h3><asp:label id="Welcome" runat=server/></h3>

      <asp:button text="Signout" OnClick="Signout_Click" runat=server/>

    </form>

  </body>

</html>