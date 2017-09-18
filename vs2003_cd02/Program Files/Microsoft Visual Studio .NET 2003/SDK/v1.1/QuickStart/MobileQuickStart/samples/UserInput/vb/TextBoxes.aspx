<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="VB" %>

<script runat="server">

Sub GoCommand_OnClick(Sender as Object, E as EventArgs)
    Try
        Dim Age as Integer
        age = Int32.Parse(AgeEdit.Text)

        Dim Name as Char()
        Name = NameEdit.Text.ToCharArray()
        Array.Reverse(Name)

        Greeting.Text = String.Format("Your code name is {0}", _
                                      New String(name) & age * 100)

    Catch Exc as Exception

        Greeting.Text = "You entered an invalid age. Please go back and try again."

    End Try

    ActiveForm = SecondForm

End Sub

</script>

<mobile:Form runat="server">
    <mobile:Label runat="server">Enter your age:</mobile:Label>
    <mobile:TextBox runat="server" id="AgeEdit" Numeric="true" />
    <mobile:Label runat="server">Enter your real name:</mobile:Label>
    <mobile:TextBox runat="server" id="NameEdit" Password="true" />
    <mobile:Command runat="server" OnClick="GoCommand_OnClick" Text="Go!" />
</mobile:Form>

<mobile:Form runat="server" id="SecondForm">
    <mobile:Label runat="server" id="Greeting" />
</mobile:Form>


