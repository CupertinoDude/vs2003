<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Security and XML Web services</span>

<p>
<div class="indent" style="font-family:Verdana;">
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#windows">Windows Authentication and Authorization</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#custom">Custom Authentication and Authorization (with Soap Headers)</a><br>
    <b> <img align="middle" src="/quickstart/images/bullet.gif">&nbsp;&nbsp;</b>
    <a class="toc2" href="#summary">Section Summary</a><br>
</div>
</p>

<p>
<hr>
<p>

This section describes methods for securing your XML Web services.  If you haven't already read the <a href="securityoverview.aspx">Security</a> section of this tutorial, take the time to do so now before continuing in this topic.
<p>

<!--BEGIN SUB SECTION-->
<a name="windows">
<span class="subhead">Windows Authentication and Authorization</span>
<p>

You use the same technique to secure your XML Web services using Windows authentication that you used for .aspx pages (described in the <a href="windowsauth.aspx">Windows-based Authentication</a> section).
  To require authentication, you enable <b>Integrated Windows authentication</b> for your application
 and disable <b>Anonymous access</b> in the IIS management console.
 To allow or deny specific users access to your service, use the
ASP.NET configuration system or set ACLs on the service file itself, as shown in the following example:

<div class="code"><pre>
&lt;configuration&gt;

  &lt;system.web&gt;
    &lt;authentication mode="Windows"/&gt;
  &lt;/system.web&gt;

  &lt;location path="secureservice.asmx"&gt;

    &lt;system.web&gt;
      &lt;authorization&gt;
        &lt;allow users="Administrator"/&gt;
        &lt;allow users="DOMAIN\Bradley"/&gt;
        &lt;deny roles="BUILTIN\Power Users"/&gt;
      &lt;/authorization&gt;
    &lt;/system.web&gt;

  &lt;/location&gt;

&lt;/configuration&gt;
</pre></div>
<p>


This works well when you know that the client of the XML Web service will be
running as a specific Windows user. A more interesting case is that of a 
client running as one user, but acting on behalf of another.
  Consider an ASP.NET page that accesses a secure XML Web service that
does not impersonate the client who accesses it.  In such a case, you should programmatically
set the username and password before connecting to the Web service.
The following example uses basic authentication and illustrates a simple <b>XML Web service</b>:

<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
&lt;%@ WebService language="C#" Class="SecureService" %&gt;

using System.Web.Services;
using System;

class SecureService : WebService {

    [WebMethod]
    public String SecureTest() {
        return "Hello from the secure web service";
    }
}
</Tab>
<Tab Name="VB">
&lt;%@ WebService language="VB" Class="SecureService" %&gt;

Imports System.Web.Services
Imports System

Class SecureService : Inherits WebService


    &lt;WebMethod()&gt; Public Function SecureTest As String
        Return "Hello from the secure web service"
    End
End Class
</Tab>
<Tab Name="JScript">
&lt;%@ WebService language="JScript" Class="SecureService" %&gt;

import System.Web.Services;
import System;

class SecureService extends WebService {


    WebMethodAttribute function SecureTest() : String {
        return "Hello from the secure web service";
    }
}
</Tab>
</Acme:TabControl>
<p>

You could require basic authentication for this service by making appropriate settings in IIS as follows:

<p>

<ol>
<li> Open the IIS MMC console.<p>
<div class="code"><pre>
Start->Run "inetmgr"
</pre></div>

<li> In the left pane, expand the tree to find your virtual directory.
<li> In the right pane, right-click <b>Secureservice.asmx</b>, and choose <b>Properties</b>.
<li> Select the <b>File Security</b> tab.  Under <b>Anonymous Access and Authentication Control</b>, click <b>Edit</b>.<p>

  <ul>
    <li>  Disable anonymous access.
    <li>  Disable integrated Windows authentication.
    <li>  Enable basic authentication.
  </ul>

<p>
<li> Click <b>OK</b> to save these settings and exit the MMC console.
</ol>

The base <b>XML Web service</b> proxy class provides two properties, <b>Username</b> and <b>Password</b>, that you can use to specify the credentials with which to connect to the remote Web service.  These must be set to valid Windows credentials on the Web service's computer or domain.<p>

