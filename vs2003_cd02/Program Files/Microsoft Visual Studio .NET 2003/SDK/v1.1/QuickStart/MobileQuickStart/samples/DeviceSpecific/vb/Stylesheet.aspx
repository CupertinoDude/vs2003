<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="VB" %>

<mobile:Stylesheet runat="server">
    <Style Name="MyForm" Font-Size="Small" Font-Name="Arial">
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
    </Style>
</mobile:Stylesheet>

<mobile:Form runat="server" StyleReference="MyForm">
    Welcome to our mobile website. Here you can get the latest weather reports.<br>
    <mobile:Link runat="server" NavigateURL="#SecondForm" Text="Continue" />
</mobile:Form>

<mobile:Form runat="server" id="SecondForm" StyleReference="MyForm">
    <mobile:Label runat="server" Text="This would be the main menu." />
</mobile:Form>




