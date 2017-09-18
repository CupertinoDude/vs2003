<%@ Page language="VB" Debug="true" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Globalization" %>


<html>
<head>
<SCRIPT runat="server">
    Function UpdateContents() As String
        Dim TargetUrls(3) As String
        TargetUrls(0) = _
            "/quickstart/howto/samples/globalization/multipleencodings/data/windows1252.aspx"
        TargetUrls(1) = _
            "/quickstart/howto/samples/globalization/multipleencodings/data/shiftjis.aspx"
        TargetUrls(2) = _
            "/quickstart/howto/samples/globalization/multipleencodings/data/utf16.aspx"
        TargetUrls(3) = _
            "/quickstart/howto/samples/globalization/multipleencodings/data/iso-8859-1.aspx"

        Dim ReceiveData As String
        Dim req As HttpWebRequest
        Dim result As HttpWebResponse
        Dim ReceiveStream As Stream
        Dim read(512) As Byte
        Dim bytes As Integer
        Dim encode As Encoding
        Dim target As String
        Dim curUri As Uri

        For Each target In TargetUrls
            Try
                curUri = new Uri("http://" & _
                    Request.ServerVariables("HTTP_HOST").ToString() & target, false)
                req = HttpWebRequest.Create(curUri)
                req.Credentials = System.Net.CredentialCache.DefaultCredentials
                result = req.GetResponse()
            Catch
                Try
                    curUri = new Uri("http://localhost" & target, false)
                    req = HttpWebRequest.Create(curUri)
                    req.Credentials = System.Net.CredentialCache.DefaultCredentials
                    result = req.GetResponse()
                Catch
                    ReceiveData = ReceiveData & "Can't resolve " & curUri.ToString & "<br>"
                End Try
            End Try
            ReceiveStream = result.GetResponseStream()
            ReceiveData += "<br><a href=" & Chr(34) & curUri.AbsoluteUri & _ 
                Chr(34) & ">" & curUri.AbsoluteUri & "</a><br>"

            bytes = ReceiveStream.Read(read, 0, 512)

            ReceiveData += "Content-Type header value : " & result.ContentType & "<br>"

            If result.CharacterSet = "" Then
                encode = Encoding.Default
            Else
                encode = Encoding.GetEncoding(result.CharacterSet)
            End If

            While (bytes > 0)
                ReceiveData += encode.GetString(read, 0, bytes)
                bytes = ReceiveStream.Read(read, 0, 512)
            End While
        Next

        Return ReceiveData
    end Function

</SCRIPT>
</head>

<body>
<br>.NET Framework can handle multiple encodings seamlessly.
From an ASP.NET page, the @ResponseEncoding directive can be used so that each individual
page can be sent to clients with the encoding specified. <br>
<%
	Response.Write(UpdateContents())
%>
</body>
</html>