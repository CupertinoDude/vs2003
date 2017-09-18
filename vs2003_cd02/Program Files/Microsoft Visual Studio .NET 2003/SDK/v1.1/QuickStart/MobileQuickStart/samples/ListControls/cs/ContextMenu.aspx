<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="C#" %>

<script runat="server" language="c#">

public class WeatherCity
{
    private String cityName, condition, high, low, forecast;
    private bool hasWeatherMap;

    public WeatherCity(String cityName, String condition, 
                       String high, String low, String forecast, bool hasWeatherMap)
    {
        this.cityName = cityName;
        this.condition = condition;
        this.high = high;
        this.low = low;
        this.forecast = forecast;
        this.hasWeatherMap = hasWeatherMap;
    }

    public String CityName { get { return this.cityName; } }
    public String Condition { get { return this.condition; } }
    public String High { get { return this.high; } }
    public String Low { get { return this.low; } }
    public String Forecast { get { return this.forecast; } }
    public bool HasWeatherMap { get { return this.hasWeatherMap; } }
}

protected void Page_Load(Object sender, EventArgs e)
{
    if (!IsPostBack)
    {
        ArrayList array = new ArrayList();
        array.Add(new WeatherCity("Sydney", "Sunny", "52F", "40F",
            "Sunny through weekend, with occasional cloudy periods", false));
        array.Add(new WeatherCity("Tel Aviv", "Sunny", "75F", "52F",
            "Sunny all weekend", true));
        array.Add(new WeatherCity("New York", "Rainy", "58F", "38F",
            "Cold and cloudy with periods of rain", false));
        array.Add(new WeatherCity("Madrid", "Cloudy", "70F", "48F",
            "Cloudy with a chance of rain on Sunday", true));
        array.Add(new WeatherCity("Tokyo", "Cloudy", "65F", "42F", 
            "Cloudy skies through weekend, clearing Sunday", true));

        CitiesList.DataSource = array;
        CitiesList.DataBind();
    }
}

protected void Cities_OnShowItemCommands(Object sender, ObjectListShowCommandsEventArgs e)
{
    if (e.ListItem["HasWeatherMap"] == "True")
    {
        e.Commands.Add(new ObjectListCommand("WeatherMap", "Show Weather Map"));
    }
}

protected void Cities_OnItemCommand(Object sender, ObjectListCommandEventArgs e)
{
    CityLabel.Text = e.ListItem["CityName"];
    if (e.CommandName == "WeatherMap")
    {
        WeatherLabel.Text = "Show weather map";
    }
    else
    {
        WeatherLabel.Text = e.ListItem["Forecast"];
    }
    ActiveForm = SecondForm;
}

</script>

<mobile:Form runat="server">
    <mobile:Label runat="server" StyleReference="title">Local Weather</mobile:Label>
    <mobile:ObjectList runat="server" id="CitiesList" AutoGenerateFields="false"
            OnItemCommand="Cities_OnItemCommand" LabelField="CityName"
            OnShowItemCommands="Cities_OnShowItemCommands">
        <Field DataField="CityName" Title="City" />
        <Field DataField="Condition" Title="Condition" />
        <Field DataField="High" Title="High" />
        <Field DataField="Low" Title="Low" />
        <Field DataField="Forecast" Visible="False" />
        <Field DataField="HasWeatherMap" Visible="False" />
        <Command Name="Forecast" Text="Long Range Forecast" />
    </mobile:ObjectList>
</mobile:Form>

<mobile:Form id="SecondForm" runat="server">
    <b>Weather for: </b><mobile:Label runat="server" id="CityLabel" />
    <mobile:Label runat="server" id="WeatherLabel" />
</mobile:Form>


