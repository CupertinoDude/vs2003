<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="VB" %>
<%@ Import Namespace="System.Web.Mobile" %>

<script runat="server" language="VB">

Protected Sub Page_Load(sender As Object, e As EventArgs)

    If Not IsPostBack

        Dim capabilityNames() as String = { _
            "IsLandscape", "IsPortrait", "IsSmallScreen", "IsBigScreen", _
            "UsingChtmlRendering", _
            "GoWebOnPalm", "GoWebOnRIM", "MmeOnSony", "MmeOnBenefon", _
            "ImodeOnMitsubishi", "ImodeOnFujitsu", _
            "UseSmallGif",  "UseMediumGif",  "UseLargeGif", _
            "UseSmallWbmp", "UseMediumWbmp", "UseLargeWbmp", _
            "UseSmallBmp",  "UseMediumBmp",  "UseLargeBmp" }

        Dim capabilities As MobileCapabilities = CType(Request.Browser, MobileCapabilities)
        Dim capabilityName As String
        For Each capabilityName In capabilityNames

            ' Is capability met by requesting browser?
            Dim result As Boolean = capabilities.HasCapability(capabilityName, Nothing)

            ' Add string with that answer as a list item.
            Dim label As String = capabilityName & " = " & result.ToString()
            CapabilityList.Items.Add(New MobileListItem(label))

        Next

    End If
End Sub

</script>

<mobile:Form runat="server" Paginate="true">
    <mobile:Label runat="server" StyleReference="title" Text="Custom Filters" />
    <mobile:List runat="server" id="CapabilityList" />
</mobile:Form>
