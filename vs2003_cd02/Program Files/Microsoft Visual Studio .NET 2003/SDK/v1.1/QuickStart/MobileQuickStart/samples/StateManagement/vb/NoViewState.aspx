<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="VB" EnableViewState="false" %>

<script runat="server" language="VB">

Public Class WeatherCity

    Dim _cityName, _condition, _high, _low, _forecast As String

    Public Sub New(cityName As String, condition As String, high As String, low As String, forecast As String)

        _cityName = cityName
        _condition = condition
        _high = high
        _low = low
        _forecast = forecast

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

    Public ReadOnly Property Forecast As String
        Get
            Return _forecast
        End Get
    End Property

End Class

Dim Shared _weather() As WeatherCity = _
    { _
        New WeatherCity("Sydney", "Windy", "52F", "40F", "Sunny through weekend, with occasional cloudy periods"), _
        New WeatherCity("Tel Aviv", "Sunny", "75F", "52F", "Sunny all weekend"), _
        New WeatherCity("New York", "Rainy", "58F", "38F", "Cold and cloudy with periods of rain"), _
        New WeatherCity("Madrid", "Cloudy", "70F", "48F", "Cloudy with a chance of rain on Sunday"), _
        New WeatherCity("Tokyo", "Cloudy", "65F", "42F", "Cloudy skies through weekend, clearing Sunday") _
    }

Private Function GetWeather(cityName As String) As WeatherCity

    ' This method would typically do a data query.

    Dim i As Integer
    For i = 0 To _weather.Length 

        If (_weather(i).CityName = cityName)

            GetWeather = _weather(i)
            Exit Function

        End If

    Next
    GetWeather = Nothing

End Function

Protected Sub Page_Load(sender As Object, e As EventArgs)

    If (ActiveForm Is CityForm)

        CitiesList.DataSource = _weather 
        CitiesList.DataBind() 

    End If

End Sub

Protected Sub Cities_OnItemCommand(sender As Object, e As ListCommandEventArgs)

    Dim cityName As String = e.ListItem.Value
    Dim city As WeatherCity = GetWeather(cityName)
    If (Not (city Is Nothing))

        CityLabel.Text = city.CityName
        WeatherLabel.Text = city.Forecast
        ActiveForm = SecondForm

    End If

End Sub

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


