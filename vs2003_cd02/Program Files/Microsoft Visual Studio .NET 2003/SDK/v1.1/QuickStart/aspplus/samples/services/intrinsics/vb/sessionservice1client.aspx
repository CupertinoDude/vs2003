<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="SessionService1VB" %>

<html>
<style>

    div
    {
        font: 8pt verdana;
        background-color:cccccc;
        border-color:black;
        border-width:1;
        border-style:solid;
        padding:10,10,10,10;
    }

</style>

<script language="VB" runat="server">

    Public Sub Page_Load(Sender As Object, E As EventArgs)

        Dim S As SessionService1VB.SessionService1  = New SessionService1VB.SessionService1()
        S.Credentials = System.Net.CredentialCache.DefaultCredentials
        S.CookieContainer = new CookieContainer()
        Message1.InnerHtml = S.UpdateHitCounter() & "<BR>" & _
            S.UpdateHitCounter() & "<BR>" & S.UpdateHitCounter()
        Message2.InnerHtml = S.UpdateAppCounter() & "<BR>" & _
            S.UpdateAppCounter() & "<BR>" & S.UpdateAppCounter()
    End Sub

</script>

<body style="font: 10pt verdana">
<H4>Using Intrinsics with XML Web services</H4>

  <h5>UpdateHitCounter Output: </h5>
  <div id="Message1" runat="server"/>

  <h5>UpdateAppCounter Output: </h5>
  <div id="Message2" runat="server"/>

</body>
</html>


