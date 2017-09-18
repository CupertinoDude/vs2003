
<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">User Account Impersonation</span>
<p>
As mentioned in the <a href="/quickstart/aspplus/doc/securityoverview.aspx">Security 
Overview</a>, impersonation is the ability of a thread to execute in a security 
context different from that of the process owning the thread.  What this means 
for a Web application is that if a server is impersonating, it is doing work 
using the identity of the client making the request.
</p>
<p>
By default, ASP.NET does not do per-request impersonation.  This is 
different from ASP, which does impersonate on every request.  If desired, 
you can configure an application to impersonate on every request 
with the following <b>Configuration</b> directive:

<p>
<div class="code"><xmp>
<identity impersonate="true" />
</xmp></div>
<p>
Since ASP.NET does dynamic compilation, enabling impersonation 
requires that all accounts have read/write access to the 
application's Codegen directory (where dynamically compiled objects 
are stored by the ASP.NET runtime) as well as the global assembly 
cache (%Windir%\assembly).  Some applications require impersonation 
to be enabled for ASP compatibility or to use Windows authentication 
services.

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->