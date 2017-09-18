<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>
<!-- #include virtual="/quickstart/howto/include/remotingheader.inc" -->

<h4>How Do I...Create a Remote Server?</h4>

This sample demonstrates how to create the remoting version of a Hello World server.  When a client
calls the <b>HelloMethod</b> on the <b>HelloServer</b> class, the server object appends
the string passed from the client to <em>"Hi There"</em> and returns the resulting
string back to the client.  The following code example demonstrates both the server object and the server
application.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
using System;
using System.Runtime.Remoting;
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Channels.Tcp;

namespace RemotingSamples {
    public class Sample {
        public static int Main(string [] args) {
            TcpChannel chan = new TcpChannel(8085);
            ChannelServices.RegisterChannel(chan);
            RemotingConfiguration.RegisterWellKnownServiceType(
                Type.GetType("RemotingSamples.HelloServer,object"),
                "SayHello", WellKnownObjectMode.SingleCall);
            System.Console.WriteLine("Hit <enter> to exit...");
            System.Console.ReadLine();
            return 0;
        }
    }
}
</Tab>
<Tab Name="VB">
Imports System
Imports System.Runtime.Remoting
Imports System.Runtime.Remoting.Channels
Imports System.Runtime.Remoting.Channels.TCP

Namespace RemotingSamples
    Public Class Sample
        Shared Sub Main
            Dim chan As TCPChannel
            chan = New TCPChannel(8085)
            ChannelServices.RegisterChannel(chan)
            RemotingConfiguration.RegisterWellKnownServiceType( _
                Type.GetType("RemotingSamples.HelloServer, object"), _
                "SayHello", WellKnownObjectMode.SingleCall)
            System.Console.WriteLine("Hit <enter> to exit...")
            System.Console.ReadLine()
        End Sub
    End Class
End Namespace
</Tab>
<Tab Name="C++">
#using <mscorlib.dll>
using namespace System;

#using <System.Runtime.Remoting.dll>
using namespace System::Runtime::Remoting;
using namespace System::Runtime::Remoting::Channels;
using namespace System::Runtime::Remoting::Channels::Tcp;

void main()
{
	TcpChannel* chan = new TcpChannel(8085);
	ChannelServices::RegisterChannel(chan);
	RemotingConfiguration::RegisterWellKnownServiceType(Type::GetType(S"RemotingSamples.HelloServer,Object"), S"SayHello", WellKnownObjectMode::SingleCall);
	Console::WriteLine(S"Hit <enter> to exit...");
	Console::ReadLine();
}

</Tab>
</Acme:TabControl>

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
using System;
using System.Runtime.Remoting;
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Channels.Tcp;

namespace RemotingSamples {
    public class HelloServer : MarshalByRefObject {
        public HelloServer() {
            Console.WriteLine("HelloServer activated");
        }

        public String HelloMethod(String name) {
            Console.WriteLine("Hello.HelloMethod : {0}", name);
            return "Hi there " + name;
        }
    }
}
</Tab>
<Tab Name="VB">
Imports System
Imports System.Runtime.Remoting
Imports System.Runtime.Remoting.Channels
Imports System.Runtime.Remoting.Channels.TCP

Namespace RemotingSamples
    Public Class HelloServer : Inherits MarshalByRefObject
        Public Sub HelloServer()
            Console.WriteLine("HelloServer activated")
        End Sub

        Public Function HelloMethod(name As String) As String
            Console.WriteLine("Hello.HelloMethod : {0}", name)
            HelloMethod = "Hi there " + name
        End Function
    End Class
End Namespace
</Tab>
<Tab Name="C++">
#using <mscorlib.dll>
using namespace System;

namespace RemotingSamples 
{
    __gc public class HelloServer : public MarshalByRefObject
    {
	public:
        HelloServer()
        {
            Console::WriteLine("HelloServer activated");
        }
        
        String* HelloMethod(String* name) 
        {
            Console::WriteLine("Hello.HelloMethod : {0}", name);
            return String::Concat("Hi there ", name);
        }
    };
}
</Tab>
</Acme:TabControl>

<p>

The class <b>HelloServer</b> is derived from <b>MarshalByRefObject</b> to make it
remotable.  When the server is started, you need to create and register a TCP
channel that will listen for clients to connect on port 8085.  You also need to
register the remote object with the remoting framework by calling
<b>RegisterWellKnownType</b>.  The parameters for this call are as follows:<p>

<ol>
<li>The name of the assembly that contains the object being registered.
Since the object is contained in an executable, you provide the name of the
executable here.  Both server and server.exe will work since the normal
rules of locating an assembly apply.<p>

<li>The next parameter is the full type name of the object being
registered, in this case <b>"RemotingSamples.HelloServer"</b>.  You need to
specify both the name of the namespace and the classname here.  If
you don't use namespaces, you pass the classname.<p>

<li>Then, you provide the name of the endpoint where the object will be
published.  Clients need to know this name in order to connect to the
object.  Any string will work; for this example, use <b>"SayHello"</b>.
It is also possible to connect to remote objects using ASP.NET and if this is a
requirement, the name of the endpoint should be namespace/class.soap.
For this example, the endpoint will be RemotingSamples/HelloServer.soap.<p>

<li>The final parameter specifies the object mode, which can be <b>SingleCall</b>
or <b>Singleton</b>.  For this example, you specify <b>SingleCall</b>.  The
object mode specifies the lifetime of the object when it is activated
on the server. In the case of <b>SingleCall</b> objects, a new instance of
the class will be created for each call made from a client, even if the
same client calls the same method more than once.  On the other hand, <b>Singleton</b> objects
are created once only and all clients communicate
with the same object.
</ol>

Now you can compile this example and execute it.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
csc /debug+ /r:System.Runtime.Remoting.dll /r:Object.dll server.cs
</Tab>
<Tab Name="VB">
vbc /debug+ /r:System.Runtime.Remoting.dll /r:Object.dll Server.vb
</Tab>
<Tab Name="C++">
cl /clr /Zi Server.cpp
</Tab>
</Acme:TabControl>

<p>
The class <b>Sample</b> should be complied as an executable and the class <b>HelloServer</b> would have be a separate dll.
<p>

When you start the server, the object will be created as part of the
registration process so the framework can extract the relevant metadata
from the object.  After registration, this object is destroyed and
the framework starts listening for clients to connect on the registered
channels.</p>

<Acme:LangSwitch runat="server">
<CsTemplate>
<Acme:SourceRef
  RunSample="/QuickStart/HowTo/Samples/Remoting/Hello/CS"
  MapRunSamplePath="true"
  ViewSource="/QuickStart/HowTo/Samples/Remoting/Hello/server.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="C# Hello Server Sample"
  runat="server" />
</CsTemplate>
<VbTemplate>
<Acme:SourceRef
  RunSample="/QuickStart/HowTo/Samples/Remoting/Hello/VB"
  MapRunSamplePath="true"
  ViewSource="/QuickStart/HowTo/Samples/Remoting/Hello/server.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="VB Hello Server Sample"
  runat="server" />
</VbTemplate>
<CpTemplate>
<Acme:SourceRef
  RunSample="/QuickStart/HowTo/Samples/Remoting/Hello/CP"
  MapRunSamplePath="true"
  ViewSource="/QuickStart/HowTo/Samples/Remoting/Hello/server.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="C++ Hello Server Sample"
  runat="server" />
</CpTemplate>
</Acme:LangSwitch>
<p>


<!-- #include virtual="/quickstart/howto/include/footer.inc" -->

