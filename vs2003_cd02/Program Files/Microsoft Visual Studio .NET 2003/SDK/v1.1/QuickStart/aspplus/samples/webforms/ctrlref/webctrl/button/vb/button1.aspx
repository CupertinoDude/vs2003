<html>
<head>

    <script language="VB" runat="server">

       Sub Button1_Click(sender As Object, e As EventArgs) 
          Label1.Text="You clicked the button"
       End Sub

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


