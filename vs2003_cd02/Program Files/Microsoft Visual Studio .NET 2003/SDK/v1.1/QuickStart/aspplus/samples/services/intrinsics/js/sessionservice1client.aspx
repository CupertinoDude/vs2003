<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="SessionService1JS" %>

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

<script language="JScript" runat="server">

    function Page_Load(sender:Object, e:EventArgs) : void {
        var  s:SessionService1 = new SessionService1();
        s.Credentials = System.Net.CredentialCache.DefaultCredentials;
        s.CookieContainer = new CookieContainer();
        Message1.InnerHtml = s.UpdateHitCounter() + "<BR>" + 
            s.UpdateHitCounter() + "<BR>" + s.UpdateHitCounter();
        Message2.InnerHtml = s.UpdateAppCounter() + "<BR>" + 
            s.UpdateAppCounter() + "<BR>" + s.UpdateAppCounter();
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


