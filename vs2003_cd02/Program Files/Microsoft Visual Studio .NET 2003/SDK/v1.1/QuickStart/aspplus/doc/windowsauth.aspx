<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/aspplus/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/aspplus/include/header.inc" -->

<span class="header">Windows-based Authentication</span>
<p>
When you use ASP.NET Windows authentication, ASP.NET attaches a <b>WindowsPrincipal</b> object to the current request.  This object is used by URL authorization. The application can also use it programmatically to determine whether a requesting identity is in a given role.
</p>
<p><Acme:TabControl runat="server">
<Tab Name="C#">
if(User.IsInRole("Administrators")) {
    DisplayPrivilegedContent();
}
</Tab>

<Tab Name="VB">
If User.IsInRole("Administrators") Then
    DisplayPrivilegedContent()
End If
</Tab>

<Tab Name="JScript">
if(User.IsInRole("Administrators")) {
    DisplayPrivilegedContent();
}
</Tab>

</Acme:TabControl><p>

The <b>WindowsPrincipal</b> class determines roles by NT group membership.  Applications that want to determine their own roles can do so by handling the 
<b>WindowsAuthentication_OnAuthenticate</b> event in their 
Global.asax file and attaching their own class that implements 
<b>System.Security.Principal.IPrincipal</b> to the request, as 
shown in the following example:
<p><Acme:TabControl runat="server">
<Tab Name="C#">
// Create a class that implements IPrincipal
public class MyPrincipal : IPrincipal {
  // implement application-defined role mappings
}

// In a Global.asax file:
public void WindowsAuthentication_OnAuthenticate(Object Source, WindowsAuthenticationEventArgs e) {
  // Attach a new application-defined class that implements IPrincipal to
  // the request.
  // Note that since IIS has already performed authentication, the provided
  // identity is used.
  e.User = new MyPrincipal(e.Identity);
}
</Tab>

<Tab Name="VB">
' Create a class that implements IPrincipal
Public Class MyPrincipal : Inherits IPrincipal
  ' Implement application-defined role mappings
End Class

' In a Global.asax file
Public Sub WindowsAuthentication_OnAuthenticate(Source As Object, e As WindowsAuthenticationEventArgs)
  ' Attach a new application-defined class that implements IPrincipal to
  ' the request.
  ' Note that since IIS has already performed authentication, the provided
  ' identity is used.
  e.User = New MyPrincipal(e.Identity)
End Sub
</Tab>

<Tab Name="JScript">
// Create a class that implements IPrincipal.
public class MyPrincipal implements IPrincipal {
  // Implement application-defined role mappings.
}

// In a Global.asax file
public function WindowsAuthentication_OnAuthenticate(Source:Object, e:WindowsAuthenticationEventArgs) : void {
  // Attach a new application-defined class that implements IPrincipal to
  // the request.
  // Note that since IIS has already performed authentication, the provided
  // identity is used.
  e.User = new MyPrincipal(e.Identity);
}
</Tab>

</Acme:TabControl><p>

<p>
The following sample shows how to access the name of an authenticated 
user, which is available as <b>User.Identity.Name</b>.  Programmers 
familiar with ASP should note that this value is also still available 
as the <i>AUTH_USER</i> server variable:
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/security/WindowsAuth/CS/windowsauth.aspx"
  ViewSource="/quickstart/aspplus/samples/security/WindowsAuth/windowsauth.src"
  Icon="/quickstart/aspplus/images/windowsauth.gif"
  Caption="C# Windows Authentication"
  runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/security/WindowsAuth/VB/windowsauth.aspx"
  ViewSource="/quickstart/aspplus/samples/security/WindowsAuth/windowsauth.src"
  Icon="/quickstart/aspplus/images/windowsauth.gif"
  Caption="VB Windows Authentication"
  runat="server" />
  </VbTemplate>
  <JsTemplate>
<Acme:SourceRef
  RunSample="/quickstart/aspplus/samples/security/WindowsAuth/JS/windowsauth.aspx"
  ViewSource="/quickstart/aspplus/samples/security/WindowsAuth/windowsauth.src"
  Icon="/quickstart/aspplus/images/windowsauth.gif"
  Caption="JScript Windows Authentication"
  runat="server" />
  </JsTemplate>
</Acme:LangSwitch>

<p>

<!-- #include virtual="/quickstart/aspplus/include/footer.inc" -->