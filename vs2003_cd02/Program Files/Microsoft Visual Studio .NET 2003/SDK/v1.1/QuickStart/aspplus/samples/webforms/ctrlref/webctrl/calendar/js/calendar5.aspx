<html>
<head>
    <script language="JScript" runat="server">

        var holidays:Object[];

        function Page_Load(sender:Object, e:EventArgs) : void {

            holidays = new Object[13];

            for (var n:int=0; n<13 ;n++) {
                var holiday:String[] = new String[32];
                if ( n == 1 ){
                	holiday[1]   = "New Year's Day"
                  	holiday[26]  = "Australia Day"
                }
                if ( n == 2 ){
                	holiday[2]   = "Groundhog Day";
                	holiday[14]  = "Valentine's Day";
                }
                if ( n == 3 ){
                    holiday[17] = "St. Patrick's Day";
                }
                if ( n == 4 ){
                    holiday[1] = "April Fool's Day";
                }
                if ( n == 5 ){
                	holiday[1]   = "May Day"
                }
                if ( n == 6 ){
                	holiday[15]  = "My Birthday"
                }
                if ( n == 7 ){
                	holiday[15]  = "My Anniversary"
                }
                if ( n == 8 ){
                	holiday[15]  = "My Mother's Birthday";
                }
                if ( n == 9 ){
                	holiday[24]  = "Autumnal Equinox";
                }
                if ( n == 12 ){
                	holiday[26] = "Boxing Day";
                }
                holidays[n] = holiday;
            }
        }

        function Calendar1_DayRender(sender:Object, e:DayRenderEventArgs) : void {

            var d:CalendarDay = e.Day;
            var c:TableCell = e.Cell;

            if (d.IsOtherMonth) {
                c.Controls.Clear();
            }
            else {
                try {
                    var Hol:String = holidays[d.Date.Month][d.Date.Day];

                    if (Hol != String.Empty && Hol != "undefined")
                        c.Controls.Add(new LiteralControl("<br>" + Hol));
                }
                catch (exc:Exception) {
                    Response.Write (exc.ToString());
                }
            }
        }

        function Date_Selected(sender:Object, e:EventArgs) : void {
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
