<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="C#" %>
<%@ Register TagPrefix="Acme" Namespace="Acme.CustomControlsCS" Assembly="Acme.CustomControlsCS" %>


<script language="c#" runat="server">

public void Page_Load(Object sender, EventArgs e)
{
    if (!IsPostBack)
    {
        MyLoginCtl.LoginInfo.UserID = "";
        MyLoginCtl.LoginInfo.Password = "";
        MyLoginCtl.DataBind();
    }
}

protected void LoginCtl_OnAuthenticate(Object sender, EventArgs e)
{
    LoginControl ctl = (LoginControl)sender;
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
