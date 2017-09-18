<%@ Page Language="C#" Debug="true" Src="ValidationReadingXML.cs"%>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="HowTo.Samples.XML" %>

<html>
<head>
        <link rel="stylesheet" href="../intro.css">
</head>
<body style="background-color:f6e4c6">

        <form action="ValidationReadingXML.aspx" method="post" runat="server">
        <font>DTD for booksDTD.xml: </font> 
        <a href="/quickstart/howto/samples/Xml/ValidationReadingXML/CS/books.dtd">books.dtd </a></br>

        <font>XML document that validates against the books.dtd: </font> 
        <a href="/quickstart/howto/samples/Xml/ValidationReadingXML/CS/booksDTD.xml">booksDTD.xml</a></br>

        <font>XML document that fails validation against the books.dtd: </font> 
        <a href="/quickstart/howto/samples/Xml/ValidationReadingXML/CS/booksDTDFail.xml">booksDTDFail.xml</a></br>

        <font>Schema for booksSchema.xml: </font> 
        <a href="/quickstart/howto/samples/Xml/ValidationReadingXML/CS/schema.xml">schema.xml</a></br>

        <font>XML document that validates against the schema.xml: </font> 
        <a href="/quickstart/howto/samples/Xml/ValidationReadingXML/CS/booksSchema.xml">booksSchema.xml</a></br>

        <font>XML document that fails validation against the schema.xml: </font> 
        <a href="/quickstart/howto/samples/Xml/ValidationReadingXML/CS/booksSchemaFail.xml">booksSchemaFail.xml</a></br></br>

  <center>
    &nbsp;&nbsp;&nbsp;&nbsp;<asp:button type=submit text="Run" OnClick="SubmitBtn_Click" runat="server"/></br>
        </form>
  </center>
  <p>

  <table align="center">
  <tr><th><span>Output from validation...</span></th></tr>
  <tr><th><span></span></th></tr>
  <tr><td><h4><xmp id="output" runat="server"/></h4></td></tr>
  </table>

</body>
</html>

<script language="C#" runat=server>

private void SubmitBtn_Click(Object sender, EventArgs e)
{
  String[] args = {Server.MapPath("booksDTD.xml"), Server.MapPath("booksDTDFail.xml"), Server.MapPath("booksSchema.xml"), Server.MapPath("booksSchemaFail.xml"), Server.MapPath("schema.xsd")};
	StringWriter writer = new StringWriter();
  Console.SetOut(writer);
  ValidationReadingXMLSample myValidationReadingXMLSample = new ValidationReadingXMLSample();
  myValidationReadingXMLSample.Run(args);
  output.InnerHtml = writer.ToString();
}

</script>
