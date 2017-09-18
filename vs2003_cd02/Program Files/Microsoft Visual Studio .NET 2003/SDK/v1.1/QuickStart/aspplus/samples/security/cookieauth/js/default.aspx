<%@ Import Namespace="System.Web.Security " %>

<html>

  <script language="JScript" runat=server>

    function Page_Load(sender:Object, e:EventArgs) : void{

      Welcome.Text = "Hello, " + User.Identity.Name;
    }

    function Signout_Click(sender:Object, e:EventArgs) : void {

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