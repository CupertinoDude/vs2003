<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="C#" %>

<mobile:Form runat="server" Wrapping="NoWrap" Font-Name="Arial">
    <mobile:Label runat="server" StyleReference="Title" Text="Template Sets" />
    <mobile:Link runat="server" NavigateURL="cs/Override.aspx">Property Overrides</mobile:Link>
    <mobile:Link runat="server" NavigateURL="cs/List.aspx">A Templated List</mobile:Link>
    <mobile:Link runat="server" NavigateURL="cs/Form.aspx">A Templated Form</mobile:Link>
    <mobile:Link runat="server" NavigateURL="cs/Stylesheet.aspx">Template Sets in Stylesheets</mobile:Link>
    <mobile:Link runat="server" NavigateURL="cs/Arbitrary.aspx">Inserting Arbitrary Content</mobile:Link>
    <mobile:Link runat="server" NavigateURL="cs/Programming.aspx">Device-Specific Programming</mobile:Link>
</mobile:Form>



