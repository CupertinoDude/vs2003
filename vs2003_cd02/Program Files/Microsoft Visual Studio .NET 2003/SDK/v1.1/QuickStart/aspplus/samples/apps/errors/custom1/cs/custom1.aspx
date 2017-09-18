
<html>

  <script language="C#" runat="server">

    void Error_500(Object sender, EventArgs e) {
        String foo = null;
        Response.Write(foo.ToString());
    }

  </script>

  <body>
    <form runat="server">
      <h4><font face="verdana">Cause an Error to Occur...</font></h4>
      <asp:button text="500 Server Error" OnClick="Error_500"  width="150" runat="server"/><p>
    </form>
  </body>

</html>