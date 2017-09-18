<%@ Register TagPrefix="CompositionSampleControls" Namespace="CompositionSampleControls" Assembly="CompositionSampleControlsVB" %>

<html>

   <script language="VB" runat=server>

      Private Sub AddBtn_Click(Sender As Object, E As EventArgs)
          MyControl.Value = MyControl.Value + 1
      End Sub

      Private Sub SubtractBtn_Click(Sender As Object, E As EventArgs)
          MyControl.Value = MyControl.Value - 1
      End Sub

   </script>

   <body>

      <form method="POST" action="Composition1.aspx" runat=server>

          <CompositionSampleControls:Composition1VB id="MyControl" runat=server/>

          <br>

          <asp:button text="Add" OnClick="AddBtn_Click" runat=server/> |
          <asp:button text="Subtract" OnClick="SubtractBtn_Click" runat=server/>

      </form>

   </body>

</html>