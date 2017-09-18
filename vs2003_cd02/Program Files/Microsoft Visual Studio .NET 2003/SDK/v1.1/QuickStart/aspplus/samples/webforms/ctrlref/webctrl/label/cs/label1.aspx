<html>
<head>

    <script language="C#" runat="server">

        void Button1_Click(Object Sender, EventArgs e) {
            Label1.Text = System.Web.HttpUtility.HtmlEncode(Text1.Text);
        }

    </script>

</head>
<body>

    <h3><font face="Verdana">Label Example</font></h3>

    <form runat="server">

        <asp:Label id="Label1" Text="Label1" Font-Name="Verdana" Font-Size="10pt" Width="200px" BorderStyle="solid" BorderColor="#cccccc" runat="server"/>

        <p>

        <asp:TextBox id="Text1" Text="Copy this text to the label" Width="200px" runat="server" />

        <asp:Button id="Button1" Text="Copy" OnClick="Button1_Click" Runat="server"/>

    </form>

</body>
</html>


