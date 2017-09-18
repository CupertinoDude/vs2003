<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="VB" %>

<script runat="server" language="VB">

Dim greetingText as String

Protected Sub GoCommand_OnClick(sender As Object, e As EventArgs)

    greetingText = String.Format("Hello, {0}!", NameEdit.Text)
    ActiveForm = SecondForm

End Sub

Protected Sub SecondForm_OnActivate(sender As Object, e As EventArgs)

    Greeting.Text = Server.HtmlEncode(greetingText)

End Sub

</script>

<mobile:Form runat="server">
    <mobile:Label runat="server">What is your name?</mobile:Label>
    <mobile:TextBox runat="server" id="NameEdit" />
    <mobile:Command runat="server" OnClick="GoCommand_OnClick" Text="Go!" />
</mobile:Form>

<mobile:Form runat="server" id="SecondForm" OnActivate="SecondForm_OnActivate">
    <mobile:Label runat="server" id="Greeting" />
</mobile:Form>


