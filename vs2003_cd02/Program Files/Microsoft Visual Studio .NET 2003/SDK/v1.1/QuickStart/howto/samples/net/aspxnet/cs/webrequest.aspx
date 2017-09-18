<%@ Page language="C#" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.IO" %>

<html>
<head>

<SCRIPT runat="server">
  void btnSubmit_Click(Object sender, EventArgs e) {

    WebRequest req = WebRequest.Create(txtURI.Text);

    try {
        WebResponse result = req.GetResponse();
        Stream ReceiveStream = result.GetResponseStream();

        Byte[] read = new Byte[512];
        int bytes = ReceiveStream.Read(read, 0, 512);

        txtHTML.InnerHtml = "";
        while (bytes > 0)
        {

          // Note:
          // The following assumes that the response uses UTF-8 as encoding.
          // If the content is sent in a ANSI codepage like 932 use something like this:
          //  Encoding encode = System.Text.Encoding.GetEncoding("shift-jis");
          Encoding encode = System.Text.Encoding.GetEncoding("utf-8");
          txtHTML.InnerHtml = txtHTML.InnerHtml + encode.GetString(read, 0, bytes);
          bytes = ReceiveStream.Read(read, 0, 512);
        }
    } catch(Exception) {
        txtHTML.InnerHtml = "Error retrieving page";
    }
  }
</SCRIPT>
</head>

<body>

  <form method="post" action="Webrequest.aspx" runat="server">
    Please enter a URI -
    <asp:TextBox runat=server ID="txtURI"></asp:TextBox>
    <asp:Button runat=server Text="Submit" ID="btnSubmit" onClick="btnSubmit_Click"></asp:button>
    <br><br>
    <TextArea runat=server ID="txtHTML" Rows="30" Cols="80" EnableViewState="false"  Wrap="True"></TextArea>
  </form>

</body>
</html>