<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
&lt;%@ Import Namespace="SecureService" %&gt;

&lt;html&gt;
&lt;script language="C#" runat="server"&gt;

    public void Page_Load(Object sender, EventArgs e) {

        SecureService s = new SecureService();
        s.Credentials = new System.Net.NetworkCredential("Administrator", "test123");
        Message.Text = s.SecureTest();
    }

&lt;/script&gt;

&lt;body&gt;
  &lt;h4&gt;&lt;font face="verdana"&gt;
    &lt;asp:Label id="Message" runat="server"/&gt;
  &lt;/font&gt;&lt;/h4&gt;
&lt;/body&gt;

&lt;/html&gt;
</Tab>
<Tab Name="VB">
&lt;%@ Import Namespace="SecureService" %&gt;

&lt;html&gt;
&lt;script language="VB" runat="server"&gt;

    Public Sub Page_Load(sender As Object, e As EventArgs)

        Dim s As New SecureService

        s.Credentials = New System.Net.NetworkCredential("Administrator", "test123")

        Message.Text = s.SecureTest()
    End Sub

&lt;/script&gt;

&lt;body&gt;
  &lt;h4&gt;&lt;font face="verdana"&gt;
    &lt;asp:Label id="Message" runat="server"/&gt;
  &lt;/font&gt;&lt;/h4&gt;
&lt;/body&gt;

&lt;/html&gt;
</Tab>
<Tab Name="JScript">
&lt;%@ Import Namespace="SecureService" %&gt;

&lt;html&gt;
&lt;script language="JScript" runat="server"&gt;

    public function Page_Load(sender : Object, e : EventArgs) {

        SecureService s = new SecureService();

        s.Credentials = new System.Net.NetworkCredential("Administrator", "test123");

        Message.Text = s.SecureTest();
    }

&lt;/script&gt;

&lt;body&gt;
  &lt;h4&gt;&lt;font face="verdana"&gt;
    &lt;asp:Label id="Message" runat="server"/&gt;
  &lt;/font&gt;&lt;/h4&gt;
&lt;/body&gt;

&lt;/html&gt;
</Tab>
</Acme:TabControl>

<p>
The base <b>XML Web service</b> class also provides a <b>User</b> property of type <b>System.Security.Principal.IPrincipal</b>, which you can use to retrieve information about
the client user.   Again, you can authorize access to your Web service
 using the <b>Authorization</b> section in the ASP.NET configuration system.
<p>

<!--BEGIN SUB SECTION-->
<a name="custom">
<span class="subhead">Custom Authentication and Authorization with Soap Headers</span>
<p>

Windows authentication works well for intranet scenarios, in which
you are authenticating against a user in your own domain.  On the
Internet, however, you probably want to perform custom authentication
and authorization, perhaps against a SQL database.  In that
case, you should pass custom credentials (such as the username and password) to your service and let it handle the authentication and authorization itself.
<p>
A convenient way to pass extra information along with a request to a XML Web service is a SOAP header.  To do this, define a class that derives from <b>SOAPHeader</b> in your service, and then declare a public field of your service
as that type.  This is exposed in the public contract for your
service, and made available to the client when the proxy is created
from WebServiceUtil.exe, as in the following example:
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
using System.Web.Services;
using System.Web.Services.Protocols;

// AuthHeader class extends from SoapHeader
public class AuthHeader : SoapHeader {
    public string Username;
    public string Password;
}

public class HeaderService : WebService {
    public AuthHeader sHeader;
    ...
}
</Tab>
<Tab Name="VB">
Imports System.Web.Services
Imports System.Web.Services.Protocols

' AuthHeader class extends from SoapHeader
Public Class AuthHeader : Inherits SoapHeader
    Public Username As String
    Public Password As String
End Class

Public Class HeaderService : Inherits WebService
    Public sHeader As AuthHeader
    ...
End Class
</Tab>
<Tab Name="JScript">
import System.Web.Services;
import  System.Web.Services.Protocols;

// AuthHeader class extends from SoapHeader
public class AuthHeader extends SoapHeader {
    public var Username:String;
    public var Password:String;
}

