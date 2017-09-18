<%@ Debug="true"%>

<html>

  <script language="VB" runat="server">

    ' Setting Debug to true causes lines numbers to be printed for runtime errors
    ' Enable this at the Page or Application level while developing
    ' Be sure to disable before deploying to a production site

    Sub Error_500(sender As Object, e As EventArgs)
        Dim foo As String = Nothing
        Response.Write(foo.ToString())
    End Sub

  </script>

  <body>
    <form runat="server">
      <h4><font face="verdana">Cause an Error to Occur...</font></h4>
      <asp:button text="500 Server Error" OnClick="Error_500"  width="150" runat="server"/><p>
    </form>
  </body>

</html>