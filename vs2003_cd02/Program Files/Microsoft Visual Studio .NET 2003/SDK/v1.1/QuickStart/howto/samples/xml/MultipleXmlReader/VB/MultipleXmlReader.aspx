<%@ Page Language="VB" Debug="true" Src="MultipleXmlReader.vb"%>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="HowTo.Samples.XML" %>

<html>
<head>
      	<link rel="stylesheet" href="intro.css">
</head>
<body style="background-color:f6e4c6">

       	<form action="MultipleXmlReader.aspx" method="post" runat="server">
       	<font>Input file: </font> 
        <a href="/quickstart/howto/samples/Xml/MultipleXmlReader/VB/twopart.xml">twopart.xml</a>
	<center>
	    <asp:button type=submit text="Run" OnClick="SubmitBtn_Click" runat="server"/>
       	</form>
	</center>
	<p>

	<table align="center">
	<tr><th><span>Output...</span></th></tr>
	<tr><th><span></span></th></tr>
	<tr><td><h4><xmp id="output" runat="server"/></h4></td></tr>
	</table>

</body>
</html>

<script language="VB" runat="server">

Private Sub SubmitBtn_Click(sender As Object, e As EventArgs)
  Dim writer as StringWriter
  writer = new StringWriter()
  Console.SetOut(writer)
  Dim myMultipleXmlReaderSample as MultipleXmlReaderSample
  myMultipleXmlReaderSample = new MultipleXmlReaderSample()
  myMultipleXmlReaderSample.Run(Server.MapPath("twopart.xml"))
  output.InnerHtml = writer.ToString()
End Sub

</script>
