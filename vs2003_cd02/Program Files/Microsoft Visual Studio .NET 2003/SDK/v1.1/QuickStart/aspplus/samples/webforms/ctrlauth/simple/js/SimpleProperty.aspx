<%@ Page Language="JScript" %>
<%@ Import Namespace="Microsoft.Jscript" %>
<%@ Register TagPrefix="SimpleControlSamples" Namespace="SimpleControlSamplesJS" Assembly="SimpleControlSamplesJS" %>

<html>

   <body>

      <form method="POST" runat="server">

          <SimpleControlSamples:SimpleProperty Message="Hello There" MessageSize="Large" Iterations=3 runat=server/>

      </form>

   </body>

</html>