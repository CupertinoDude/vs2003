<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" 
    Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Handling Errors</span>

<p>
<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#custom">Customizing Error Pages</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#handlerr">Handling Errors Programmatically</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#evtlog">Writing to the Event Log</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#summary">Section Summary</a><br>
</div>
</p>

<p>
<hr>
<p>
When an error occurs on a page, ASP.NET sends information about the
error to the client.  Errors are divided into four categories:
<ul>
<li>Configuration errors: Occur when the syntax or structure of a
Web.config file in the configuration hierarchy is incorrect.</li>
<li>Parser errors: Occur when the ASP.NET syntax on a page is malformed.</li>
<li>Compilation errors: Occur when statements in a page's target 
language are incorrrect.</li>
<li>Run-time errors: Occur during a page's execution, even though the 
errors could not be detected at compile time.</li>
<p>

By default, the information shown for a run-time error is the call
stack (the chains of procedure calls leading up to the exception).
If debug mode is enabled, ASP.NET displays the line number in source
code where the run-time error originated.  Debug mode is a valuable
tool for debugging your application.  You can enable debug mode
at the page level, using the following directive:
<p>
<div class="code"><pre>
&lt;%@ Page Debug="true" %&gt;
</pre></div>
<p>

You can also enable debug mode at the application level, using the 
Web.config file in the application's root directory, as
shown in the following example.
<p><b>  Note:</b> Running debug mode incurs a heavy performance penalty.
Be sure to disable it before deploying your finished application.
<p>  The following example demonstrates the use of debug mode to show 
source line numbers for a run-time exception.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/errors/handlerr/CS/error1.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/errors/handlerr/error1.src"
  Icon="/quickstart/aspplus/images/genicon.gif"
  Caption="C# Error1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/errors/handlerr/VB/error1.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/errors/handlerr/error1.src"
  Icon="/quickstart/aspplus/images/genicon.gif"
  Caption="VB Error1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/errors/handlerr/JS/error1.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/errors/handlerr/error1.src"
  Icon="/quickstart/aspplus/images/genicon.gif"
  Caption="JScript Error1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>

<!--BEGIN SUB SECTION-->
<a name="custom">
<span class="subhead">Customizing Error Pages</span>
<p>

Depending on the circumstances, you might want to handle application
errors in different ways.  For example, at development time you
probably want to see the detailed error pages that ASP.NET provides
to help you identify and fix problems.  However, once an
application is being served in a production environment, you probably
do not want to display detailed errors to your customer clients.
You can use ASP.NET to specify whether errors are shown
to local clients, to remote clients, or to both. By default,
errors are shown only to local clients (those clients on the same
computer as the server).  You can also specify a custom error page
to redirect clients to if an error occurs.
<p>

Custom errors are enabled in the Web.config file for an application. For example:

<p>
<div class="code"><pre>
&lt;configuration&gt;
     &lt;system.web&gt;
         &lt;customErrors defaultRedirect="genericerror.htm" 
             mode="RemoteOnly" /&gt;
     &lt;/system.web&gt;
&lt;/configuration&gt;
</pre></div>

<p>
This configuration enables local clients to see the default ASP.NET
detailed error pages but redirects remote clients to a custom page, genericerror.htm.
This page could be an .aspx page as well. ASP.NET passes the path of the page
on which the error occurred to the error page as a
<b>QueryString</b> argument.  Note that if the execution of the
error page generates an error, a blank page is sent back to the
remote client.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
&lt;%@ Page Language="C#" Description="Error page"%&gt;

&lt;html&gt;
&lt;head&gt;
&lt;title&gt;Error page&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
&lt;h1&gt;Error page&lt;/h1&gt;
Error originated on: &lt;%=Request.QueryString["ErrorPage"] %&gt;
&lt;/body&gt;
&lt;/html&gt;
</Tab>
<Tab Name="VB">
&lt;%@ Page Language="VB" Description="Error page"%&gt;

