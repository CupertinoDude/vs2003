
<script language="C#" runat="server">

    void Application_Start(Object sender, EventArgs E) {
        // Do application startup code here
    }

    void Application_End(Object sender, EventArgs E) {
        // Clean up application resources here
    }

    void Session_Start(Object sender, EventArgs E) {
        Response.Write("Session is Starting...<br>");
    }

    void Session_End(Object sender, EventArgs E) {
        // Clean up session resources here
    }

    void Application_BeginRequest(Object sender, EventArgs E) {
        Response.Write("<h3><font face='Verdana'>Using the Global.asax File</font></h3>");
        Response.Write("Request is Starting...<br>");
    }

    void Application_EndRequest(Object sender, EventArgs E) {
        Response.Write("Request is Ending...<br>");
    }
    
    void Application_Error(Object sender, EventArgs E) {
        Context.ClearError();
        Response.Redirect("errorpage.htm");
    }

</script>

