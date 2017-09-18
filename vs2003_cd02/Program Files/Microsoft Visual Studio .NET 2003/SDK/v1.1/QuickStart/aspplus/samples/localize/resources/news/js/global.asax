<%@Import namespace="System.Globalization"%>
<%@Import namespace="System.Resources"%>
<%@Import namespace="System.Threading"%>
<%@Import namespace="System.IO"%>


<script runat="server" language="JScript">
function Application_OnStart() : void {
    Application["RM"] = ResourceManager.CreateFileBasedResourceManager("articles",
              Server.MapPath("resources")
              + Path.DirectorySeparatorChar,
              null);
}


function Application_BeginRequest(sender:Object, args:EventArgs) : void {
    // For each request initialize the culture values with the
    // user language as specified by the browser.

    try {
        Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Request.UserLanguages.GetValue(0));
    } catch(exc:Exception) {
        // provide fallback for not supported languages.
        Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US");
    }

    Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture;
}
</script>
