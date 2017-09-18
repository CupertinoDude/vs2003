<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="JScript" %>

<script runat="server" language="JScript">

var greetingText : String;

protected function GoCommand_OnClick(sender:Object , e:EventArgs )
{
    greetingText = String.Format("Hello, {0}!", NameEdit.Text);
    ActiveForm = SecondForm;
}

protected function SecondForm_OnActivate(sender:Object , e:EventArgs )
{
    Greeting.Text = Server.HtmlEncode(greetingText);
}

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


