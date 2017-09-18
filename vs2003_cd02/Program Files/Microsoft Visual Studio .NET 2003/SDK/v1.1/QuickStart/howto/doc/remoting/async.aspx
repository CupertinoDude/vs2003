<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>
<!-- #include virtual="/quickstart/howto/include/remotingheader.inc" -->

<h4>How Do I...Make an Asynchronous Call to a Remote Object?</h4>

All the examples up to this point made synchronous calls to the remote
object.  This strategy might not always be desirable since the remote
object might have to perform a number of time-consuming tasks and it is
not advisable to block the client while a call is in progress.  This example demonstrates how to make asynchronous calls.<p>

Reuse the server from the hello sample and modify the client to make
asynchronous calls.  The following code example demonstrates the new client code.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
using System;
using System.Threading;
using System.Runtime.Remoting;
using System.Runtime.Remoting.Messaging;
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Channels.Tcp;

namespace RemotingSamples {
    public class Client {

        public static ManualResetEvent e;
        public delegate String MyDelegate(String name);

        public static int Main(string [] args) {
            e = new ManualResetEvent(false);

            TcpChannel chan = new TcpChannel();
            ChannelServices.RegisterChannel(chan);
            HelloServer obj = (HelloServer)Activator.GetObject(
                typeof(RemotingSamples.HelloServer),
                    "tcp://localhost:8085/SayHello");
            if (obj == null) System.Console.WriteLine("Could not locate server");
            else {
                AsyncCallback cb = new AsyncCallback(Client.MyCallBack);
                MyDelegate d = new MyDelegate(obj.HelloMethod);
                IAsyncResult ar = d.BeginInvoke("Caveman", cb, null);
            }

            e.WaitOne();
            return 0;
        }

        public static void MyCallBack(IAsyncResult ar) {
            MyDelegate d = (MyDelegate)((AsyncResult)ar).AsyncDelegate;
            Console.WriteLine(d.EndInvoke(ar));
            e.Set();
        }
    }
}
</Tab>
<Tab Name="VB">
Imports System
Imports System.Threading
Imports System.Runtime.Remoting
Imports System.Runtime.Remoting.Messaging
Imports System.Runtime.Remoting.Channels
Imports System.Runtime.Remoting.Channels.TCP

Namespace RemotingSamples
    Public Class Client
        Public Shared e As ManualResetEvent
        Public Delegate Function MyDelegate(name As String) As String

        Shared Sub Main
            e = New ManualResetEvent(false)
            Dim chan As TCPChannel
            chan = New TCPChannel()
            ChannelServices.RegisterChannel(chan)
            dim obj As HelloServer
            obj = CType(Activator.GetObject( _
                Type.GetType("RemotingSamples.HelloServer,Object"), _
                    "tcp://localhost:8085/SayHello"), _
                HelloServer)
            If obj Is Nothing Then
                System.Console.WriteLine("Could not locate server")
            Else
                Dim cb As AsyncCallback
	            cb = New AsyncCallback(AddressOf Client.MyCallBack)
                Dim d As MyDelegate
	            d = New MyDelegate(AddressOf obj.HelloMethod)
                Dim ar As IAsyncResult
                ar = d.BeginInvoke("Caveman", cb, 0)
            End If

            e.WaitOne()
        End Sub

        Shared Sub MyCallBack(ar As IAsyncResult)
            Dim d As MyDelegate = CType(ar, AsyncResult).AsyncDelegate
            Console.WriteLine(d.EndInvoke(ar))
            e.Set()
        End Sub
    End Class
End Namespace
</Tab>
<Tab Name="C++">

#using mscorlib.dll
using namespace System;
using namespace System::Threading;

#using System.Runtime.Remoting.dll
using namespace System::Runtime::Remoting;
using namespace System::Runtime::Remoting::Messaging;
using namespace System::Runtime::Remoting::Channels;
using namespace System::Runtime::Remoting::Channels::Tcp;

#using "object.dll"
using namespace RemotingSamples;

__gc public class Client 
{
public:
    static ManualResetEvent* e;
    __delegate String* MyDelegate(String* name);

public:
	Client()
	{
		e = new ManualResetEvent(false);

		TcpChannel* chan = new TcpChannel();
		ChannelServices::RegisterChannel(chan);
		HelloServer* obj = __try_cast<HelloServer *>(Activator::GetObject(__typeof(RemotingSamples::HelloServer), S"tcp://localhost:8085/SayHello"));
		if (obj)
		{
			AsyncCallback* cb = new AsyncCallback(this, &(Client::MyCallBack));
			MyDelegate* d = new MyDelegate(obj, &(HelloServer::HelloMethod));
			IAsyncResult* ar = d->BeginInvoke(S"Caveman", cb, 0);
		}
		else 
			Console::WriteLine(S"Could not locate server");

		e->WaitOne();
	}

	static void MyCallBack(IAsyncResult* ar)
	{
		MyDelegate* d = __try_cast<MyDelegate *>(__try_cast<AsyncResult *>(ar)->AsyncDelegate);
		Console::WriteLine(d->EndInvoke(ar));
		e->Set();
	}
};

