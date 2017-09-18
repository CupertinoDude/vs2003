<%@ Page Language="VB" Debug="true" Src="XmlReadFromUrl.vb"%>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="HowTo.Samples.XML" %>

<html>
<head>
      	<link rel="stylesheet" href="intro.css">
</head>
<body style="background-color:f6e4c6">

       	<form action="XmlReadFromUrl.aspx" method="post" runat="server">
       	<font>Input file: </font>
        <a href="/quickstart/howto/samples/Xml/XmlReadFromUrl/VB/books.xml">books.xml</a>
	<center>
		&nbsp;&nbsp;&nbsp;&nbsp;<asp:button type=submit text="Run" OnClick="SubmitBtn_Click" runat="server"/></br>
       	</form>
	</center>
	<p>

	<table align="center">
	<tr><th><span>Output from loading file...</span></th></tr>
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
  Dim myXmlReadFromUrlSample as XmlReadFromUrlSample
  myXmlReadFromUrlSample = new XmlReadFromUrlSample()
  myXmlReadFromUrlSample.Run()
  output.InnerHtml = writer.ToString()
End Sub

</script>
