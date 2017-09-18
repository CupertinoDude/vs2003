<%@ Import Namespace="SoapHeadersVB" %>

<script language="VB" runat="server">

Public Sub Page_Load(sender As Object, e As EventArgs)

        Response.Write("<h4><font face=""verdana"">Using Soap Headers for Custom Authentication</font></h4>")

        ' Create a new instance of the UsingSoapHeaders
        ' proxy class used to call the remote .asmx file
        Dim h As New HeaderService
        h.Credentials = System.Net.CredentialCache.DefaultCredentials

        ' Call the secure method without credentials
        Response.Write("First call result: <p>")
        Try
          Response.Write(h.SecureMethod() & "<p>")

        Catch ex As Exception
          Response.Write("<pre>" & ex.StackTrace & "</pre><p>")
        End Try

        ' Create a new instance of the AuthHeader class
        Dim myHeader As New AuthHeaderVB

        ' Set the value of myHeader
        myHeader.Username = "JohnDoe"
        myHeader.Password = "password"

        ' Set the AuthHeader public member of the
        ' UsingSoapHeaders class to myHeader
        h.AuthHeaderVBValue = myHeader

        ' Call the secure method with credentials
        Response.Write("Second call result: <p><pre>" & h.SecureMethod() & "</pre>")
End Sub

</script>
