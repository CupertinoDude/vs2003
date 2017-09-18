<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="JScript" EnableViewState="false" Debug="true" %>

<script runat="server" language="JScript">

public class WeatherCity
{
    private var cityName : String;
    private var condition : String;
    private var high : String;
    private var low : String;
    private var forecast : String;
    
    public function WeatherCity(cityName:String , condition:String , 
                       high:String , low:String , forecast:String)
    {
        this.cityName = cityName;
        this.condition = condition;
        this.high = high;
        this.low = low;
        this.forecast = forecast;
    }
        
    public function get CityName() : String { return this.cityName; }
    public function get Condition() : String{ return this.condition; }
    public function get High() : String { return this.high; }
    public function get Low() : String { return this.low; }
    public function get Forecast() : String { return this.forecast; }
}

private var _weather : WeatherCity[] = [
        new WeatherCity("Sydney", "Windy", "52F", "40F",
          "Sunny through weekend, with occasional cloudy periods"),
    new WeatherCity("Tel Aviv", "Sunny", "75F", "52F",
            "Sunny all weekend"),   
    new WeatherCity("New York", "Rainy", "58F", "38F",
            "old and cloudy with periods of rain"),
    new WeatherCity("Madrid", "Cloudy", "70F", "48F",
           "Cloudy with a chance of rain on Sunday"),
    new WeatherCity("Tokyo", "Cloudy", "65F", "42F", 
            "Cloudy skies through weekend, clearing Sunday")];
        

private function GetWeather(cityName:String ):WeatherCity
{
    // This method would typically do a data query.

    for (var i: int = 0; i < _weather.Length; i++)
    {
        if (_weather[i].CityName == cityName)
        {
            return _weather[i];
        }
    }

    return null;
}

protected function Page_Load(sender:Object , e:EventArgs )
{
        if (ActiveForm == CityForm)
    {
        CitiesList.DataSource = _weather;
        CitiesList.DataBind();
    }
}

protected function Cities_OnItemCommand(sender:Object , e:ListCommandEventArgs )
{
    var cityName : String = e.ListItem.Value;
    var city : WeatherCity  = GetWeather(cityName);
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


