<html>
<head>

    <script language="VB" runat="server">

        Sub SubmitBtn_Click(sender As Object, e As EventArgs)
            If ListBox1.SelectedIndex > -1 Then
                Label1.Text="You chose: " + ListBox1.SelectedItem.Text
            End If    
        End Sub

    </script>

</head>
<body>

    <h3><font face="Verdana">ListBox Example</font></h3>
    <p>

    <form runat=server>

        <asp:ListBox id=ListBox1 Width="100px" runat="server">
            <asp:ListItem>Item 1</asp:ListItem>
            <asp:ListItem>Item 2</asp:ListItem>
            <asp:ListItem>Item 3</asp:ListItem>
            <asp:ListItem>Item 4</asp:ListItem>
            <asp:ListItem>Item 5</asp:ListItem>
            <asp:ListItem>Item 6</asp:ListItem>
        </asp:ListBox>

        <asp:button Text="Submit" OnClick="SubmitBtn_Click" runat="server" />
        
        <p>
        
        <asp:Label id=Label1 font-name="Verdana" font-size="10pt" runat="server"/>
        
    </form>

</body>
</html>


