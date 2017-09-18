<html>
<head>

    <script language="C#" runat="server">

       void Button1_Click(object Source, EventArgs e) {
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


