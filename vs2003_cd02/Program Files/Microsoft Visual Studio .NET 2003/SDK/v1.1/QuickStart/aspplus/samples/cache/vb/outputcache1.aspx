<%@ OutputCache Duration="60" VaryByParam="none" %>

<html>

  <script language="VB" runat="server">

    Sub Page_Load(Src As Object, E As EventArgs)
          TimeMsg.Text = DateTime.Now.ToString("G")
    End Sub

   </script>

  <body>

    <h3><font face="Verdana">Using the Output Cache</font></h3>

    <p><i>Last generated on:</i> <asp:label id="TimeMsg" runat="server"/>

  </body>

</html>