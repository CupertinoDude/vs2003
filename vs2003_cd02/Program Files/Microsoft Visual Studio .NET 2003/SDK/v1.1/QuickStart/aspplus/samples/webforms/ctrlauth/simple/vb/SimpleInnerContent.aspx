<%@ Register TagPrefix="SimpleControlSamples" Namespace="SimpleControlSamples" Assembly="SimpleControlSamplesVB" %>

<html>

   <body>

      <form method="POST" runat="server">

          <SimpleControlSamples:SimpleInnerContentVB id="MyControl" runat=server>
             My Message Is Inside the Control Tag!!!!
          </SimpleControlSamples:SimpleInnerContentVB>

      </form>

   </body>

</html>