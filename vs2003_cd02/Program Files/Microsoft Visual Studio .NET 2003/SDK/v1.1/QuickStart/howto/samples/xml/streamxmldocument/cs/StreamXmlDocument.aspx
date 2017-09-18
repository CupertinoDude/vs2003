<%@ Page Language="C#" Debug="true" Src="StreamXmlDocument.cs"%>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="HowTo.Samples.XML" %>

<html>
<head>
        <link rel="stylesheet" href="intro.css">
</head>
<body style="background-color:f6e4c6">

         <form action="StreamXmlDocument.aspx" method="post" runat="server">
         <font>Input file: </font> 
        <a href="/quickstart/howto/samples/Xml/StreamXmlDocument/CS/books.xml">books.xml</a>
         &nbsp;&nbsp;<font>Stylesheet: </font> 
        <a href="/quickstart/howto/samples/Xml/StreamXmlDocument/CS/identity.xsl">identity.xsl</a>
  <center>
    &nbsp;&nbsp;&nbsp;&nbsp;<asp:button type=submit text="Run" OnClick="SubmitBtn_Click" runat="server"/></br>
         </form>
  </center>
  <table align="center">
  <tr><th><span>Output from reading file...</span></th></tr>
  <tr><th><span></span></th></tr>
  <tr><td><h4><xmp id="output" runat="server"/></h4></td></tr>
  </table>

</body>
</html>

<script language="C#" runat=server>

private void SubmitBtn_Click(Object sender, EventArgs e)
{
	String[] args = {Server.MapPath("books.xml"),Server.MapPath("identity.xsl")};
	StringWriter writer = new StringWriter();
  Console.SetOut(writer);
  StreamXmlDocumentSample myStreamXmlDocumentSample = new StreamXmlDocumentSample();
  myStreamXmlDocumentSample.Run(args);
  output.InnerHtml = writer.ToString();
}

</script>
