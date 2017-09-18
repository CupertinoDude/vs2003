<%@ Page Inherits="System.Web.UI.MobileControls.MobilePage" Language="C#" %>

<script language="c#" runat=server>

protected void Calendar_SelectionChanged(Object sender, EventArgs e)
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
