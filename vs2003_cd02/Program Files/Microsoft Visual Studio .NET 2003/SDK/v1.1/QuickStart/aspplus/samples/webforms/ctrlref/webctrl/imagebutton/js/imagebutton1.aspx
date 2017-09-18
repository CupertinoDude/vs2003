<html>
<head>
    <script language="JScript" runat="server">

        function ImageButton1_OnClick(sender:Object, e:ImageClickEventArgs) : void {
            Label1.Text="You clicked the image button";
        }

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


