<%@ Page Language="JScript" %>
<%@ Import Namespace="Microsoft.Jscript" %>
<%@ Register TagPrefix="SimpleControlSamples" Namespace="SimpleControlSamplesJS" Assembly="SimpleControlSamplesJS" %>

<html>

   <body>

      <form method="POST" runat="server">

          <SimpleControlSamples:SimpleInnerContent id="MyControl" runat=server>
             My Message Is Inside the Control Tag!!!!
          </SimpleControlSamples:SimpleInnerContent>

      </form>

   </body>

</html>