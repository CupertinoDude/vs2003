<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="JScript" %>

<script runat="server" language="JScript">

protected function Continue_OnClick(sender:Object , e:EventArgs )
{
    ActiveForm = MenuForm;
}

</script>

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
    <mobile:Panel runat="server">
        <DeviceSpecific>
            <Choice Filter="IsScriptableHtml32">
                <ContentTemplate>
                    <br><br>
                    <table width="40" bgcolor="#660000"><tr><td>
                    <a runat="server" OnServerClick="Continue_OnClick">
                    <font face="Verdana" color="#ffffff" size="-1"><b>CONTINUE</b></font>
                    </a>
                    </td></tr></table>
                </ContentTemplate>
            </Choice>
        </DeviceSpecific>
        <mobile:Command runat="server" OnClick="Continue_OnClick" Text="Continue" />
    </mobile:Panel>

</mobile:Form>

<mobile:Form runat="server" id="MenuForm">
    <mobile:Label runat="server" Text="This would be the main menu." />
</mobile:Form>



