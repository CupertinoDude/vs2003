<%@ Page Language="VB" Debug="true" Src="adooverview4.vb"%>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="HowTo.Samples.ADONET" %>

<script language="VB" runat="server">

protected sub Page_Load(Src as object, E as EventArgs) 
  Dim writer as StringWriter
  writer = new StringWriter()
  Console.SetOut(writer)
  Dim myadooverview4 as adooverview4
  myadooverview4 = new adooverview4()
  myadooverview4.Run()
  output.InnerHtml = writer.ToString()
end sub

</script>


<html>
<body style="background-color:f6e4c6">
  <tr><td><h4><xmp id="output" runat="server"/></h4></td></tr>
</body>
</html>

