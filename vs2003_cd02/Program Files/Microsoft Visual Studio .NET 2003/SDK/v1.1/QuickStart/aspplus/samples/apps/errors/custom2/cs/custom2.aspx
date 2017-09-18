
<html>

  <script language="C#" runat="server">

    void Error_404(Object sender, EventArgs e) {
        Response.Redirect("nowhere.aspx");
    }

    void Error_500(Object sender, EventArgs e) {
        String foo = null;
        Response.Write(foo.ToString());
    }

  </script>

  <body>
    <form runat="server">
      <h4><font face="verdana">Cause an Error to Occur...</font></h4>
      <asp:button text="404 Not Found" OnClick="Error_404" width="150" runat="server"/><p>
      <asp:button text="500 Server Error" OnClick="Error_500"  width="150" runat="server"/><p>
    </form>
  </body>

</html>