
<script language="VB" runat="server">

    Sub Application_Start(Sender As Object, E As EventArgs)
        ' Do application startup code here
    End Sub

    Sub Application_End(Sender As Object, E As EventArgs)
        ' Clean up application resources here
    End Sub

    Sub Session_Start(Sender As Object, E As EventArgs)
        Response.Write("Session is Starting...<br>")
    End Sub

    Sub Session_End(Sender As Object, E As EventArgs)
        ' Clean up session resources here
    End Sub

    Sub Application_BeginRequest(Sender As Object, E As EventArgs)
        Response.Write("<h3><font face='Verdana'>Using the Global.asax File</font></h3>")
        Response.Write("Request is Starting...<br>")
    End Sub

    Sub Application_EndRequest(Sender As Object, E As EventArgs)
        Response.Write("Request is Ending...<br>")
    End Sub
    
    Sub Application_Error(Sender As Object, E As EventArgs)
        Context.ClearError()
        Response.Redirect("errorpage.htm")
    End Sub

</script>

