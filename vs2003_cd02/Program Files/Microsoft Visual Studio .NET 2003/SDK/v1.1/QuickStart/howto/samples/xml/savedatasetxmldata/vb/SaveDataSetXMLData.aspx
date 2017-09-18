<%@ Page Language="VB" Debug="true" Src="SaveDataSetXMLData.vb"%>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="HowTo.Samples.XML" %>

<html>
<head>
        <link rel="stylesheet" href="intro.css">
</head>
<body style="background-color:f6e4c6">

         <form action="SaveDataSetXMLData.aspx" method="post" runat="server">
        
  <center>
    &nbsp;&nbsp;&nbsp;&nbsp;<asp:button type=submit text="Run" OnClick="SubmitBtn_Click" runat="server"/></br>
         </form>
  </center>
  <p>

  <table align="center">
  <tr><th><span>Output from saving the DataSet relational tables as XML data...</span></th></tr>
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
  Dim mySaveDataSetXMLDataSample as SaveDataSetXMLDataSample
  mySaveDataSetXMLDataSample = new SaveDataSetXMLDataSample()
  mySaveDataSetXMLDataSample.Run()
  output.InnerHtml = writer.ToString()
End Sub

</script>