<html>
<head>
    <script language="VB" runat="server">

        Sub Page_Load(sender As Object, e As EventArgs) 
        
            Dim numrows As Integer
            Dim numcells As Integer
            Dim i As Integer
            Dim j As Integer
            Dim r As TableRow
            Dim c As TableCell
        
            ' Generate rows and cells
            numrows = CInt(DropDown1.SelectedItem.Value)
            numcells = CInt(DropDown2.SelectedItem.Value)
            
            For j = 0 To numrows-1
            
                r = new TableRow()
                
                For i = 0  To numcells-1
                    c = new TableCell()
                    c.Controls.Add(new LiteralControl("row " & j & ", cell " & i))
                    r.Cells.Add(c)
                Next i
                
                Table1.Rows.Add(r)
            Next j
        End Sub

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


