<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/messagingheader.inc" -->

<h4>How Do I...Receive a message from a message queue?</h4>

Message queuing makes it easy for application developers to communicate with application
programs quickly and reliably by sending and receiving messages. Messaging provides you
with guaranteed message delivery and a robust, fail-safe way to carry out many of your
business processes.
<p>
The <b>MessageQueue</b> component allows you to easily incorporate message-based communication into your applications.
Using this component and its associated language features, you can send and receive messages, explore existing
queues, create and delete queues, and perform a variety of other operations using a simple programming model.
<p>
The sample illustrates how to use the <b>MessageQueue</b> component to receive a message from a message queue. To run
the sample you have to have Message Queuing installed on your system. The sample is a command-line application
that takes one command-line argument. The argument is the name of a public message queue on your local machine.
For example, you can run it as follows (first send a message to the queue using the MQSend sample):

<div class="code"><pre>
&gt; MQReceive.exe MyQueue
</pre></div>

The sample application will receive and output to the console the first message from the queue.
In its simplest form, receiving a message from a message queue involves:

<ol>
<li> Creating an instance of the <b>MessageQueue</b> component, setting its <b>Path</b>, and initializing the Formatter's
<b>TargetTypeNames</b> property:
<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
MessageQueue mq = new MessageQueue(&quot;.\\MyQueue&quot;);
string[] types = { &quot;System.String&quot; };
((XmlMessageFormatter)mq.Formatter).TargetTypeNames = types;
</Tab>
<Tab Name="VB">
Dim mq As MessageQueue = new MessageQueue(mqPath)
Dim formatter As XmlMessageFormatter = CType(mq.Formatter,XmlMessageFormatter)
formatter.TargetTypeNames = new String(){"System.String"}
</Tab>
<Tab Name="C++">
MessageQueue* mq = new MessageQueue(mqPath);
String* strTypeNames[] = { S"System.String,mscorlib" };
__try_cast<XmlMessageFormatter*>( mq->Formatter )->TargetTypeNames = strTypeNames;
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>
<p>

<li> Calling <b>Receive</b> to receive the message:
<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
Message m = mq.Receive(new TimeSpan(0,0,3));
Console.WriteLine((string)m.Body);
</Tab>
<Tab Name="VB">
Dim m As Message = mq.Receive(New TimeSpan(0,0,3))
Console.WriteLine(CStr(m.Body))
</Tab>
<Tab Name="C++">
Message* m = mq->Receive( TimeSpan(0,0,3) );
Console::WriteLine( String::Concat( S"Message: ", __try_cast<String*>(m->Body) ) );
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>

</ol>

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/MessageQueue/MQReceive/CS"
        ViewSource="/quickstart/howto/samples/Services/MessageQueue/MQReceive/MQReceive.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# MQReceive.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/MessageQueue/MQReceive/VB"
        ViewSource="/quickstart/howto/samples/Services/MessageQueue/MQReceive/MQReceive.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB MQReceive.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/MessageQueue/MQReceive/CP"
        ViewSource="/quickstart/howto/samples/Services/MessageQueue/MQReceive/MQReceive.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ MQReceive.exe"
        MapRunSamplePath=true
        runat="server" />
  </CPTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->