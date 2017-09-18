<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="C#" %>

<script runat="server" language="c#">

protected void GoCommand_OnClick(Object sender, EventArgs e)
{
    try
    {
        int age = Int32.Parse(AgeEdit.Text);

        char[] name = NameEdit.Text.ToCharArray();
        Array.Reverse (name);

        Greeting.Text = String.Format("Your code name is {0}",
                                      new String(name) + age * 100);
    }
    catch(Exception ex)
    {
        Greeting.Text = "You entered an invalid age. Please go back and try again.";
    }

    ActiveForm = SecondForm;
}

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


