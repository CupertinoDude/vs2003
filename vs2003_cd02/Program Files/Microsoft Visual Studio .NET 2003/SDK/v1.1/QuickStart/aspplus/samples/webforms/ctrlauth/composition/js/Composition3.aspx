<%@ Page Language="JScript" %>
<%@ Register TagPrefix="CompositionSampleControls" Namespace="CompositionSampleControlsJS" Assembly="CompositionSampleControlsJS" %>

<html>

   <script language="JScript" runat=server>

      function Composition3_Change(sender:Object, e:EventArgs) : void {

         if (MyControl.Value < 0) {
            MyControl.Value = 0;
         }
      }

   </script>

   <body>
      <font color="#FF0000" size="-1">This sample is crippled because JScript doesn't support creating events</font>

      <form method="POST" action="Composition3.aspx" runat=server>

          <CompositionSampleControls:Composition3 id="MyControl" runat=server/>

      </form>

   </body>

</html>