<%@ Page language="JScript" Debug="true" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Globalization" %>

<html>
<head>
<SCRIPT runat="server">

    function UpdateContents(){
        var targetUrls : String[] = [		            "/quickstart/howto/samples/globalization/multipleencodings/data/windows1252.aspx",
            "/quickstart/howto/samples/globalization/multipleencodings/data/shiftjis.aspx",
            "/quickstart/howto/samples/globalization/multipleencodings/data/utf16.aspx",
            "/quickstart/howto/samples/globalization/multipleencodings/data/iso-8859-1.aspx"];
        var ReceiveData : String = "";
        var target : Int32;
        var req : HttpWebRequest;
        var read : Byte[] = new Byte[512];
        var result : HttpWebResponse;
        var ReceiveStream : Stream;
        var bytes : int;
        var encode : Encoding;
        var curUri : Uri;

        for (target in targetUrls){
            try{
                curUri = new Uri("http://" +
                Request.ServerVariables["HTTP_HOST"].ToString() + 
                    targetUrls[target], false);
                req = HttpWebRequest(WebRequest.Create(curUri));
                req.Credentials = System.Net.CredentialCache.DefaultCredentials;
                result = HttpWebResponse(req.GetResponse());
            }
            catch(e){
                try {
                    curUri = new Uri("http://localhost" + targetUrls[target], false);
                    req = HttpWebRequest(WebRequest.Create(curUri));
                    req.Credentials = System.Net.CredentialCache.DefaultCredentials;
                    result = HttpWebResponse(req.GetResponse());
                } catch(e) {
                    ReceiveData += "Can't resolve " + curUri + "<br>";
                }
            }
            if ( result ) {
                ReceiveStream = result.GetResponseStream();
                ReceiveData += "<br><a href=\""+ curUri.AbsoluteUri + "\">" + 
                    curUri.AbsoluteUri + "</a><br>";

                bytes = ReceiveStream.Read(read, 0, 512);

                ReceiveData += "Content-Type header value : " + result.ContentType + "<br>";
                if ( result.CharacterSet == "" ) {
                    encode = Encoding.Default;
                } else {
                    encode = Encoding.GetEncoding(result.CharacterSet);
                }

                while (bytes > 0) {
                    ReceiveData += encode.GetString(read, 0, bytes);
                    bytes = ReceiveStream.Read(read, 0, 512);
                }
            }
        }

        return ReceiveData;
    }

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

