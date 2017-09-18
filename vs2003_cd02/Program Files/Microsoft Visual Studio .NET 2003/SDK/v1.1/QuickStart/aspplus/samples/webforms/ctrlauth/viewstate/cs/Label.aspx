<%@ Register TagPrefix="ViewStateControlSamples" Namespace="ViewStateControlSamples" Assembly="ViewStateControlSamples" %>

<html>

   <script language="C#" runat=server>

       private void Btn1_Click(Object sender, EventArgs e) {
           MyLabel1.Text = "Button 1 was clicked!!!";
           MyLabel1.FontSize++;
       }

       private void Btn2_Click(Object sender, EventArgs e) {
           MyLabel2.Text = "Button 2 was clicked!!!";
           MyLabel2.FontSize++;
       }

   </script>

   <body>

      <form method="POST" action="Label.aspx" runat=server>

          Message1: <ViewStateControlSamples:Label id="MyLabel1" Text="Label1" FontSize=1 runat=server/> <br>
          Message2: <ViewStateControlSamples:Label id="MyLabel2" Text="Label2" FontSize=1 runat=server/>

          <br><br>

          <asp:button Text="Button1" OnClick="Btn1_Click" runat=server/> | <asp:button Text="Button2" OnClick="Btn2_Click" runat=server/>

      </form>

   </body>

</html>