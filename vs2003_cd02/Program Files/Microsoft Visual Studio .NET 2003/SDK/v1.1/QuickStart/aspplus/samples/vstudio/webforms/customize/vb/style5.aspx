
<%@ Page CodeBehind="style5.aspx.vb" Language="vb" AutoEventWireup="false" Inherits="Customize.Vb.style5" %>
<html>
<body>

  <form runat="server">

      <h3><font face="verdana">Applying Styles to Web Controls</font></h3>

      <p><font face="verdana"><h4>Style Sub-Properties</h4></font><p>

      <ASP:Calendar runat="server"

           BackColor="Beige" 
           ForeColor="Brown"
           BorderWidth="3"
           BorderStyle="Solid"
           BorderColor="Black"
           Height="450"
           Width="450"
           Font-Size="12pt"
           Font-Name="Tahoma,Arial"
           Font-Underline="false"
           CellSpacing=2
           CellPadding=2 
           ShowGridLines=true

           TitleStyle-BorderColor="darkolivegreen"
           TitleStyle-BorderWidth="3"
           TitleStyle-BackColor="olivedrab"	
           TitleStyle-Height="50px"

           DayHeaderStyle-BorderColor="darkolivegreen"  
           DayHeaderStyle-BorderWidth="3"
           DayHeaderStyle-BackColor="olivedrab"
           DayHeaderStyle-ForeColor="black"
           DayHeaderStyle-Height="20px"  

           DayStyle-Width="50px"
           DayStyle-Height="50px"

           TodayDayStyle-BorderWidth="3"

           WeekEndDayStyle-BackColor="palegoldenrod"
           WeekEndDayStyle-Width="50px"
           WeekEndDayStyle-Height="50px"

           SelectedDayStyle-BorderColor="firebrick"
           SelectedDayStyle-BorderWidth="3"

           OtherMonthDayStyle-Width="50px"
           OtherMonthDayStyle-Height="50px"
       />

    </form>

</body>
</html>
