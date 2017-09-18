<%@ Register TagPrefix="Acme" TagName="Login" Src="pagelet4.ascx" %>

<html>

<script language="JScript" runat="server">

  function Page_Load(sender : Object, E : EventArgs) : void {

    if (Page.IsPostBack) {
      MyLabel.Text += "The UserId is " + MyLogin.UserId + "<br>";
      MyLabel.Text += "The Password is " + MyLogin.Password + "<br>";
    }    
  }

</script>

<body style="font: 10pt verdana">

  <h3>A Login Pagelet</h3>

  <form runat="server">

    <Acme:Login id="MyLogin" UserId="John Doe" Password="Secret" BackColor="beige" runat="server"/>

  </form>

  <asp:Label id="MyLabel" runat="server"/>

</body>
</html>