&lt;html&gt;
&lt;head&gt;
&lt;title&gt;Error page&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
&lt;h1&gt;Error page&lt;/h1&gt;
Error originated on: &lt;%=Request.QueryString("ErrorPage") %&gt;
&lt;/body&gt;
&lt;/html&gt;
</Tab>
<Tab Name="JScript">
&lt;%@ Page Language="JScript" Description="Error page"%&gt;

&lt;html&gt;
&lt;head&gt;
&lt;title&gt;Error page&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
&lt;h1&gt;Error page&lt;/h1&gt;
Error originated on: &lt;%=Request.QueryString["ErrorPage"] %&gt;
&lt;/body&gt;
&lt;/html&gt;
</Tab>
</Acme:TabControl>

<p>
<b>Note:</b> Only files mapped to the aspnet_isapi.dll extension in IIS
generate these errors. Files not served through the aspnet_isapi.dll are
not processed by ASP.NET and generate IIS errors. See the IIS
documentation for information about configuring IIS custom errors.
<p>
The following table describes the configuration attributes and
values for the <b>&lt;customErrors&gt;</b> tag.
<p>
<table class="table2" width="90%" cellpadding=3>
<tr>
<th width="20%">Attribute</th><th width="100%">Description</th>
</tr>
<tr>
  <td>
    <b>mode</b>
  </td>
  <td>Indicates whether custom errors are enabled, disabled, or only
shown to remote computers. Values: <b>On</b>, <b>Off</b>, <b>RemoteOnly</b> (default).
</td>
</tr>
<tr>
  <td>
    <b>defaultRedirect</b>
  </td>
  <td>Indicates the default URL to which a browser should be redirected
if an error occurs.  This attribute is optional.
  </td>
</tr>
</table>

<p>

The <b>Mode</b> attribute determines whether errors are shown to
local clients, remote clients, or both.  The effects of each setting are
described in the following table.

<p>

<table class="table2" width="90%" cellpadding=3>
<tr>
<th width="20%">Mode</th><th width="40%">Local host request</th>
<th width="40%">Remote host request</th>
</tr>
<tr>
  <td>
    <b>On</b>
  </td>
  <td>
     Custom error page.
  </td>
  <td>
     Custom error page.
  </td>
</tr>
<tr>
  <td>
    <b>Off</b>
  </td>
  <td>
     ASP.NET error page.
  </td>
  <td>
     ASP.NET error page.
  </td>
</tr>
<tr>
  <td>
    <b>RemoteOnly</b>
  </td>
  <td>
     ASP.NET error page.
  </td>
  <td>
     Custom error page.
  </td>
</tr>
</table>

<p>
The following sample demonstrates how the <b>&lt;customErrors&gt;</b>
configuration section is used.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/errors/custom1/CS/custom1.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/errors/custom1/custom1.src"
  Icon="/quickstart/aspplus/images/genicon.gif"
  Caption="C# Custom1.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/errors/custom1/VB/custom1.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/errors/custom1/custom1.src"
  Icon="/quickstart/aspplus/images/genicon.gif"
  Caption="VB Custom1.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/errors/custom1/JS/custom1.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/errors/custom1/custom1.src"
  Icon="/quickstart/aspplus/images/genicon.gif"
  Caption="JScript Custom1.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
In addition to redirecting to a common page for all errors, you can also
assign specific error pages to specific error status codes.
The <b>&lt;customErrors&gt;</b> configuration section supports an inner
<b>&lt;error&gt;</b> tag that associates HTTP status codes with
custom error pages. For example:
<p>

<div class="code"><pre>
&lt;configuration&gt;
  &lt;system.web&gt;
    &lt;customErrors mode="RemoteOnly" defaultRedirect="/genericerror.htm"&gt;
      &lt;error statusCode="500" redirect="/error/callsupport.htm"/&gt;
      &lt;error statusCode="404" redirect="/error/notfound.aspx"/&gt;
      &lt;error statusCode="403" redirect="/error/noaccess.aspx"/&gt;
    &lt;/customErrors&gt;
  &lt;/system.web&gt;
&lt;/configuration&gt;
</pre></div>

<p>
The following table describes the attributes and values for the
<b>&lt;error&gt;</b> tag.
<p>

