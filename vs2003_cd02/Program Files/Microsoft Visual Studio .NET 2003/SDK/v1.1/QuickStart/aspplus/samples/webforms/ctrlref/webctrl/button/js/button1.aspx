<html>
<head>

    <script language="JScript" runat="server">

       function Button1_Click(sender:Object, e:EventArgs) : void {
          Label1.Text="You clicked the button";
       }

    </script>

</head>
<body>

    <h3><font face="Verdana">PostBack Using Button</font></h3>

    <form runat=server>

        <asp:Button id=Button1 Text="Click Me" onclick="Button1_Click" runat="server" />
        
        <asp:Label id=Label1 runat=server />

    </form>

</body>
</html>


