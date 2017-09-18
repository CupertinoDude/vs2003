<%@ Import Namespace="System.Web.Security" %>
<%@ Import Namespace="System.Web.Mobile" %>
<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="C#" %>

<script runat="Server">
public void Page_Load(Object o, EventArgs e)
{
    label1.Text = String.Format("Welcome {0}", User.Identity.Name);
}

public void Logout_Click(Object o, EventArgs e)
{
    MobileFormsAuthentication.SignOut();
    ActiveForm = formB;
}
</script>

<mobile:Form id="formA" runat=server Paginate="False">
    <mobile:Label runat=server id="label1"/>
    <mobile:Command runat="Server" OnClick="Logout_Click" SoftkeyLabel="go">Logout</mobile:Command>
</mobile:Form>

<mobile:Form id="formB" runat=server>
    <mobile:Label id="message" runat="server">Good Bye</mobile:Label>
    <mobile:Link NavigateURL="FormsAuth.aspx" runat="server">Log back in</mobile:Link>
</mobile:Form>











