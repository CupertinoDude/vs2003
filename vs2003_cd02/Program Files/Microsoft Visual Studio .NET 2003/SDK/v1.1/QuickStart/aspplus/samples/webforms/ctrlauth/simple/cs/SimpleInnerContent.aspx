<%@ Register TagPrefix="SimpleControlSamples" Namespace="SimpleControlSamples" Assembly="SimpleControlSamples" %>

<html>

   <body>

      <form method="POST" runat="server">

          <SimpleControlSamples:SimpleInnerContent id="MyControl" runat=server>
             My Message Is Inside the Control Tag!!!!
          </SimpleControlSamples:SimpleInnerContent>

      </form>

   </body>

</html>