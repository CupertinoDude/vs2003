<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Authorizing Users and Roles</span>
<p>
ASP.NET <b><authorization></b> is used to control client access to URL resources.  
It is configurable for the HTTP method used to make the request 
(<b>GET</b> or <b>POST</b>) and can be configured to allow or deny 
access to groups of users or roles.  The following example shows 
access being granted to a user named <i>someone</i> 
and 
a role named <i>Admins</i>.  All other users are denied access.
</p>

<div class="code"><xmp>
<authorization>
    <allow users="someone@www.contoso.com" />
    <allow roles="Admins" />
    <deny users="*" />
</authorization>
</xmp></div>

<p>
Permissible elements for authorization directives are either 
<b>allow</b> or <b>deny</b>.  Each <b>allow</b> or <b>deny</b> 
element must contain a <b>users</b> or a <b>roles</b> attribute.  
Multiple users or roles can be specified in a single element by 
providing a comma-separated list.
<p>
<div class="code"><xmp>
<allow users="John,Mary" />
</xmp></div>
<p>
The HTTP method can be indicated using the <b>Verb</b> attribute:
<p>
<div class="code"><xmp>
<allow VERB="POST" users="John,Mary" />
<deny VERB="POST" users="*" />
<allow VERB="GET" users="*" />
</xmp></div>
<p>
This example lets Mary and John <b>POST</b> to the protected resources, while only allowing everyone else to use <b>GET</b>.
<p>
There are two special usernames:
<ul>
<li><b>*</b>: All users</li>
<li><b>?</b>: Anonymous (unauthenticated) users</li>
</ul>
These special usernames are commonly used by applications using 
forms-based authentication to deny access to unauthenticated users, as shown in the following example:
<p>
<div class="code"><xmp>
<authorization>
    <deny users="?" />
</authorization>
</xmp></div>
<p>
URL authorization is computed hierarchically and the rules used to determine access are as follows:
<ul>
<li>Rules relevant to the URL are collected from across the hierarchy and a merged list of rules is constructed.</li>
<li>The most recent rules are placed at the head of the list.  This means that configuration in the current directory is 
at the head of the list, followed by configuration in the 
immediate parent, and so on, up to the top-level file for the computer.</li>
<li>Rules are checked until a match is found.  If the match is allowable, 
access is granted.  If not, access is disallowed.</li>
</ul>
What this means is that applications that are not interested in 
inheriting their configuration should explicitly configure all of the possibilities relevant to their applications.

<p>
The default setting in the machine-wide configuration file (machine.config) 
is to grant access to all users. Unless an application is configured to the contrary 
(and assuming that a user is authenticated and passes the file 
authorization ACL check), access is granted.
<p>
When roles are checked, URL authorization effectively marches down the list of configured roles and does something that looks like the following pseudocode:
<p><Acme:TabControl runat="server">
<Tab Name="C#">
if(User.IsInRole("ConfiguredRole")) {
  ApplyRule();
}
</Tab>

<Tab Name="VB">
If User.IsInRole("ConfiguredRole") Then
  ApplyRule()
End If
</Tab>

<Tab Name="JScript">
if(User.IsInRole("ConfiguredRole")) {
  ApplyRule();
}
</Tab>

</Acme:TabControl><p>

<p>
What this means for your application is that you use your own class 
that implements <b>System.Security.Principal.IPrincipal</b> to provide 
your own role-mapping semantics, as explained in
<a href="/quickstart/aspplus/doc/windowsauth.aspx">Windows-based Authentication</a>.
</p>
The following sample uses forms-based authentication services.  
It explicitly denies access to <i>someone@www.contoso.com</i> and anonymous users. 
Try logging into the sample with Username="someone@www.contoso.com" and 
Password="password". Access will be denied and you will be redirected 
back to the logon page.  Now log on as Username="someone.else@www.contoso.com" and Password="password". You will see that access is granted.

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/security/UserAuth/CS/default.aspx"
  ViewSource="/quickstart/aspplus/samples/security/UserAuth/userauth.src"
  Icon="/quickstart/aspplus/images/userauth.gif"
  Caption="C# Forms-Based/Cookie Authentication with URL Authorization"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/security/UserAuth/VB/default.aspx"
  ViewSource="/quickstart/aspplus/samples/security/UserAuth/userauth.src"
  Icon="/quickstart/aspplus/images/userauth.gif"
  Caption="VB Forms-Based/Cookie Authentication with URL Authorization"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/security/UserAuth/JS/default.aspx"
  ViewSource="/quickstart/aspplus/samples/security/UserAuth/userauth.src"
  Icon="/quickstart/aspplus/images/userauth.gif"
  Caption="JScript Forms-Based/Cookie Authentication with URL Authorization"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->