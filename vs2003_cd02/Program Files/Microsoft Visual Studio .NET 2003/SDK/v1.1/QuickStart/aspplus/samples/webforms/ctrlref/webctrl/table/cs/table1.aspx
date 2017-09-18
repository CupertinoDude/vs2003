<html>
<head>

    <script language="C#" runat="server">

        void Page_Load(Object sender, EventArgs e) {
        
            // Generate rows and cells
            
            int numrows = int.Parse(DropDown1.SelectedItem.Value);
            int numcells = int.Parse(DropDown2.SelectedItem.Value);
            
            for (int j=0; j<numrows; j++) {
            
                TableRow r = new TableRow();
                
                for (int i=0; i<numcells; i++) {
                    TableCell c = new TableCell();
                    c.Controls.Add(new LiteralControl("row " + j.ToString() + ", cell " + i.ToString()));
                    r.Cells.Add(c);
                }
                
                Table1.Rows.Add(r);
            }
        }

    </script>

</head>
<body>

    <h3><font face="Verdana">Table Example</font></h3>

    <form runat=server>

        <asp:Table id="Table1" Font-Name="Verdana" Font-Size="8pt" CellPadding=5 CellSpacing=0 BorderColor="black" BorderWidth="1" Gridlines="Both" runat="server"/>

        <p>
        Table rows:
        <asp:DropDownList id=DropDown1 runat="server">
            <asp:ListItem Value="1">1</asp:ListItem>
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="3">3</asp:ListItem>
            <asp:ListItem Value="4">4</asp:ListItem>
        </asp:DropDownList>

        <br>
        Table cells:
        <asp:DropDownList id=DropDown2 runat="server">
            <asp:ListItem Value="1">1</asp:ListItem>
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="3">3</asp:ListItem>
            <asp:ListItem Value="4">4</asp:ListItem>
        </asp:DropDownList>

        <p>
        <asp:button Text="Generate Table" runat=server/>
        
    </form>

</body>
</html>


