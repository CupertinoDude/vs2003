<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="C#" %>

<mobile:Form runat="server">
    <DeviceSpecific>
        <Choice Filter="IsHTML32">
            <HeaderTemplate>
                <table width="100%" height="100%" cellspacing="1">
                <tr><td bgcolor="#003366">
                    <img src="../images/weather.gif">
                </td></tr>
                <tr><td bgcolor="#cccccc" valign="top" height="100%">
            </HeaderTemplate>
            <FooterTemplate>
                </td></tr>
                <tr><td bgcolor="#003366" height="4"></td></tr>
                </table>
            </FooterTemplate>
        </Choice>
        <Choice>
            <HeaderTemplate>
                <mobile:Label runat="server" StyleReference="Title" Text="THE WEATHER" />
            </HeaderTemplate>
        </Choice>
    </DeviceSpecific>
    <mobile:Label runat="server" Font-Size="Small" Font-Name="Arial" 
        Text="Welcome to our mobile website. Here you can get the latest weather reports." />
</mobile:Form>




