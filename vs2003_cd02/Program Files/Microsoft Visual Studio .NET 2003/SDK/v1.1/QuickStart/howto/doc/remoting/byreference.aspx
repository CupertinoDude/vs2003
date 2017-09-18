<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>
<!-- #include virtual="/quickstart/howto/include/remotingheader.inc" -->

<h4>How Do I...Pass An Object to a Server By Reference?</h4>

This example demonstrates how to create an object that derives from <b>MarshalByRefObject</b>
on the client that is then passed as a parameter to the server.  The
server calls a method on the remote object it receives.  The first step is to create
the object you need to pass.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
using System;
namespace RemotingSamples {

    public class ForwardMe : MarshalByRefObject {

        public void CallMe(String text) {
            Console.WriteLine(text);
        }
    }
}
</Tab>
<Tab Name="VB">
Imports System
Namespace RemotingSamples

  Public Class ForwardMe : Inherits MarshalByRefObject

        Sub CallMe(String text)
            Console.WriteLine(text)
        End Sub
    End Class
End Namespace
</Tab>
<Tab Name="C++">
#using mscorlib.dll
using namespace System;

namespace RemotingSamples 
{
    __gc public class ForwardMe : public MarshalByRefObject
    {
    public:
	void CallMe(String* text)
	{
	     Console::WriteLine(text);
	}
    };
}
</Tab>
</Acme:TabControl>
<p>

Since the compiler requires the metadata for this object for both the
client and server applications, you will compile the class and create a separate
assembly for it.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
csc /debug+ /target:library /out:share.dll share.cs
</Tab>
<Tab Name="VB">
vbc /debug+ /target:library /out:share.dll share.vb
</Tab>
<Tab Name="C++">
cl.exe /clr /Zi /LD share.cpp
</Tab>
</Acme:TabControl>
<p>

On the server side, because we're passing a custom type (<b>ForwardMe</b>),
a custom formatter for the <b>TcpChannel</b> sink chain with <b>TypeFilterLevel</b> set
to <b>Full</b> must be used.  If we were passing a primative type instead, <b>TypeFilterLevel</b>
could be set to <b>Low</b>.  See the <i>Automatic Deserialization in .NET Remoting</i>
section of the .NET Framework documentation for more information about deserialization in .NET Remoting.<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// creating a custom formatter for your TcpChannel sink chain.
BinaryServerFormatterSinkProvider provider = new BinaryServerFormatterSinkProvider();
provider.TypeFilterLevel = TypeFilterLevel.Full;
</Tab>
<Tab Name="VB">
' creating a custom formatter for your TcpChannel sink chain.
Dim provider As New BinaryServerFormatterSinkProvider()
provider.TypeFilterLevel = TypeFilterLevel.Full
</Tab>
<Tab Name="C++">
// creating a custom formatter for your TcpChannel sink chain.
BinaryServerFormatterSinkProvider* provider = new BinaryServerFormatterSinkProvider();
provider->TypeFilterLevel = TypeFilterLevel::Full;
</Tab>
</Acme:TabControl>
<p>

On the client side, you can create an instance of <b>ForwardMe</b> and pass it
as a parameter when you call <b>HelloMethod.</b>  The only catch in this example
is the way you create the TCP channel - you have to give it a
port number.  This port number should be different from the one you are already using
to communicate with the server.  When the client channel is registered,
the framework will start listening on this port for clients to connect,
and establish a connection with the remote object.  This allows
bi-directional communication between the client and the server where the
client forwards parameters to the server on one port and the server
forwards parameters to the client using the other port.<p>

When you run the example, the client should print the
text <b>"Regards from the server"</b> to the console window.<p>

<Acme:LangSwitch runat="server">
<CsTemplate>
<Acme:SourceRef
  RunSample="/QuickStart/HowTo/Samples/Remoting/byreference/CS"
  MapRunSamplePath="true"
  ViewSource="/QuickStart/HowTo/Samples/Remoting/byreference/server.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="C# Passing by Reference"
  runat="server" />
</CsTemplate>
<VbTemplate>
<Acme:SourceRef
  RunSample="/QuickStart/HowTo/Samples/Remoting/byreference/VB"
  MapRunSamplePath="true"
  ViewSource="/QuickStart/HowTo/Samples/Remoting/byreference/server.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="VB Passing by Reference"
  runat="server" />
</VbTemplate>
<CpTemplate>
<Acme:SourceRef
  RunSample="/QuickStart/HowTo/Samples/Remoting/byreference/CP"
  MapRunSamplePath="true"
  ViewSource="/QuickStart/HowTo/Samples/Remoting/byreference/server.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="C++ Passing by Reference"
  runat="server" />
</CpTemplate>
</Acme:LangSwitch>
<p>



<!-- #include virtual="/quickstart/howto/include/footer.inc" -->


