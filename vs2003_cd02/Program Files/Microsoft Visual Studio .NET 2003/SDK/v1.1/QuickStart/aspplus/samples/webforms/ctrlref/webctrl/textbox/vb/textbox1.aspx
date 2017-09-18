<html>
<head>

    <script language="VB" runat="server">

        Sub SubmitBtn_Click(sender As Object, e As EventArgs)
            Label1.Text = "Text1.Text = " & Text1.Text
        End Sub

    </script>

</head>
<body>

    <h3><font face="Verdana">TextBox Sample</font></h3>

    <form runat="server">

      <asp:TextBox id="Text1" Text="Copy this text to the label" Width="200px" runat="server"/>

      <asp:Button OnClick="SubmitBtn_Click" Text="Copy Text to Label" Runat="server"/>

      <p>
      
      <asp:Label id="Label1" Text="Label1" runat="server"/>

    </form>

</body>
</html>


