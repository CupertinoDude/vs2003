<%@ Page Language="VB" Debug="true" Src="StreamXmlDocument.vb"%>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="HowTo.Samples.XML" %>

<html>
<head>
        <link rel="stylesheet" href="intro.css">
</head>
<body style="background-color:f6e4c6">

         <form action="StreamXmlDocument.aspx" method="post" runat="server">
         <font>Input file: </font> 
        <a href="/quickstart/howto/samples/Xml/StreamXmlDocument/VB/books.xml">books.xml</a>
         &nbsp;&nbsp;<font>Stylesheet: </font> 
        <a href="/quickstart/howto/samples/Xml/StreamXmlDocument/VB/identity.xsl">identity.xsl</a>
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

<script language="VB" runat=server>

Private Sub SubmitBtn_Click(sender As Object, e As EventArgs)
	Dim args As String() = {Server.MapPath("books.xml"),Server.MapPath("identity.xsl")}
  Dim writer as StringWriter
  writer = new StringWriter()
  Console.SetOut(writer)
  Dim myStreamXmlDocumentSample as StreamXmlDocumentSample
  myStreamXmlDocumentSample = new StreamXmlDocumentSample()
  myStreamXmlDocumentSample.Run(args)
  output.InnerHtml = writer.ToString()
End Sub

</script>