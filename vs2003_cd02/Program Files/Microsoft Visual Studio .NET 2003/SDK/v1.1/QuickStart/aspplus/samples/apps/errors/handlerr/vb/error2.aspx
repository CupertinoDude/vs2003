<html>

  <script language="VB" runat="server">

    Sub Error_500(sender As Object, e As EventArgs)
        Dim foo As String = Nothing
        Response.Write(foo.ToString())
    End Sub

    Sub Page_Error(sender As Object, e As EventArgs)
        Dim message As String = "<font face=verdana color=red>" _
                               & "<h4>" & Request.Url.ToString() & "</h4>" _
                               & "<pre><font color='red'>" & Server.GetLastError().ToString() & "</pre>" _
                               & "</font>"

        Response.Write(message)
        Server.ClearError()
    End Sub

  </script>

  <body>
    <form runat="server">
      <h4><font face="verdana">Cause an Error to Occur...</font></h4>
      <asp:button text="500 Server Error" OnClick="Error_500"  width="150" runat="server"/><p>
    </form>
  </body>

</html>