<html>
<head>

    <script language="C#" runat="server">

       void Page_Load(Object sender, EventArgs e) {

          int row = 0;

          //generate rows and cells
          int numrows = int.Parse(Select1.Value);
          int numcells = int.Parse(Select2.Value);

          for (int j=0; j<numrows; j++) {

             HtmlTableRow r = new HtmlTableRow();

             // set bgcolor on alternating rows
             if (row%2 == 1)
                r.BgColor="Gainsboro";

             row++;

             for (int i=0; i<numcells; i++) {
                HtmlTableCell c = new HtmlTableCell();
                c.Controls.Add(new LiteralControl("row " + j.ToString() + ", cell " + i.ToString()));
                r.Cells.Add(c);
             }
             Table1.Rows.Add(r);
          }
       }

    </script>

</head>
<body>

    <h3><font face="Verdana">HtmlTable Example</font></h3>

    <form runat=server>
    <font face="Verdana" size="-1">
        <p>

        <table id="Table1" CellPadding=5 CellSpacing=0 Border="1" BorderColor="black" runat="server" />
        
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


