<html>
<head>

    <script language="C#" runat="server">

        void SubmitBtn_Click(Object Sender, EventArgs e) {
            Label1.Text="You chose: " + DropDown1.SelectedItem.Text;
        }

    </script>

</head>
<body>

    <h3><font face="Verdana">DropDownList Example</font></h3>

    <form runat=server>

        <asp:DropDownList id=DropDown1 runat="server">
            <asp:ListItem>Item 1</asp:ListItem>
            <asp:ListItem>Item 2</asp:ListItem>
            <asp:ListItem>Item 3</asp:ListItem>
            <asp:ListItem>Item 4</asp:ListItem>
            <asp:ListItem>Item 5</asp:ListItem>
            <asp:ListItem>Item 6</asp:ListItem>
        </asp:DropDownList>

        <asp:button text="Submit" OnClick="SubmitBtn_Click" runat=server/>

        <p>
        
        <asp:Label id=Label1 font-name="Verdana" font-size="10pt" runat="server">
          Select a value from the list
        </asp:Label>

    </form>

</body>
</html>


