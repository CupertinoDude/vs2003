<html>
<head>
    <script language="VB" runat="server">

      Sub LinkButton1_Click(sender As Object, e As EventArgs)
          Label1.Text="You clicked the link button"
      End Sub

    </script>

</head>
<body>

    <h3><font face="Verdana">LinkButton Example</font></h3>

    <form runat=server>

        <asp:LinkButton Text="Click Me!" Font-Name="Verdana" Font-Size="14pt" onclick="LinkButton1_Click" runat="server"/>
        
        &nbsp;&nbsp;

        <asp:Label id=Label1 runat=server />
        
    </form>

</body>
</html>


