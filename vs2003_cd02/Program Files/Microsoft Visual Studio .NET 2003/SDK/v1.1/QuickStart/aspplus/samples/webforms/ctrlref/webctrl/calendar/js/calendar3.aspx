<html>
<head>
    <script language="JScript" runat="server">

        function Date_Selected(sender:Object, e:EventArgs) : void {
        
            switch (Calendar1.SelectedDates.Count) {
            
                case (0):   //None
                    Label1.Text = "No dates are currently selected";
                    break;
                case (1):   //Day
                    Label1.Text = "The selected date is " + Calendar1.SelectedDate.ToShortDateString();
                    break;
                case (7):   //Week
                    Label1.Text = "The selection is a week beginning " + Calendar1.SelectedDate.ToShortDateString();
                    break;
                default:    //Month
                    Label1.Text = "The selection is a month beginning " + Calendar1.SelectedDate.ToShortDateString();
            }
        }

    </script>
</head>

<body>

    <h3><font face="Verdana">Selection Link Graphics</font></h3>
    <p>

    <form runat=server>

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
            NextMonthText = "<img src='/quickstart/aspplus/images/monthright.gif' border=0>"
            PrevMonthText = "<img src='/quickstart/aspplus/images/monthleft.gif' border=0>"
            SelectorStyle-BackColor="#99ccff"
            SelectWeekText = "<img src='/quickstart/aspplus/images/selweek.gif' border=0 onmouseover=this.style.backgroundColor='#ffcc66' onmouseout=this.style.backgroundColor='#99ccff'>"
            SelectMonthText = "<img src='/quickstart/aspplus/images/selmonth.gif' border=0 onmouseover=this.style.backgroundColor='#ffcc66' onmouseout=this.style.backgroundColor='#99ccff'>"
            />

        <p>
        
        <asp:Label id=Label1 runat="server" />
        
    </form>
</body>
</html>
