<html>
<head>

    <script language="C#" runat="server">

       void SubmitBtn_Click(Object sender, EventArgs e) {
       
          Image1.ImageUrl="/quickstart/aspplus/images/" + DropDown1.SelectedItem.Value;
          Image1.AlternateText=DropDown1.SelectedItem.Text;
       }

    </script>

</head>

<body>

    <h3><font face="Verdana">Simple HtmlImage Sample</font></h3>

    <form runat=server>

        <asp:Image ID="Image1" ImageUrl="/quickstart/aspplus/images/cereal1.gif" AlternateText="Healthy Grains" runat="server" />

        <p>

        Select image file:

        <asp:DropDownList id=DropDown1 runat="server">
            <asp:ListItem Value="Cereal1.gif">Healthy Grains</asp:ListItem>
            <asp:ListItem Value="Cereal2.gif">Corn Flake Cereal</asp:ListItem>
            <asp:ListItem Value="Cereal3.gif">U.F.O.S</asp:ListItem>
            <asp:ListItem Value="Cereal4.gif">Oatey O's</asp:ListItem>
            <asp:ListItem Value="Cereal5.gif">Strike</asp:ListItem>
            <asp:ListItem Value="Cereal7.gif">Fruity Pops</asp:ListItem>
        </asp:DropDownList>

        <asp:button text="Apply" OnClick="SubmitBtn_Click" runat=server/>

    </form>

</body>
</html>






