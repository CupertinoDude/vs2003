<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="JScript" %>
<%@ Register TagPrefix="Acme" TagName="Menu" Src="UserControl.ascx" %>

<script runat="server" language="JScript">

protected function Page_Load(sender:Object , e:EventArgs )
{
    var forms : Form[] = new Form[5];
    forms[0] = NewsForm;
    forms[1] = TrafficForm;
    forms[2] = WeatherForm;
    forms[3] = SportsForm;
    forms[4] = StocksForm;

    MenuCtl.Forms = forms;
}

</script>

<mobile:Form runat="server">
    <mobile:Label runat="server" StyleReference="Title" Text="Main Menu" />
    <Acme:Menu runat="server" id="MenuCtl" />
</mobile:Form>

<mobile:Form runat="server" id="NewsForm" Title="Local News">Local News</mobile:Form>
<mobile:Form runat="server" id="TrafficForm" Title="Traffic Report">Traffic Report</mobile:Form>
<mobile:Form runat="server" id="WeatherForm" Title="Weather Forecast">Weather Forecast</mobile:Form>
<mobile:Form runat="server" id="SportsForm" Title="Sports Scoreboard">Sports Scoreboard</mobile:Form>
<mobile:Form runat="server" id="StocksForm" Title="The Stock Market">The Stock Market</mobile:Form>
