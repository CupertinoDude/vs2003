<%@ Register TagPrefix="Acme" TagName="Message" Src="pagelet2.ascx" %>

<html>

  <script language="JScript" runat="server">

      function SubmitBtn_Click(sender : Object, E : EventArgs) : void  {
          MyMessage.Text = "Message text changed!";
          MyMessage.Color = "red";
      }

  </script>

<body style="font: 10pt verdana">

  <h3>A Simple Pagelet w/ Properties</h3>

  <form runat="server">

    <Acme:Message id="MyMessage" Text="This is a custom message!" Color="blue" runat="server"/>

    <p>

    <asp:button text="Change Properties" OnClick="SubmitBtn_Click" runat=server/>

  </form>

</body>
</html>