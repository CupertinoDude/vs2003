<%@ Page language="C#" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Threading" %>
<%@ Import Namespace="System.IO" %>

<html>
<head>

<SCRIPT runat="server">
  void btnSubmit_Click(Object sender, EventArgs e) {

    const int MAX = 20;

    Uri HttpSite = new Uri(txtURI.Text);
    HttpWebRequest wreq = (HttpWebRequest) WebRequest.Create(HttpSite);
    IAsyncResult r = (IAsyncResult) wreq.BeginGetResponse(new AsyncCallback(this.RespCallback), wreq);
    Thread.Sleep(3000);
  }

  private void RespCallback(IAsyncResult ar)
  {
    HttpWebRequest req = (HttpWebRequest) ar.AsyncState;
    HttpWebResponse resp = (HttpWebResponse) req.EndGetResponse(ar);

    int BytesRead = 0;
    char[] Buffer = new char[512];

    StreamReader Reader = new StreamReader(resp.GetResponseStream(), System.Text.Encoding.UTF8);
    StringWriter Writer = new StringWriter();

    BytesRead = Reader.Read(Buffer, 0, 512);
    while (BytesRead != 0 ) {
      Writer.Write(Buffer, 0, 512);
      BytesRead = Reader.Read(Buffer, 0, 512);
    }
    txtHTML.InnerHtml = Writer.ToString();
  }
</SCRIPT>
</head>

<body>

  <form method="post" action="Webrequestasync.aspx" runat="server">
    Please enter a URI -
    <asp:TextBox runat=server ID="txtURI"></asp:TextBox>
    <asp:Button runat=server Text="Submit" ID="btnSubmit" onclick="btnSubmit_Click"></asp:button>
    <br><br>
    <TextArea runat=server ID="txtHTML" Rows="30" Cols="80" EnableViewState="false" Wrap="True"></TextArea>
  </form>

</body>
</html>
