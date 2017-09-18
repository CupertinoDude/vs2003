<%@ Register TagPrefix="Acme" TagName="Login" Src="pagelet5.ascx" %>

<html>

<script language="C#" runat="server">

  public void Page_Load(Object sender, EventArgs E) {

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

  <h3>A Login User Control</h3>

  <form runat="server">

    <Acme:Login id="MyLogin" BackColor="beige" runat="server"/>

  </form>

  <asp:Label id="MyLabel" runat="server"/>

</body>
</html>