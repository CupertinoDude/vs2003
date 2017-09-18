<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/MobileQuickstart/util/SrcRef.ascx"%>
<!-- #include virtual="/MobileQuickstart/include/header.inc" -->

<h4>Security</h4>

<div class="indent" style="font-family:Verdana; font-size:8pt;">
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#WhatIs">Understanding Security</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#WindowsAuth">Windows Authentication</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#PassportAuth">Passport Authentication</a><br>
    <b> <img align="middle" src="../images/bullet.gif">&nbsp;&nbsp;</b><a class="toc2" href="#FormsAuth">Forms Authentication</a><br>
</div>

<br>

<hr color="darkred" size="1">

<br>

<a name="WhatIs"></a>
<span class="subhead">Understanding Security</span><br>

<p>

The security in the ASP.NET is made up of three distinct areas:
authentication, authorization, and encryption.
The Microsoft .NET Framework, in conjunction 
with Internet Information Services (IIS) provides support across
these areas to secure your application.
To write a secure Web application, it's important to understand that configuration
choices affect the security of
your application. ASP.NET 
relies on the infrastructure of IIS and Microsoft ASP.NET for securing applications. 
Before you begin, it is recommended that you review the 
<a href="/quickstart/aspplus/doc/securityoverview.aspx" target="_top">
.NET Framework QuickStart security topics</a>.
Note that this tutorial is available only if you have
installed the .NET Framework samples on this computer.

<p>

ASP.NET mobile controls work with a wide range of 
devices. By using
the mobile controls, you can avoid 
many of the complications inherent in supporting unique clients.
This section discusses the particular authentication schemes that
ASP.NET supports, and the steps 
you must take to ensure that a wide range of devices can access your
application. 
After the user is authenticated, the authorization facilities
of ASP.NET determine whether or not a user has sufficient permission to perform the requested action.
Encryption choices are usually transparent to the device user. If an application
is configured to use the Secure Sockets Layer (SSL), the data is encrypted 
for transmission between the client and the server. In the various authentication 
schemes, pieces of data such as user names, passwords, or cookies are encrypted
to protect them from being viewed during transmission.

<p>

The .NET Framework supports Integrated Windows Authentication and Authorization, 
Microsoft Passport, and Forms Authentication. Each
authentication method presents unique challenges when combined with mobile devices.
In some cases, the support is not yet available. In other cases, extra
handling may be required.

<p>

<a name="WindowsAuth"></a>
<span class="subhead">Windows Authentication</span><br>

<p>

ASP.NET relies on IIS to negotiate Microsoft Windows authentication with the client.
Basic authentication is widely supported but suffers from the complication
that user names and passwords are transmitted in clear text. Digest and
NTLM/Challenge Response are not widely supported in mobile devices, so 
you cannot rely on these choices for authenticating users. Because these 
forms of authentication require a user account on the target computer,
consider the implications of allowing users to log on
by using basic authentication. You may not feel comfortable unless you
can be assured that the communications between client and server 
are being encrypted.

<p>

<a name="PassportAuth"></a>
<span class="subhead">Passport Authentication</span><br>

<p>
The Microsoft Passport Authentication service is supported by
ASP.NET. Currently, it only supports devices that use HTML. 
As such, it is not an appropriate choice for authenticating
a wide range of mobile devices at this time.

<p>

<a name="FormsAuth"></a>
<span class="subhead">Forms Authentication</span><br>

<p>

The Forms Authentication support provided by ASP.NET allows you to
validate the identity of the user without requiring a separate account
on the computer or in the domain. The basic idea behind forms
authentication is that each request is checked for an authentication
cookie. If the cookie is not found, is not valid, or is expired, the user
is redirected to a logon page (by default, this page is login.aspx).

<p>

The logon page has a form where the user presents credentials. When the user posts
the required data, the authentication check is performed in code,
and the user is redirected to the originally requested page with the
required cookie in place. This
page is the same as any other .aspx page; thus, the developer must determine the requirements
to successfully authenticate.

<p>

The following sample shows the quickest method to redirect and set a cookie.

<div class="code"><xmp style="padding-left:0px">
using System.Web.Security;
//...
if (MyClass.UserIsAuthenticated(UserName, UserPassword))
{
    FormsAuthentication.RedirectFromLoginPage(UserName, false);
}
//...
</xmp></div>

<p>

This method works well for many devices, but not for all devices. At the point where a cookie 
is sent to the client, the user is also redirected back
to the original page. Some devices and device gateways
follow the redirect without saving the cookie. 
When this happens, the original request is sent again without the required authentication cookie,
and the user is redirected to the logon page.
The solution for devices that do not support cookies at all is to add
the authentication ticket onto the URL's query string.

<p>

Mobile controls provide a helper mechanism
for dealing with restricted devices. The
<b>System.Web.Mobile.MobileFormsAuthentication</b>
class provides an alternative <b>RedirectFromLoginPage</b> method
that deals with the above restrictions.
The following code example demonstrates how to accomplish this task.

<div class="code"><xmp style="padding-left:0px">
using System.Web.Mobile;
//...
if (MyClass.UserIsAuthenticated(UserName, UserPassword))
{
    MobileFormsAuthentication.RedirectFromLoginPage(UserName, false);
}
//...
</xmp></div>

In addition, <b>System.Web.Mobile.MobileFormsAuthentication</b> provides a <b>SignOut</b> method
to be used in order to clear any cookie or additional query string parameter.
<p>

The following sample demonstrates the use of
<b>MobileFormsAuthentication</b>.  Use <b>jdoe</b> for the user name and
<b>password</b> for the password.

<p>
<Acme:SourceRef runat="server" Path="Security/Login" />


<!-- #include virtual="/MobileQuickstart/include/footer.inc" -->