<table class="table2" width="90%" cellpadding=3>
<tr>
<th width="20%">Attribute</th><th width="100%">Description</th>
</tr>
<tr>
  <td>
    <b>StatusCode</b>
  </td>
  <td>
HTTP status code of errors for which the custom error
page should be used.  Examples: 403 Forbidden, 404 Not Found, or
500 Internal Server Error.
</td>
</tr>
<tr>
  <td>
    <b>Redirect</b>
  </td>
  <td>
URL to which the client browser should be redirected if an error
occurs.
  </td>
</tr>
</table>

<p>
The following example demonstrates how to use the <b>&lt;error&gt;</b> tag.
Note that the example specifies an .aspx page for "File Not Found"
errors so that the missing page URL passed via the <b>QueryString</b> can be printed.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/errors/custom2/CS/custom2.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/errors/custom2/custom2.src"
  Icon="/quickstart/aspplus/images/genicon.gif"
  Caption="C# Custom2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/errors/custom2/VB/custom2.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/errors/custom2/custom2.src"
  Icon="/quickstart/aspplus/images/genicon.gif"
  Caption="VB Custom2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/errors/custom2/JS/custom2.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/errors/custom2/custom2.src"
  Icon="/quickstart/aspplus/images/genicon.gif"
  Caption="JScript Custom2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>
<p>


<!--BEGIN SUB SECTION-->
<a name="handlerr">
<span class="subhead">Handling Errors Programmatically</span>
<p>

You can also handle errors in code, at either the page level or the
application level.  The <b>Page</b> base class exposes a
<b>Page_Error</b> method, which you can override in your pages.
The method is called whenever an uncaught exception is thrown at
run time.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
&ltscript language="C#" runat="server"&gt;

void Page_Error(Object source, EventArgs e) {
    String message = "&lt;font face=verdana color=red&gt;"
        + "&lt;h4&gt;" + Request.Url.ToString() + "&lt;/h4&gt;"
        + "&lt;pre&gt;&lt;font color='red'&gt;" 
        + Server.GetLastError().ToString() + "&lt;/pre&gt;"
        + "&lt;/font&gt;";

    Response.Write(message);
}

&lt/script&gt;
</Tab>
<Tab Name="VB">
&ltscript language="C#" runat="server"&gt;

Sub Page_Error(Source As Object, E As EventArgs)
    Dim message As String = "&lt;font face=verdana color=red&gt;" _
        & "&lt;h4&gt;" & Request.Url.ToString() & "&lt;/h4&gt;" _
        & "&lt;pre&gt;&lt;font color='red'&gt;" _
        & Server.GetLastError().ToString() & "&lt;/pre&gt;" _
        & "&lt;/font&gt;"

    Response.Write(message)
End Sub

&lt/script&gt;
</Tab>
<Tab Name="JScript">
&ltscript language="JScript" runat="server"&gt;

function Page_Error(source:Object, e:EventArgs) : void {
    var message:String = "&lt;font face=verdana color=red&gt;"
        + "&lt;h4&gt;" + Request.Url.ToString() + "&lt;/h4&gt;"
        + "&lt;pre&gt;&lt;font color='red'&gt;" 
        + Server.GetLastError().ToString() + "&lt;/pre&gt;"
        + "&lt;/font&gt;";

    Response.Write(message);
}

&lt/script&gt;
</Tab>
</Acme:TabControl>
<p>
The following sample demonstrates the <b>Page_Error</b> method.
<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/errors/handlerr/CS/error2.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/errors/handlerr/error2.src"
  Icon="/quickstart/aspplus/images/genicon.gif"
  Caption="C# Error2.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/errors/handlerr/VB/error2.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/errors/handlerr/error2.src"
  Icon="/quickstart/aspplus/images/genicon.gif"
  Caption="VB Error2.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/errors/handlerr/JS/error2.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/errors/handlerr/error2.src"
  Icon="/quickstart/aspplus/images/genicon.gif"
  Caption="JScript Error2.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
You could do something useful in this method, like sending an e-mail to the
site administrator saying that the page failed to execute properly.
ASP.NET provides a set of classes in the <b>System.Web.Mail</b>
namespace for just this purpose.  To import this namespace, use an
<b>@Import</b> directive at the top of your page, as follows:
<p>

