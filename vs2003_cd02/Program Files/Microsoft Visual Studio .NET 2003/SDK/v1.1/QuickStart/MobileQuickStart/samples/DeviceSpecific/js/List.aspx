<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="JScript" %>
<%@ Import Namespace="System.Web.Mobile" %>

<script runat="server" language="JScript">

public class WeatherCity
{
    private var cityName : String;
    private var condition : String;
    private var high : String;
    private var low : String;
        
    public function WeatherCity( cityName:String, condition:String , high:String , low:String)
    {
        this.cityName = cityName;
        this.condition = condition;
        this.high = high;
        this.low = low;
    }
        public function get CityName() : String { return this.cityName; }
    public function get Condition() : String{ return this.condition; }
    public function get High() : String { return this.high; }
    public function get Low() : String { return this.low; }
        
    public function get Summary() : String
    { 
                return CityName + String.Format(": {0}, High {1}, Low {2}", Condition, High, Low);
    }
    
    public function get ImageUrl() : String { return "../images/" + Condition + ".gif"; }
}

protected function Page_Load(sender:Object , e:EventArgs )
{
    if (!IsPostBack)
    {
        var array : ArrayList = new ArrayList();
        array.Add(new WeatherCity ("Sydney", "Sunny", "52F", "40F"));
        array.Add(new WeatherCity ("Tel Aviv", "Sunny", "75F", "52F"));
        array.Add(new WeatherCity ("New York", "Rainy", "58F", "38F"));
        array.Add(new WeatherCity ("Madrid", "Cloudy", "70F", "48F"));
        array.Add(new WeatherCity ("Tokyo", "Cloudy", "65F", "42F"));

        CitiesList.DataSource = array;
        CitiesList.DataBind ();
    }
}

protected function CitiesList_OnItemCommand(sender:Object , e:ListCommandEventArgs )
{
    CityLabel.Text = String.Format("More information for {0}", e.ListItem.Value);
    ActiveForm = SecondForm;
}

</script>

<mobile:Form runat="server" Wrapping="NoWrap">
    <mobile:Label runat="server" StyleReference="title" Font-Name="Arial" Font-Size="Large">Local Weather</mobile:Label>
    <mobile:List runat="server" id="CitiesList" 
            DataTextField="Summary" DataValueField="CityName"
            OnItemCommand="CitiesList_OnItemCommand">
        <DeviceSpecific>
            <Choice Filter="IsScriptableHtml32">
                <HeaderTemplate>
                    <table width="100%">
                </HeaderTemplate>
                <ItemTemplate>
                     <tr><td bgcolor="#cccccc"><font face="Arial">
                        <asp:LinkButton runat="server">
                            <b><%# (WeatherCity((MobileListItem(Container)).DataItem)).CityName %></b>
                        </asp:LinkButton><br />
                        <img align="left" 
                            src="<%# (WeatherCity((MobileListItem(Container)).DataItem)).ImageUrl %>"
                            width="24" height="24" />
                        <font size="-1">
                        <b>High: </b><%# (WeatherCity((MobileListItem(Container)).DataItem)).High %>
                        <b>Low: </b><%# (WeatherCity((MobileListItem(Container)).DataItem)).Low %>
                        </font>
                     </font></td></tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                     <tr><td bgcolor="#eeeeee"><font face="Arial">
                        <asp:LinkButton runat="server">
                            <b><%# (WeatherCity((MobileListItem(Container)).DataItem)).CityName %></b>
                        </asp:LinkButton><br />
                        <img align="left" 
                            src="<%# (WeatherCity((MobileListItem(Container)).DataItem)).ImageUrl %>"
                            width="24" height="24" />
                        <font size="-1">
                        <b>High: </b><%# (WeatherCity((MobileListItem(Container)).DataItem)).High %>
                        <b>Low: </b><%# (WeatherCity((MobileListItem(Container)).DataItem)).Low %>
                        </font>
                     </font></td></tr>
                </AlternatingItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </Choice>
        </DeviceSpecific>
    </mobile:List>
</mobile:Form>

<mobile:Form id="SecondForm" runat="server">
    <mobile:Label runat="server" id="CityLabel" StyleReference="title" />
</mobile:Form>



