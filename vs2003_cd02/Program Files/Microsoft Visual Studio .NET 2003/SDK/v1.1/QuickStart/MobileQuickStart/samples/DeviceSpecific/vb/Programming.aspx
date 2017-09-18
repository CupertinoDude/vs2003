<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="VB" %>

<script runat="server" language="VB">

Protected Sub Continue_OnClick(sender As Object, e As EventArgs)

    If (Request.Browser("preferredRenderingType") = "html32")

        ActiveForm = HTML32MenuForm 
    
    Else

        ActiveForm = QuickWeatherForm

    End If

End Sub

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
    <mobile:Command runat="server" OnClick="Continue_OnClick" Text="Continue" />

</mobile:Form>

<mobile:Form runat="server" id="HTML32MenuForm">
    
    <mobile:Label runat="server" Font-Size="Large" Font-Name="Arial" Font-Bold="True" Text="Weather Menu" />
    <mobile:Link runat=server NavigateURL="#HTML32MenuForm" Text="Local Weather" />
    <mobile:Link runat=server NavigateURL="#HTML32MenuForm" Text="Long-Range Forecasts" />
    <mobile:Link runat=server NavigateURL="#HTML32MenuForm" Text="Weather Warnings" />
    <mobile:Link runat=server NavigateURL="#HTML32MenuForm" Text="Satellite Maps" />
    <mobile:Link runat=server NavigateURL="#HTML32MenuForm" Text="Personalize" />

</mobile:Form>

<mobile:Form runat="server" id="QuickWeatherForm">
    <mobile:Label runat="server" Font-Italic="True" Text="Weather Update" />
    The local weather in your city is...
</mobile:Form>