public class HeaderService extends WebService {
    public var sHeader:AuthHeader;
    ...
}
</Tab>
</Acme:TabControl>


<p>
Each <b>WebMethod</b> in your service can define a set of associated headers using the <b>SoapHeader</b> custom attribute.
By default, the header is required, but it is possible to define
optional headers as well.  The <b>SoapHeader</b> attribute specifies
the name of a public field or property of the <b>Client</b> or <b>Server</b> class (referred to as a
<b>Headers</b> property in this topic).  <b>XML Web services</b> sets
the value of a <b>Headers</b> property before the method is called
for input headers, and retrieves the value when the method returns
for output headers.  For more information about output or optional
headers see the .NET Framework SDK documentation.
<p>


<Acme:TabControl runat="server">
<Tab Name="C#">
[WebMethod(Description="This method requires a custom soap header set by the caller")]
[SoapHeader("sHeader")]
public string SecureMethod() {

    if (sHeader == null)
        return "ERROR: Please supply credentials";
    else
        return "USER: " + sHeader.Username;

}
</Tab>
<Tab Name="VB">


&lt;WebMethod(), SoapHeader("sHeader")&gt; Public Function SecureMethod() As String

    If (sHeader Is Nothing)
        Return "ERROR: Please supply credentials"
    Else
        Return "USER: " & sHeader.Username
    End If
End Function
</Tab>
<Tab Name="JScript">
WebMethodAttribute(Description="This method requires a custom soap header set by the caller")
SoapHeaderAttribute("sHeader")
public string SecureMethod() {

    if (sHeader == null)
        return "ERROR: Please supply credentials";
    else
        return "USER: " + sHeader.Username;

}
</Tab>
</Acme:TabControl>
<p>

A client then sets the header on the proxy class directly before making a method call that requires it, as shown in the following example:
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
HeaderService h = new HeaderService();
AuthHeader myHeader = new AuthHeader();
myHeader.Username = "JohnDoe";
myHeader.Password = "password";
h.AuthHeader = myHeader;
String result = h.SecureMethod();
</Tab>
<Tab Name="VB">
Dim h As New HeaderService
Dim myHeader As New AuthHeader
myHeader.Username = "JohnDoe"
myHeader.Password = "password"
h.AuthHeader = myHeader
Dim result As String = h.SecureMethod()
</Tab>
<Tab Name="JScript">
var h:HeaderService = new HeaderService();
var myHeader:AuthHeader = new AuthHeader();
myHeader.Username = "JohnDoe";
myHeader.Password = "password";
h.AuthHeader = myHeader;
var result:String = h.SecureMethod();
</Tab>
</Acme:TabControl>
<p>

To see this code in action, run the following sample:
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/soapheaders/CS/soapheaders.aspx"
  ViewSource="/quickstart/aspplus/samples/services/soapheaders/soapheaders.src"
  Icon="/quickstart/aspplus/images/genicon.gif"
  Caption="C# SoapHeaders.aspx"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/soapheaders/VB/soapheaders.aspx"
  ViewSource="/quickstart/aspplus/samples/services/soapheaders/soapheaders.src"
  Icon="/quickstart/aspplus/images/genicon.gif"
  Caption="VB SoapHeaders.aspx"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/services/soapheaders/JS/soapheaders.aspx"
  ViewSource="/quickstart/aspplus/samples/services/soapheaders/soapheaders.src"
  Icon="/quickstart/aspplus/images/genicon.gif"
  Caption="JScript SoapHeaders.aspx"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>
<h4><a name="summary">Section Summary</a></h4>
<ol>
<li>Securing your XML Web services on the server using Windows authentication follows exactly the same model as described for .aspx page.
<li>You can also programmatically set Windows credentials using the
<b>Username</b> and <b>Password</b> properties on the <b>XML Web service</b> proxy class.
<li>Lastly, you can do custom authentication by passing credential
information as <b>SOAPHeaders</b>, along with a SOAP request to the method
that requires it.
</ol>
<p>

<!-- #include virtual="/quickstart/include/footer.inc" -->
<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
