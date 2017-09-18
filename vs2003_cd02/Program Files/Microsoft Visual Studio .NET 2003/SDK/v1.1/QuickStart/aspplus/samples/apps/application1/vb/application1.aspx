<html>

  <script language="VB" runat="server">

      Sub Page_Load(Sender As Object, E As EventArgs)
         Response.Write("In Page.Load()...<br>")
      End Sub

      Sub Session_Click(Sender As Object, E As EventArgs)
         Session.Abandon()
         Response.Redirect("application1.aspx")
      End Sub

      Sub Error_Click(Sender As Object, E As EventArgs)
         throw New Exception()
      End Sub

  </script>

  <body>

    <form runat="server">
      <input type="submit" Value="Refresh This Page" runat="server"/>
      <input type="submit" OnServerClick="Session_Click" Value="End This Session" runat="server"/>
      <input type="submit" OnServerClick="Error_Click" Value="Generate An Error" runat="server"/><p>
      <hr>
    </form>
    
  </body>

</html>