<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="VB" %>

<mobile:Stylesheet runat="server">
    <Style Name="MyForm" BackColor="#ffffff">
        <DeviceSpecific>
            <Choice Filter="IsHTML32" Font-Name="Verdana" Font-Size="Small" />
        </DeviceSpecific>
    </Style>
    <Style Name="FormTitle" 
           Font-Size="Large" Font-Name="Arial" 
           ForeColor="#660000">
        <DeviceSpecific>
            <Choice Filter="IsWML" Font-Italic="True" />
        </DeviceSpecific>
    </Style>
</mobile:Stylesheet>

<mobile:Form runat="server" StyleReference="MyForm">
    <mobile:Label runat="server" StyleReference="FormTitle" Text="My Weather" />
    Welcome to our mobile website. Here you can get the latest weather reports.<br>
</mobile:Form>




