<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/messagingheader.inc" -->

<h4>How Do I...Use message formatters?</h4>

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
The sample illustrates how to use the <b>MessageQueue</b> component to use different
serialization mechanisms to send objects through a message queue. To run the
sample you have to have Message Queuing installed on your system.<br>
<br>
Selecting a serialization mechanism is as simple as changing the value of one
property. Here are some examples:

<ol>
<li> Send a message using an XML based serialization mechanism:

<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
mq.Formatter = new XmlMessageFormatter();
mq.Send(order);
</Tab>
<Tab Name="VB">
mq.Formatter = New XmlMessageFormatter()
mq.Send(order)
</Tab>
<Tab Name="C++">
mq->Formatter = new XmlMessageFormatter;
mq->Send(order);
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>
<p>

<li>Send a message using a binary serialization mechanism:

<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
mq.Formatter = new BinaryMessageFormatter();
mq.Send(order);
</Tab>
<Tab Name="VB">
mq.Formatter = New BinaryMessageFormatter()
mq.Send(order)
</Tab>
<Tab Name="C++">
mq->Formatter = new BinaryMessageFormatter;        
mq->Send(order);
</Tab>
</Acme:TabControl>

</td>
</tr>
</table>
<p>

<li>
Send a message using a serialization mechanism which is compatibile with the
MSMQ ActiveX Formatter:

<p>
<table cellpadding=0 cellspacing=0 width="95%">
<tr>
<td>

<Acme:TabControl runat="server">
<Tab Name="C#">
mq.Formatter = new ActiveXMessageFormatter();
mq.Send(order);
</Tab>
<Tab Name="VB">
mq.Formatter = New ActiveXMessageFormatter()
mq.Send(order)
</Tab>
<Tab Name="C++">
mq->Formatter = new ActiveXMessageFormatter;     
mq->Send(order);
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
        RunSample="/quickstart/howto/samples/Services/MessageQueue/Formatters/CS"
        ViewSource="/quickstart/howto/samples/Services/MessageQueue/Formatters/Formatters.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C# Formatters.exe"
        MapRunSamplePath=true
        runat="server" />
  </CsTemplate>
  <VbTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/MessageQueue/Formatters/VB"
        ViewSource="/quickstart/howto/samples/Services/MessageQueue/Formatters/Formatters.src"
        Icon = "/quickstart/images/console.gif"
        Caption="VB Formatters.exe"
        MapRunSamplePath=true
        runat="server" />
  </VbTemplate>
  <CpTemplate>
        <Acme:SourceRef
        RunSample="/quickstart/howto/samples/Services/MessageQueue/Formatters/CP"
        ViewSource="/quickstart/howto/samples/Services/MessageQueue/Formatters/Formatters.src"
        Icon = "/quickstart/images/console.gif"
        Caption="C++ Formatters.exe"
        MapRunSamplePath=true
        runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->