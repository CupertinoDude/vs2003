
<%@ Register TagPrefix="Acme" TagName="DataControl" Src="datactrl.ascx" %>

<html>

  <script language="JScript" runat="server">

      function Page_Load(sender:Object, e:EventArgs) : void {

          TimeMsg.Text = DateTime.Now.ToString("G");
      }

  </script>

  <body>

    <h3><font face="Verdana">Fragment Caching</font></h3>

    <Acme:DataControl runat="server"/>

    <br>

    <i>Page last generated on:</i> <asp:label id="TimeMsg" runat="server" />

  </body>
</html>