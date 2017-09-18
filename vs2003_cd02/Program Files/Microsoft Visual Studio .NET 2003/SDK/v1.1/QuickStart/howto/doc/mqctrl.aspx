<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/messagingheader.inc" -->

<h4>How Do I...Control a message queue?</h4>

<p>Message queuing makes it easy for application developers to
communicate with application programs quickly and reliably by
sending and receiving messages. Messaging provides you with
guaranteed message delivery and a robust, fail-safe way to
carry out many of your business processes.</p>

<p>The <b>MessageQueue</b> component allows you to easily incorporate message-based
communication into your applications. Using this component and its associated
language features, you can send and receive messages, explore existing queues,
create and delete queues, and perform a variety of other operations using a
simple programming model.</p>

<p>This sample illustrates how to change some properties of a message queue. It is a
small console application that can be run from a command prompt. Run the sample
without any command-line arguments and it will print its full usage
instructions.</p>

<p>For example, if you want change a queue's label, run:</p>

<div class="code"><pre>
&gt; MQCtrl.exe MyQueue l &quot;New Label&quot;
</pre></div>

<p>In its simplest form, changing a property of a message queue involves:</p>

<ol>
<li>Creating a new instance of a <b>MessageQueue</b> component and pointing it to an existing queue:

<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
MessageQueue mq = new MessageQueue(mqPath);
</Tab>
<Tab Name="VB">
Dim mq As MessageQueue = New MessageQueue(mqPath)
</Tab>
<Tab Name="C++">
MessageQueue* mq = new MessageQueue(mqPath);
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>
<p>

<li>Setting the property to a new value:

<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
mq.Label = &quot;New Label&quot;;
</Tab>
<Tab Name="VB">
mq.Label = &quot;New Label&quot;
</Tab>
<Tab Name="C++">
mq->Label = &quot;New Label&quot;;
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
        RunSample="/quickstart/howto/samples/Services/MessageQueue/MQCtrl/CS"
        ViewSource="/quickstart/howto/samples/Services/MessageQueue/MQCtrl/MQCtrl.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# MQCtrl.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/MessageQueue/MQCtrl/VB"
        ViewSource="/quickstart/howto/samples/Services/MessageQueue/MQCtrl/MQCtrl.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB MQCtrl.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CPTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/MessageQueue/MQCtrl/CP"
        ViewSource="/quickstart/howto/samples/Services/MessageQueue/MQCtrl/MQCtrl.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ MQCtrl.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->