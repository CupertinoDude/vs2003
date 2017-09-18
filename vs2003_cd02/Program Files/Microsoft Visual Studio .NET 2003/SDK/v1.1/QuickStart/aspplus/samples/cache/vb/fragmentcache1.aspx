
<%@ Register TagPrefix="Acme" TagName="DataControl" Src="datactrl.ascx" %>

<html>

  <script language="VB" runat="server">

      Sub Page_Load(Src As Object, E As EventArgs)

          TimeMsg.Text = DateTime.Now.ToString("G")
      End Sub

  </script>

  <body>

    <h3><font face="Verdana">Fragment Caching</font></h3>

    <Acme:DataControl runat="server"/>

    <br>

    <i>Page last generated on:</i> <asp:label id="TimeMsg" runat="server" />

  </body>
</html>