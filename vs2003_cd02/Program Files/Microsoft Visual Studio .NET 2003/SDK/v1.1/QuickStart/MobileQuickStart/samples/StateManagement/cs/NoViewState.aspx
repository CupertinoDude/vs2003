<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="C#" EnableViewState="false" %>

<script runat="server" language="c#">

public class WeatherCity
{
    private String cityName, condition, high, low, forecast;

    public WeatherCity(String cityName, String condition, String high, String low, String forecast)
    {
        this.cityName = cityName;
        this.condition = condition;
        this.high = high;
        this.low = low;
        this.forecast = forecast;
    }

    public String CityName { get { return this.cityName; } }
    public String Condition { get { return this.condition; } }
    public String High { get { return this.high; } }
    public String Low { get { return this.low; } }
    public String Forecast { get { return this.forecast; } }
}

private static WeatherCity[] _weather = new WeatherCity[]
    {
        new WeatherCity("Sydney", "Windy", "52F", "40F",
            "Sunny through weekend, with occasional cloudy periods"),
        new WeatherCity("Tel Aviv", "Sunny", "75F", "52F",
            "Sunny all weekend"),
        new WeatherCity("New York", "Rainy", "58F", "38F",
            "Cold and cloudy with periods of rain"),
        new WeatherCity("Madrid", "Cloudy", "70F", "48F",
            "Cloudy with a chance of rain on Sunday"),
        new WeatherCity("Tokyo", "Cloudy", "65F", "42F", 
            "Cloudy skies through weekend, clearing Sunday")
    };

private WeatherCity GetWeather(String cityName)
{
    // This method would typically do a data query.

    for (int i = 0; i < _weather.Length; i++)
    {
        if (_weather[i].CityName == cityName)
        {
            return _weather[i];
        }
    }

    return null;
}

protected void Page_Load(Object sender, EventArgs e)
{
    if (ActiveForm == CityForm)
    {
        CitiesList.DataSource = _weather;
        CitiesList.DataBind();
    }
}

protected void Cities_OnItemCommand(Object sender, ListCommandEventArgs e)
{
    String cityName = e.ListItem.Value;
    WeatherCity city = GetWeather(cityName);
    if (city != null)
    {
        CityLabel.Text = city.CityName;
        WeatherLabel.Text = city.Forecast;
        ActiveForm = SecondForm;
    }
}

</script>

<mobile:Form id="CityForm" runat="server">
    <mobile:Label runat="server" StyleReference="title">Local Weather</mobile:Label>
    <mobile:List runat="server" id="CitiesList" DataTextField="CityName" 
            OnItemCommand="Cities_OnItemCommand" />
</mobile:Form>

<mobile:Form id="SecondForm" runat="server">
    <b>Weather for: </b><mobile:Label runat="server" id="CityLabel" />
    <mobile:Label runat="server" id="WeatherLabel" />
</mobile:Form>


