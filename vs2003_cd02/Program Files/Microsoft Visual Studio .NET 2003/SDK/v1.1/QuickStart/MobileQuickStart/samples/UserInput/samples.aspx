<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="c#" %>

<mobile:Form runat="server" Wrapping="NoWrap" Font-Name="Arial">
    <mobile:Label runat="server" StyleReference="Title" Text="Handling User Input" />
    <mobile:Link runat="server" NavigateURL="cs/TextBoxes.aspx">Passwords and Numeric Input</mobile:Link>
    <mobile:Link runat="server" NavigateURL="cs/SelectionList.aspx">Using a Selection List</mobile:Link>
    <mobile:Link runat="server" NavigateURL="cs/Validation.aspx">Validation</mobile:Link>
    <mobile:Link runat="server" NavigateURL="cs/ValidationSummary.aspx">Validation Summary</mobile:Link>
</mobile:Form>



