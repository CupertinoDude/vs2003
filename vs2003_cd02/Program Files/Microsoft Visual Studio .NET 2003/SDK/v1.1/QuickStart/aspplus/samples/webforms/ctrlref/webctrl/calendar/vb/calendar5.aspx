<html>
<head>
    <script language="VB" runat="server">

        Dim holidays(12,31) as String

        Sub Page_Load(sender As Object, e As EventArgs)
        	holidays(1,1)   = "New Year's Day"
          	holidays(1,26)  = "Australia Day"
        	holidays(2,2)   = "Groundhog Day"
        	holidays(2,14)  = "Valentine's Day"
        	holidays(3,17)  = "St. Patrick's Day"
        	holidays(4,1)   = "April Fool's Day"
        	holidays(5,1)   = "May Day"
        	holidays(6,15)  = "My Birthday"
        	holidays(7,15)  = "My Anniversary"
        	holidays(8,15)  = "My Mother's Birthday"
        	holidays(9,24)  = "Autumnal Equinox"
        	holidays(12,26) = "Boxing Day"
        End Sub

        Sub Calendar1_DayRender(sender As Object, e As DayRenderEventArgs)

            Dim d as CalendarDay
            Dim c as TableCell

            d = e.Day
            c = e.Cell

            If d.IsOtherMonth Then
                c.Controls.Clear
            Else
                Try
                    Dim Hol As String = holidays(d.Date.Month,d.Date.Day)

                    If Hol <> "" Then
                        c.Controls.Add(new LiteralControl("<br>" + Hol))
                    End If
                Catch exc as Exception
                    Response.Write (exc.ToString())
                End Try
            End If
        End Sub

        Sub Date_Selected(sender As Object, e As EventArgs)
            Label1.Text = "Selected date is: " + Calendar1.SelectedDate.ToShortDateString
        End Sub

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
            BorderWidth="1"
            Font-Name="Verdana"
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
