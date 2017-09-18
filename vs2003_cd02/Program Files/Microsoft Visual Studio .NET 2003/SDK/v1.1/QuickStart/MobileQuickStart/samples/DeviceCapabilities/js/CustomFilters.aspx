<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="JScript" Debug="true" %>
<%@ Import Namespace="System.Web.Mobile" %>

<script runat="server" language="JScript">
protected function Page_Load(sender:Object , e:EventArgs )
{
    if (!IsPostBack)
    {
		var capabilities : MobileCapabilities;
        capabilities = MobileCapabilities(Request.Browser);
        var capabilityNames : String[] = ["IsLandscape", "IsPortrait", "IsSmallScreen", "IsBigScreen",
            "UsingChtmlRendering",
            "GoWebOnPalm", "GoWebOnRIM", "MmeOnSony", "MmeOnBenefon",
            "ImodeOnMitsubishi", "ImodeOnFujitsu",
            "UseSmallGif",  "UseMediumGif",  "UseLargeGif",
            "UseSmallWbmp", "UseMediumWbmp", "UseLargeWbmp",
            "UseSmallBmp",  "UseMediumBmp",  "UseLargeBmp"];

		for (var idx in capabilityNames)
		{                                                            
			var capabilityName : String = capabilityNames[idx];
			var result : boolean = capabilities.HasCapability(capabilityName, null);
			var label : String = capabilityName + " = " + Convert.ToString(result);
			CapabilityList.Items.Add(new MobileListItem(label));
   		}
		
    }
}
</script>

<mobile:Form runat="server" Paginate="true">
    <mobile:Label runat="server" StyleReference="title" Text="Custom Filters" />
    <mobile:List runat="server" id="CapabilityList"/>	
</mobile:Form>
