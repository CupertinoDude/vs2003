<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="vb" %>
<%@ Register TagPrefix="Acme" Namespace="Acme.CustomControlsVB" Assembly="Acme.CustomControlsVB" %>


<script language="vb" runat="server">

Protected Sub Page_Load(sender As Object, e As EventArgs)
    If Not IsPostBack
        MyLoginCtl.LoginInfo.UserID = ""
        MyLoginCtl.LoginInfo.Password = ""
        MyLoginCtl.DataBind()
    End If
End Sub

Protected Sub LoginCtl_OnAuthenticate(sender As Object, e As EventArgs)
    Dim ctl As LoginControl = CType(sender, LoginControl)
    AuthLabel.Text = String.Format("Authenticating user {0}", ctl.LoginInfo.UserID)
    ActiveForm = AuthForm
End Sub

</script>

<mobile:Form runat="server">
   <Acme:LoginControl id="MyLoginCtl" runat="server" OnAuthenticate="LoginCtl_OnAuthenticate" />
</mobile:Form>

<mobile:Form runat="server" id="AuthForm">
   <mobile:Label runat="server" id="AuthLabel" />
</mobile:Form>
