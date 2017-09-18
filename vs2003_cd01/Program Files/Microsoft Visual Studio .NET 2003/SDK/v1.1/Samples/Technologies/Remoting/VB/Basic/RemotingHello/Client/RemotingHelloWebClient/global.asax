<%@ Import Namespace="System.Runtime.Remoting" %>

<script runat="server" language="vb">
  Sub Application_OnStart()
    RemotingConfiguration.Configure(HttpContext.Current.Server.MapPath("web.config"))
  End Sub
</script>       

