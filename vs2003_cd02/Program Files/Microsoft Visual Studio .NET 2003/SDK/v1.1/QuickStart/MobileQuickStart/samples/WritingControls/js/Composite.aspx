<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="JScript" %>
<%@ Register TagPrefix="Acme" Namespace="Acme.CustomControlsCS" Assembly="Acme.CustomControlsCS" %>


<script language="JScript" runat="server">

public function Page_Load(sender:Object , e:EventArgs )
{
    if (!IsPostBack)
    {
        MyLoginCtl.LoginInfo.UserID = "";
        MyLoginCtl.LoginInfo.Password = "";
        MyLoginCtl.DataBind();
    }
}

protected function LoginCtl_OnAuthenticate(sender:Object , e:EventArgs )
{
    var ctl : LoginControl = LoginControl(sender);
    AuthLabel.Text = String.Format("Authenticating user {0}",
                                   ctl.LoginInfo.UserID);
    ActiveForm = AuthForm;
}

</script>

<mobile:Form runat="server">
   <Acme:LoginControl id="MyLoginCtl" runat="server" OnAuthenticate="LoginCtl_OnAuthenticate" />
</mobile:Form>

<mobile:Form runat="server" id="AuthForm">
   <mobile:Label runat="server" id="AuthLabel" />
</mobile:Form>