<div class="code"><pre>
&lt;%@ Import Namespace="System.Web.Mail" %&gt;
</pre></div>

<p>
You can then use the <b>MailMessage</b> and <b>SmtpMail</b> objects
to programmatically send e-mail.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
MailMessage mail = new MailMessage();
mail.From = "automated@www.contoso.com";
mail.To = "administrator@www.contoso.com";
mail.Subject = "Site Error";
mail.Body = message;
mail.BodyFormat = MailFormat.Html;
SmtpMail.Send(mail);
</Tab>
<Tab Name="VB">
Dim mail As New MailMessage
mail.From = "automated@www.contoso.com"
mail.To = "administrator@www.contoso.com"
mail.Subject = "Site Error"
mail.Body = message
mail.BodyFormat = MailFormat.Html
SmtpMail.Send(mail)
</Tab>
<Tab Name="JScript">
var mail:MailMessage = new MailMessage();
mail.From = "automated@www.contoso.com";
mail.To = "administrator@www.contoso.com";
mail.Subject = "Site Error";
mail.Body = message;
mail.BodyFormat = MailFormat.Html;
SmtpMail.Send(mail);
</Tab>
</Acme:TabControl>

<p>
The following sample shows how to send a mail message in response to a
page
error.
<p><b>Note:</b> This sample does not actually send mail unless you have
 configured the SMTP mail service on your machine.  For more
information about the SMTP mail service, consult the IIS documentation.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/errors/handlerr/CS/error3.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/errors/handlerr/error3.src"
  Icon="/quickstart/aspplus/images/genicon.gif"
  Caption="C# Error3.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/errors/handlerr/VB/error3.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/errors/handlerr/error3.src"
  Icon="/quickstart/aspplus/images/genicon.gif"
  Caption="VB Error3.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/apps/errors/handlerr/JS/error3.aspx"
  ViewSource="/quickstart/aspplus/samples/apps/errors/handlerr/error3.src"
  Icon="/quickstart/aspplus/images/genicon.gif"
  Caption="JScript Error3.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
In addition to handling errors at the page level, you might want to
handle errors at the application level. To do this, use the
<b>Application_Error</b> event in <a href="globalasax.aspx">Global.asax</a>.
This event occurs for any unhandled exception thrown within the
application.
<p>

<Acme:TabControl HtmlEncode runat="server">
<Tab Name="C#">
void Application_Error(Object sender, EventArgs e) {
    //...Do something here
}
</Tab>
<Tab Name="VB">
Sub Application_Error(sender As Object, e As EventArgs)
    '...Do something here
End Sub
</Tab>
<Tab Name="JScript">
function Application_Error(sender:Object, e:EventArgs) : void {
    //...Do something here
}
</Tab>
</Acme:TabControl>
<p>

<!--BEGIN SUB SECTION-->
<a name="evtlog">
<span class="subhead">Writing to the Event Log</span>

<p>
The <b>System.Diagnostics</b> namespace provides classes for
writing to the Windows event log.  To use this namespace in your
pages, you must first import the namespace, as follows:

<p>
<div class="code"><pre>
&lt;%@ Import Namespace="System.Diagnostics"%&gt;
</pre></div>
<p>

The <b>EventLog</b> class encapsulates the log itself.  It provides
static methods for detecting or creating logs and can
be instantiated to write log entries from code. The following
example shows this functionality within the
<b>Application_Error</b> method of Global.asax.   Whenever an
unhandled exception occurs in the application, an
entry containing the error message and stack trace is made to the
application log.

