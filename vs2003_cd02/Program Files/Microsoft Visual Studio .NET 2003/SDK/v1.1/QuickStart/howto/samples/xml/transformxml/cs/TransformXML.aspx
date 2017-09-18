<%@ Page Language="C#" Debug="true" Src="TransformXML.cs"%>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="HowTo.Samples.XML" %>

<html>
<head>
          <link rel="stylesheet" href="intro.css">
</head>
<body style="background-color:f6e4c6">

           <form action="TransformXML.aspx" method="post" runat="server">
           <font>Input file1: </font> 
        <a href="/quickstart/howto/samples/Xml/TransformXML/CS/books.xml">books.xml</a>
           &nbsp;&nbsp;<font>Stylesheet1: </font> 
        <a href="/quickstart/howto/samples/Xml/TransformXML/CS/books.xsl">books.xsl</a>
        <p/p>
           <font>Input file2: </font> 
        <a href="/quickstart/howto/samples/Xml/TransformXML/CS/books.xml">ProcessParametersA.xml</a>
           &nbsp;&nbsp;<font>Stylesheet2: </font> 
        <a href="/quickstart/howto/samples/Xml/TransformXML/CS/books.xsl">StyleSheetGenerator.xsl</a>
        <p/p>
           <font>Input file3: </font> 
        <a href="/quickstart/howto/samples/Xml/TransformXML/CS/books.xml">ProcessParametersB.xml</a>
           &nbsp;&nbsp;<font>Stylesheet3: </font> 
        <a href="/quickstart/howto/samples/Xml/TransformXML/CS/books.xsl">StyleSheetGenerator.xsl</a>
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

<script language="C#" runat=server>

private void SubmitBtn_Click(Object sender, EventArgs e)
{
  StringWriter writer = new StringWriter();
  Console.SetOut(writer);
  TransformXMLSample myTransformXMLSample = new TransformXMLSample();

  Console.WriteLine("\n\n*********Output from the first transform:*********\n\n");
  String[] args1 = {Server.MapPath("books.xml"),Server.MapPath("books.xsl")};
  myTransformXMLSample.Run(args1);

  Console.WriteLine("\n\n*********Output from the second transform:*********\n\n");
  String[] args2 = {Server.MapPath("ProcessParametersA.xml"),Server.MapPath("StyleSheetGenerator.xsl")};
  myTransformXMLSample.Run(args2);
  
  Console.WriteLine("\n\n*********Output from the third transform:*********\n\n");
  String[] args3 = {Server.MapPath("ProcessParametersB.xml"),Server.MapPath("StyleSheetGenerator.xsl")};
  myTransformXMLSample.Run(args3);

  output.InnerHtml = writer.ToString();
  
}

</script>
