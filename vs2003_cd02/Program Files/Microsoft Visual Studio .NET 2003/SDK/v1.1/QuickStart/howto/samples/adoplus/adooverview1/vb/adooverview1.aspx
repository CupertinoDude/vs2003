<%@ Page Language="VB" Debug="true" Src="adooverview1.vb"%>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="HowTo.Samples.ADONET" %>

<script language="VB" runat="server">

protected sub Page_Load(Src as object, E as EventArgs) 
  Dim writer as StringWriter
  writer = new StringWriter()
  Console.SetOut(writer)
  Dim myadooverview1 as adooverview1
  myadooverview1 = new adooverview1()
  myadooverview1.Run()
  output.InnerHtml = writer.ToString()
end sub

</script>


<html>
<body style="background-color:f6e4c6">
  <tr><td><h4><xmp id="output" runat="server"/></h4></td></tr>
</body>
</html>

