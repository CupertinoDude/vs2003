<%@ Page Language="C#" Debug="true" Src="SchemaCollection.cs"%>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="HowTo.Samples.XML" %>

<html>
<head>
        <link rel="stylesheet" href="intro.css">
</head>
<body style="background-color:f6e4c6">

        <form action="SchemaCollection.aspx" method="post" runat="server">
        <font>XML file: </font> 
        <a href="/quickstart/howto/samples/Xml/SchemaCollection/CS/xmlsc.xml">xmlsc.xml</a>
        &nbsp;&nbsp;<font>XSD file: </font> 
        <a href="/quickstart/howto/samples/Xml/SchemaCollection/CS/xmlsc.xsd">xmlsc.xsd</a>
  <center>
    &nbsp;&nbsp;&nbsp;&nbsp;<asp:button type=submit text="Run" OnClick="SubmitBtn_Click" runat="server"/></br>
        </form>
  </center>
  <table align="center">
  <tr><th><span>Output from reading the input files...</span></th></tr>
  <tr><th><span></span></th></tr>
  <tr><td><h4><xmp id="output" runat="server"/></h4></td></tr>
  </table>

</body>
</html>

<script language="C#" runat=server>

private void SubmitBtn_Click(Object sender, EventArgs e)
{
  String[] args ={Server.MapPath("xmlsc.xml"),Server.MapPath("xmlsc.xsd")};
  StringWriter writer = new StringWriter();
  Console.SetOut(writer);
  SchemaCollectionSample mySchemaCollectionSample = new SchemaCollectionSample();
  mySchemaCollectionSample.Run(args);
  output.InnerHtml = writer.ToString();
}

</script>
