<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="JScript" %>

<script runat="server" language="JScript">

public class WeatherCity
{
    private var cityName : String;
        private var report : String;  
        
    public function WeatherCity( cityName:String, report:String)
    {
        this.cityName = cityName;
        this.report = report;
    }

    public function get CityName() : String
    {
        return this.cityName;
    }

    public function get Report() : String
    {
        return this.report;        
    }
}

protected function Page_Load( sender:Object , e:EventArgs )
{
    if (!IsPostBack)
    {
        var array : ArrayList = new ArrayList();
        array.Add(new WeatherCity("Sydney", "Sunny, 52F"));
        array.Add(new WeatherCity("Tel Aviv", "Sunny, 75F"));
        array.Add(new WeatherCity("New York", "Rainy, 58F"));
        array.Add(new WeatherCity("Madrid", "Cloudy, 70F"));
        array.Add(new WeatherCity("Tokyo", "Cloudy, 65F"));

        MenuList.DataSource = array;
        MenuList.DataBind();
    }
}

protected function Menu_OnItemCommand( sender:Object, e:ListCommandEventArgs )
{
    CityLabel.Text = e.ListItem.Text;
    WeatherLabel.Text = e.ListItem.Value;
    ActiveForm = SecondForm;
}

</script>

<mobile:Form runat="server">
    <mobile:Label runat="server" StyleReference="title">City Menu</mobile:Label>
    <mobile:List runat="server" id="MenuList" OnItemCommand="Menu_OnItemCommand" 
        DataTextField="CityName" DataValueField="Report" />
</mobile:Form>

<mobile:Form id="SecondForm" runat="server">
    <b>Weather for: </b><mobile:Label runat="server" id="CityLabel" />
    <mobile:Label runat="server" id="WeatherLabel" />
</mobile:Form>


