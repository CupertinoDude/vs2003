<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="VB" %>

<script runat="server" language="VB">

Protected Sub Menu_OnItemCommand(sender As Object, e As ListCommandEventArgs) 

    CityLabel.Text = String.Format("Weather for {0}", e.ListItem.Text)
    WeatherLabel.Text = e.ListItem.Value
    ActiveForm = SecondForm

End Sub

</script>

<mobile:Form runat="server">
    <mobile:Label runat="server" StyleReference="title">City Menu</mobile:Label>
    <mobile:List runat="server" OnItemCommand="Menu_OnItemCommand">
        <Item Text="Sydney" Value="Sunny, 52F" />
        <Item Text="Tel Aviv" Value="Sunny, 75F" />
        <Item Text="New York" Value="Rainy, 58F" />
        <Item Text="Madrid" Value="Cloudy, 70F" />
        <Item Text="Tokyo" Value="Cloudy, 65F" />
    </mobile:List>
</mobile:Form>

<mobile:Form id="SecondForm" runat="server">
    <mobile:Label runat="server" id="CityLabel" StyleReference="title" />
    <mobile:Label runat="server" id="WeatherLabel" />
</mobile:Form>


