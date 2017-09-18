<%@ Register TagPrefix="CompositionSampleControls" Namespace="CompositionSampleControls" Assembly="CompositionSampleControlsVB" %>

<html>

   <script language="VB" runat=server>

      Private Sub Composition3_Change(Sender As Object, E As EventArgs)

         If MyControl.Value < 0
            MyControl.Value = 0
         End If
      End Sub

   </script>

   <body>

      <form method="POST" action="Composition3.aspx" runat=server>

          <CompositionSampleControls:Composition3VB id="MyControl" OnChange="Composition3_Change" runat=server/>

      </form>

   </body>

</html>