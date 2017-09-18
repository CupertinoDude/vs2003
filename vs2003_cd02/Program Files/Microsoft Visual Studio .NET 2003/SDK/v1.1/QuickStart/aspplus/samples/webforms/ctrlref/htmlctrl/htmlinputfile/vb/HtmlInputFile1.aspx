<%@ Import Namespace="System.IO" %>
<html>
<head>

    <script language="VB" runat="server">

       Sub Button1_Click(sender As Object, e As EventArgs)

          If Text1.Value = "" Then
             Span1.InnerHtml = "Error: you must enter a file name"
             Return
          End If

          If Not IsNothing(File1.PostedFile) Then
             Dim filepath As String = Path.Combine(Path.GetTempPath(), Path.GetFileName(Text1.Value))

             Try
                File1.PostedFile.SaveAs(filepath)
                Span1.InnerHtml = "File uploaded successfully to <b>" & filepath & "</b> on the web server"
             Catch Exc As Exception
                Span1.InnerHtml = "Error saving file <b>" & filepath & "</b><br>" & Exc.ToString()
             End Try
          End If
       End Sub

    </script>

</head>
<body>

    <h3><font face="Verdana">HtmlInputFile Sample</font></h3>

    <form enctype="multipart/form-data" runat="server">

        Select File to Upload: <input id="File1" type=file runat="server">

        <p>
        Save as filename (no path): <input id="Text1" type="text" runat="server">

        <p>
        <span id=Span1 style="font: 8pt verdana;" runat="server" />

        <p>
        <input type=button id="Button1" value="Upload" OnServerClick="Button1_Click" runat="server">

    </form>

</body>
</html>


