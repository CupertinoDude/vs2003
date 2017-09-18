<%@ Page Language="VB" Debug="true" Src="DataSetMapXsdSchema.vb"%>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="HowTo.Samples.XML" %>

<html>
<head>
      	<link rel="stylesheet" href="intro.css">
</head>
<body style="background-color:f6e4c6">

       	<form action="DataSetMapXSDSchema.aspx" method="post" runat="server">
       	<font>Schema file: </font> 
        <a href="/quickstart/howto/samples/Xml/DataSetMapXSDSchema/VB/books.xsd">books.xsd</a>
	<center>
		&nbsp;&nbsp;&nbsp;&nbsp;<asp:button type=submit text="Run" OnClick="SubmitBtn_Click" runat="server"/></br>
       	</form>
	</center>
	<p>

	<table align="center">
	<tr><th><span>Output from creating tables from schema...</span></th></tr>
	<tr><th><span></span></th></tr>
	<tr><td><h4><xmp id="output" runat="server"/></h4></td></tr>
	</table>

</body>
</html>

<script language="VB" runat=server>

Private Sub SubmitBtn_Click(sender As Object, e As EventArgs)
  Dim writer as StringWriter
  writer = new StringWriter()
  Console.SetOut(writer)
  Dim myDataSetMapXMLDataSample as DataSetMapXSDSchemaSample
  myDataSetMapXMLDataSample = new DataSetMapXSDSchemaSample()
  myDataSetMapXMLDataSample.Run(Server.MapPath("books.xsd"))
  output.InnerHtml = writer.ToString()
End Sub

</script>
