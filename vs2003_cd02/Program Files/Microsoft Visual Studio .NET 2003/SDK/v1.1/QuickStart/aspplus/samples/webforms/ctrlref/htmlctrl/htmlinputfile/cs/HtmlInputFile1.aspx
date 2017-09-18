<%@ Import Namespace="System.IO" %>
<html>
<head>

    <script language="C#" runat="server">

       void Button1_Click(object Source, EventArgs e) {

          if (Text1.Value == "") {
             Span1.InnerHtml = "Error: you must enter a file name";
             return;
          }

          if (File1.PostedFile != null) {
             string filepath = Path.Combine(Path.GetTempPath(), Path.GetFileName(Text1.Value));

             try {
                File1.PostedFile.SaveAs(filepath);
                Span1.InnerHtml = "File uploaded successfully to <b>" + filepath + "</b> on the web server";
             }
             catch (Exception exc) {
                Span1.InnerHtml = "Error saving file <b>" + filepath + "</b><br>"+ exc.ToString();
             }
          }
       }

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


