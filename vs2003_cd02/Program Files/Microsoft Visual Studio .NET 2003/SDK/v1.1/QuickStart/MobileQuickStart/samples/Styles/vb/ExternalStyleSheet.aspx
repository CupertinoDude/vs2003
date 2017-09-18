<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="VB" %>

<script runat="server" >

Dim GreetingText As String

Sub GoCommand_OnClick(Sender As Object, E As EventArgs)
    GreetingText = String.Format("Hello, {0}!", NameEdit.Text)
    ActiveForm = SecondForm
End Sub

Sub SecondForm_OnActivate(Sender As Object, E As EventArgs)
    Greeting.Text = GreetingText
End Sub

</script>

<mobile:StyleSheet runat="server" ReferencePath="../DefinedStyleSheet.ascx" />

<mobile:Form runat="server" id="FirstForm" StyleReference="BlueForm">
    <mobile:Label runat="server" StyleReference="Title">What is your name?</mobile:Label>
    <mobile:TextBox runat="server" id="NameEdit" ForeColor="#000000" />
    <mobile:Command runat="server" OnClick="GoCommand_OnClick" Text="Go!" />
</mobile:Form>

<mobile:Form runat="server" id="SecondForm" OnActivate="SecondForm_OnActivate" StyleReference="Form">
    <mobile:Label runat="server" id="Greeting" StyleReference="Title" />
    <mobile:Link runat="server" StyleReference="SmallLink" NavigateURL="#FirstForm" Text="Return to Start" />
</mobile:Form>


