<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="JScript" %>

<script runat="server" language="JScript">

public class WeatherCity
{
    private var cityName : String;
    private var condition : String;
    private var high : String;
    private var low : String;
    private var forecast : String;

    public function WeatherCity( cityName:String, condition:String , high:String , low:String , forecast:String )
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

protected function Page_Load(sender:Object , e:EventArgs)
{
    if (!IsPostBack)
    {
        var array : ArrayList = new ArrayList();
        array.Add(new WeatherCity("Sydney", "Windy", "52F", "40F",
            "Sunny through weekend, with occasional cloudy periods"));
        array.Add(new WeatherCity("Tel Aviv", "Sunny", "75F", "52F",
            "Sunny all weekend"));
        array.Add(new WeatherCity("New York", "Rainy", "58F", "38F",
            "Cold and cloudy with periods of rain"));
        array.Add(new WeatherCity("Madrid", "Cloudy", "70F", "48F",
            "Cloudy with a chance of rain on Sunday"));
        array.Add(new WeatherCity("Tokyo", "Cloudy", "65F", "42F", 
            "Cloudy skies through weekend, clearing Sunday"));

        CitiesList.DataSource = array;
        CitiesList.DataBind();
    }
}

protected function Cities_OnItemCommand(sender:Object , e:ObjectListCommandEventArgs )
{
    CityLabel.Text = e.ListItem["CityName"];
    WeatherLabel.Text = e.ListItem["Forecast"];
    ActiveForm = SecondForm;
}

</script>

<mobile:Form runat="server">
    <mobile:Label runat="server" StyleReference="title">Local Weather</mobile:Label>
    <mobile:ObjectList runat="server" id="CitiesList" AutoGenerateFields="false"
            OnItemCommand="Cities_OnItemCommand" LabelField="CityName">
        <Field DataField="CityName" Title="City" />
        <Field DataField="Condition" Title="Condition" />
        <Field DataField="High" Title="High" />
        <Field DataField="Low" Title="Low" />
        <Field DataField="Forecast" Visible="False" />
        <Command Name="Forecast" Text="Long Range Forecast" />
    </mobile:ObjectList>
</mobile:Form>

<mobile:Form id="SecondForm" runat="server">
    <b>Weather for: </b><mobile:Label runat="server" id="CityLabel" />
    <mobile:Label runat="server" id="WeatherLabel" />
</mobile:Form>


