<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="VB" %>

<script runat=server>

Sub Summary_OnClick(Sender as Object, E as EventArgs)
    ActiveForm = Form2
End Sub

Sub ServerValidate(Source as Object, Args as ServerValidateEventArgs)
    Dim Num as Integer

    Try
        Num = Int32.Parse(args.Value)
    Catch F as FormatException
        Args.IsValid = false
        Exit Sub
    End Try

    If num Mod 2 = 0 Then
        args.IsValid = true
    Else 
        args.IsValid = false
    End If

End Sub

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
