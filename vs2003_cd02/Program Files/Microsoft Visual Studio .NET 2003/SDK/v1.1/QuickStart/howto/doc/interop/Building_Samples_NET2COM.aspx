<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/interopheader.inc" -->

<h4>How Do I...Build a .NET Client That Uses a COM Server?</h4>
<P>This section explains how to build managed code that uses COM. The steps involved in the build
process are as follows:
<ol>
<li> Obtain an assembly containing definitions of the COM types to be used.
<li> Install the assembly in the global assembly cache. (optional)
<li> Reference the assembly containing the COM type definitions.
<li> Reference the COM types.
</ol>

<h5>Obtain an Assembly Containing Definitions of the COM Types to be Used</h5>
Before any managed application can reference a specific type, the type must be described in metadata.
For managed types, this is easy because the compiler that produces the managed code also produces the
necessary metadata.  Getting metadata for existing COM types is a little trickier.  There are several
ways to do this.
<ol>
<li> Obtain a signed assembly containing the metadata from the producer of the library.  The provider of the
COM types should be the first source of metadata for any COM library.   This allows the vendor to
sign the assembly with the correct publisher key. <p>
<li> If a signed assembly is not available from the publisher, consider using the tlbimp.exe (Type Library
Importer) utility to produce an assembly yourself. You can produce an assembly
from most COM type libraries.  If the assembly is to be shared, the assembly must be signed with a
publisher's key.  The tlbimp.exe can produce signed assemblies using the /keyfile option.<p>

<div class="code"><pre>
tlbimp SHDocVw.dll /keyfile:MyKey.snk /out:ExplorerLib.dll
</pre></div>
<li> As a last resort, the metadata can be created directly from source code.  In order to do this,
the types are defined in a language like C# or Visual Basic .NET and marked with the <b>ComImportAttribute</b>.  The attribute
is used to by the runtime to differentiate these types from other managed types.  There are several
other attributes that can be used to customize how a managed type is exposed to COM. <p>

<div class="code"><pre>
[ComImport] interface IMyComInterface {...}
</pre></div>
</ol>
<h5>Install the Assembly in the Global Assembly Cache</h5>
If you want your assembly containing definitions of the COM types to be shared among
several applications, it must be installed in the global assembly cache (GAC). Use gacutil.exe
to install an assembly in the GAC.<p>

<div class="code"><pre>
gacutil /i ExplorerLib.dll
</pre></div>

<h5>Reference the Assembly Containing the Type Definitions.</h5>
With Visual Basic .NET or with C#, you can reference the assembly using the compiler /r switch or
you can add reference to the project directly from Visual Studio .NET development tool.
<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
csc TestClient.cs /r:ExplorerLib.dll
</Tab>
<Tab Name="VB">
vbc TestClient.vb /r:ExplorerLib.dll
</Tab>
</Acme:TabControl>

<p>

<h5>Reference the COM Types</h5>
Once the reference to the type library is added to the project, the types defined within
that library can be referenced from managed code. Refer to the
<A href="/quickstart/howto/doc/Interop/TestClient_1.aspx">How Do I...Call COM methods from .NET?</A>
for an example on how to do that.
<p>
<b>Note: </b> See the article on <a target="_blank"href="http://support.microsoft.com/support/misc/kblookup.asp?id=Q264957">http://support.microsoft.com/support/misc/kblookup.asp?id=Q264957</a> when using VB6 components from managed code.



<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
