<html>
<head>

    <script language="VB" runat="server">

        Sub Page_Load(sender As Object, e As EventArgs) 
        
            Dim numlabels as Integer
            Dim numtexts as Integer
            Dim i as Integer
        
            ' Show/Hide Panel Contents
            If Check1.Checked Then
                Panel1.Visible = False
            Else
                Panel1.Visible = True
            End If

            ' Generate label controls
            numlabels = CInt(DropDown1.SelectedItem.Value)
            
            For i = 1 To numlabels
                Dim l As System.Web.UI.WebControls.Label = New System.Web.UI.WebControls.Label()
                l.Text = "Label" & i
                l.ID = "Label" & i
                Panel1.Controls.Add(l)
                Panel1.Controls.Add(new LiteralControl("<br>"))
            Next

            ' Generate textbox controls
            numtexts = CInt(DropDown2.SelectedItem.Value)
            
            For i = 1 To numtexts
                Dim t As System.Web.UI.WebControls.TextBox = New System.Web.UI.WebControls.TextBox()
                t.Text = "TextBox" & i
                t.ID = "TextBox" & i
                Panel1.Controls.Add(t)
                Panel1.Controls.Add(new LiteralControl("<br>"))
            Next
        End Sub

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


