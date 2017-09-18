<%@ Register TagPrefix="Acme" TagName="Login" Src="pagelet5.ascx" %>

<html>

<script language="JScript" runat="server">

  public function Page_Load(sender : Object, E : EventArgs) : void {

    if (Page.IsPostBack) {
        Page.Validate();
        if (Page.IsValid) {
            MyLabel.Text += "The UserId is " + MyLogin.UserId + "<br>";
            MyLabel.Text += "The Password is " + MyLogin.Password + "<br>";
        }
    }
  }

</script>

<body style="font: 10pt verdana">

  <h3>A Login Pagelet</h3>

  <form runat="server">

    <Acme:Login id="MyLogin" BackColor="beige" runat="server"/>

  </form>

  <asp:Label id="MyLabel" runat="server"/>

</body>
</html>