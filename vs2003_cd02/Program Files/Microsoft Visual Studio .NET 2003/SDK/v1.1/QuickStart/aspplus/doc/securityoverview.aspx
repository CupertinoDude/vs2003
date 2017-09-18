<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Security Overview</span>
<p>
An important part of many Web applications is the ability to identify 
users and control access to resources.  The act of determining the 
identity of the requesting entity is known as authentication.  
Generally, the user must present credentials, such as a name/password pair in order to be 
authenticated. 
Once an authenticated identity is available, it must be determined 
whether that identity can access a given resource. This process is 
known as authorization.  ASP.NET works in conjunction with IIS to provide authentication and authorization services to applications.
</p>
<p>
An important feature of COM objects is the ability to control the 
identity under which COM object code is executed.  When a COM object 
executes code with the identity of the requesting entity, this is 
known as impersonation.  ASP.NET Framework applications can optionally choose to impersonate requests.
<p>
Some applications also want to be able to dynamically tailor content, 
based on the requesting identity or based on a set of roles that a 
requesting identity belongs to.  ASP.NET Framework applications can dynamically 
check whether the current requesting identity participates 
in a particular role. For example, an application might want to check 
to see whether the current user belongs to the manager's role, in 
order to conditionally generate content for managers.
<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->