<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>
<!-- #include virtual="/quickstart/howto/include/remotingheader.inc" -->

<h4>How Do I...Create a Client of a Remote Server?</h4>

If you haven't already read the section <a href="firstserver.aspx">How Do I Create a Remote Server?</a>, please read this first.
The client references the server assembly for metadata, so you have to compile the server
before the client.  The code for the client is listed below.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
using System;
using System.Runtime.Remoting;
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Channels.Tcp;

namespace RemotingSamples {
    public class Client {
        public static int Main(string [] args) {
            HelloServer obj = (HelloServer)Activator.GetObject(
                typeof(RemotingSamples.HelloServer),
                    "tcp://localhost:8085/SayHello");
            if (obj == null) System.Console.WriteLine("Could not locate server");
            else Console.WriteLine(obj.HelloMethod("Caveman"));
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
    Public Class Client
        Shared Sub Main
            Dim obj As HelloServer
            Obj = CType(Activator.GetObject( _
                Type.GetType("RemotingSamples.HelloServer, object"), _
                    "tcp://localhost:8085/SayHello"), _
                HelloServer)
            If obj Is Nothing Then
    	        System.Console.WriteLine("Could not locate server")
    	    Else
    	        Console.WriteLine(obj.HelloMethod("Caveman"))
    	    End If
        End Sub
    End Class
End Namespace
</Tab>
<Tab Name="C++">
#using mscorlib.dll
using namespace System;

#using System.Runtime.Remoting.dll
using namespace System::Runtime::Remoting;
using namespace System::Runtime::Remoting::Channels;
using namespace System::Runtime::Remoting::Channels::Tcp;

#using "object.dll"
using namespace RemotingSamples;

void main()
{
    HelloServer* obj = __try_cast<HelloServer *>(Activator::GetObject(__typeof(RemotingSamples::HelloServer), 
	S"tcp://localhost:8085/SayHello"));
    if (obj)
	Console::WriteLine(obj->HelloMethod(S"Caveman"));
    else 
    Console::WriteLine(S"Could not locate server");
}
</Tab>
</Acme:TabControl>
<p>

When the client starts up, it registers a TCP channel and proceeds to
activate the object by calling the <b>GetObject</b> method on the <b>Activator</b>
class. One point to be noted is that, for the client to activate the object the dll should be copied
from the Server machine to the client machine. The parameters for 
this call are as follows: <p>

<ol>
<li>The type of the name of the class you need to activate, <b>RemotingSamples.HelloServer</b>.<p>

<li>Specify the URI of the object you need to activate.  For this client the
URI is <b>tcp://localhost:8085/SayHello</b>.  Note that the URI
includes the protocol, machine name, port number, and the endpoint.  If the server
is deployed on a host named Sunshine, clients can connect to the server by
specifying <b>tcp://sunshine:8085/SayHello</b>.<p>
</ol>

When you run the client, it locates and connects to the server, retrieves a proxy for
the remote object, and calls the <b>HelloMethod</b> on the remote object, passing the
string "Caveman" as a parameter.  The server returns "Hi there Caveman".<p>

<b>NOTE:</b> All TCP channels use binary serialization when transporting local objects to
and from a remote object.<p>


<Acme:LangSwitch runat="server">
<CsTemplate>
<Acme:SourceRef
  RunSample="/QuickStart/HowTo/Samples/Remoting/Hello/CS"
  MapRunSamplePath="true"
  ViewSource="/QuickStart/HowTo/Samples/Remoting/Hello/client.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="C# Hello Client Sample"
  runat="server" />
</CsTemplate><VbTemplate>
<Acme:SourceRef
  RunSample="/QuickStart/HowTo/Samples/Remoting/Hello/VB"
  MapRunSamplePath="true"
  ViewSource="/QuickStart/HowTo/Samples/Remoting/Hello/client.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="VB Hello Client Sample"
  runat="server" />
</VbTemplate>
<CpTemplate>
<Acme:SourceRef
  RunSample="/QuickStart/HowTo/Samples/Remoting/Hello/CP"
  MapRunSamplePath="true"
  ViewSource="/QuickStart/HowTo/Samples/Remoting/Hello/client.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="C++ Hello Client Sample"
  runat="server" />
</CpTemplate>
</Acme:LangSwitch>
<p>


<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
