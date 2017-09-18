<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="C#" %>

<mobile:Form runat="server" Wrapping="NoWrap" Font-Name="Arial">
    <mobile:Label runat="server" StyleReference="Title" Text="Introducing Mobile Web Forms" />
    <mobile:Link runat="server" NavigateURL="cs/SimpleForm.aspx">A Simple Mobile Web Form</mobile:Link>
    <mobile:Link runat="server" NavigateURL="cs/MultipleForms.aspx">Placing Multiple Forms on a Page</mobile:Link>
    <mobile:Link runat="server" NavigateURL="cs/ControlEvents.aspx">Responding to Control Events</mobile:Link>
    <mobile:Link runat="server" NavigateURL="cs/Menu.aspx">Showing a Menu</mobile:Link>
    <mobile:Link runat="server" NavigateURL="cs/DisplayText.aspx">Displaying Text</mobile:Link>
</mobile:Form>



