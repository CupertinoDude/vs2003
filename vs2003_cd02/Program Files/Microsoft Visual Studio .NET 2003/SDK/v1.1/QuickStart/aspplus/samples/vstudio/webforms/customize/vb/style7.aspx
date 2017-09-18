
<%@ Page CodeBehind="style7.aspx.vb" Language="vb" AutoEventWireup="false" Inherits="Customize.Vb.style7" %>
<html>
<head>

  <style>
    .calstyle { font-size:12pt; font-family:Tahoma,Arial; }
  </style>

</head>
<body>

  <form runat="server">

      <h3><font face="verdana">Applying Styles to Web Controls</font></h3>

      <p><font face="verdana"><h4>The CssClass Property</h4></font><p>

      <ASP:Calendar CssClass="calstyle" runat="server"

           BackColor="Beige" 
           ForeColor="Brown"
           BorderWidth="3"
           BorderStyle="Solid"
           BorderColor="Black"
           Height="450"
           Width="450"
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
