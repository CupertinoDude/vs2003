<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>
<!-- #include virtual="/quickstart/howto/include/remotingheader.inc" -->

<h4>How Do I...Pass An Object to a Server By Value?</h4>

The <a href="byreference.aspx">Pass an Object to a Server by Reference</a> section illustrated that local objects are always passed by
value when you call a remote function.  To demonstrate this concept, you need change the previous example.<p>

The first step is to create the object you need to pass to the server.

<p>
<Acme:TabControl runat="server">
<Tab Name="C#">
using System;
namespace RemotingSamples {

    [serializable]
    public class ForwardMe {

        private int mValue = 1;

        public void CallMe() {
            mValue++;
        }

        public int getValue() {
            return mValue;
        }
    }
}
</Tab>
<Tab Name="VB">
Imports System
Namespace RemotingSamples

    <Serializable> Public Class ForwardMe
        Dim mValue As Integer = 1

        Public Sub CallMe()
            mValue += 1
        End Sub

        Public Function getValue() As Integer
            Return mValue
        End Function
    End Class
End Namespace

</Tab>
<Tab Name="C++">
#using mscorlib.dll
using namespace System;
using namespace System::Runtime::Remoting;

namespace RemotingSamples
{
    [Serializable]
    __gc public class ForwardMe
    {
    private:
	int mValue;

    public:
	ForwardMe()
	{
	    mValue = 1;
	}

	void CallMe()
	{
	   mValue++;
	}

	int getValue()
	{
	    return mValue;
	}
    };
}
</Tab>
</Acme:TabControl>
<p>


This class is flagged with the [serializable] custom attribute, which allows it to be
streamed to and from the server.  When you run the sample, the client reports the
value of the counter to be one. Since the server calls the <b>CallMe</b> method on
the object five times, the value of the counter when the object is returned
is six.  Note that the client has two instances of the <b>ForwardMe</b> class
after calling the <b>remote</b> method: the instance that was passed and a copy of
the instance that was returned.<p>

<Acme:LangSwitch runat="server">
<CsTemplate>
<Acme:SourceRef
  RunSample="/QuickStart/HowTo/Samples/Remoting/byvalue/CS"
  MapRunSamplePath="true"
  ViewSource="/QuickStart/HowTo/Samples/Remoting/byvalue/server.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="C# Passing by Value"
  runat="server" />
</CsTemplate>
<VbTemplate>
<Acme:SourceRef
  RunSample="/QuickStart/HowTo/Samples/Remoting/byvalue/VB"
  MapRunSamplePath="true"
  ViewSource="/QuickStart/HowTo/Samples/Remoting/byvalue/server.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="VB Passing by Value"
  runat="server" />
</VbTemplate>
<CpTemplate>
<Acme:SourceRef
  RunSample="/QuickStart/HowTo/Samples/Remoting/byvalue/CP"
  MapRunSamplePath="true"
  ViewSource="/QuickStart/HowTo/Samples/Remoting/byvalue/server.src"
  Icon="/quickstart/images/genicon.gif"
  Caption="C++ Passing by Value"
  runat="server" />
</CpTemplate>
</Acme:LangSwitch>
<p>


<!-- #include virtual="/quickstart/howto/include/footer.inc" -->

