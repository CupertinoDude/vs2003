<%@ Page Language="VB" Debug="true" Src="typeddata.vb"%>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="HowTo.Samples.ADONET" %>

<script language="VB" runat="server">

protected sub Page_Load(Src as object, E as EventArgs) 
  Dim writer as StringWriter
  writer = new StringWriter()
  Console.SetOut(writer)
  Dim mytypeddata as typeddata
  mytypeddata = new typeddata()
  mytypeddata.Run()
  output.InnerHtml = writer.ToString()
end sub

</script>


<html>
<body style="background-color:f6e4c6">
  <tr><td><h4><xmp id="output" runat="server"/></h4></td></tr>
</body>
</html>
