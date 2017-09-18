<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/interopheader.inc" -->

<h4>How Do I...Call COM Methods from .NET?</h4>

<p>This example demonstrates how to use COM object from a Visual Basic .NET or C# application.</p>

<p>In order to use the types defined within a COM library from managed code, you must obtain 
an assembly containing definitions of the COM types. Refer to the 
<A href="/quickstart/howto/doc/Interop/Building_Samples_NET2COM.aspx">How Do I...Build a .NET Client That Uses a COM Server?</A> 
for specific details.</p>

<p>With Visual Basic .NET or with C#, you can reference the assembly using compiler /r switch or
you can add reference to the project directly from Visual Studio .NET development tool.</p>

<Acme:TabControl runat="server">
<Tab Name="C#">

namespace TestClient {
	public class Test {
		public static void Main(){
			<b>ExplorerLib.InternetExplorer explorer;</b>
			ExplorerLib.IWebBrowserApp webBrowser;			
			
			explorer = new ExplorerLib.InternetExplorer();
			<b>webBrowser = (ExplorerLib.IWebBrowserApp) explorer;</b>
			
			webBrowser.Visible = true;
			webBrowser.GoHome();
			...
		}
	}
}
</Tab>
<Tab Name="VB">

Namespace TestClient
	Public Class Test 	
		Public Shared Sub Main()
			<b>Dim explorer As ExplorerLib.InternetExplorer</b>
			Dim webBrowser As ExplorerLib.IWebBrowserApp
				
			explorer = New ExplorerLib.InternetExplorer
			<b>webBrowser = explorer</b>
			
			webBrowser.Visible = True
			webBrowser.GoHome
			...
		End Sub
	End Class
End Namespace
</Tab>
<Tab Name="C++">

void main()
{
   <b>ExplorerLib::InternetExplorer * explorer = new ExplorerLib::InternetExplorerClass;</b>
   <b>ExplorerLib::IWebBrowserApp * webBrowser = __try_cast<ExplorerLib::IWebBrowserApp *>(explorer);</b>
            
   ExplorerLib::DWebBrowserEvents2_TitleChangeEventHandler * dTitleChange
	   = new ExplorerLib::DWebBrowserEvents2_TitleChangeEventHandler(0, &S::OnTitleChange);
   explorer->TitleChange += dTitleChange;    
                        
   webBrowser->Visible = true;
   webBrowser->GoHome();    
   
   ...
}
</Tab>
</Acme:TabControl>

<p>The following example uses the Internet Explorer object methods to display an Internet Explorer
window and to navigate to the home page. In order to do that, an assembly containing 
definitions of the Internet Explorer types is created from SHDocVw.dll and saved into ExplorerLib.dll,
which then can be referenced from code.</p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef 
        RunSample="/quickstart/howto/samples/Interop/TestClient_1/CS"        
        ViewSource="/quickstart/howto/samples/Interop/TestClient_1/TestClient.src"
        Icon = "/quickstart/images/console.gif"
        Caption="TestClient.exe"
        MapRunSamplePath="true"
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef 
        RunSample="/quickstart/howto/samples/Interop/TestClient_1/VB"
        ViewSource="/quickstart/howto/samples/Interop/TestClient_1/TestClient.src"
        Icon = "/quickstart/images/console.gif"
        Caption="TestClient.exe"
        MapRunSamplePath="true"
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef 
        RunSample="/quickstart/howto/samples/Interop/TestClient_1/CP"
        ViewSource="/quickstart/howto/samples/Interop/TestClient_1/TestClient.src"
        Icon = "/quickstart/images/console.gif"
        Caption="TestClient.exe"
        MapRunSamplePath="true"
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
