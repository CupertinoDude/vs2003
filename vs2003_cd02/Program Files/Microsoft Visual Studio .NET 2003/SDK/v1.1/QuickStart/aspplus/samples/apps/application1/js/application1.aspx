<html>

  <script language="JScript" runat="server">

      function Page_Load(sender:Object, e:EventArgs) : void {
         Response.Write("In Page.Load()...<br>");
      }

      function Session_Click(sender:Object, e:EventArgs) : void {
         Session.Abandon();
         Response.Redirect("application1.aspx");
      }

      function Error_Click(sender:Object, e:EventArgs) : void {
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