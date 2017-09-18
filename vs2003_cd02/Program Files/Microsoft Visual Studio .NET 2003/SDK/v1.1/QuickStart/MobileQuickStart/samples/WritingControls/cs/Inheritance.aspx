<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="C#" %>
<%@ Register TagPrefix="Acme" Namespace="Acme.CustomControlsCS" Assembly="Acme.CustomControlsCS" %>

<mobile:Form runat="server">
    <mobile:Label runat="server" StyleReference="Title" Text="Main Menu" />
    <Acme:Menu runat="server" />
</mobile:Form>

<mobile:Form runat="server" id="NewsForm" Title="Local News">Local News</mobile:Form>
<mobile:Form runat="server" id="TrafficForm" Title="Traffic Report">Traffic Report</mobile:Form>
<mobile:Form runat="server" id="WeatherForm" Title="Weather Forecast">Weather Forecast</mobile:Form>
<mobile:Form runat="server" id="SportsForm" Title="Sports Scoreboard">Sports Scoreboard</mobile:Form>
<mobile:Form runat="server" id="StocksForm" Title="The Stock Market">The Stock Market</mobile:Form>
