<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="C#" %>

<script runat="server" language="c#">

public class WeatherCity
{
    private String cityName, report;

    public WeatherCity(String cityName, String report)
    {
        this.cityName = cityName;
        this.report = report;
    }

    public String CityName
    {
        get
        {
            return this.cityName;
        }
    }

    public String Report
    {
        get
        {
            return this.report;
        }
    }
}

protected void Page_Load(Object sender, EventArgs e)
{
    if (!IsPostBack)
    {
        ArrayList array = new ArrayList();
        array.Add(new WeatherCity("Sydney", "Sunny, 52F"));
        array.Add(new WeatherCity("Tel Aviv", "Sunny, 75F"));
        array.Add(new WeatherCity("New York", "Rainy, 58F"));
        array.Add(new WeatherCity("Madrid", "Cloudy, 70F"));
        array.Add(new WeatherCity("Tokyo", "Cloudy, 65F"));

        MenuList.DataSource = array;
        MenuList.DataBind();
    }
}

protected void Menu_OnItemCommand(Object sender, ListCommandEventArgs e)
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


