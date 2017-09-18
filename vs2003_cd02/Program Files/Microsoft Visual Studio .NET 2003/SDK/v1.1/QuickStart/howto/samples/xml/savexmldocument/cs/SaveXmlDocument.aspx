<%@ Page Language="C#" Debug="true" Src="SaveXmlDocument.cs"%>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="HowTo.Samples.XML" %>

<html>
<head>
        <link rel="stylesheet" href="intro.css">
</head>
<body style="background-color:f6e4c6">

    <form action="SaveXmlDocument.aspx" method="post" runat="server">
        Input file: 
        <a href="/quickstart/howto/samples/Xml/SaveXmlDocument/CS/books.xml">books.xml</a><br>
        Output file: <%=Environment.GetEnvironmentVariable("TEMP")%>\updatebooksCS.xml<br><br>
        <center>
            <asp:button type=submit text="Run" OnClick="SubmitBtn_Click" runat="server"/>
        </center>
    </form>
  <p>

  <table align="center">
  <tr><th><span>Output from reading and saving file...</span></th></tr>
  <tr><th><span></span></th></tr>
  <tr><td><h4><xmp id="output" runat="server"/></h4></td></tr>
  </table>

</body>
</html>

<script language="C#" runat=server>

private void SubmitBtn_Click(Object sender, EventArgs e)
{
    String[] args = {Server.MapPath("books.xml"), 
        Environment.GetEnvironmentVariable("TEMP") + "\\updatebooksCS.xml"};
    StringWriter writer = new StringWriter();
    Console.SetOut(writer);
    SaveXmlDocumentSample mySaveXmlDocumentSample = new SaveXmlDocumentSample();
    mySaveXmlDocumentSample.Run(args);
    output.InnerHtml = writer.ToString();
}

</script>
