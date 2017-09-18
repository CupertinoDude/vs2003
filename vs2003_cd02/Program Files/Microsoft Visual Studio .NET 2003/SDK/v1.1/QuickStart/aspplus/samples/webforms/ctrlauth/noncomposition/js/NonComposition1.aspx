<%@ Register TagPrefix="NonCompositionSampleControls" Namespace="NonCompositionSampleControlsJS" Assembly="NonCompositionSampleControlsJS" %>

<html>

   <script language="JScript" runat=server>

      private function AddBtn_Click(sender:Object, e:EventArgs) : void {
          MyControl.Value++;
      }

      private function SubtractBtn_Click(sender:Object, e:EventArgs) : void {
          MyControl.Value--;
      }

   </script>

   <body>

      <form method="POST" action="NonComposition1.aspx" runat=server>

          <NonCompositionSampleControls:NonComposition1 id="MyControl" runat=server/>

          <br>

          <asp:button text="Add" OnClick="AddBtn_Click" runat=server/> |
          <asp:button text="Subtract" OnClick="SubtractBtn_Click" runat=server/>

      </form>

   </body>

</html>