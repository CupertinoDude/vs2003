<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>
<!-- #include virtual="/quickstart/howto/include/remotingheader.inc" -->

<h4>Remoting Overview</h4>


The common language runtime Remoting infrastructure provides a rich set
of classes that allow developers to ignore most of the complexities of
deploying and managing remote objects.  Even though you are dealing with
applications running against different run-time environments, calling methods
on remote objects is nearly identical to calling local methods.  The purpose of
this QuickStart is to provide a brief introduction to Remoting and to describe the principles involved so that you can build more sophisticated applications as needed.  A basic understanding of remote objects, HTTP, TCP, and URLs would be helpful for
understanding these examples.
<br><br>

Remoting is a framework built into the common language runtime that can be
used to build sophisticated distributed applications and network services.
Although it has a number of features in common with similar .NET Framework on
other platforms, it offers a unique set of features not available anywhere
else:<br><br>

<ul>

<li><b>Proxy objects.  </b> When a client creates an instance of a remote object, it
receives a proxy to the class instance on the server.  All methods called
on the proxy will automatically be forwarded to the remote class and any
results will be returned to the client.  From the client's perspective,
this process is no different than making a local call.  Any exceptions
thrown by the remote object will automatically be returned to the client.
This enables the client to use normal try and catch blocks around sections
of the code to trap and deal with exceptions.<br><br>

<li><b>Object passing.  </b> All objects created remotely are
returned by reference and have to derive from <b>MarshalByRefObject</b>.
Objects passed as parameters to a remote method call can be forwarded by
value or by reference.  The default behavior is pass by value provided the
object in question is marked by the custom attribute
[serializable]. Additionally, the object could implement the
<b>ISerializable</b> interface, which provides flexibility in how the object
should be serialized and deserialized.  Objects that are not marshal by
reference or marshal by value are not remotable.<br><br>

<li><b>Activation models.  </b> Remote objects can easily be created
from a client by calling <b>new</b>.  The framework contains
enough "intelligence" to realize you are dealing with a remote object and
will ensure an instance of the object gets created in the relevant remote
application.  Creating instances of remote objects is not limited to default
constructors; you can even do this using a constructor that
requires one or more parameters.  The <b>Activator</b> class contains two methods,
<b>CreateInstance</b> and <b>GetObject</b>, that can also be used to create an instance of
remote objects.  The former can be used in place of new to create an
object instance while the latter is normally used to connect to an object
at a specified URL.<br><br>

<li><b>Stateless and Stateful objects.  </b>The framework makes a provision
for creating remote objects as stateless.  When an object is configured as
SingleCall, it will be created when a method is called on that
object.  The object processes the call, returns an optional result, and
is then collected by the garbage collector.  This way the client is
always connected to a fresh object with each call.  Configuring an object
as a Singleton ensures that all clients will be connected to the same
object whenever a call is made to that object.  <b>ClientActivated</b> objects
allow the client to pass parameters to the constructor of a remote object
when it gets created.  Each activation request for a client activated
object (<b>Activator.CreateInstance</b> or new in combination with entries in the
configuration file) on the client results in a new object on the
server.<br><br>

<li><b>Channels and Serialization.  </b>When a client calls a method on a
remote object, the remoting framework automatically serializes any data
associated with the request and transports the data to the remote object
using a channel.  Some of the more popular channels supported are HTTP, TCP, and
SMTP.  In the case of HTTP, the framework uses the SOAP protocol
to transport data in XML format from the client to the server and back.
The default serialization formatter for HTTP is a SOAP formatter. Since programmers can create custom formatters for use
with any channel, the remoting framework can be configured to work with
any external .NET Framework on other platforms.  The TCP channel uses plain
sockets and Binary Serialization by default and can be used to communicate
with any object on a remote server.<br><br>

<li><b>Lease based Lifetime.  </b>The lifetime of remote objects is
controlled by a leasing mechanism.  When an object is first created, it is
given a lease time.  When the lease time of the object reaches zero, the
object will be disconnected from the Remoting infrastructure and when all
references to the object has been freed within the <b>AppDomain</b>, it will be
collected by the garbage collector.  A number of mechanisms are provided that allow the
client to extend the lease on the object, thereby sustaining its life.<br><br>

<li><b>Hosting objects in IIS.  </b>Remote objects can easily be hosted
in IIS.  This allows any client to connect to the object using normal
HTTP on port 80.  It is also possible to create Web pages that allow a
user to connect to a remote object using Internet Explorer.<br><br>

</ul>

The remainder of the QuickStart features practical examples of the above
concepts.  
<!-- #include virtual="/quickstart/howto/include/footer.inc" -->

