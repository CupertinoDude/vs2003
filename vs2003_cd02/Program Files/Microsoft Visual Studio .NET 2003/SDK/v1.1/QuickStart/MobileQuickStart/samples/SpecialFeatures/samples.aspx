<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="c#" %>

<mobile:Form runat="server" Wrapping="NoWrap" Font-Name="Arial">
    <mobile:Label runat="server" StyleReference="Title" Text="Special Features" />
    <mobile:Link runat="server" NavigateURL="cs/Image.aspx">Using the Image control</mobile:Link>
    <mobile:Link runat="server" NavigateURL="cs/AdRotator.aspx">Using the AdRotator control</mobile:Link>
    <mobile:Link runat="server" NavigateURL="cs/Call.aspx">Initiating phone calls with the Call control</mobile:Link>
    <mobile:Link runat="server" NavigateURL="cs/Calendar.aspx">Choosing dates with the Calendar control</mobile:Link>
</mobile:Form>



