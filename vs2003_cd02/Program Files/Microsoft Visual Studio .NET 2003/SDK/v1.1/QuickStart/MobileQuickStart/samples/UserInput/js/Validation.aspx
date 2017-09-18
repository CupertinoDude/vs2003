<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="JScript" %>

<script language="JScript" runat=server>

protected function Submit_OnClick(sender:Object , e:EventArgs )
{
    if (Page.IsValid) 
    {
        ActiveForm = Form2;
        Result.Text = String.Format("The number you chose was {0}", NumberEdit.Text);
    }
}

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
