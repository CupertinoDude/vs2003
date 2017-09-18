<%@ Register TagPrefix="Acme" TagName="Login" Src="pagelet4.ascx" %>

<html>

<script language="VB" runat="server">

  Sub Page_Load(Sender As Object, E As EventArgs)

    If (Page.IsPostBack)
      MyLabel.Text &= "The UserId is " & MyLogin.UserId & "<br>"
      MyLabel.Text &= "The Password is " & MyLogin.Password & "<br>"
    End If
  End Sub

</script>

<body style="font: 10pt verdana">

  <h3>A Login User Control</h3>

  <form runat="server">

    <Acme:Login id="MyLogin" UserId="John Doe" Password="Secret" BackColor="beige" runat="server"/>

  </form>

  <asp:Label id="MyLabel" runat="server"/>

</body>
</html>
