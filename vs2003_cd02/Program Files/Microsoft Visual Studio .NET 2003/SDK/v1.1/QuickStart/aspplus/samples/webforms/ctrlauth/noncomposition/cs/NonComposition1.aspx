<%@ Register TagPrefix="NonCompositionSampleControls" Namespace="NonCompositionSampleControls" Assembly="NonCompositionSampleControls" %>

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

      <form method="POST" action="NonComposition1.aspx" runat=server>

          <NonCompositionSampleControls:NonComposition1 id="MyControl" runat=server/>

          <br>

          <asp:button text="Add" OnClick="AddBtn_Click" runat=server/> |
          <asp:button text="Subtract" OnClick="SubtractBtn_Click" runat=server/>

      </form>

   </body>

</html>