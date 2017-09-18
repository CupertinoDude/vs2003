<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="VB" %>

<script runat="server" language="VB">

Public Class WeatherCity

    Dim _cityName, _report As String

    Public Sub New(cityName As String, report As String)

        _cityName = cityName
        _report = report

    End Sub

    Public ReadOnly Property CityName As String

        Get
            Return _cityName 
        End Get

    End Property

    Public ReadOnly Property Report As String

        Get
            Return _report
        End Get

    End Property

End Class

Protected Sub Page_Load(sender As Object, e As EventArgs)

    If (Not IsPostBack)

        Dim array As New ArrayList()

        array.Add(New WeatherCity("Sydney", "Sunny, 52F"))
        array.Add(New WeatherCity("Tel Aviv", "Sunny, 75F"))
        array.Add(New WeatherCity("New York", "Rainy, 58F"))
        array.Add(New WeatherCity("Madrid", "Cloudy, 70F"))
        array.Add(New WeatherCity("Tokyo", "Cloudy, 65F"))

        MenuList.DataSource = array 
        MenuList.DataBind() 

    End If

End Sub

Protected Sub Menu_OnItemCommand(sender As Object, e As ListCommandEventArgs)

    CityLabel.Text = e.ListItem.Text
    WeatherLabel.Text = e.ListItem.Value
    ActiveForm = SecondForm

End Sub

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


