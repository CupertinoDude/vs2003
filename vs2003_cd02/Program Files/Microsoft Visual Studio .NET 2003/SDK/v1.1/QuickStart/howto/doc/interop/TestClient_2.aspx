<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/interopheader.inc" -->

<h4>How Do I...Sink Unmanaged Events from .NET?</h4>

<p>This example demonstrates how to sink unmanaged events from .NET code.</p>

<p>In order to use the types defined within a COM library from managed code, you have to obtain 
an assembly containing definitions of the COM types. Refer to the 
<A href="/quickstart/howto/doc/Interop/Building_Samples_NET2COM.aspx">How Do I...Build a .NET Client That Uses a COM Server?</A> 
for specific details.</p>

<p>With Visual Basic .NET or with C#, you can reference the assembly using compiler /r switch or
you can add reference to your project directly from the Visual Studio .NET development tool.</p>

<p>Once you have a reference, you can create new instances of the event handlers and add them 
to existing event handlers in unmanaged code. For specific syntax see
examples below.</p>

<br>
<Acme:TabControl runat="server">
<Tab Name="C#">
public static void Main(){
	ExplorerLib.InternetExplorer explorer;
	IWebBrowserApp webBrowser;			
	
	explorer = new ExplorerLib.InternetExplorer();
	webBrowser = (IWebBrowserApp) explorer;
	
	//Title Change event
	<b>DWebBrowserEvents2_TitleChangeEventHandler dTitleChangeE
		= new DWebBrowserEvents2_TitleChangeEventHandler(OnTitleChange);
	explorer.TitleChange += dTitleChangeE;</b>	
				
	webBrowser.Visible = true;
	webBrowser.GoHome();	
	...		
}

<b>static void OnTitleChange(String text){
	Console.WriteLine("Title changes to {0}", text);
}</b>
</Tab>
<Tab Name="VB">
Public Shared Sub Main()
	Dim explorer As ExplorerLib.InternetExplorer
	Dim webBrowser As IWebBrowserApp
		
	explorer = New ExplorerLib.InternetExplorer
	webBrowser = explorer
	
	'Title Change event
	<b>AddHandler explorer.TitleChange, AddressOf OnTitleChange</b>		
	
	
	
	webBrowser.Visible = True
	webBrowser.GoHome
	...		
End Sub

<b>Public Shared Sub OnTitleChange(txt As String)
	Console.WriteLine("Title changes to {0}", txt)
End Sub</b>
</Tab>
<Tab Name="C++">
int main()
{
   ExplorerLib::InternetExplorer * explorer = new ExplorerLib::InternetExplorerClass;
   ExplorerLib::IWebBrowserApp * webBrowser = __try_cast<ExplorerLib::IWebBrowserApp *>(explorer);
            
   
   webBrowser->Visible = true;
   webBrowser->GoHome();    
   ...     
}






</Tab>
</Acme:TabControl>

<p>The following example uses the Internet Explorer object methods and events to open an Internet Explorer
window, catch all TitleChange events and show them in console window. To do this, an assembly containing 
definitions of the Internet Explorer types and events is created from SHDocVw.dll and saved into ExplorerLib.dll,
which then can be referenced from the code.</p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef 
        RunSample="/quickstart/howto/samples/Interop/TestClient_2/CS"        
        ViewSource="/quickstart/howto/samples/Interop/TestClient_2/TestClient.src"
        Icon = "/quickstart/images/console.gif"
        Caption="TestClient.exe"
        MapRunSamplePath="true"
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef 
        RunSample="/quickstart/howto/samples/Interop/TestClient_2/VB"
        ViewSource="/quickstart/howto/samples/Interop/TestClient_2/TestClient.src"
        Icon = "/quickstart/images/console.gif"
        Caption="TestClient.exe"
        MapRunSamplePath="true"
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef 
        RunSample="/quickstart/howto/samples/Interop/TestClient_2/CP"
        ViewSource="/quickstart/howto/samples/Interop/TestClient_2/TestClient.src"
        Icon = "/quickstart/images/console.gif"
        Caption="TestClient.exe"
        MapRunSamplePath="true"
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
