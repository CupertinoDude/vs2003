<%@ Import Namespace="System.Web.Security" %>
<%@ Import Namespace="System.Web.Mobile" %>
<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="C#" %>

<script runat="Server">
void Login_Click(Object sender, EventArgs e)
{
    if ((UserEmail.Text == "jdoe") && (UserPass.Text == "password"))
    {
        MobileFormsAuthentication.RedirectFromLoginPage(UserEmail.Text, false);
    }
    else
    {
        message.Visible = true;
        message.Text = "Incorrect username and password.";
    }
}
</script>

<mobile:Form id="formA" runat=server Paginate="True">
    <mobile:Label id="message" visible="false" runat=server/>
    <mobile:Label runat="server">Enter username</mobile:Label>
    <mobile:TextBox id="UserEmail" runat="Server"/>
    <mobile:Label runat="server">Enter password</mobile:Label>
    <mobile:TextBox id="UserPass" runat="Server" Password="True" />
    <mobile:Command runat="Server" OnClick="Login_Click" SoftkeyLabel="go">Go</mobile:Command>
</mobile:Form>


