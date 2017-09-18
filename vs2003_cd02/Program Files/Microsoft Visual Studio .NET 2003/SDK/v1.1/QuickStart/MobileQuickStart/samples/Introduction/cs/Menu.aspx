<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="C#" %>

<script runat="server" language="c#">

protected void Menu_OnItemCommand(Object sender, ListCommandEventArgs e)
{
    CityLabel.Text = String.Format("Weather for {0}", e.ListItem.Text);
    WeatherLabel.Text = e.ListItem.Value;
    ActiveForm = SecondForm;
}

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


