<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="VB" %>

<script runat=server>

Sub Submit_OnClick(Sender as Object, E as EventArgs)
    If Page.IsValid Then
        ActiveForm = Form2
        Result.Text = String.Format("The number you chose was {0}", NumberEdit.Text)
    End If
End Sub

</script>

<mobile:Form id="Form1" runat=server>
    <mobile:CompareValidator runat=server ControlToValidate="NumberEdit" Type="Integer" ValueToCompare="100" Operator="LessThanEqual">The number is out of range</mobile:CompareValidator>
    <mobile:Label runat=server>Please enter an integer less than or equal to 100</mobile:Label>
    <mobile:TextBox id="NumberEdit" Numeric="true" runat=server/>
    <mobile:Command OnClick="Submit_OnClick" runat=server>Submit</mobile:Command>
</mobile:Form>

<mobile:Form id="Form2" runat=server>
    <mobile:Label id="Result" runat=server/>
    <mobile:Link Text="Back" NavigateURL="#Form1" runat=server/>
</mobile:Form>