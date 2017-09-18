<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/messagingheader.inc" -->

<h4>How Do I...Receive asynchronously?</h4>

Message queuing makes it easy for application developers to communicate with application
programs quickly and reliably by sending and receiving messages. Messaging
provides you with guaranteed message delivery and a robust, fail-safe way to
carry out many of your business processes.</p>

<p>The <b>MessageQueue</b> component allows you to easily incorporate message-based
communication into your applications. Using this component and its associated
language features, you can send and receive messages, explore existing queues,
create and delete queues, and perform a variety of other operations using a
simple programming model.</p>

<p>The sample illustrates how to use the <b>MessageQueue</b> component to watch a message
queue for arrival of new messages. To run the sample you have to have Message
Queuing installed on your system. The sample is a command-line application that
takes one command-line argument. The argument is the name of a public message
queue on your local machine. For example you can run it as follows:</p>

<div class="code"><pre>
&gt; MQAsync.exe MyQueue
</pre></div>

<p>Now, use the MQSend sample to send a message
to the MyQueue queue. The sample application
will be notified when the message arrives at the queue and will output the
message to the console.</p>

<p>In its simplest form, asynchronously receiving a message from a message queue
involves:</p>

<ol>

<li>Creating an instance of the <b>MessageQueue</b> component, and setting its <b>Path</b> property and the formatter:

<p>

<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
MessageQueue mq = new MessageQueue(&quot;.\\MyQueue&quot;);
((XmlMessageFormatter)mq.Formatter).TargetTypeNames = new string[]{&quot;System.String&quot;};

</Tab>
<Tab Name="VB">
Dim mq As MessageQueue = New MessageQueue(&quot;.\MyQueue&quot;)
Dim formatter As XmlMessageFormatter = CType(mq.Formatter,XmlMessageFormatter)
formatter.TargetTypeNames = new String(){"System.String"}
</Tab>
<Tab Name="C++">
MessageQueue* mq = new MessageQueue(mqPath);
__try_cast<XmlMessageFormatter*>( mq->Formatter )->TargetTypeNames = strTypeNames;
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>

<p>

<li>Setting up an event handler:

<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
mq.ReceiveCompleted += new ReceiveCompletedEventHandler(OnReceiveCompleted);
</Tab>
<Tab Name="VB">
AddHandler mq.ReceiveCompleted, New ReceiveCompletedEventHandler(AddressOf OnReceiveCompleted)
</Tab>
<Tab Name="C++">
mq->ReceiveCompleted += new ReceiveCompletedEventHandler( mq, MyEventHandler::OnReceiveCompleted );
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>
<p>

<li>Implementing an event handler:

<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
public static void OnReceiveCompleted(Object source, ReceiveCompletedEventArgs asyncResult){
    MessageQueue mq = (MessageQueue)source;
    Message m = mq.EndReceive(asyncResult.AsyncResult);
    Console.WriteLine(&quot;Message: &quot; + (string)m.Body);
    mq.BeginReceive();
}
</Tab>
<Tab Name="VB">
Public Shared Sub OnReceiveCompleted(source As Object, asyncResult As ReceiveCompletedEventArgs)
    Dim mq As MessageQueue = CType(source,MessageQueue)
    Dim m As Message = mq.EndReceive(asyncResult.AsyncResult)
    Console.WriteLine("Message: " + CStr(m.Body))
    mq.BeginReceive()
End sub
</Tab>
<Tab Name="C++">
static void OnReceiveCompleted( Object* source, ReceiveCompletedEventArgs* asyncResult ){
    String* strTypeNames[] = { S"System.String, mscorlib" };
    MessageQueue* mq = __try_cast<MessageQueue*>( source );
    Message* m = mq->EndReceive( asyncResult->AsyncResult );
    m->Formatter = new XmlMessageFormatter( strTypeNames );
    Console::WriteLine( String::Concat( S"Message: ", __try_cast<String*>( m->Body ) ) );
    mq->BeginReceive();
}
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>
<p>

<li>Calling <b>BeginReceive</b> to start an asynchronous receive operation:

<p>

<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
mq.BeginReceive();
</Tab>
<Tab Name="VB">
mq.BeginReceive
</Tab>
<Tab Name="C++">
mq->BeginReceive();
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>
<p>

</ol>

<p>Please note that <b>BeginReceive</b> will receive only one message. If you want to keep
receiving messages, you have to call <b>BeginReceive</b> again (see the event handler
implementation in step 3). </p>

<h4>Example</h4>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/MessageQueue/MQAsync/CS"
        ViewSource="/quickstart/howto/samples/Services/MessageQueue/MQAsync/MQAsync.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# MQAsync.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/MessageQueue/MQAsync/VB"
        ViewSource="/quickstart/howto/samples/Services/MessageQueue/MQAsync/MQAsync.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB MQAsync.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/MessageQueue/MQAsync/CP"
        ViewSource="/quickstart/howto/samples/Services/MessageQueue/MQAsync/MQAsync.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ MQAsync.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->