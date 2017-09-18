
<html>

  <script language="VB" runat="server">

    Sub Error_404(sender As Object, e As EventArgs)
        Response.Redirect("nowhere.aspx")
    End Sub

    Sub Error_500(sender As Object, e As EventArgs)
        Dim foo As String = Nothing
        Response.Write(foo.ToString())
    End Sub

  </script>

  <body>
    <form runat="server">
      <h4><font face="verdana">Cause an Error to Occur...</font></h4>
      <asp:button text="404 Not Found" OnClick="Error_404" width="150" runat="server"/><p>
      <asp:button text="500 Server Error" OnClick="Error_500"  width="150" runat="server"/><p>
    </form>
  </body>

</html>