void main()
{
	Client* cl = new Client();
}

</Tab>
</Acme:TabControl>
<p>


An <b>Event</b> object is used to prevent the client application from returning
from <b>Main</b> while the asynchronous call is pending.  You need to reset the <b>Event</b> object
to false on the first line in <b>Main</b> and wait for state of the object to change
before leaving <b>Main.</b>

The async programming pattern in the .NET Framework requires a <b>delegate</b> to
represent the callback function.  You need to declare the delegate that is required before it
can be used.  Delegates are somewhat similar to function pointers on classes
in C++.  You have to declare a delegate with the same calling parameters and result type
as the method the delegate represents.  Since you need to define a delegate for the
<b>HelloMethod</b> you want to call, declare the delegate as follows:

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
public delegate String MyDelegate(String name);
</Tab>
<Tab Name="VB">
Public Delegate Function MyDelegate(name As String) As String
</Tab>
<Tab Name="C++">
__delegate String* MyDelegate(String* name);
</Tab>
</Acme:TabControl>
<p>

The call accepts a string as argument and returns a string as the result.
The compiler automatically generates the class <b>MyDelegate</b> when it
encounters the declaration and adds a <b>BeginInvoke</b> and <b>EndInvoke</b> method to
the delegate that maps to native calls somewhere in the common language runtime.

The next is to create the
callback function that receives the result from the call.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
public static void MyCallBack(IAsyncResult ar) {
    MyDelegate d = (MyDelegate)((AsyncResult)ar).AsyncDelegate;
    Console.WriteLine(d.EndInvoke(ar));
    e.Set();
}
</Tab>
<Tab Name="VB">
Shared Sub MyCallBack(ar As IAsyncResult)
    Dim d As MyDelegate = CType(ar, AsyncResult).AsyncDelegate
    Console.WriteLine(d.EndInvoke("Caveman", ar))
    e.Set()
End Sub
</Tab>
<Tab Name="C++">
static void MyCallBack(IAsyncResult* ar)
{
    MyDelegate* d = __try_cast<MyDelegate *>(__try_cast<AsyncResult *>(ar)->AsyncDelegate);
    Console::WriteLine(d->EndInvoke(ar));
    e->Set();
}
</Tab>
</Acme:TabControl>
<p>

Notice how the callback declares an object of type <b>IAsyncResult</b> as the
parameter of the callback function.  Once the call completes, the
framework ensures that the result of the call is placed inside
the result object and the callback is then invoked back
to the client, forwarding the result object to it.  To retrieve
the result of the call, extract the delegate
from the <b>AsyncResult</b> and call <b>EndInvoke.</b>


The following code example demonstrates calling the <b>HelloMethod</b> on the remote object. 

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
AsyncCallback cb = new AsyncCallback(Client.MyCallBack);
MyDelegate d = new MyDelegate(obj.HelloMethod);
IAsyncResult ar = d.BeginInvoke("Caveman", cb, null);



</Tab>
<Tab Name="VB">
Dim cb As AsyncCallback
cb = New AsyncCallback(AddressOf Client.MyCallBack)
Dim d As MyDelegate
d = New MyDelegate(AddressOf obj.HelloMethod)
Dim ar As IAsyncResult
ar = d.BeginInvoke("Caveman", cb, 0)
</Tab>
<Tab Name="C++">
AsyncCallback* cb = new AsyncCallback(this, &(Client::MyCallBack));
MyDelegate* d = new MyDelegate(obj, &(HelloServer::HelloMethod));
IAsyncResult* ar = d->BeginInvoke(S"Caveman", cb, 0);



</Tab>
</Acme:TabControl>
<p>


Create a delegate for the <b>callback</b> method and one for the <b>remote</b>
method.  Next, call the method by calling <b>BeginInvoke</b> on the delegate,
and wait for the result to return from the server.<p>

<Acme:LangSwitch runat="server">
<CsTemplate>
<Acme:SourceRef
  RunSample="/QuickStart/HowTo/Samples/Remoting/async/CS"
  MapRunSamplePath="true"
  ViewSource="/QuickStart/HowTo/Samples/Remoting/async/server.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="C# Acync calls"
  runat="server" />
</CsTemplate>
<VbTemplate>
<Acme:SourceRef
  RunSample="/QuickStart/HowTo/Samples/Remoting/async/VB"
  MapRunSamplePath="true"
  ViewSource="/QuickStart/HowTo/Samples/Remoting/async/server.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="VB Acync calls"
  runat="server" />
</VbTemplate>
<CpTemplate>
<Acme:SourceRef
  RunSample="/QuickStart/HowTo/Samples/Remoting/async/Cp"
  MapRunSamplePath="true"
  ViewSource="/QuickStart/HowTo/Samples/Remoting/async/server.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="C++ Acync calls"
  runat="server" />
</CpTemplate>
</Acme:LangSwitch>
<p>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->


