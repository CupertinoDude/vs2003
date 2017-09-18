<html>
<head>
    <script language="VB" runat="server">

        Sub Date_Selected(sender As Object, e As EventArgs) 
        
            Select (Calendar1.SelectedDates.Count) 
                Case 0:   'None
                    Label1.Text = "No dates are currently selected"
                Case 1:   'Day
                    Label1.Text = "The selected date is " & Calendar1.SelectedDate.ToShortDateString
                Case 7:   'Week
                    Label1.Text = "The selection is a week beginning " & Calendar1.SelectedDate.ToShortDateString
                Case Else:  'Month
                    Label1.Text = "The selection is a month beginning " & Calendar1.SelectedDate.ToShortDateString
            End Select
            
        End Sub

    </script>
</head>

<body>

    <h3><font face="Verdana">Selection Link Text</font></h3>
    <p>

    <form runat=server>

        <p>
        <asp:Calendar id=Calendar1 runat="server"
            onselectionchanged="Date_Selected"
            DayNameFormat="Short"
            SelectionMode="DayWeekMonth"
            Font-Name="Verdana;Arial" Font-Size="12px"
            Height="180px" Width="230px"
            TodayDayStyle-Font-Bold="True"
            DayHeaderStyle-Font-Bold="True"
            OtherMonthDayStyle-ForeColor="gray"
            TitleStyle-BackColor="#3366ff"
            TitleStyle-ForeColor="white"
            TitleStyle-Font-Bold="True"
            SelectedDayStyle-BackColor="#ffcc66"
            SelectedDayStyle-Font-Bold="True"
            NextPrevFormat="ShortMonth"
            NextPrevStyle-ForeColor="white"
            NextPrevStyle-Font-Size="10px"
            SelectorStyle-BackColor="#99ccff"
            SelectorStyle-ForeColor="navy"
            SelectorStyle-Font-Size="9px"
            SelectWeekText = "week"
            SelectMonthText = "month"
            />

        <p>
        <asp:Label id=Label1 runat="server" />
    </form>
</body>
</html>
