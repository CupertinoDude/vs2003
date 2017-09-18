<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="SessionService1" %>

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

<script language="C#" runat="server">

    public void Page_Load(Object sender, EventArgs E)
    {
        SessionService1 s = new SessionService1();
        s.Credentials = System.Net.CredentialCache.DefaultCredentials;
        s.CookieContainer = new CookieContainer();
        Message1.InnerHtml = s.UpdateHitCounter() + "<BR>" + s.UpdateHitCounter() + "<BR>" +             s.UpdateHitCounter();

        Message2.InnerHtml = s.UpdateAppCounter() + "<BR>" + s.UpdateAppCounter() + "<BR>" +
            s.UpdateAppCounter();
    }

</script>

<body style="font: 10pt verdana">
<H4>Using Intrinsics with XML Web services</H4>

  <h5>UpdateHitCounter Output: </h5>
  <div id="Message1" runat="server"/>

  <h5>UpdateAppCounter Output: </h5>
  <div id="Message2" runat="server"/>

</body>
</html>


