<%@ Page language="C#" debug="true" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Globalization" %>

<html>
<head>
<SCRIPT runat="server">

    String UpdateContents(){
        String[] TargetUrls = {
            "/quickstart/howto/samples/globalization/multipleencodings/data/windows1252.aspx",
            "/quickstart/howto/samples/globalization/multipleencodings/data/shiftjis.aspx",
            "/quickstart/howto/samples/globalization/multipleencodings/data/utf16.aspx",
            "/quickstart/howto/samples/globalization/multipleencodings/data/iso-8859-1.aspx"
        };
        String	ReceiveData = String.Empty;
        HttpWebRequest req = null;
        HttpWebResponse result = null;
        Stream ReceiveStream = null;
        Byte[] read = null;
        int bytes = 0;
        Encoding encode = null;
        Uri curUri = null;

        foreach( String target in TargetUrls ){
            try{
                curUri = new Uri("http://" + 
                    Request.ServerVariables["HTTP_HOST"].ToString() + target, false);
                req = (HttpWebRequest)WebRequest.Create(curUri);
                req.Credentials = System.Net.CredentialCache.DefaultCredentials;
                result = (HttpWebResponse)req.GetResponse();
            }
            catch(Exception e){
                try{
                    curUri = new Uri("http://localhost" + target, false);
                    req = (HttpWebRequest)WebRequest.Create(curUri);
                    req.Credentials = System.Net.CredentialCache.DefaultCredentials;
                    result = (HttpWebResponse)req.GetResponse();
                } catch(Exception ex) {
                    ReceiveData += "Can't resolve " + curUri + "<br>";
                }
            }
            ReceiveStream = result.GetResponseStream();

            ReceiveData += "<br><a href=\""+ curUri.AbsoluteUri +"\">"+ 
                curUri.AbsoluteUri + "</a><br>";

            read = new Byte[512];
            bytes = ReceiveStream.Read(read, 0, 512);

            ReceiveData += "Content-Type header value : " + result.ContentType + "<br>";
            if ( result.CharacterSet == "" ) {
                encode = Encoding.Default;
            } else {
                encode = Encoding.GetEncoding(result.CharacterSet);
            }

            while (bytes > 0)
            {
                ReceiveData += encode.GetString(read, 0, bytes);
                bytes = ReceiveStream.Read(read, 0, 512);
            }
        }
        return ReceiveData;
    }
</SCRIPT>
</head>

<body>
<br>.NET Framework can handle multiple encodings seamlessly.
From an ASP.NET page, the @ResponseEncoding directive can be used so that each individual
page can be sent to clients with the encoding specified.<br>
<%
	Response.Write(UpdateContents());
%>
</body>
</html>

