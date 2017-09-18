<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/Security.inc" -->


<h4>How Do I...Control access to my shared component?</h4>

This topic describes how to control access to an assembly (or individual method within
an assembly) using Code Access Security.<p>

Every assembly loaded by the common language runtime is assigned evidence that describes
its identity. This evidence can be the path or URL from which the assembly was loaded or
it can be a digital signature given to the code by its publisher. To control access to your
code, you can simply demand that your caller have a specific identity.  For example, to
limit access to a shared component to only code from the same publisher, the publisher
would sign all their code and then place a demand for that signature within their shared
component.<p>

The identity permissions found under the namespace <b>System.Security.Permissions</b>
are used for this purpose. Identity permissions are provided for the following types of
assembly identity: strong name, Authenticode publisher certificate, URL of origin, site
of origin, and Internet Explorer security zone. All identity permissions support three
types of identity demands as described below:
<ul>
<li><b>Demand:</b> All callers on the call stack are required to have the
specified identity. This check is performed at runtime.
<li><b>LinkDemand:</b> Only the code's immediate caller is required to have
the specified identity. The caller must be trusted to not allow misuse of the called
code by its own callers. This check is performed during loading.
<li><b>InheritanceDemand:</b> Requires the specified identity of any code
that attempts to inherit from or override a method on the protected code. This check is
performed during loading.
</ul>
Because the last two are performed during loading, they can only be specified declaratively.
Declarative security is placed in an assembly's manifest by the compiler where it can be
read and acted upon by the common language runtime when loading that
assembly. A straight demand, because it occurs at runtime, can be used either
imperatively or declaratively.<p>

Below is an example of making a link demand on a method for a strong name identity. The
public key has been abbreviated for readability.<p>

<Acme:TabControl runat="server" HtmlEncode="true">
<Tab Name="C#">

[StrongNameIdentityPermission(SecurityAction.LinkDemand, PublicKey="002400000...")]
public static void ProtectedMethod() {
    //do something
}
</Tab>
<Tab Name="VB">
Public Shared Sub _
  <StrongNameIdentityPermission(SecurityAction.LinkDemand, PublicKey := "002400000...")> _
  ProtectedMethod()
    'do something
End Sub
</Tab>
<Tab Name="C++">


[StrongNameIdentityPermission(SecurityAction::Demand, PublicKey="002400000...")]
void ProtectedMethod() {
    //do something
}
</Tab>
</Acme:TabControl>
<p>

The additional properties <b>Name</b> and <b>Version</b> can also
be provided.  By specifying <b>Name</b>, <b>Version</b>, and
<b>PublicKey</b>, an exact version of an assembly can be reliably demanded.
Specifying only <b>Name</b> and <b>PublicKey</b> will allow the
demand to succeed if the assembly name and signature match regardless of the assembly version. Specifying only the <b>PublicKey</b>, as in the code example above, causes the security system to
look for only the required signature and is useful when you desire to limit access to a
group of code signed by the same key.<p>

Attaching a strong name signature to your code involves two steps: creating the strong
name key and compiling your assembly with that key. The first is accomplished by using
the SN utility that is provided with the .NET Framework SDK. Below is the command-line
syntax for creating a key pair and viewing the public key portion (you will need
to make an identity demand for code signed with the corresponding private key).<p>

<div class="code"><pre>
sn -k keypair.dat

sn -p keypair.dat publickey.dat
sn -tp publickey.dat
</pre></div>

The second step requires adding a declaration to the assembly to indicate the location
of the file generated in step one.<p>

<Acme:TabControl runat="server" HtmlEncode="true">
<Tab Name="C#">
[assembly:AssemblyKeyFile("keypair.dat")]

public class MyClass {
    //something interesting
}
</Tab>
<Tab Name="VB">
<Assembly: AssemblyKeyFile("keypair.dat")>

Public Class MyClass
    'something interesting
End Class
</Tab>
<Tab Name="C++">
[assembly:AssemblyKeyFile("keypair.dat")]

public class MyClass {
    //something interesting
}
</Tab>
</Acme:TabControl>
<p>

It is also possible to delay-sign an assembly. This reserves room for the signature in the
assembly manifest but does not actually sign the assembly. Delayed signing is used when
the author of the assembly does not have access to the private key that will be used to
generate the signature.  For more information about delayed signing, see the reference
documentation on <b>AssemblyDelaySignAttribute</b>.<p>

<hr>
The following example contains three assemblies: a shared component written by Company A,
an application written by Company A that uses the shared component, and an application
by Company B that tries to use the shared component from Company A. Run the two executables,
noting in their titles whether they are from Company A or B, and observe the results. A
SecurityException is thrown when the code from Company B tries to call that protected
code from Company A.<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample = "/QuickStart/howto/samples/Security/CodeIdentityDemand/CS"
        ViewSource="/quickstart/howto/samples/Security/CodeIdentityDemand/CodeIdentityDemand.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# CodeIdentityDemand"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample = "/QuickStart/howto/samples/Security/CodeIdentityDemand/VB"
        ViewSource="/quickstart/howto/samples/Security/CodeIdentityDemand/CodeIdentityDemand.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB CodeIdentityDemand"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample = "/QuickStart/howto/samples/Security/CodeIdentityDemand/CP"
        ViewSource="/quickstart/howto/samples/Security/CodeIdentityDemand/CodeIdentityDemand.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ CodeIdentityDemand"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->