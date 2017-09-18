<%@ Page Language="C#" Debug="true" Src="LoadDataSetXMLData.cs"%>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="HowTo.Samples.XML" %>

<html>
<head>
      	<link rel="stylesheet" href="intro.css">
</head>
<body style="background-color:f6e4c6">

       	<form action="LoadDataSetXMLData.aspx" method="post" runat="server">
       	<font>Input file: </font> 
        <a href="/quickstart/howto/samples/Xml/LoadDataSetXMLData/CS/books.xml">books.xml</a>
       	&nbsp;&nbsp;<font>Schema file: </font> 
        <a href="/quickstart/howto/samples/Xml/LoadDataSetXMLData/CS/books.xsd">books.xsd</a>
	<center>
		&nbsp;&nbsp;&nbsp;&nbsp;<asp:button type=submit text="Run" OnClick="SubmitBtn_Click" runat="server"/></br>
       	</form>
	</center>
	<p>

	<table align="center">
	<tr><th><span>Output from loading XML data with schema...</span></th></tr>
	<tr><th><span></span></th></tr>
	<tr><td><h4><xmp id="output" runat="server"/></h4></td></tr>
	</table>

</body>
</html>

<script language="C#" runat=server>

private void SubmitBtn_Click(Object sender, EventArgs e)
{
	String[] args = {Server.MapPath("books.xml"), Server.MapPath("books.xsd")};
	StringWriter writer = new StringWriter();
  Console.SetOut(writer);
  LoadDataSetXMLDataSample myLoadDataSetXMLDataSample = new LoadDataSetXMLDataSample();
  myLoadDataSetXMLDataSample.Run(args);
  output.InnerHtml = writer.ToString();
}

</script>
