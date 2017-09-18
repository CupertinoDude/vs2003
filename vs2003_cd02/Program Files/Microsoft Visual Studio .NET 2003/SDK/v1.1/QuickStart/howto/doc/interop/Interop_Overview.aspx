<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/interopheader.inc" -->

<h4>How Do I... Get Started Using Interoperability?</h4>

<P>The common language runtime's COM interoperability services make it possible to use existing COM 
objects from within managed applications and expose managed objects to existing COM applications. 

<p><b>Note:</b> Managed code is code that targets the common language runtime.
 
<p>In addition, the runtime's platform invoke mechanism makes it possible to call functions exported 
from unmanaged DLLs. One of the QuickStarts in this area is devoted to demonstrating COM interoperability 
and platform invoke.  
<p>
<p><h5>COM Interoperability</h5>
<p>COM interoperability provides support for producing and consuming COM 
objects from managed code.  

<p>Objects that are intended to be consumed 
by COM applications must be designed with interoperability in mind right from the start.   
Before a type can be consumed by a COM application, the 
type must meet the following requirements.  

<ul>
<li> The managed type (class, interface, struct or enum) must be public. 
<li> It is strongly recommended that the class explicitly implement an interface instead of
exposing class interface, which contains all of the members of the class and all the members 
of its base classes.
<li> The members of the type that are being accessed from COM must 
be public, non-static instance members.  Private, protected, internal, and static members 
are not accessible.
<li> If you need to create the type from COM, it must have a public, default (parameterless) 
constructor.
</ul>

<p>See the <A href="/quickstart/howto/doc/Interop/Building_Samples_COM2NET.aspx">
How Do I...Build a .NET COM Server Callable from COM clients?</A> topic for details on the build process.

<p>COM interoperability provides mechanisms that make it possible to use COM objects from
managed code as well. This is the mechanism that runtime clients use to access the services provided
by COM objects. Before any managed client can reference a specific COM type, the type must 
be described in metadata.

<p>See the <A href="/quickstart/howto/doc/Interop/Building_Samples_NET2COM.aspx">
How Do I...Build a .NET Client That Uses a COM Server?</A> topic for details on obtaining
an assembly containing metadata for the COM types and the build process.

<p><h5>Platform Invoke</h5>
<p>The platform invoke service makes it possible to call functions that are exported from an 
unmanaged DLL. Using platform invoke is similar to calling the <b>LoadLibrary</b> and <b>GetProcAddress</b>
Win32 API functions, which call into an exported function.  It is also similar to using a 
<b>Declare</b> statement in Visual Basic.

<p>Each exported function being called must have a managed method definition. The 
method definition can be provided as part of any class and is attributed with the <b>DllImport</b>
attribute in C# or with <b>Declare</b> statement in VB.NET to indicate that the method is 
implemented in unmanaged code. 

<p>See the <A href="/quickstart/howto/doc/Interop/PInvoke_Simple.aspx">
How Do I...Call a Function Exported From an Unmanaged Library?</A> topic for details on 
the platform invoke syntax.

</Acme:LangSwitch>
<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
