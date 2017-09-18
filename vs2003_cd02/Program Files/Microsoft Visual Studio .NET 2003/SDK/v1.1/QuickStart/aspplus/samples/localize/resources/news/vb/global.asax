<%@Import namespace="System.Globalization"%>
<%@Import namespace="System.Resources"%>
<%@Import namespace="System.Threading"%>
<%@Import Namespace="System.IO"%>


<script runat="server" language="VB">

Sub Application_OnStart()
    Application("RM") = ResourceManager.CreateFileBasedResourceManager("articles", _
              Server.MapPath("resources") _
              + Path.DirectorySeparatorChar, _
              Nothing)
End Sub



Sub Application_BeginRequest(sender As Object, args As EventArgs)
    ' For each request initialize the culture values with the
    ' user language as specified by the browser.
    Try
        Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Request.UserLanguages(0))
    Catch
      ' provide fallback for not supported languages.
        Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US")
    End Try

    Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture
End Sub

</script>
