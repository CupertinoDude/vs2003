<%@ Page Language="C#" Debug="true" Src="ReadXmlStream.cs"%>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="HowTo.Samples.XML" %>

<html>
<head>
      	<link rel="stylesheet" href="intro.css">
</head>
<body style="background-color:f6e4c6">

       	<form action="ReadXmlStream.aspx" method="post" runat="server">
       	<font>Input file: </font> 
        <a href="/quickstart/howto/samples/Xml/ReadXmlStream/CS/books.xml">XML representation of the stream</a>
	<center>
		&nbsp;&nbsp;&nbsp;&nbsp;<asp:button type=submit text="Run" OnClick="SubmitBtn_Click" runat="server"/></br>
       	</form>
	</center>
	<p>

	<table align="center">
	<tr><th><span >Output from reading the stream ...</span></th></tr>
	<tr><th><span></span></th></tr>
	<tr><td><h4><xmp id="output" runat="server"/></h4></td></tr>
	</table>

</body>
</html>

<script language="C#" runat=server>

private void SubmitBtn_Click(Object sender, EventArgs e)
{
  StringWriter writer = new StringWriter();
  Console.SetOut(writer);
  ReadXmlStreamSample myReadXmlStreamSample = new ReadXmlStreamSample();
  myReadXmlStreamSample.Run();
  output.InnerHtml = writer.ToString();
}

</script>
