<%@ Page Language="VB" Debug="true" Src="WriteXmlFile.vb"%>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="HowTo.Samples.XML" %>

<html>
<head>
          <link rel="stylesheet" href="intro.css">
</head>

<body style="background-color:f6e4c6">
    <form action="WriteXmlFile.aspx" method="post" runat="server">
        Output file: <%=Environment.GetEnvironmentVariable("TEMP")%>\newbooksVB.xml<br><br>
        <center>
            &nbsp;&nbsp;&nbsp;&nbsp;<asp:button type=submit text="Run" 
            OnClick="SubmitBtn_Click" runat="server"/></br>
        </center>
    </form>

    <p>

    <table align="center">
        <tr><th>Output from writing file...</th><tr>
        <tr><th><span></span></th></tr>
        <tr><td><h4><xmp id="output" runat="server"/></h4></td></tr>
    </table>

</body>
</html>

<script language="VB" runat=server>

Private Sub SubmitBtn_Click(sender As Object, e As EventArgs)
    Dim writer as StringWriter
    writer = new StringWriter()
    Console.SetOut(writer)
    Dim myWriteXmlFileSample as WriteXmlFileSample
    myWriteXmlFileSample = new WriteXmlFileSample()
    myWriteXmlFileSample.Run(Environment.GetEnvironmentVariable("TEMP") & _
        "\newbooksVB.xml", Server.MapPath("books.dtd"))
    output.InnerHtml = writer.ToString()
End Sub

</script>
