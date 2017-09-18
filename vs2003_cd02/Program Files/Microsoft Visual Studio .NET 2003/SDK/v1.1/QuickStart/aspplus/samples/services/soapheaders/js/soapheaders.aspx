<%@ Import Namespace="SoapHeadersJS" %>

  <script language="JScript" runat="server">

    public function Page_Load(sender:Object, e:EventArgs) : void {

        Response.Write("<h4><font face=\"verdana\">Using Soap Headers for Custom Authentication</font></h4>");

        // Create a new instance of the UsingSoapHeaders
        // proxy class used to call the remote .asmx file
        var h:HeaderService = new HeaderService();
        h.Credentials = System.Net.CredentialCache.DefaultCredentials;

        // Call the secure method without credentials
        Response.Write("First call result: <p>");
        try {
          Response.Write(h.SecureMethod() + "<p>");
        }
        catch (ex:Exception) {
          Response.Write("<pre>" + ex.StackTrace + "</pre><p>");
        }

        // Create a new instance of the AuthHeader class
        var myHeader:AuthHeader = new AuthHeader();

        // Set the value of myHeader
        myHeader.Username = "JohnDoe";
        myHeader.Password = "password";

        // Set the AuthHeader public member of the
        // UsingSoapHeaders class to myHeader
        h.sHeader = myHeader;

        // Call the secure method with credentials
        Response.Write("Second call result: <p><pre>" + h.SecureMethod() + "</pre>");
    }

  </script>
