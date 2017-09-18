<%@ Page language="VB" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Threading" %>
<%@ Import Namespace="System.IO" %>

<html>
<head>

<SCRIPT runat="server">
  Sub btnSubmit_Click(Sender As Object, e As EventArgs)

    Const MAX As Integer = 20

    Dim HttpSite As Uri = New Uri(txtURI.Text)
    Dim wreq As HttpWebRequest = CType(WebRequest.Create(HttpSite), HttpWebRequest)
    Dim r As IAsyncResult = wreq.BeginGetResponse(New AsyncCallback(AddressOf RespCallback), wreq)
    Thread.Sleep(3000)
  End Sub

  Private Sub RespCallback(ar As IAsyncResult)
    Dim req As HttpWebRequest = CType(ar.AsyncState, HttpWebRequest)
    Dim resp As HttpWebResponse = CType(req.EndGetResponse(ar), HttpWebResponse)

    Dim BytesRead As Integer = 0
    Dim Buffer(512) As Char

    Dim Reader As StreamReader = New StreamReader(resp.GetResponseStream(), System.Text.Encoding.UTF8)
    Dim Writer As StringWriter = New StringWriter()

    BytesRead = Reader.Read(Buffer, 0, 512)
    Do While BytesRead <> 0
      Writer.Write(Buffer, 0, 512)
      BytesRead = Reader.Read(Buffer, 0, 512)
    Loop
    txtHTML.InnerHtml = Writer.ToString()
  End Sub
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
