<%@ Register TagPrefix="ViewStateControlSamples" Namespace="ViewStateControlSamples" Assembly="ViewStateControlSamplesVB" %>

<html>

   <script language="VB" runat=server>

       Private Sub Btn1_Click(Sender As Object, E As EventArgs)
           MyLabel1.Text = "Button 1 was clicked!!!"
           MyLabel1.FontSize = MyLabel1.FontSize + 1
       End Sub

       Private Sub Btn2_Click(Sender As Object, E As EventArgs)
           MyLabel2.Text = "Button 2 was clicked!!!"
           MyLabel2.FontSize = MyLabel2.FontSize + 1
       End Sub

   </script>

   <body>

      <form method="POST" action="Label.aspx" runat=server>

          Message1: <ViewStateControlSamples:LabelVB id="MyLabel1" Text="Label1" FontSize=1 runat=server/> <br>
          Message2: <ViewStateControlSamples:LabelVB id="MyLabel2" Text="Label2" FontSize=1 runat=server/>

          <br><br>

          <asp:button Text="Button1" OnClick="Btn1_Click" runat=server/> | <asp:button Text="Button2" OnClick="Btn2_Click" runat=server/>

      </form>

   </body>

</html>