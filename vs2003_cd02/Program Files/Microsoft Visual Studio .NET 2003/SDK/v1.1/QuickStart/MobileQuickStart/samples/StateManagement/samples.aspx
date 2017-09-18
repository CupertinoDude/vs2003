<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="C#" %>

<mobile:Form runat="server" Wrapping="NoWrap" Font-Name="Arial">
    <mobile:Label runat="server" StyleReference="Title" Text="Managing Application State" />
    <mobile:Link runat="server" NavigateURL="cs/OnViewStateExpire.aspx">Dealing with Session State Expiration</mobile:Link>
    <mobile:Link runat="server" NavigateURL="cs/NoViewState.aspx">Turning Off ViewState</mobile:Link>
    <mobile:Link runat="server" NavigateURL="cs/ClientState.aspx">Client State</mobile:Link>
</mobile:Form>



