<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="C#" %>

<script language="c#" runat=server>

protected void Summary_OnClick(Object sender, EventArgs e)
{
    ActiveForm = Form2;
}

void ServerValidate(object source, ServerValidateEventArgs args)
{ 
    int num;

    try
    {
        num = Int32.Parse(args.Value);
    }
    catch (FormatException)
    {
        args.IsValid = false;
        return;
    }

    if (num % 2 == 0)
    {
        args.IsValid = true;
    }
    else 
    {
        args.IsValid = false;
    }
}

</script>


<mobile:Form id="Form1" runat=server>
    <mobile:CustomValidator runat=server ControlToValidate="number" OnServerValidate="ServerValidate" ErrorMessage="The input number should be even.">Please enter an even number</mobile:CustomValidator>
    <mobile:RangeValidator runat=server ControlToValidate="number" Type="Integer" MaximumValue="50" MinimumValue="1" ErrorMessage="The input number should be with in the range 1 - 50.">Please enter a number of value 1 - 50</mobile:RangeValidator>
    <mobile:RequiredFieldValidator runat=server ControlToValidate="number" ErrorMessage="The input box cannot be empty.">Please fill in a number</mobile:RequiredFieldValidator>
    <mobile:Label runat=server>Please enter an even number between 1 and 50</mobile:Label>
    <mobile:TextBox id="number" Numeric="true" runat=server/>
    <mobile:Command OnClick="Summary_OnClick" runat=server>Submit</mobile:Command>
</mobile:Form>

<mobile:Form id="Form2" runat=server>
    <mobile:Label runat=server>Your input is valid if no error is shown below.</mobile:Label>
    <mobile:ValidationSummary FormToValidate="Form1" HeaderText="Error listed below:" runat=server/>
</mobile:Form>
