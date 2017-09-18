
<html>

  <script language="JScript" runat="server">

    function Error_404(sender:Object, e:EventArgs) : void {
        Response.Redirect("nowhere.aspx");
    }

    function Error_500(sender:Object, e:EventArgs) : void {
        var foo:System.Array;
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