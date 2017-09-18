<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/interopheader.inc" -->

<h4>How Do I...Call a Function Exported From an Unmanaged Library?</h4>

<P>This example demonstrates how to call a function exported from an unmanaged library 
from managed code. The <b>MessageBox</b> routine in User32.dll and <b>GetSystemTime</b> 
routine in Kernel32.dll are called.  The same technique can be used to call any exported 
function in any other library.  

<p>In order to call <b>MessageBox</b> and <b>GetSystemTime</b>, you need the metadata that describes 
each method and its arguments. The necessary metadata is provided by defining a managed class 
with one or more static methods. The class and the static methods can have any name you choose. 
You might want to create several classes that contain related functions or simply group all 
the functions you need into a single class.

<P>In C# the <b>DllImport</b> attribute is used to identify the name of the actual DLL that contains 
the exported function. The method must be defined as static and external in order to apply 
the attribute. In VB.NET the <b>Declare</b> statement serves the same purpose.  

<p>Many unmanaged DLL functions expect you to pass structures, as a parameter to the function.
When using platform invoke to pass a structure, you must provide additional
information to format the type. In managed code, a formatted type is a structure or class
that is annotated with the <b>StructLayoutAttribute</b> to ensure predictable layout
information to its members.

<p>Once the class and methods are defined, the method can be called like any other method.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
using System.Runtime.InteropServices;

<b>[StructLayout(LayoutKind.Sequential)]</b>
public struct SystemTime {
	public ushort wYear;
	...
}

public class Win32  {
        <b>[DllImport("Kernel32.dll")]
        public static extern void GetSystemTime(ref SystemTime sysTime);</b>
	...
}

public class TestPInvoke {
        public static void Main() {
		SystemTime sysTime = new SystemTime();
		<b>Win32.GetSystemTime(ref sysTime);</b> 
		...
	}
}        	   
</Tab>
<Tab Name="VB">
imports System.Runtime.InteropServices

<b>Public Structure _
&lt;StructLayout(LayoutKind.Sequential)&gt; SystemTime</b>
	Public wYear As Short
	...
End Structure

Public Class Win32
	<b>Declare Auto Sub GetSystemTime _
	Lib "Kernel32.dll"(ByRef sysTime As SystemTime)</b>
	...
End Class

Public Class TestPInvoke 	
	Public Shared Sub Main()
		Dim sysTime As New SystemTime()
		<b>Win32.GetSystemTime(sysTime)</b>
		...	
	End Sub
End Class
</Tab>
<Tab Name="C++">
using namespace System::Runtime::InteropServices;

<b>[StructLayout(LayoutKind::Sequential)]</b>
public __gc struct SystemTime
{
 unsigned short wYear;
 unsigned short wMonth;
	...
}

public __gc class Win32 
{
public:
        <b>[DllImport("Kernel32.dll")]
         static void GetSystemTime(SystemTime * sysTime);</b>
	...
}


void main()
{
    SystemTime * sysTime = new SystemTime();
    Win32 * w = new Win32;
    <b>w -> GetSystemTime(sysTime);</b>
    ...
}       	   
</Tab>
</Acme:TabControl>

<p>If the name of the method is different than the actual export name in the DLL, 
the <b>DllImport.EntryPoint</b> property can be used to map the function to the correct 
entry point if you are using C#. In Visual Basic you can use <b>Alias</b> keyword for this
purpose.<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
using System.Runtime.InteropServices;

public class Win32 {
        ...
        <b>[DllImport("User32.dll", EntryPoint="MessageBox", CharSet=CharSet.Auto)]
        public static extern int MsgBox(int hWnd, String text, String caption, uint type);</b>
}

public class TestPInvoke {
        public static void Main() {
		...        	
		String date = ...;
		
		<b>Win32.MsgBox(0, date, "PInvoke Sample", 0);</b>
	}
}
</Tab>
<Tab Name="VB">
using System.Runtime.InteropServices;

Public Class Win32
	...	
	<b>Declare Auto Function MsgBox Lib "User32.dll" Alias "MessageBox" _
	(hWnd As Integer, txt As String, caption As String, Typ As Integer) As Integer</b>
End Class

Public Class TestPInvoke 	
	Public Shared Sub Main()
		...        	
		Dim dt As String
		dt = ...
		<b>Win32.MsgBox(0, dt, "Platform Invoke Sample", 0)</b>		
	End Sub
End Class
</Tab>
<Tab Name="C++">
using System.Runtime.InteropServices;
public __gc class Win32 
{
   	 ...
        
	<b>[DllImport("User32.dll", EntryPoint="MessageBox", CharSet=CharSet::Auto)]
        static int MsgBox(int hWnd, String * text, String * caption, unsigned int type);</b>
};

void Main() {
	...        	
	String *date = ...;
		
	<b>w -> MsgBox(0, date, S"PInvoke Sample", 0);</b>
}

</Tab>
</Acme:TabControl>

<p>Also, you can specify the entry by ordinal rather than by name. 

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
[DllImport("User32.dll", EntryPoint="#452")]
public static extern int MsgBox(int hWnd, String text, String caption, uint type);
</Tab>
<Tab Name="VB">
Declare Function MsgBox Lib "User32.dll" Alias "#452" _
(hWnd As Integer, txt As String, caption As String, Typ As Integer) As Integer
</Tab>
<Tab Name="C++">
[DllImport("User32.dll", EntryPoint="MessageBox", CharSet=CharSet::Auto)]
static int MsgBox(int hWnd, String * text, String * caption, unsigned int type);
</Tab>
</Acme:TabControl>

<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef 
        RunSample="/quickstart/howto/samples/Interop/PInvokeSimple/CS"
        MapRunSamplePath="true"
        ViewSource="/quickstart/howto/samples/Interop/PInvokeSimple/PInvokeSimple.src"
        Icon = "/quickstart/images/console.gif"
        Caption="PInvokeSimple.exe"
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef 
        RunSample="/quickstart/howto/samples/Interop/PInvokeSimple/VB"
        MapRunSamplePath="true"
        ViewSource="/quickstart/howto/samples/Interop/PInvokeSimple/PInvokeSimple.src"
        Icon = "/quickstart/images/console.gif"
        Caption="PInvokeSimple.exe"
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef 
        RunSample="/quickstart/howto/samples/Interop/PInvokeSimple/CP"
        MapRunSamplePath="true"
        ViewSource="/quickstart/howto/samples/Interop/PInvokeSimple/PInvokeSimple.src"
        Icon = "/quickstart/images/console.gif"
        Caption="PInvokeSimple.exe"
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>
<p>


<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
