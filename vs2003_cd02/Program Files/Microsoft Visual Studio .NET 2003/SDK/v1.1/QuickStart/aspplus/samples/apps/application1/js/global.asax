
<script language="JScript" runat="server">

    function Application_Start(sender:Object, e:EventArgs) : void {
        // Do application startup code here
    }

    function Application_End(sender:Object, e:EventArgs) : void {
        // Clean up application resources here
    }

    function Session_Start(sender:Object, e:EventArgs) : void {
        Response.Write("Session is Starting...<br>");
    }

    function Session_End(sender:Object, e:EventArgs) : void {
        // Clean up session resources here
    }

    function Application_BeginRequest(sender:Object, e:EventArgs) : void {
        Response.Write("<h3><font face='Verdana'>Using the Global.asax File</font></h3>");
        Response.Write("Request is Starting...<br>");
    }

    function Application_EndRequest(sender:Object, e:EventArgs) : void {
        Response.Write("Request is Ending...<br>");
    }
    
    function Application_Error(sender:Object, e:EventArgs) : void {
        Context.ClearError();
        Response.Redirect("errorpage.htm");
    }

</script>

