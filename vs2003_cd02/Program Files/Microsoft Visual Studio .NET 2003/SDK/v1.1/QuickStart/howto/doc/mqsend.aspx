<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/messagingheader.inc" -->

<h4>How Do I...Send a message to a message queue?</h4>

Message queuing makes it easy for application developers to communicate with application programs quickly and reliably by sending and
receiving messages. Messaging provides you with guaranteed message delivery and a robust, fail-safe way to carry
out many of your business processes.<br>
<br>
The <b>MessageQueue</b> component allows you to easily incorporate message-based communication into your applications.
Using this component and its associated language features, you can send and receive messages, explore existing
queues, create and delete queues, and perform a variety of other operations using a simple programming model.<br>
<br>
The sample illustrates how to use the <b>MessageQueue</b> component to send a simple
message to a message queue. To run the sample, you have to have Message Queuing
installed on your system. The sample is a command-line application that takes
two command-line arguments. The first argument is a name of a message
queue. The path does not have to refer to an existing queue. If the queue does
not exist, it will be created for you. The second command-line argument is the
message to be written to the queue. For example you can run it as follows:

<p>
<div class="code"><pre>
MQSend.exe MyQueue &quot;Hello World!&quot;
</pre></div>

Now, open the Message Queuing console and examine the MyQueue message queue. It
should have a message in it.<br>
<br>
In its simplest form, sending a message to a message queue involves:</p>
<ol>
<li> Creating an instance of the <b>MessageQueue</b> component and setting its <b>Path</b>
property:
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

<li>Calling <b>Send</b> method to send the message:
<p>

<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
mq.Send(&quot;Hello World!&quot;);
</Tab>

<Tab Name="VB">
mq.Send(&quot;Hello World!&quot;)
</Tab>

<Tab Name="C++">
mq->Send(&quot;Hello World!&quot;);
</Tab>
</Acme:TabControl>
</td>
</tr>
</table>


</ol>

<p></font>

<h4>Example</h4>

<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/MessageQueue/MQSend/CS"
        ViewSource="/quickstart/howto/samples/Services/MessageQueue/MQSend/MQSend.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# MQSend.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/MessageQueue/MQSend/VB"
        ViewSource="/quickstart/howto/samples/Services/MessageQueue/MQSend/MQSend.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB MQSend.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/MessageQueue/MQSend/Cp"
        ViewSource="/quickstart/howto/samples/Services/MessageQueue/MQSend/MQSend.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ MQSend.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->

