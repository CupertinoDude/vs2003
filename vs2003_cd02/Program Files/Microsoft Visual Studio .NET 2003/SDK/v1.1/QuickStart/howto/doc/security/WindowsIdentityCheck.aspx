<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/Security.inc" -->


<h4>How Do I...Check the Windows Identity in a client application?</h4>

User identity is a common means of controlling access to a business application
or limiting the options available within that application.  The .NET Framework
classes under the namespace <b>System.Security.Principal</b> are
provided to assist in making such role-based security determinations.<p>

These classes and the mechanisms they expose are highly extensible.   They allow host
code to provide its own user identity and role information, or allow it to expose the
user account and group information provided by Windows. For more complete details
regarding how to extend the role-based security system, consult the .NET Framework
SDK Developer's Guide.<p>

For those who simply need to check the user's Windows user name and group
memberships from a client application, this topic will show you how.<p>


The Framework provides a <b>WindowsIdentity</b> class that represents an
authenticated Windows user and a <b>WindowsPrincipal</b> class that
encapsulates the <b>WindowsIdentity</b> and information about the user's
role memberships. These objects representing the current user are accessible in one
of two ways: using a static property on the <b>Thread</b> object or a static
method on the <b>WindowsIdentity</b> object.  Examples of both are given
in the following section.<p>

Accessing the current principal from the <b>Thread</b> is the standard
approach, and it works for all types of principal objects. But, because this method
returns an <b>IPrincipal</b>, it must be cast as a <b>WindowsPrincipal</b>
before it can be used as one. Notice that before accessing the current principal,
a call to <b>SetPrincipalPolicy</b> is made. This is noteworthy
because without it the principal returned would be a <b>GenericPrincipal</b>
containing no user information. As the call to <b>SetPrincipalPolicy</b>
requires the ControlPrincipal <b>SecurityPermission</b> (one not
normally given out to less than fully trusted code) this prevents semi-trusted code
(such as that running off the Internet) from gaining access to a user's account name.<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
AppDomain.CurrentDomain.SetPrincipalPolicy(PrincipalPolicy.WindowsPrincipal);

WindowsPrincipal user = (WindowsPrincipal)System.Threading.Thread.CurrentPrincipal;
WindowsIdentity ident = user.Identity;
</Tab>
<Tab Name="VB">
AppDomain.CurrentDomain.SetPrincipalPolicy(PrincipalPolicy.WindowsPrincipal)

Dim user As WindowsPrincipal = CType(System.Threading.Thread.CurrentPrincipal, WindowsPrincipal)
Dim ident As WindowsIdentity = user.Identity
</Tab>
<Tab Name="C++">
AppDomain::CurrentDomain->SetPrincipalPolicy(PrincipalPolicy::WindowsPrincipal);

WindowsPrincipal* user = __try_cast<WindowsPrincipal*>(Thread::CurrentPrincipal);
</Tab>
</Acme:TabControl>
<p>

Since checking for a Windows identity is expected to be a very common case, a
shortcut is provided using a static method on the <b>WindowsIdentity</b> object
as shown in the example below. Please note, however, that this method requires the
same level of permission as the one above.<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
WindowsIdentity ident = WindowsIdentity.GetCurrent();
WindowsPrincipal user = new WindowsPrincipal(ident);
</Tab>
<Tab Name="VB">
Dim ident As WindowsIdentity = WindowsIdentity.GetCurrent()
Dim user As New WindowsPrincipal(ident)
</Tab>
<Tab Name="C++">
WindowsIdentity ident = WindowsIdentity.GetCurrent();
WindowsPrincipal user = new WindowsPrincipal(ident);
</Tab>
</Acme:TabControl>
<p>

Once a <b>WindowsPrincipal</b> is retrieved, group membership can be checked using
the method <b>IsInRole</b>.  If the goal of checking role group membership is to
deny access to an application (vs. customizing the user experience), an even simpler approach
is to use the <b>PrincipalPermission</b> to demand the required role.<p>


The following example verifies that a user is in a given NT group using both
<b>WindowsPrincipal</b> and <b>PrincipalPermission</b>.<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample = "/QuickStart/howto/samples/Security/WindowsIdentityCheck/CS"
        ViewSource="/quickstart/howto/samples/Security/WindowsIdentityCheck/WindowsIdentityCheck.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# WindowsIdentityCheck"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample = "/QuickStart/howto/samples/Security/WindowsIdentityCheck/VB"
        ViewSource="/quickstart/howto/samples/Security/WindowsIdentityCheck/WindowsIdentityCheck.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB WindowsIdentityCheck"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample = "/QuickStart/howto/samples/Security/WindowsIdentityCheck/CP"
        ViewSource="/quickstart/howto/samples/Security/WindowsIdentityCheck/WindowsIdentityCheck.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ WindowsIdentityCheck"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>



<!-- #include virtual="/quickstart/howto/include/footer.inc" -->