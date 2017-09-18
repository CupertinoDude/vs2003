<html>
<head>

    <script language="VB" runat="server">

       Sub Button1_Click(sender As Object, e As EventArgs) 
          Span1.InnerHtml = "You clicked the button"
       End Sub

    </script>

</head>

<body>

    <h3><font face="Verdana">Button HtmlInputButton</font></h3>

    <form runat=server>

        <p>

        <input type=button value="Button1" onServerClick="Button1_Click" runat="server">

        &nbsp;&nbsp;

        <span id=Span1 runat=server />

    </form>

</body>
</html>


