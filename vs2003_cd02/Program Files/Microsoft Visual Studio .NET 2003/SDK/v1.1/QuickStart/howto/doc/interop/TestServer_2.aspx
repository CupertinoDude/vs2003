<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/interopheader.inc" -->

<h4>How Do I...Pass an Array From .NET Code to VB6 Code?</h4>

<P>This example demonstrates how to use a .NET object from a Visual Basic 6.0 application. The same
technique can be used to create the object from any COM application including those built
with Visual C++ 6.0, VBScript or JScript.

<p>In this example, a simple class called Test implements <b>ITest</b> interface. This interface
has a single method that returns an array of strings and can be easily used from COM. The array can be
enumerated as any other Visual Basic array.

It is possible to avoid explicit definition of interface and use class interface, which contains all
of the members of the class and all the members of its base classes. This technique is available by
applying the DefaultInterface.AutoDual attribute, but is strongly discouraged because it limits
your ability to version your classes.
<P>

<Acme:TabControl runat="server">
<Tab Name="C#">
namespace TestServer{
	public interface ITest{
		string[] GetArray();
	}

	public class Test : ITest{
		string[] ITest.GetArray(){
			string[] stringArray = {"red", "yellow", "blue"};
			return stringArray;
		}
	}
}
</Tab>
<Tab Name="VB">
Namespace TestServer
	Public Interface ITest
		Function GetArray() As String()
	End Interface

	Public Class Test : Implements ITest
		Function GetArray() As String() Implements ITest.GetArray
			Dim stringArray() As String = {"one", "two", "three"}
			Return stringArray
		End Function
	End Class
End Namespace
</Tab>
<Tab Name="C++">
namespace TestServer
{
    public __gc __interface ITest
    {
        String * GetArray() [];
    };        
    
    public __gc class Test : public ITest
    {
        String * GetArray() []
        {
            String * stringArray[] = {S"red", S"yellow", S"blue"};
            return stringArray;
        }        
    };
}
</Tab>
</Acme:TabControl>

<P>After compiling the managed code to create an assembly, the assembly must be installed in the
global assembly cache (GAC) and registered for use from COM. Use gacutil.exe to install the assembly
in the GAC and add the registry entries needed to enable the types within the assembly to be created from COM.</P>

<div class="code"><pre>
gacutil /i TestServer.dll
</pre></div>

<P>In order to use the type from Visual Basic 6.0, it helps to have a type library that describes the types
contained in the assembly. Use tlbexp.exe to produce a type library from any managed assembly.  Once
a type library is available, it can be added the project through the Project/Reference dialog in
Visual Basic 6.0.</P>

<div class="code"><pre>
tlbexp TestServer.dll
</pre></div>

<p>Once the reference to the type library is added to the project, the types defined in the assembly can
be referenced directly with the Visual Basic 6.0 code.


<div class="code"><pre>
Dim dotNETServer As TestServer.ITest
Set dotNETServer = New TestServer.Test

Dim str As Variant

Debug.Print ".NET server returned: "
For Each str In dotNETServer.GetArray
        Debug.Print str
Next
</pre></div>

<p>In order to run the application, the assembly is typically installed in
the global assembly cache as described above.  During development it is easier to simply copy the assembly to the application directory.  Assemblies
can only be located if they reside in the application directory or in the
Global Assembly Cache.

<p>Note: If you are trying to run the application from within
the Visual Basic 6.0 development environment, the assembly must be in the same
directory as vb6.exe because vb6.exe is really the process hosting the assembly.</p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Interop/TestServer_2/VB6"
        MapRunSamplePath="true"
        ViewSource="/quickstart/howto/samples/Interop/TestServer_2/TestServer.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB6 Test Client"
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Interop/TestServer_2/VB6"
        MapRunSamplePath="true"
        ViewSource="/quickstart/howto/samples/Interop/TestServer_2/TestServer.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB6 Test Client"
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Interop/TestServer_2/CP"
        MapRunSamplePath="true"
        ViewSource="/quickstart/howto/samples/Interop/TestServer_2/TestServer.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ Test Client"
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
