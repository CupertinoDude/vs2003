<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="VB" %>

<script runat="server" >

Dim GreetingText As String

Sub GoCommand_OnClick(Sender As Object, E As EventArgs)
    GreetingText = String.Format("Hello, {0}!", NameEdit.Text)
    ActiveForm = SecondForm
End Sub

Sub SecondForm_OnActivate(Sender As Object, E As EventArgs)
    Greeting.Text = Server.HtmlEncode(GreetingText)
End Sub

</script>

<mobile:StyleSheet runat="server">

    <Style name="Form" Font-Name="Arial" />
    <Style name="BlueForm" StyleReference="Form" BackColor="#336699" ForeColor="#ffffff" />
    <Style name="Title" Font-Size="Large" />
    <Style name="SmallLink" Font-Size="Small" />

</mobile:StyleSheet>

<mobile:Form runat="server" id="FirstForm" StyleReference="BlueForm">
    <mobile:Label runat="server" StyleReference="Title">What is your name?</mobile:Label>
    <mobile:TextBox runat="server" id="NameEdit" ForeColor="#000000" />
    <mobile:Command runat="server" OnClick="GoCommand_OnClick" Text="Go!" />
</mobile:Form>

<mobile:Form runat="server" id="SecondForm" OnActivate="SecondForm_OnActivate" StyleReference="Form">
    <mobile:Label runat="server" id="Greeting" StyleReference="Title" />
    <mobile:Link runat="server" StyleReference="SmallLink" NavigateURL="#FirstForm" Text="Return to Start" />
</mobile:Form>


