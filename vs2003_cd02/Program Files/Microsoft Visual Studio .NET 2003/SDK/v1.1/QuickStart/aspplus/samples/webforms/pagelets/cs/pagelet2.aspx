<%@ Register TagPrefix="Acme" TagName="Message" Src="pagelet2.ascx" %>

<html>

  <script language="C#" runat="server">

      void SubmitBtn_Click(Object sender, EventArgs E) {
          MyMessage.Text = "Message text changed!";
          MyMessage.Color = "red";
      }

  </script>

<body style="font: 10pt verdana">

  <h3>A Simple User Control w/ Properties</h3>

  <form runat="server">

    <Acme:Message id="MyMessage" Text="This is a custom message!" Color="blue" runat="server"/>

    <p>

    <asp:button text="Change Properties" OnClick="SubmitBtn_Click" runat=server/>

  </form>

</body>
</html>