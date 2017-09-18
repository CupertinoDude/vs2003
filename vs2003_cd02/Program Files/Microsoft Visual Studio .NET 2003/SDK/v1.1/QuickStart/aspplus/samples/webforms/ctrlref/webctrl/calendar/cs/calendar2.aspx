<html>
<head>
    <script language="C#" runat="server">

        void Page_Load(Object Sender, EventArgs e) {

            Calendar1.SelectionMode = (CalendarSelectionMode)lstSelMode.SelectedIndex;

            if (Calendar1.SelectionMode == CalendarSelectionMode.None)
                Calendar1.SelectedDates.Clear();
        }

        void Date_Selected(object s, EventArgs e) {

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
                    break;
            }
        }

    </script>

</head>

<body>

    <h3><font face="Verdana">Date Selection Modes</font></h3>
    <p>

    <form runat=server>

        Choose a Selection Mode:
        <asp:DropDownList id="lstSelMode" runat=server
            AutoPostBack=true>
            <asp:ListItem Value="None" >None</asp:ListItem>
            <asp:ListItem Selected Value="Day" >Day</asp:ListItem>
            <asp:ListItem Value="DayWeek" >DayWeek</asp:ListItem>
            <asp:ListItem Value="DayWeekMonth" >DayWeekMonth</asp:ListItem>
        </asp:DropDownList>

        <p>
        <asp:Calendar id=Calendar1 runat="server"
            onselectionchanged="Date_Selected"
            Font-Name="Arial" Font-Size="12px"
            Height="180px" Width="200px"
            SelectorStyle-BackColor="gainsboro"
            TodayDayStyle-BackColor="gainsboro"
            DayHeaderStyle-BackColor="gainsboro"
            OtherMonthDayStyle-ForeColor="gray"
            TitleStyle-BackColor="gray"
            TitleStyle-Font-Bold="True"
            TitleStyle-Font-Size="12px"
            SelectedDayStyle-BackColor="Navy"
            SelectedDayStyle-Font-Bold="True"
            />

        <p>
        <asp:Label id=Label1 runat="server" />
    </form>

</body>
</html>
