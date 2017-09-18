<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="C#" %>
<%@ Import Namespace="System.Web.Mobile" %>

<script runat="server" language="c#">

protected void Page_Load(Object sender, EventArgs e)
{
    if (!IsPostBack)
    {
        String[] capabilityNames = {
            "IsLandscape", "IsPortrait", "IsSmallScreen", "IsBigScreen",
            "UsingChtmlRendering",
            "GoWebOnPalm", "GoWebOnRIM", "MmeOnSony", "MmeOnBenefon",
            "ImodeOnMitsubishi", "ImodeOnFujitsu",

            "UseSmallGif",  "UseMediumGif",  "UseLargeGif",
            "UseSmallWbmp", "UseMediumWbmp", "UseLargeWbmp",
            "UseSmallBmp",  "UseMediumBmp",  "UseLargeBmp" };

        MobileCapabilities capabilities = (MobileCapabilities)Request.Browser;
        foreach (String capabilityName in capabilityNames)
        {
            // Is capability met by requesting browser?
            bool result = capabilities.HasCapability(capabilityName, null);

            // Add string with that answer as a list item.
            String label = capabilityName + " = " + result.ToString();
            CapabilityList.Items.Add(new MobileListItem(label));
        }
    }
}
</script>

<mobile:Form runat="server" Paginate="true">
    <mobile:Label runat="server" StyleReference="title" Text="Custom Filters" />
    <mobile:List runat="server" id="CapabilityList" />
</mobile:Form>
