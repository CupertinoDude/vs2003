<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="VB" %>

<mobile:Form runat="server" id="FirstForm">
    <mobile:Label runat="server" StyleReference="title">This is the first form</mobile:Label>
    <mobile:Link runat="server" NavigateURL="#SecondForm">Next Form</mobile:Link>
</mobile:Form>

<mobile:Form runat="server" id="SecondForm">
    <mobile:Label runat="server" StyleReference="title">This is the second form</mobile:Label>
    <mobile:Link runat="server" NavigateURL="#FirstForm">First Form</mobile:Link>
</mobile:Form>


