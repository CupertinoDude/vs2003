<html>

<script language="C#" runat=server>

   void Page_Load(Object sender, EventArgs e) {
      anchor1.HRef = "/QuickStart";
   }

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


