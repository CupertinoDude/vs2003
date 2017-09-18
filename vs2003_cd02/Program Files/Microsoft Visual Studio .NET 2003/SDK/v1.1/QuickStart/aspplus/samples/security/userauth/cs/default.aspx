<%@ Import Namespace="System.Web.Security " %>

<html>

  <script language="C#" runat=server>

    void Page_Load(Object Src, EventArgs E ) {

      Welcome.Text = "Hello, " + User.Identity.Name;
    }

    void Signout_Click(Object sender, EventArgs E) {

      FormsAuthentication.SignOut();
      Response.Redirect("login.aspx");
    }

  </script>

  <body>

    <h3><font face="Verdana">Using Cookie Authentication</font></h3>

    <form runat=server>

      <h3><asp:label id="Welcome" runat=server/></h3>

      <asp:button text="Signout" OnClick="Signout_Click" runat=server/>

    </form>

  </body>

</html>