<html>
<head>

    <script language="JScript" runat="server">

       function Page_Load(sender:Object, e:EventArgs) : void {

          var row:int = 0;

          //generate rows and cells
          var numrows:int = Int32.Parse(Select1.Value);
          var numcells:int = Int32.Parse(Select2.Value);

          for (var j:int=0; j<numrows; j++) {

             var r:HtmlTableRow = new HtmlTableRow();

             // set bgcolor on alternating rows
             if (row%2 == 1)
                r.BgColor="Gainsboro";

             row++;

             for (var i:int=0; i<numcells; i++) {
                var c:HtmlTableCell = new HtmlTableCell();
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


