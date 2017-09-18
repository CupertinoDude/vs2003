<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="JScript" %>

<script runat="server" language="JScript">

var greetingText : String;

protected function GoCommand_OnClick(sender:Object , e:EventArgs){
    greetingText = String.Format("Hello, {0}!", NameEdit.Text);
    ActiveForm = SecondForm;
}

protected function SecondForm_OnActivate(sender:Object , e:EventArgs )
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


