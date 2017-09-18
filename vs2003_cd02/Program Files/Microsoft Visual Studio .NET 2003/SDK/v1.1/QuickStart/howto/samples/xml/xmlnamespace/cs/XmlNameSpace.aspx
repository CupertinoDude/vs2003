<%@ Page Language="C#" Debug="true" Src="XmlNameSpace.cs"%>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="HowTo.Samples.XML" %>

<html>
<head>
      	<link rel="stylesheet" href="intro.css">
</head>
<body style="background-color:f6e4c6">

       	<form action="XmlNameSpace.aspx" method="post" runat="server">
       	<font>Input file: </font> 
        <a href="/quickstart/howto/samples/Xml/XmlNameSpace/CS/orders.xml">orders.xml</a>
	<center>
		&nbsp;&nbsp;&nbsp;&nbsp;<asp:button type=submit text="Run" OnClick="SubmitBtn_Click" runat="server"/></br>
       	</form>
	</center>
	<p>

	<table align="center">
	<tr><th><span>Output ...</span></th></tr>
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
  XmlNameSpaceSample myXmlNameSpaceSample = new XmlNameSpaceSample();
  myXmlNameSpaceSample.Run(Server.MapPath("orders.xml"));
  output.InnerHtml = writer.ToString();
}

</script>
