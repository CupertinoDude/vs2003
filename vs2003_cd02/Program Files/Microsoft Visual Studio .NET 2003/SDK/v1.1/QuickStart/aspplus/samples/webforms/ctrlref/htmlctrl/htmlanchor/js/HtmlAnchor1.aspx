<html>

<script language="JScript" runat=server>

   protected function Page_Load(sender:Object, e:EventArgs) : void {
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


