<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/messagingheader.inc" -->

<h4>How Do I...Pass a complex type through a message queue?</h4>

Message queuing makes it easy for application developers to communicate with application
programs quickly and reliably by sending and receiving messages. Messaging
provides you with guaranteed message delivery and a robust, fail-safe way to
carry out many of your business processes.<br>
<br>
The <b>MessageQueue</b> component allows you to easily incorporate message-based
communication into your applications. Using this component and its associated
language features, you can send and receive messages, explore existing queues,
create and delete queues, and perform a variety of other operations using a
simple programming model.<br>
<br>
The sample illustrates how to use the <b>MessageQueue component</b> to send a complex
type through a message queue. To run the sample you have to have Message
Queuing installed on your system.<br>
<br>
Sending a complex type through a queue is very simple. It is actually as simple
as sending a string (see MQSend sample). The <b>MessageQueue</b> component handles
everything automatically. All you have to do is:

<ol>
<li>Create an instance of the <b>MessageQueue</b> component and set its <b>Path</b> property:
<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
MessageQueue mq = new MessageQueue(&quot;.\\MyQueue&quot;);
</Tab>
<Tab Name="VB">
Dim mq As MessageQueue = New MessageQueue(&quot;.\MyQueue&quot;)
</Tab>
<Tab Name="C++">
MessageQueue* mq = new MessageQueue(mqPath);
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>
<p>

<li>Calling <b>Send</b> method to send a complex object:

<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
MyComplexType myType = new MyComplexType();
mq.Send(myType);
</Tab>
<Tab Name="VB">
Dim myType As MyComplexType = New MyComplexType()
mq.Send(myType)
</Tab>
<Tab Name="C++">
Customer* customer = new MyComplexType;
mq->Send(MyComplexType);
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
        RunSample="/quickstart/howto/samples/Services/MessageQueue/SendObject/CS"
        ViewSource="/quickstart/howto/samples/Services/MessageQueue/SendObject/SendObject.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# SendObject.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/MessageQueue/SendObject/VB"
        ViewSource="/quickstart/howto/samples/Services/MessageQueue/SendObject/SendObject.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB SendObject.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/MessageQueue/SendObject/CP"
        ViewSource="/quickstart/howto/samples/Services/MessageQueue/SendObject/SendObject.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ SendObject.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>
<p>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->