<html>

<script language="JScript" runat=server>

   function Page_Load(sender:Object, e:EventArgs) : void {
      HyperLink1.NavigateUrl = "/QuickStart";
   }

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


