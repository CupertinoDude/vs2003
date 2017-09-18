<%@ Page Language="VB" Debug="true" Src="TransformXml.vb"%>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="HowTo.Samples.XML" %>

<html>
<head>
          <link rel="stylesheet" href="intro.css">
</head>
<body style="background-color:f6e4c6">

           <form action="TransformXml.aspx" method="post" runat="server">
           <font>Input file1: </font> 
        <a href="/quickstart/howto/samples/Xml/TransformXml/VB/books.xml">books.xml</a>
           &nbsp;&nbsp;<font>Stylesheet1: </font> 
        <a href="/quickstart/howto/samples/Xml/TransformXml/VB/books.xsl">books.xsl</a>
        <p/p>
           <font>Input file2: </font> 
        <a href="/quickstart/howto/samples/Xml/TransformXml/VB/books.xml">ProcessParametersA.xml</a>
           &nbsp;&nbsp;<font>Stylesheet2: </font> 
        <a href="/quickstart/howto/samples/Xml/TransformXml/VB/books.xsl">StyleSheetGenerator.xsl</a>
        <p/p>
           <font>Input file3: </font> 
        <a href="/quickstart/howto/samples/Xml/TransformXml/VB/books.xml">ProcessParametersB.xml</a>
           &nbsp;&nbsp;<font>Stylesheet3: </font> 
        <a href="/quickstart/howto/samples/Xml/TransformXml/VB/books.xsl">StyleSheetGenerator.xsl</a>
        <p/p>
    <center>
        &nbsp;&nbsp;&nbsp;&nbsp;<asp:button type=submit text="Run" OnClick="SubmitBtn_Click" runat="server"/></br>
           </form>
    </center>
    <table align="center">
    <tr><th><span>Output from the transform...</span></th></tr>
    <tr><th><span></span></th></tr>
    <tr><td><h4><xmp id="output" runat="server"/></h4></td></tr>
    </table>

</body>
</html>

<script language="VB" runat=server>

Private Sub SubmitBtn_Click(sender As Object, e As EventArgs)
	'Dim args As String() = {Server.MapPath("books.xml"),Server.MapPath("books.xsl")}
	Dim args As String() = {Server.MapPath("ProcessParametersA.xml"),Server.MapPath("StyleSheetGenerator.xsl")}
  Dim writer as StringWriter
  writer = new StringWriter()
  Console.SetOut(writer)
  Dim myTransformXMLSample as TransformXMLSample
  myTransformXMLSample = new TransformXMLSample()
  
  Console.WriteLine(Chr(10) & Chr(10) & "*********Output from the first transform:*********" & Chr(10) & Chr(10))
  Dim args1 As String() = {Server.MapPath("books.xml"),Server.MapPath("books.xsl")}
  myTransformXMLSample.Run(args1)

  Console.WriteLine(Chr(10) & Chr(10) & "*********Output from the second transform:*********" & Chr(10) & Chr(10))
	Dim args2 As String() = {Server.MapPath("ProcessParametersA.xml"),Server.MapPath("StyleSheetGenerator.xsl")}
  myTransformXMLSample.Run(args2)

  Console.WriteLine(Chr(10) & Chr(10) & "*********Output from the third transform:*********" & Chr(10) & Chr(10))
	Dim args3 As String() = {Server.MapPath("ProcessParametersB.xml"),Server.MapPath("StyleSheetGenerator.xsl")}
  myTransformXMLSample.Run(args3)

  output.InnerHtml = writer.ToString()
End Sub

</script>
