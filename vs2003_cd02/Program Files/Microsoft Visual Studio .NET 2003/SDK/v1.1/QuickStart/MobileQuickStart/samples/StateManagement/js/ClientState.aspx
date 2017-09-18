<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="JScript" EnableViewState="false" %>

<script runat="server" language="JScript">

protected function Page_Load(sender:Object , e:EventArgs )
{
    var customerID : String = Request.QueryString["cid"];
    if (customerID != null)
    {
        customerID = Server.HtmlEncode(customerID);
        // A customer ID was found. Here, you would normally look
        // up the customer's profile in a database. 
        // This code simulates such a lookup by converting the client ID
        // back to a user.

        var underscore : int  = customerID.IndexOf('_');
        if (underscore != -1)
        {
            // If visiting the first time, prompt the user to bookmark.

            if (Session["FirstTime"] != null)
            {
                Session["FirstTime"] = null;
                WelcomeLabel.Text =
                    String.Format("Welcome to the site, {0}", customerID.Substring(0, underscore));
                ActiveForm = WelcomeForm;
            }
            else
            {
                ReturnLabel.Text =
                    String.Format("Welcome back, {0}", customerID.Substring(0, underscore));
                ActiveForm = ReturnForm;
            }
        }
    }
}

protected function LoginForm_OnSubmit(sender:Object , e:EventArgs )
{
    // Generate a customer ID. Here, you would normally create
    // a new customer profile.

    var customerID : String = CustomerName.Text + "_" + System.Guid.NewGuid().ToString();
    var path : String = AbsoluteFilePath + "?cid=" + Server.UrlEncode(customerID);
    Session["FirstTime"] = true;
    this.RedirectToMobilePage(path);
}

</script>

<mobile:Form runat="server">
    <mobile:Label runat="server" StyleReference="title">Welcome to the site. Please register to continue.</mobile:Label>
    <mobile:TextBox runat="server" id="CustomerName" />
    <mobile:Command runat="server" OnClick="LoginForm_OnSubmit" Text="Register" />
</mobile:Form>

<mobile:Form id="WelcomeForm" runat="server">
    <mobile:Label runat="server" id="WelcomeLabel" />
    Please bookmark this page for future access.
</mobile:Form>

<mobile:Form id="ReturnForm" runat="server">
    <mobile:Label runat="server" id="ReturnLabel" />
</mobile:Form>


