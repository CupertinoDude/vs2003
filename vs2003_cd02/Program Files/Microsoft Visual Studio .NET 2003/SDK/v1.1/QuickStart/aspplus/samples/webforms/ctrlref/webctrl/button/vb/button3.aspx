<html>
<head>

    <script language="VB" runat="server">

       Sub Button1_Click(sender As Object, e As EventArgs) 
          Label1.Text="You clicked Button1"
       End Sub

       Sub Button2_Click(sender As Object, e As EventArgs) 
          Label1.Text="You clicked Button2"
       End Sub

    </script>

</head>
<body>

    <h3><font face="Verdana">Mouse-Over Effects on Button</font></h3>
    <p>Move your mouse over the buttons to observe the mouse-over effects.</p>
    
    <form runat=server>
    <font face="Verdana" size="-1">

        <asp:Button id=Button1 runat="server"
            Text="Button1"
            Width="100px"
            onmouseover="this.style.backgroundColor='yellow'"
            onmouseout="this.style.backgroundColor='buttonface'"
            onclick="Button1_Click" />

            &nbsp;&nbsp;
            Applies an inline CSS style (button background color)...

        <p>

        <asp:Button id=Button2 runat="server"
            Text="Button2"
            Width="100px"
            onmouseover="this.style.fontWeight='bold'"
            onmouseout="this.style.fontWeight='normal'"
            onclick="Button2_Click" />

            &nbsp;&nbsp;
            Applies an inline CSS style (button font bold)...

        <p>
        
        <asp:Label id=Label1 runat=server />
        
    </font>
    </form>

</body>
</html>


