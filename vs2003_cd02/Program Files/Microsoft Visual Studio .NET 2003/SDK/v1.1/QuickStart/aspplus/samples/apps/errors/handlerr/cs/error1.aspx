<%@ Debug="true"%>

<html>

  <script language="C#" runat="server">

    // Setting Debug to true causes lines numbers to be printed for runtime errors
    // Enable this at the Page or Application level while developing
    // Be sure to disable before deploying to a production site

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