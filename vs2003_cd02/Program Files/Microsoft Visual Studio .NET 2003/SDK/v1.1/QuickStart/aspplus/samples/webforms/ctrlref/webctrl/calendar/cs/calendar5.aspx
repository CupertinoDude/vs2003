<html>
<head>
    <script language="C#" runat="server">

        String [][] holidays;

        void Page_Load(Object Sender, EventArgs e) {

            holidays = new String[13][];

            for (int n=0; n<13 ;n++)
                    holidays[n] = new String[32];

        	holidays[1][1]   = "New Year's Day";
          	holidays[1][26]  = "Australia Day";
        	holidays[2][2]   = "Groundhog Day";
        	holidays[2][14]  = "Valentine's Day";
        	holidays[3][17]  = "St. Patrick's Day";
        	holidays[4][1]   = "April Fool's Day";
        	holidays[5][1]   = "May Day";
        	holidays[6][15]  = "My Birthday";
        	holidays[7][15]  = "My Anniversary";
        	holidays[8][15]  = "My Mother's Birthday";
        	holidays[9][24]  = "Autumnal Equinox";
        	holidays[12][26] = "Boxing Day";
        }

        void Calendar1_DayRender(object sender, DayRenderEventArgs e) {

            CalendarDay d = ((DayRenderEventArgs)e).Day;
            TableCell c = ((DayRenderEventArgs)e).Cell;

            if (d.IsOtherMonth) {
                c.Controls.Clear();
            }
            else {
                try {
                    string Hol = holidays[d.Date.Month][d.Date.Day];

                    if (Hol != string.Empty)
                        c.Controls.Add(new LiteralControl("<br>" + Hol));
                }
                catch (Exception exc) {
                    Response.Write (exc.ToString());
                }
            }
        }

        void Date_Selected(object s, EventArgs e) {
            Label1.Text = "Selected date is: " + Calendar1.SelectedDate.ToShortDateString();
        }

    </script>

</head>

<body>

    <h3><font face="Verdana">Adding Custom Content to Calendar</font></h3>
    <p><p>

    <form runat=server>

        <asp:Calendar id=Calendar1 runat="server"
            ondayrender="Calendar1_DayRender"
            onselectionchanged="Date_Selected"
            ShowGridLines="true"
            Font-Name="Verdana;Arial"
            Font-Size="9px"
            Width="500px"
            VisibleDate="01/01/2000"
            TitleStyle-BackColor="Gainsboro"
            TitleStyle-Font-Size="12px"
            TitleStyle-Font-Bold="true"
            DayStyle-VerticalAlign="Top"
            DayStyle-Height="50px"
            DayStyle-Width="14%"
            SelectedDate="1/1/0001"
            SelectedDayStyle-BackColor="Navy"
            />

        <p>
        <asp:Label id=Label1 runat="server" />
    </form>

</body>
</html>
