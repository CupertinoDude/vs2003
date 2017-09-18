<%@ Import Namespace="System.Web.Mail" %>

<html>

  <script language="JScript" runat="server">

    function Error_500(sender:Object, e:EventArgs) : void {
        var foo:System.Array;
        Response.Write(foo.ToString());
    }
    function Page_Error(sender:Object, e:EventArgs) : void {

        var message:String = "<font face=verdana color=red>"
                               + "<h4>" + Request.Url.ToString() + "</h4>"
                               + "<pre><font color='red'>" + Server.GetLastError().ToString() + "</pre>"
                               + "</font>";

        Response.Write(message);
        Response.Write("An error has occured on this server, and the administrator of the site has been notified.");

        var mail:MailMessage = new MailMessage();
        mail.From = "automated@www.contoso.com";
        mail.To = "administrator@www.contoso.com";
        mail.Subject = "Site Error";
        mail.Body = message;
        mail.BodyFormat = MailFormat.Html;
        SmtpMail.Send(mail);

        Server.ClearError();
    }
  </script>

  <body>
    <form runat="server">
      <h4><font face="verdana">Cause an Error to Occur...</font></h4>
      <asp:button text="500 Server Error" OnClick="Error_500"  width="150" runat="server"/><p>
    </form>
  </body>

</html>