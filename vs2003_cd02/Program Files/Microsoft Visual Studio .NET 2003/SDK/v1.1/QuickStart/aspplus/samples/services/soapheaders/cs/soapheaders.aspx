<%@ Import Namespace="SoapHeaders" %>

  <script language="C#" runat="server">

    public void Page_Load(Object sender, EventArgs e) {

        Response.Write("<h4><font face=\"verdana\">Using Soap Headers for Custom Authentication</font></h4>");

        // Create a new instance of the UsingSoapHeaders
        // proxy class used to call the remote .asmx file
        HeaderService h = new HeaderService();
        h.Credentials = System.Net.CredentialCache.DefaultCredentials;

        // Call the secure method without credentials
        Response.Write("First call result: <p>");
        try {
          Response.Write(h.SecureMethod() + "<p>");
        }
        catch (Exception ex) {
          Response.Write("<pre>" + ex.StackTrace + "</pre><p>");
        }

        // Create a new instance of the AuthHeader class
        AuthHeaderCS myHeader = new AuthHeaderCS();

        // Set the value of myHeader
        myHeader.Username = "JohnDoe";
        myHeader.Password = "password";

        // Set the AuthHeader public member of the
        // UsingSoapHeaders class to myHeader
        h.AuthHeaderCSValue = myHeader;

        // Call the secure method with credentials
        Response.Write("Second call result: <p><pre>" + h.SecureMethod() + "</pre>");
    }

  </script>
