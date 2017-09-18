<%@ Register TagPrefix="CompositionSampleControls" Namespace="CompositionSampleControlsJS" Assembly="CompositionSampleControlsJS" %>

<html>

   <script language="JScript" runat=server>

      function AddBtn_Click(sender:Object, e:EventArgs) : void {
          MyControl.Value++;
      }

      function SubtractBtn_Click(sender:Object, e:EventArgs) : void {
          MyControl.Value--;
      }

   </script>

   <body>

      <form method="POST" action="Composition1.aspx" runat=server>

          <CompositionSampleControls:Composition1 id="MyControl" runat=server/>

          <br>

          <asp:button text="Add" OnClick="AddBtn_Click" runat=server/> |
          <asp:button text="Subtract" OnClick="SubtractBtn_Click" runat=server/>

      </form>

   </body>

</html>