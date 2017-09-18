<%@ Page Language="VB" Debug="true" Src="QueryXmlDocumentXPath.vb"%>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="HowTo.Samples.XML" %>

<html>
<head>
        <link rel="stylesheet" href="intro.css">
</head>

<body style="background-color:f6e4c6">

        <form action="QueryXmlDocumentXPath.aspx" method="post" runat="server">
        <font>Input file: </font> 
        <a href="/quickstart/howto/samples/Xml/QueryXmlDocumentXPath/VB/books.xml">books.xml</a>
  <center>
      <asp:button type=submit text="Run" OnClick="SubmitBtn_Click" runat="server"/>
        </form>
  </center>   
  <table align="center">
  <tr><th><span>Output From Query...</span></th></tr>
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
  Dim myQueryXmlDocumentXPathSample as QueryXmlDocumentXPathSample
  myQueryXmlDocumentXPathSample = new QueryXmlDocumentXPathSample()
  myQueryXmlDocumentXPathSample.Run(Server.MapPath("books.xml"))
  output.InnerHtml = writer.ToString()
End Sub

</script>