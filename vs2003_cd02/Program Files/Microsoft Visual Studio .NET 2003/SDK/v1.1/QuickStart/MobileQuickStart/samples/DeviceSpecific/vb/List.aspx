<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="VB" %>

<script runat="server" language="VB">

Public Class WeatherCity

    Dim _cityName, _condition, _high, _low As String
    Dim _image As Int32

    Public Sub New(cityName As String, condition As String, high As String, low As String, imageNum as Int32)

        _cityName = cityName
        _condition = condition
        _high = high
        _low = low
        _image = imageNum

    End Sub

    Public ReadOnly Property CityName As String
        Get
            Return _cityName
        End Get
    End Property

    Public ReadOnly Property Condition As String
        Get
            Return _condition
        End Get
    End Property

    Public ReadOnly Property High As String
        Get
            Return _high
        End Get
    End Property

    Public ReadOnly Property Low As String
        Get
            Return _low
        End Get
    End Property

    Public ReadOnly Property Summary As String
        Get
            Return String.Format("{0}: {1}, High {2}, Low {3}", _
                                 CityName, Condition, High, Low)
        End Get
    End Property

    Public ReadOnly Property ImageUrl As String
        Get
            If (_image = 1)
                Return "../images/sunny.gif"
            Else If (_image = 2)
                Return "../images/cloudy.gif"
            Else
                Return "../images/rainy.gif"
            End If
        End Get
    End Property

End Class

Protected Sub Page_Load(sender As Object, e As EventArgs)

    If (IsPostBack = False)

        Dim arr As ArrayList = New ArrayList()
        arr.Add(New WeatherCity("Sydney", "Sunny", "52F", "40F", 1)) 
        arr.Add(New WeatherCity("Tel Aviv", "Sunny", "75F", "52F", 1)) 
        arr.Add(New WeatherCity("New York", "Rainy", "58F", "38F", 3)) 
        arr.Add(New WeatherCity("Madrid", "Cloudy", "70F", "48F", 2)) 
        arr.Add(New WeatherCity("Tokyo", "Cloudy", "65F", "42F", 2)) 

        CitiesList.DataSource = arr
        CitiesList.DataBind()
    
    End If

End Sub

Protected Sub CitiesList_OnItemCommand(sender As Object, e As ListCommandEventArgs)

    CityLabel.Text = String.Format("More information for {0}", e.ListItem.Value)
    ActiveForm = SecondForm

End Sub

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
                            <b><%# CType(CType(Container, MobileListItem).DataItem, WeatherCity).CityName %></b>
                        </asp:LinkButton><br />
                        <img align="left" 
                            src="<%# CType(CType(Container, MobileListItem).DataItem, WeatherCity).ImageUrl %>"
                            width="24" height="24" />
                        <font size="-1">
                        <b>High: </b><%# CType(CType(Container, MobileListItem).DataItem, WeatherCity).High %>
                        <b>Low: </b><%# CType(CType(Container, MobileListItem).DataItem, WeatherCity).Low %>
                        </font>
                     </font></td></tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                     <tr><td bgcolor="#eeeeee"><font face="Arial">
                        <asp:LinkButton runat="server">
                            <b><%# CType(CType(Container, MobileListItem).DataItem, WeatherCity).CityName %></b>
                        </asp:LinkButton><br />
                        <img align="left" 
                            src="<%# CType(CType(Container, MobileListItem).DataItem, WeatherCity).ImageUrl %>"
                            width="24" height="24" />
                        <font size="-1">
                        <b>High: </b><%# CType(CType(Container, MobileListItem).DataItem, WeatherCity).High %>
                        <b>Low: </b><%# CType(CType(Container, MobileListItem).DataItem, WeatherCity).Low %>
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



