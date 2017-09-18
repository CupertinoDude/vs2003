<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="C#" %>
<%@ Import Namespace="System.Web.Mobile" %>

<script runat="server" language="c#">

public class WeatherCity
{
    private String cityName, condition, high, low;
    private int image;

    public WeatherCity(String cityName, String condition, String high, String low, int image)
    {
        this.cityName = cityName;
        this.condition = condition;
        this.high = high;
        this.low = low;
        this.image = image;
    }

    public String CityName { get { return this.cityName; } }
    public String Condition { get { return this.condition; } }
    public String High { get { return this.high; } }
    public String Low { get { return this.low; } }
    
    public String Summary 
    { 
        get 
        {
            return String.Format("{0}: {1}, High {2}, Low {3}",
                                 CityName, Condition, High, Low);
        } 
    }
    
    public String ImageUrl 
    { 
        get 
        { 
            switch(image) 
            {
                case 1:
                    return "../images/sunny.gif";
                    break;
                case 2:
                    return "../images/cloudy.gif";
                    break;
                default:
                    return "../images/rainy.gif";
                    
            }
        }
    }
}

protected void Page_Load(Object sender, EventArgs e)
{
    if (!IsPostBack)
    {
        ArrayList array = new ArrayList();
        array.Add(new WeatherCity ("Sydney", "Sunny", "52F", "40F", 1));
        array.Add(new WeatherCity ("Tel Aviv", "Sunny", "75F", "52F", 1));
        array.Add(new WeatherCity ("New York", "Rainy", "58F", "38F", 3));
        array.Add(new WeatherCity ("Madrid", "Cloudy", "70F", "48F", 2));
        array.Add(new WeatherCity ("Tokyo", "Cloudy", "65F", "42F", 2));

        CitiesList.DataSource = array;
        CitiesList.DataBind ();
    }
}

protected void CitiesList_OnItemCommand(Object sender, ListCommandEventArgs e)
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
                            <b><%# ((WeatherCity)((MobileListItem)Container).DataItem).CityName %></b>
                        </asp:LinkButton><br />
                        <img align="left" 
                            src="<%# ((WeatherCity)((MobileListItem)Container).DataItem).ImageUrl %>"
                            width="24" height="24" />
                        <font size="-1">
                        <b>High: </b><%# ((WeatherCity)((MobileListItem)Container).DataItem).High %>
                        <b>Low: </b><%# ((WeatherCity)((MobileListItem)Container).DataItem).Low %>
                        </font>
                     </font></td></tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                     <tr><td bgcolor="#eeeeee"><font face="Arial">
                        <asp:LinkButton runat="server">
                            <b><%# ((WeatherCity)((MobileListItem)Container).DataItem).CityName %></b>
                        </asp:LinkButton><br />
                        <img align="left" 
                            src="<%# ((WeatherCity)((MobileListItem)Container).DataItem).ImageUrl %>"
                            width="24" height="24" />
                        <font size="-1">
                        <b>High: </b><%# ((WeatherCity)((MobileListItem)Container).DataItem).High %>
                        <b>Low: </b><%# ((WeatherCity)((MobileListItem)Container).DataItem).Low %>
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