<p>
<Acme:TabControl HtmlEncode runat="server">
<Tab Name="C#">
void Application_Error(Object sender, EventArgs e) {

    String Message = "\n\nURL:\n http://localhost/" + Request.Path
        + "\n\nMESSAGE:\n " + Server.GetLastError().Message
        + "\n\nSTACK TRACE:\n" + Server.GetLastError().StackTrace;

    // Create event Log if it does not exist

    String LogName = "Application";
    if (!EventLog.SourceExists(LogName)) {
        EventLog.CreateEventSource(LogName, LogName);
    }

    // Insert into event log
    EventLog Log = new EventLog();
    Log.Source = LogName;
    Log.WriteEntry(Message, EventLogEntryType.Error);

}
</Tab>
<Tab Name="VB">
Sub Application_Error(sender As Object, e As EventArgs)

    Dim Message As String = "\n\nURL:\n http://localhost/" & Request.Path _
        & "\n\nMESSAGE:\n " & Server.GetLastError().Message _
        & "\n\nSTACK TRACE:\n" & Server.GetLastError().StackTrace

   ' Create event log if it does not exist

    Dim LogName As String = "Application"
    If (Not EventLog.SourceExists(LogName))
        EventLog.CreateEventSource(LogName, LogName)
    End If

    ' Insert into event log
    Dim Log As New EventLog
    Log.Source = LogName
    Log.WriteEntry(Message, EventLogEntryType.Error)

End Sub
</Tab>
<Tab Name="JScript">
function Application_Error(sender:Object, e:EventArgs) : void {

    var Message:String = "\n\nURL:\n http://localhost/" + Request.Path
        + "\n\nMESSAGE:\n " + Server.GetLastError().Message
        + "\n\nSTACK TRACE:\n" + Server.GetLastError().StackTrace;

    // Create event log if it does not exist

    var LogName:String = "Application";
    if (!EventLog.SourceExists(LogName)) {
        EventLog.CreateEventSource(LogName, LogName);
    }

    // Insert into event log
    var Log:EventLog = new EventLog();
    Log.Source = LogName;
    Log.WriteEntry(Message, EventLogEntryType.Error);

}
</Tab>
</Acme:TabControl>
<p>

The complete source code for the preceding example follows.  Note
that this code is disabled so that it cannot run
here, to prevent entries to your Windows event log.  If you would
like to see this code run, create an
IIS virtual root pointing to the directory that contains this file.

<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  ViewSource="/quickstart/aspplus/samples/apps/errors/handlerr/evtlog.src"
  Icon="/quickstart/aspplus/images/genicon.gif"
  Caption="C# Global.asax"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  ViewSource="/quickstart/aspplus/samples/apps/errors/handlerr/evtlog.src"
  Icon="/quickstart/aspplus/images/genicon.gif"
  Caption="VB Global.asax"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  ViewSource="/quickstart/aspplus/samples/apps/errors/handlerr/evtlog.src"
  Icon="/quickstart/aspplus/images/genicon.gif"
  Caption="JScript Global.asax"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>

<h4><a name="summary">Section Summary</a></h4>
<ol>
<li>Errors are divided into four categories: configuration errors, 
parser errors, compilation errors, and run-time errors.
<li>By default, the information shown for a run-time error is the
call stack (the chain of procedure calls leading up to the
exception). If debug mode is enabled, ASP.NET displays the line
number in source code where the run-time error originated.
<li>ASP.NET enables you to specify whether errors are shown to
local clients, to remote clients, or to both. By default, errors are
only shown to local clients (clients on the same computer as the server).
You can also specify a custom error page to redirect clients to
if an error occurs.
<li>In addition to redirecting to a common page for all errors, you
can also assign specific error pages to specific error status codes.
The <b>&lt;customErrors&gt;</b> configuration section supports an inner 
<b>&lt;error&gt;</b> tag
for associating HTTP status codes with custom error pages.
<li>You can also handle errors in code, at either the page level or
application level. The <b>Page</b> base class exposes a <b>HandleError</b> method,
which you can override in your pages. The method will be called
whenever an uncaught exception is thrown at run time.
<li>The <b>System.Web.Mail</b> namespace exposes classes for
programmatically sending e-mail.  This is useful for notifying an
administrator when an error occurs.
<li>In addition to handling errors at the page level, you can use
the <b>Application_Error</b> event in Global.asax to
handle errors at the application level. This event will occur for
any unhandled exception thrown within the application.
<li>The <b>System.Diagnostics</b> namespace provides classes
for writing to the Windows event log.
</ol>
<p>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
