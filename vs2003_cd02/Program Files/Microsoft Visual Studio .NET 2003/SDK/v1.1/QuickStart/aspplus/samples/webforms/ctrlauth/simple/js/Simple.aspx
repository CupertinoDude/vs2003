<%@ Page Language="JScript" %>
<%@ Import Namespace="Microsoft.Jscript" %>
<%@ Register TagPrefix="SimpleControlSamples" Namespace="SimpleControlSamplesJS" Assembly="SimpleControlSamplesJS" %>

<html>

   <body>

      <form method="POST" action="Simple.aspx" runat=server>

          <SimpleControlSamples:Simple id="MyControl" runat=server/>

      </form>

   </body>

</html>