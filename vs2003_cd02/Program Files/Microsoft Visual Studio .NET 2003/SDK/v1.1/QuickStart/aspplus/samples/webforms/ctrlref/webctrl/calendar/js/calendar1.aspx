<html>
<head>

    <script language="JScript" runat="server">

        function Date_Selected(sender:Object, e:EventArgs) : void {
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
