<html>
<head>
    <script language="VB" runat="server">

        Sub ImageButton1_OnClick(sender As Object, e As ImageClickEventArgs)
            Label1.Text = "You clicked the image button"
        End Sub

    </script>

</head>
<body>

    <h3><font face="Verdana">ImageButton Example</font></h3>

    <form runat=server>

        <asp:ImageButton id=Button1 ImageUrl="/quickstart/aspplus/images/mango.jpg" BorderWidth="2px" onclick="ImageButton1_OnClick" runat="server"/>
        
        &nbsp;&nbsp;

        <asp:Label id=Label1 runat=server />
        
    </form>

</body>
</html>


