<html>
<head>

    <script language="C#" runat="server">

        void Page_Load(Object sender, EventArgs e) {
        
            // Show/Hide Panel Contents
        
            if (Check1.Checked) {
                Panel1.Visible=false;
            }
            else {
                Panel1.Visible=true;
            }

            // Generate label controls
            
            int numlabels = int.Parse(DropDown1.SelectedItem.Value);
            
            for (int i=1; i<=numlabels; i++) {
                System.Web.UI.WebControls.Label l = new System.Web.UI.WebControls.Label();
                l.Text = "Label" + i.ToString();
                l.ID = "Label" + i.ToString();
                Panel1.Controls.Add(l);
                Panel1.Controls.Add(new LiteralControl("<br>"));
            }

            // Generate textbox controls
            
            int numtexts = int.Parse(DropDown2.SelectedItem.Value);
            
            for (int i=1; i<=numtexts; i++) {
                System.Web.UI.WebControls.TextBox t = new System.Web.UI.WebControls.TextBox();
                t.Text = "TextBox" + i.ToString();
                t.ID = "TextBox" + i.ToString();
                Panel1.Controls.Add(t);
                Panel1.Controls.Add(new LiteralControl("<br>"));
            }
        }

    </script>

</head>
<body>

    <h3><font face="Verdana">Panel Example</font></h3>

    <form runat=server>

        <asp:Panel id="Panel1" runat="server"
            BackColor="gainsboro"
            Height="200px"
            Width="300px">

            Panel1: Here is some static content...
            <p>

        </asp:Panel>

        <p>
        
        Generate Labels:
        <asp:DropDownList id=DropDown1 runat="server">
            <asp:ListItem Value="0">0</asp:ListItem>
            <asp:ListItem Value="1">1</asp:ListItem>
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="3">3</asp:ListItem>
            <asp:ListItem Value="4">4</asp:ListItem>
        </asp:DropDownList>

        <br>
        
        Generate TextBoxes:
        <asp:DropDownList id=DropDown2 runat="server">
            <asp:ListItem Value="0">0</asp:ListItem>
            <asp:ListItem Value="1">1</asp:ListItem>
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="3">3</asp:ListItem>
            <asp:ListItem Value="4">4</asp:ListItem>
        </asp:DropDownList>

        <p>
        <asp:CheckBox id="Check1" Text="Hide Panel" runat="server"/>
            
        <p>
        <asp:Button Text="Refresh Panel" runat="server"/>

    </font>
    </form>

</body>
</html>


