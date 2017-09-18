<%@ Page Language="VB" Debug="true" Src="XmlSchemaObjectModel.vb"%>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="HowTo.Samples.XML" %>

<html>
<head>
          <link rel="stylesheet" href="intro.css">
</head>
<body style="background-color:f6e4c6">

           <form action="XmlSchemaObjectModel.aspx" method="post" runat="server">
           <font>Input file1: </font> 
        <a href="/quickstart/howto/samples/Xml/XmlSchemaObjectModel/VB/books.xsd">books.xsd</a>
           &nbsp;&nbsp;<font>Stylesheet1: </font> 
        <a href="/quickstart/howto/samples/Xml/XmlSchemaObjectModel/VB/poschema.xsd">poschema.xsd</a>
    <center>
        &nbsp;&nbsp;&nbsp;&nbsp;<asp:button type=submit text="Run" OnClick="SubmitBtn_Click" runat="server"/></br>
           </form>
    </center>
    <table align="center">
    <tr><th><span>Output ...</span></th></tr>
    <tr><th><span></span></th></tr>
    <tr><td><h4><xmp id="output" runat="server"/></h4></td></tr>
    </table>

</body>
</html>

<script language="VB" runat=server>

Private Sub SubmitBtn_Click(sender As Object, e As EventArgs)
	Dim args As String() = {Server.MapPath("books.xsd"),Server.MapPath("poschema.xsd")}
  Dim writer as StringWriter
  writer = new StringWriter()
  Console.SetOut(writer)
  Dim myXmlSchemaObjectModelSample as XmlSchemaObjectModelSample
  myXmlSchemaObjectModelSample = new XmlSchemaObjectModelSample()
  myXmlSchemaObjectModelSample.Run(args)
  output.InnerHtml = writer.ToString()
End Sub

</script>
