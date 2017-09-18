<%@ Register TagPrefix="CompositionSampleControls" Namespace="CompositionSampleControls" Assembly="CompositionSampleControls" %>

<html>

   <script language="C#" runat=server>

      private void Composition3_Change(Object sender, EventArgs e) {

         if (MyControl.Value < 0) {
            MyControl.Value = 0;
         }
      }

   </script>

   <body>

      <form method="POST" action="Composition3.aspx" runat=server>

          <CompositionSampleControls:Composition3 id="MyControl" OnChange="Composition3_Change" runat=server/>

      </form>

   </body>

</html>