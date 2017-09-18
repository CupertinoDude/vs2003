<%@ Register TagPrefix="CompositionSampleControls" Namespace="CompositionSampleControls" Assembly="CompositionSampleControls" %>

<html>

   <script language="C#" runat=server>

      private void AddBtn_Click(Object sender, EventArgs e) {
          MyControl.Value++;
      }

      private void SubtractBtn_Click(Object sender, EventArgs e) {
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