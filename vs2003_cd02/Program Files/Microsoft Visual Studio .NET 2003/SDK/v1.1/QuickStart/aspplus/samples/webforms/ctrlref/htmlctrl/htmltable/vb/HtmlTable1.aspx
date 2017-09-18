<html>
<head>

    <script language="VB" runat="server">

       Sub Page_Load(sender As Object, e As EventArgs) 

            Dim numrows As Integer
            Dim numcells As Integer
            Dim i As Integer = 0
            Dim j As Integer = 0
            Dim Row As Integer = 0
            Dim r As HtmlTableRow
            Dim c As HtmlTableCell
        
            ' Generate rows and cells
            numrows = CInt(Select1.Value)
            numcells = CInt(Select2.Value)
            
            For j = 0 To numrows-1
            
                r = new HtmlTableRow()
                            
                If (row Mod 2 <> 0) Then
                    r.BgColor = "Gainsboro"
                End If
                row += 1
             
                For i = 0 To numcells-1
                    c = new HtmlTableCell()
                    c.Controls.Add(new LiteralControl("row " & j & ", cell " & i))
                    r.Cells.Add(c)
                Next i
                
                Table1.Rows.Add(r)
            Next j
       End Sub

    </script>

</head>
<body>

    <h3><font face="Verdana">HtmlTable Example</font></h3>

    <form runat=server>
    <font face="Verdana" size="-1">
        <p>

        <table id="Table1" CellPadding=5 CellSpacing=0 Border="1" runat="server" />
        
        <p>
        Table rows:
        <select id="Select1" runat="server">
            <option Value="1">1</option>
            <option Value="2">2</option>
            <option Value="3">3</option>
            <option Value="4">4</option>
            <option Value="5">5</option>
        </select>

        <br>
        Table cells:
        <select id="Select2" runat="server">
            <option Value="1">1</option>
            <option Value="2">2</option>
            <option Value="3">3</option>
            <option Value="4">4</option>
            <option Value="5">5</option>
        </select>
        
        <input type="submit" value="Generate Table" runat="server">

    </font>
    </form>

</body>
</html>


