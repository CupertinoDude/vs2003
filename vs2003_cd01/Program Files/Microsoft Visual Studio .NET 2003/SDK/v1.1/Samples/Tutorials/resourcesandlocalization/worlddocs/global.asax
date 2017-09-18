<%@Import namespace="System.Globalization"%>
<%@Import namespace="System.Resources"%>
<%@Import namespace="System.Threading"%>
<%@Import namespace="System.IO"%>

<script runat="server" language="C#">

void Application_OnStart() {
    Application["RM"] = ResourceManager.CreateFileBasedResourceManager("mytext",
        Server.MapPath("resources")
        + Path.DirectorySeparatorChar,
        null);
}

void Application_BeginRequest(Object sender, EventArgs args) {
    // For each request initialize the culture values with
    // the user language as specified by the browser.

    try {
        Thread.CurrentThread.CurrentCulture = new CultureInfo(Request.UserLanguages[0]);
    }
    catch(Exception) {
        // provide fallback for not supported languages.
        Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US");
    }

    Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture;
}

</script>
