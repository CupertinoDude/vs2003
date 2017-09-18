<html>

  <script language="C#" runat="server">

      void Page_Load(Object sender, EventArgs e) {
         Response.Write("In Page.Load()...<br>");
      }

      void Session_Click(Object sender, EventArgs e) {
         Session.Abandon();
         Response.Redirect("application1.aspx");
      }

      void Error_Click(Object sender, EventArgs e) {
         throw new Exception();
      }

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