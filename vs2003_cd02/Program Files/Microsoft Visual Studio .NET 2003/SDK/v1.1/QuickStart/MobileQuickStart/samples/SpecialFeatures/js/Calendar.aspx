<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="JScript" %>

<script language="JScript" runat=server>

protected function Calendar_SelectionChanged(sender:Object , e:EventArgs )
{
    DateLabel.Text = String.Format("The date you selected is {0}",
                                   Cal.SelectedDate.ToString("D"));
    ActiveForm = Form2;
}

</script>

<mobile:Form id="Form1" runat=server>
  <mobile:Label runat=server StyleReference="Title">Pick a date using the calendar control.</mobile:Label>
  <mobile:Calendar id="Cal" OnSelectionChanged="Calendar_SelectionChanged" runat=server/>
</mobile:Form>

<mobile:Form id="Form2" runat=server>
  <mobile:Label id="DateLabel" runat=server/>
</mobile:Form>
