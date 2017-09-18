<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/interopheader.inc" -->

<h4>How Do I...Build a .NET COM Server Callable from COM clients?</h4>

<P>This section explains how to build and install managed code that will be used from COM 
applications. The steps involved in the build process are as follows:
<ol>
<li> Write and compile the managed code.
<li> Generate a type library for the assembly using the tlbexp.exe utility.
<li> Install and register the assembly.
<li> Write and compile the COM code that references types in the assembly.
</ol>

<h5>Writing and Compiling the Managed Code</h5>
Before setting out to build an assembly that will be used from COM, it is important to 
understand the limitations of the common language runtime's interoperability services.  Refer to the 
<A href="/quickstart/howto/doc/Interop/Interop_Overview.aspx">Get Started with Interoperability</A> 
for specific details on exactly what those limitations are. 
<p>
If your managed assembly is designed to be shared among several applications, be sure 
that the assembly has a strong name so that it can be installed in the global assembly cache 
(see <A href="/quickstart/howto/doc/sharedname.aspx">How Do I...Create 
an Assembly with a Strong Name?</A>). If your assembly does not have a strong 
name, it can only be used by a single application.  

<p>Once the managed code is written, the compilation process is the same as it would 
be for any other piece of managed code. <p>

<h5>Generating a Type Library</h5>
Most unmanaged application development tools require a type library before you can make
references to external types. A type library can be generated from an assembly using the 
tlbexp.exe, which produces a .tlb file that can then be referenced
from your unmanaged development tool.  

<div class="code"><pre>
tlbexp TestServer.dll 
</pre></div>

<p>For example, with Visual Basic 6.0, you can reference 
the .tlb file from the Project/References dialog. In Visual C++ 6.0, you can use the #import 
statement to import the type definitions from the type library directly into C++. Once the 
reference to the type library is added to the project, the types defined within that library 
can be referenced from unmanaged code.<p>

<h5>Installing and Registering the Assembly</h5>
In order to actually create managed types from unmanaged code, the assembly needs to be 
installed in the global assembly cache (GAC) and registered for use from COM. 

<p>You can install an assembly in the global assembly cache using gacutil.exe utility. 
Assemblies can be uninstalled using the /u option. 

<div class="code"><pre>
gacutil /i TestServer.dll 
</pre></div>

If the assembly is to be used privately by a single application, it can be copied directly to the 
application directory (rather than installing the assembly in the GAC). Private assemblies do not
require strong names, but they must be registered for use from COM. 

<p>You can register an assembly using regasm.exe utility. Assemblies can be uninstalled 
using the /u option.

<div class="code"><pre>
regasm TestServer.dll 
</pre></div>
<p>

<h5>Writing and Compiling the Unmanaged Code</h5>
Once the assembly is registered and properly installed, the types defined within the assembly can be 
used from COM as though they were normal COM types.  For example, new objects can be created by 
calling <b>CoCreateInstance</b> API or by calling <b>CreateObject</b> or <b>GetObject</b> from Visual Basic or 
script languages.  See the remaining samples in this section for specific coding details.<p>




<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
