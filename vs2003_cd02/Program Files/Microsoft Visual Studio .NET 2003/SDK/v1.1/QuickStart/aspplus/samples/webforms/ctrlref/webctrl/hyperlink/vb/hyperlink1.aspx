<html>

<script language="VB" runat="server">


   Sub Page_Load(sender As Object, e As EventArgs) 
      HyperLink1.NavigateUrl = "/QuickStart"
   End Sub

</script>

<body>

    <h3><font face="Verdana">Simple asp:hyperlink Sample</font></h3>

    <form runat=server>

        <p>

        <asp:hyperlink id=HyperLink1 runat="server">
            Go To QuickStart
        </asp:hyperlink>

    </form>

</body>

</html>


