<%@ OutputCache Duration="60" VaryByParam="none" %>

<html>

  <script language="JScript" runat="server">

    function Page_Load(sender:Object, e:EventArgs) : void {
        TimeMsg.Text = DateTime.Now.ToString("G");
    }

  </script>

  <body>

    <h3><font face="Verdana">Using the Output Cache</font></h3>

    <p><i>Last generated on:</i> <asp:label id="TimeMsg" runat="server"/>

  </body>

</html>