<html>

<script language="VB" runat="server">

    Sub Page_Load(sender As Object, e As EventArgs) 
        anchor1.HRef = "/QuickStart"
    End Sub

</script>

<body>

    <h3><font face="Verdana">Simple HtmlAnchor Sample</font></h3>

    <form runat=server>

        <p>

        <a id=anchor1 runat="server">
            Go To QuickStart
        </a>

    </form>

</body>

</html>


