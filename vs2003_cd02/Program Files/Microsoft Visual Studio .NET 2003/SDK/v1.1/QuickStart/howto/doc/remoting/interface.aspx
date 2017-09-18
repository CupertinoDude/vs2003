<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>
<!-- #include virtual="/quickstart/howto/include/remotingheader.inc" -->

<h4>How Do I...Compile a Client Against an Interface?</h4>

This example illustrates how to build a client that does not reference a
server object at compile time.  The following code example demonstrates the client code.<p>

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
      TcpChannel chan = new TcpChannel();
      ChannelServices.RegisterChannel(chan);
      IHello obj = (IHello)Activator.GetObject(typeof(RemotingSamples.IHello), "tcp://localhost:8085/SayHello");
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
            Dim chan As TCPChannel
            chan = New TCPChannel()
            ChannelServices.RegisterChannel(chan)
            Dim obj As IHello
            obj = CType(Activator.GetObject(Type.GetType("RemotingSamples.IHello,share"), "tcp://localhost:8085/SayHello"),IHello)
            If obj Is Nothing
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

#using <System.Runtime.Remoting.dll>
using namespace System::Runtime::Remoting;
using namespace System::Runtime::Remoting::Channels;
using namespace System::Runtime::Remoting::Channels::Tcp;

#using "share.dll"
using namespace RemotingSamples;

void main()
{
	TcpChannel* chan = new TcpChannel();
	ChannelServices::RegisterChannel(chan);
	HelloServer* obj = __try_cast<HelloServer *>(Activator::GetObject(__typeof(RemotingSamples::IHello), S"tcp://localhost:8085/SayHello"));
	if (obj)
		Console::WriteLine(obj->HelloMethod(S"Caveman"));
	else 
		Console::WriteLine(S"Could not locate server");
}

</Tab>
</Acme:TabControl>
<p>


The client calls <b>GetObject</b> on an endpoint without knowing what the exact
object type is. All it knows is that the object implements <b>IHello.</b><p>

<Acme:LangSwitch runat="server">
<CsTemplate>
<Acme:SourceRef
  RunSample="/QuickStart/HowTo/Samples/Remoting/interface/CS"
  MapRunSamplePath="true"
  ViewSource="/QuickStart/HowTo/Samples/Remoting/interface/server.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="C# Interface"
  runat="server" />
</CsTemplate><VbTemplate>
<Acme:SourceRef
  RunSample="/QuickStart/HowTo/Samples/Remoting/interface/VB"
  MapRunSamplePath="true"
  ViewSource="/QuickStart/HowTo/Samples/Remoting/interface/server.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="VB Interface"
  runat="server" />
</VbTemplate>
<CpTemplate>
<Acme:SourceRef
  RunSample="/QuickStart/HowTo/Samples/Remoting/interface/CP"
  MapRunSamplePath="true"
  ViewSource="/QuickStart/HowTo/Samples/Remoting/interface/server.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="C++ Interface"
  runat="server" />
</CpTemplate>
</Acme:LangSwitch>
<p>


<!-- #include virtual="/quickstart/howto/include/footer.inc" -->


