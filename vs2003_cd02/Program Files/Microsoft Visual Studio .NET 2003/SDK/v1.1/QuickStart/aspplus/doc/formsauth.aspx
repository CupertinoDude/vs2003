<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Forms-Based Authentication</span>

<p>Forms-based authentication is an ASP.NET authentication service 
that enables applications to
provide their own logon UI and do their own credential verification.  
ASP.NET authenticates users, redirects unauthenticated users to the 
logon page, and performs all the
necessary cookie management.  This sort of authentication is a popular 
technique used by many
Web sites.</p>

<p>An application has to be configured to use forms-based 
authentication by setting <b>&lt;authentication&gt;</b> to <b>Forms</b>, and
denying access to anonymous users. The following example shows how 
this can be done in the Web.config
file for the desired application:</p>

<div class="code"><xmp>
<configuration>
  <system.web>
    <authentication mode="Forms"/>
    <authorization>
        <deny users="?" />
    </authorization>
  </system.web>
</configuration>
</xmp></div>

<p>Administrators use forms-based authentication to configure the 
name of the cookie to use, the
protection type, the URL to use for the logon page, length of time the 
cookie is in effect, and the
path to use for the issued cookie. The following table shows the 
valid attributes for the <b>&lt;Forms&gt;</b>
element, which is a sub-element of the <b>&lt;authentication&gt;</b> 
element shown in the following example:</p>

<div class="code"><xmp>
<authentication mode="Forms">
   <forms name=".ASPXCOOKIEDEMO" loginUrl="login.aspx" protection="All" timeout="30" path="/">
                    <!-- protection="[All|None|Encryption|Validation]" -->
   </forms>
</authentication>
</xmp></div>

<table class="table2" cellpadding=3 width="95%">
<tr>
  <th width="150"><b>Attribute</b></th>
  <th><b>Description</b></th>
</tr>
<tr>
  <td><b>loginUrl</b></td>
  <td>Specifies the URL to which the request is redirected for unauthenticated users.  This can be on the same
    computer or a remote one.  If it is on a remote computer, both 
computers need to be using
    the same value for the <b>decryptionkey</b> attribute.</td>
</tr>
<tr>
  <td><b>name</b></td>
  <td>Name of the HTTP cookie to use for authentication purposes.  Note that if more
    than one application wants to use forms-based authentication 
services on a single
    computer, they should each configure a unique cookie value.  In order to avoid
    causing dependencies in URLs, ASP.NET uses "/" as the Path value when setting
    authentication cookies, so that they are sent back to every 
application on the site.</td>
</tr>
<tr>
  <td><b>timeout</b></td>
  <td>Amount of time in integer minutes, after which the cookie 
expires.  The default value is <i>30</i>.
    The timeout attribute is a sliding value, expiring <i>n</i> minutes from the time the last request was
    received.  In order to avoid adversely affecting performance and to 
avoid multiple browser warnings
    for those who have cookies warnings turned on, the cookie is updated if the time is more
    than half gone. (This means a loss of possible precision in some cases.)</td>
</tr>
<tr>
  <td><b>path</b></td>
  <td>Path to use for the issued cookie.  The default value is "/" to 
avoid difficulties with
    mismatched case in paths, since browsers are strictly 
case-sensitive when returning cookies.
    Applications in a shared-server environment should use this directive to maintain private
    cookies. (Alternatively, they can specify the path at runtime using the APIs to issue
    cookies.)</td>
</tr>
<tr>
  <td><b>protection</b></td>
  <td>Method used to protect cookie data.  Valid values are as follows:
    <ul>
     <li><b>All</b>: Use both data validation and encryption to 
protect the cookie.  The configured data validation algorithm is 
based on the <b><machinekey></b> element. Triple DES is used for encryption, if available and if the key is long enough (48 bytes).  <b>All</b> is the default (and suggested) value.
     <li><b>None</b>: Use for sites that are only using cookies for 
personalization and have weaker security requirements. Both encryption and 
validation can be disabled.  Although you should use caution if you 
use cookies in this way, this setting provides the best performance of any method 
of doing personalization using the .NET Framework.
     <li><b>Encryption</b>: Encrypts the cookie using TripleDES or 
DES, but data validation is not done on the cookie.  This type of 
cookie can be subject to chosen plaintext attacks.
     <li><b>Validation</b>: Does not encrypt the contents of the 
