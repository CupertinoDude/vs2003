<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>
<!-- #include virtual="/quickstart/howto/include/remotingheader.inc" -->

<h4>How Remoting Works</h4>

The .NET Remoting framework provides developers with a modern distributed
object model that allows remote method invocation between different common language runtimes
across the network or between different <b>AppDomains</b> in the same common language runtime.  Any
interaction with a remote object occurs through a proxy, and a client cannot
access a remote object directly since the object is only meaningful inside
its own <b>AppDomain.</b>  The following rules apply:<p>

<ul>
<li>All remote objects have to derive from <b>MarshalByRefObject</b>.<p>

<li>Any interaction with a remote object occurs by reference through a
proxy.  Clients have to obtain this proxy activating a remote object.
This can be done by calling <b>CreateInstance</b>, <b>GetObject</b>, or <b>new</b>.<p>

<li>Local objects can be used as parameters when making remote calls.
Since a reference to a local object is meaningless to a remote object, all
local objects are passed by value when they are used as parameters in a
remote call or returned as a result from a remote call.<p>

<li>All objects passed by value must be serializable.  This can be
achieved by implementing the <b>ISerializable</b> interface or marking the object
with the [serializable] custom attribute.<p>

</ul>

Remote objects have to be activated before they can be used by a client.
The framework supports two activation models: server activation and client
activation.  Server activation means the object will automatically be
created on the server when a client attempts to access the object.
Client activation means the object will be created
as the result of a deliberate activation request from a client.  The reason there are two activation models is that the lifetime of an object often becomes an
issue in distributed object models.  In some cases, a remote
object is required to maintain state across calls. In other cases, a
stateless object is required where each caller is given a fresh instance of the
object on each call.  Sometimes the client requires more control over the
lifetime of the object than that provided by server activation.  By
allowing both server and client activation, developers have the
freedom to pick the best activation model for the task at hand.<p>

How can a
server object listen for clients when it has not been created? A
server object is created and deployed somewhere on the network where it
listens for clients to connect.  When a client comes along, details about
the call and the parameters are transported to the server object, then the method
executes, and an optional result is transported back to the client.<p>

The steps for deploying a server object follow:<p>

<ol>

<li>All remote objects have to be registered with the common language runtime before they can be
accessed by a client.  You need to provide the common language runtime with specific details
about the object, such as the name of the assembly that should be loaded to
activate the object, the namespace and type name of the object, and
the name of the endpoint where the object can be accessed.  The framework
ensures that an object is not registered more than once in the same
<b>AppDomain.</b><p>

<li>You also need to register all the channels clients will use to
communicate with the object.  Each channel uses a specific protocol such as
TCP, HTTP, or SMTP.  More than one channel can be registered where
applicable.<p>

<li>Details about the object are stored in a table managed by the framework.
An object reference is then created for object that is also stored.  The
object reference will be used to represent the registered object in a
different <b>AppDomain</b> and will be serialized and transported to the client
when required.<p>

<li>The registered channels then start listening for clients to connect.<p>

</ol>

Once a remote object has been deployed, clients can connect and invoke methods on the server object.<p>

<ol>

<li>The client registers a channel that will be used to communicate with the
remote object.  The only requirement here is that the server should be
listening on a similar channel.<p>

<li>The client then activates the object by calling <b>new</b>,
<b>GetObject</b>, or <b>CreateInstance.</b><p>

<li>Sufficient information about the type and location of the remote object is
provided with the activation request for the framework to create proxy to
represent the remote object.  It is important to note that this process is
local, and no calls have been made to the remote object at all.  The proxy is
also stored locally in a table, any additional activation request on the
client side receives the same proxy.<p>

<li>In the case of server activated object,
the client calls a method on the remote object using the proxy it
received on activation.  The client channel then attempts to establish a
connection with the remote channel if not already connected.<p>

<li>Once a connection is established, a message sink is connected to either
side of the connection that handles the details of the communication using
the specified protocol.<p>

<li>Details of the method call are loaded in a <b>Message</b> object that
is serialized and transported to the server.  The type of serialization
depends on the channel.  For example, when the HTTP channel is used, all
messages are serialized to XML and transported over SOAP.  On the other hand, TCP uses binary serialization.<p>

<li>Once the message arrives on the server side, the framework reassembles
the original call, activates the target object if it is not already activated,
and forwards the call to the object in question.  Returning a result
back to the client follows the exact opposite path - the result is packaged
in a message that is transported back to the client.  If the target object is 
of type <b>SingleCall</b>, it will automatically be garbage collected after the call completes.<p>

</ol>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->


