<%@ Page Language="C#" %>

<html>
<body>

  <form runat="server">

      <h3><font face="verdana">Applying Styles to Web Controls</font></h3>

      <p><font face="verdana"><h4>Style Properties</h4></font><p>

      <b>No Style:</b>
      <p>
      <ASP:Calendar runat="server" />
      <p>

      <b>Style:</b>
      <p>
      <ASP:Calendar runat="server"

           BackColor="Beige" 
           ForeColor="Brown"
           BorderWidth="3"
           BorderStyle="Solid"
           BorderColor="Black"
           Height="450"
           Width="450"
           Font-Size="12pt"
           Font-Name="Tahoma,Arial"
           Font-Underline="false"
           CellSpacing=2
           CellPadding=2 
           ShowGridLines=true
       />

    </form>

</body>
</html>