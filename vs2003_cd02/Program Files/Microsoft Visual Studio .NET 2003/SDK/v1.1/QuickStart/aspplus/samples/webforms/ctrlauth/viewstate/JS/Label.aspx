<%@ Register TagPrefix="ViewStateControlSamples" Namespace="ViewStateControlSamplesJS" Assembly="ViewStateControlSamplesJS" %>

<html>

   <script language="JScript" runat=server>

       private function Btn1_Click(sender:Object, e:EventArgs) : void {
           MyLabel1.Text = "Button 1 was clicked!!!";
           MyLabel1.FontSize++;
       }

       private function Btn2_Click(sender:Object, e:EventArgs) : void {
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