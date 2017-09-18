
<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Authentication and Authorization</span>

<p>ASP.NET works in conjunction with IIS to support authentication, 
using Basic,
Digest, and Windows authentication. ASP.NET supports 
the Microsoft Passport authentication service, which provides 
single sign-on services and support for user profile
services. ASP.NET also provides a robust service for applications that 
want to use forms-based
authentication. Forms-based authentication uses cookies to authenticate users and allows the
application to do its own credential verification.</p>

<p>It is important to realize that ASP.NET authentication services are subject to the
authentication services provided by IIS. For example, in order to use Basic authentication in
an IIS application, you must configure the use of Basic authentication for the application
using the Internet Service Manager tool.</p>

<p>ASP.NET provides two types of authorization services: 
<ul>
<li>Checks against ACLs or permissions on a
resource to determine whether the authenticated user account can 
access the resources
<li>
URL authorization, which authorizes an identity for pieces of the Web 
space
</ul> 

To illustrate
the difference, consider a scenario in which an application is configured to allow
anonymous access using the <i>IUSR_MYMACHINE</i> account. When a 
request for an ASP.NET page (such as "/default.aspx") is authorized, 
a check is done against the ACLs on that file (for example, 
"c:\inetpub\wwwroot\default.aspx") to see whether the <i>IUSR_MYMACHINE</i> account has
permission to read the file. If it does, then access is authorized. If the web content resides on an NTFS volume, 
and Windows Authentication is configured for the virtual directory, file authorization is performed automatically.</p>

<p>For URL authorization, the anonymous user is checked against the 
configuration data computed for the ASP.NET application. If access is 
allowed for the requested
URL, the request is authorized. In this case, ASP.NET checks to see 
whether the anonymous user has
access to /Default.aspx (that is, the check is done against the URL itself, not against the
file that the URL ultimately resolves to).</p>

<p>This might seem a subtle distinction, but it enables applications to use authentication
schemes likes forms-based authentication or Passport authentication, 
in which the users do not
correspond to a machine or domain account. It also enables 
authorization against
virtual resources, for which there is no physical file underlying 
the resource. For example,
an application could choose to map all requests for files ending in 
.stk to a handler that
serves stock quotes based on variables present in the query string. 
In such a case, there is no
physical .stk against which to do ACL checks, so URL authorization is 
used to control access to the
virtual resource.</p>

<p>File authorization is always performed against the authenticated
account provided by IIS. If anonymous access is allowed, this is 
the configured
anonymous account. Otherwise, it uses an NT account. This works 
in exactly the same way as ASP.</p>

<p>File ACLs are set for a given file or directory using the 
<b>Security</b> tab in the Explorer
property page. URL authorization is configured as part of an ASP.NET Framework application and is
described fully in <a href="/quickstart/aspplus/doc/authorization.aspx">Authorizing Users and
Roles</a>.</p>

<p>To activate an ASP.NET authentication service, you must configure 
the <b>&lt;authentication&gt;</b>
element in the application's configuration file. This element
can have any of the values listed in the following table.</p>

<p><table class="table2" cellpadding=3 width="95%">
<tr><th width="150"><b>Value</b></th><th><b>Description</b></th></tr>
<tr><td>None</td><td>No ASP.NET authentication services are active.  Note 
that IIS authentication services can still be present.</td></tr>
<tr><td>Windows</td><td>ASP.NET authentication services 
attach a <b>WindowsPrincipal</b> (<b>System.Security.Principal.WindowsPrincipal</b>) 
to the current request to enable authorization against NT 
users or groups.</td></tr>
<tr><td>Forms</td><td>ASP.NET authentication services manage cookies 
and redirect unathenticated users to a logon page.  This is often used in conjunction with the IIS option to allow anonymous access to an application.</td></tr>
<tr><td>Passport</td><td>ASP.NET authentication services provide a 
convenient wrapper around the services provided by the Passport 
SDK, which must be installed on the machine.</td></tr>
</table></p>

<p>For example, the following configuration file enables forms-based (cookie) authentication
for an application:</p>

<div class="code"><pre>
&lt;configuration&gt;
  &lt;system.web&gt;
    &lt;authentication mode="Forms"/&gt;
  &lt;/system.web&gt;
&lt;/configuration&gt;
</pre></div>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->