cookie, but validates that the cookie data has not been altered in 
transit.  To create the cookie, the validation key is concatenated in a buffer with the cookie data and a MAC is computed and appended to the outgoing cookie.
    </ul>
  </td>
</tr>
</table>

<p>After the application has been configured, you need to provide a logon page. The following
example shows a simple logon page.  When the sample is run, it requests the
Default.aspx page.  Unauthenticated requests are redirected to the logon page (Login.aspx), 
which presents a simple form that prompts for an e-mail address and a password. (Use
Username="someone@www.contoso.com" and Password="password" as credentials.)</p>

<p>After validating the credentials, the application calls the following:</p>

<p><Acme:TabControl runat="server">
<Tab Name="C#">
FormsAuthentication.RedirectFromLoginPage(UserEmail.Value, PersistCookie.Checked);
</Tab>
<Tab Name="VB">
FormsAuthentication.RedirectFromLoginPage(UserEmail.Value, PersistCookie.Checked)
</Tab>

<Tab Name="JScript">
FormsAuthentication.RedirectFromLoginPage(UserEmail.Value, PersistCookie.Checked);
</Tab>

</Acme:TabControl><p>

<p>This redirects the user back to the originally requested URL.  Applications that do not
want to perform the redirection can call either <b>FormsAuthentication.GetAuthCookie</b> to
retrieve the cookie value or <b>FormsAuthentication.SetAuthCookie</b> to attach a properly
encrypted cookie to the outgoing response.  These techniques can be 
useful for applications
that provide a logon UI embedded in the containing page or that want 
to have more
control over where users are redirected.  Authentication cookies 
can either be temporary or
permanent ("persistent").  Temporary cookies last only for the 
duration of the 
current browser session. When the
browser is closed, the cookie is lost.  Permanent cookies are saved 
by the browser and are
sent back across browser sessions unless explicitly deleted by the user.</p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/security/CookieAuth/CS/default.aspx"
  ViewSource="/quickstart/aspplus/samples/security/CookieAuth/cookieauth.src"
  Icon="/quickstart/aspplus/images/formsauth.gif"
  Caption="C# Forms-Based/Cookie Authentication"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/security/CookieAuth/VB/default.aspx"
  ViewSource="/quickstart/aspplus/samples/security/CookieAuth/cookieauth.src"
  Icon="/quickstart/aspplus/images/formsauth.gif"
  Caption="VB Forms-Based/Cookie Authentication"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/security/CookieAuth/JS/default.aspx"
  ViewSource="/quickstart/aspplus/samples/security/CookieAuth/cookieauth.src"
  Icon="/quickstart/aspplus/images/formsauth.gif"
  Caption="JScript Forms-Based/Cookie Authentication"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>The authentication cookie used by forms authentication consists 
of a linear version of
the <b>System.Web.Security.FormsAuthenticationTicket </b> class.  The information includes the
user name (but not the password), the version of forms authentication used, the date the
cookie was issued, and a field for optional application-specific data.</p>

<p>Application code can revoke or remove authentication cookies using the
<b>FormsAuthentication.SignOut</b> method.  This removes the 
authentication cookie
regardless of whether it is temporary or permanent.</p>

<p>It is also possible to supply forms-based authentication services with a list of valid
credentials using configuration, as shown in the following example:</p>

<div class="code"><xmp>
<authentication>
    <credentials passwordFormat="SHA1" >
        <user name="Mary" password="94F85995C7492EEC546C321821AA4BECA9A3E2B1"/>
        <user name="John" password="5753A498F025464D72E088A9D5D6E872592D5F91"/>
    </credentials>
</authentication>
</xmp></div>

<p>The application can then call 
<b>FormsAuthentication.Authenticate</b>, supplying
the username and password, and ASP.NET will verify the credentials.  Credentials can
be stored in cleartext, or as SHA1 or MD5 hashes, according to the following values 
of the
<b>passwordFormat</b> attribute:</p>

<table class="table2" cellpadding=3>
  <tr>
    <th width="150">Hash Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>Clear</td>
    <td>Passwords are stored in cleartext</td>
  </tr>
  <tr>
    <td>SHA1</td>
    <td>Passwords are stored as SHA1 digests</td>
  </tr>
  <tr>
    <td>MD5</td>
    <td>Passwords are stored as MD5 digests</td>
  </tr>
</table>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->