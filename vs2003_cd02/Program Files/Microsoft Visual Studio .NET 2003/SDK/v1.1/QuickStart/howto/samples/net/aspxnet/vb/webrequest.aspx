<%@ Page language="VB" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.IO" %>

<html>
<head>

<SCRIPT runat="server">
  Sub btnSubmit_Click(sender As Object,  e As EventArgs)
    Dim req As WebRequest = WebRequest.Create(txtURI.Text)

    Try
        Dim result As WebResponse  = req.GetResponse()
        Dim ReceiveStream As Stream = result.GetResponseStream()

        Dim read() as Byte = new Byte(512) {}
        Dim bytes As Integer  = ReceiveStream.Read(read, 0, 512)

        txtHTML.InnerHtml = ""
        While (bytes > 0)
          Dim encode As Encoding = System.Text.Encoding.GetEncoding("utf-8")
          txtHTML.InnerHtml = txtHTML.InnerHtml & encode.GetString(read, 0, bytes)
          bytes = ReceiveStream.Read(read, 0, 512)
        End While
    Catch Exc As Exception
        txtHTML.InnerHtml = "Error retrieving page"
    End Try
  end sub
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
