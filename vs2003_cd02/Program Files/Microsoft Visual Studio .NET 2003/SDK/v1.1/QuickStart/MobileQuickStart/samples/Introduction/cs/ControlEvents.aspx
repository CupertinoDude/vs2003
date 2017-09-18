<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="C#" %>

<script runat="server" language="c#">

string greetingText;

protected void GoCommand_OnClick(Object sender, EventArgs e)
{
    greetingText = String.Format("Hello, {0}!", NameEdit.Text);
    ActiveForm = SecondForm;
}

protected void SecondForm_OnActivate(Object sender, EventArgs e)
{
    Greeting.Text = Server.HtmlEncode(greetingText);
}

</script>

<mobile:Form runat="server">
    <mobile:Label runat="server">What is your name?</mobile:Label>
    <mobile:TextBox runat="server" id="NameEdit" />
    <mobile:Command runat="server" OnClick="GoCommand_OnClick" Text="Go!" />
</mobile:Form>

<mobile:Form runat="server" id="SecondForm" OnActivate="SecondForm_OnActivate">
    <mobile:Label runat="server" id="Greeting" />
</mobile:Form>


