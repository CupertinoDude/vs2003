<html>
<head>

    <script language="C#" runat="server">

        void Date_Selected(object s, EventArgs e) {
            Label1.Text = "Selected date is: " + Calendar1.SelectedDate.ToShortDateString();
        }

    </script>

</head>

<body>

    <h3><font face="Verdana">Calendar Example</font></h3>

    <form runat=server>

        <asp:Calendar id=Calendar1 onselectionchanged="Date_Selected" runat="server" />
        
        <p>
        
        <asp:Label id=Label1 runat="server" />
        
    </form>

</body>
</html>
