<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>

<p>
The Internet is quickly evolving from today's Web sites that just deliver
user interface pages to browsers to a next generation of programmable Web sites that
directly link organizations, applications, services, and devices with one
another.  These programmable Web sites become more than passively accessed
sites - they become reusable, intelligent XML Web services.
</P>
<P>
The common language runtime provides built-in support for creating and exposing Web
Services, using a programming abstraction that is consistent and familiar
to both ASP.NET Web Forms developers and existing Visual Basic users.  The resulting model
is both scalable and extensible, and embraces open Internet standards (HTTP,
XML, SOAP, WSDL) so that it can be accessed and consumed from any client or
Internet-enabled device.
</P>
<H5>XML Web services created using ASP.NET</H5>
<P>
ASP.NET provides support for XML Web services with the .asmx file. An .asmx file
is a text file that is similar to an .aspx file. These files can be part of
an ASP.NET application that includes .aspx files. These files are then
URI-addressable, just as .aspx files are.
</P>
<P>
The following example shows a very simple .asmx file.
</P>

<p><Acme:TabControl runat="server">
<Tab Name="C#">
&lt;%@ WebService Language=&quot;C#&quot; Class=&quot;HelloWorld&quot; %&gt;

using System;
using System.Web.Services;

public class HelloWorld : WebService {

     [WebMethod] public String SayHelloWorld() {
          return &quot;Hello World&quot;;
     }

}
</Tab>

<Tab Name="VB">
&lt;%@ WebService Language=&quot;VB&quot; Class=&quot;HelloWorld&quot; %&gt;

Imports System
Imports System.Web.Services

Public Class HelloWorld :Inherits WebService

     &lt;WebMethod()&gt; Public Function SayHelloWorld() As String
          Return(&quot;Hello World&quot;)
     End Function

End Class
</Tab>

<Tab Name="JScript">
&lt;%@ WebService Language=&quot;JScript&quot; Class=&quot;HelloWorld&quot; %&gt;

import System;
import System.Web.Services;

public class HelloWorld extends WebService {

     WebMethodAttribute public function SayHelloWorld() : String {
          return &quot;Hello World&quot;;
     }

}
</Tab>

</Acme:TabControl><p>

<P>
This file starts with an ASP.NET directive <b>WebService</b>, and sets
the language to C#, Visual Basic, or JScript. Next,
it imports the namespace <b>System.Web.Services</b>. You must include this namespace. Next, the class HelloWorld is declared.
This class is derived from the base class <B>WebService</B>; note that
deriving from the <B>WebService</B> base class is optional. Finally,
any methods that will be accessible as part of the service have the
 attribute <B>[WebMethod]</B> in C#, <B>&lt;WebMethod()&gt;</B> in
Visual Basic, or <B>WebMethodAttribute</B> in JScript, in front of their
signatures.
</P>
<P>
To make this service available, we might name the file <b>HelloWorld.asmx</b>
and place it on a server called <B>SomeDomain.com</B> inside a virtual directory
called <B>someFolder</B>. Using a Web browser, you could then enter the
URL <B>http://SomeDomain.com/someFolder/HelloWorld.asmx</B>, and the resulting page would
show the public methods for this XML Web service (those marked with the
<b>WebMethod</b> attribute), as well as which protocols (such as SOAP, or HTTP
GET) you can use to invoke these methods.
</P>
<P>
Entering the address: <B>http://SomeDomain.com/someFolder/HelloWorld.asmx?WSDL</B>
into the browser returns a Web Service Description Language (WSDL) document. This
WSDL document is very important, and is used by clients that will access the service.
</P>
<H5>Accessing XML Web services</H5>
<P>
In addition to the ASP.NET server side technology that allows developers
to create XML Web services, the .NET Framework
provides a sophisticated set of tools and code to consume XML Web services.
Because XML Web services are based on open protocols
such as the Simple Object Access Protocol (SOAP), this client
technology can also be used to consume XML Web services not created using ASP.NET.
</P>
<P>
Within the SDK, there is a tool called the Web Services Description Language tool (WSDL.exe). This command-line tool
is used to create proxy classes from WSDL. For example, you could enter:
</P>

<div class="code"><pre>
WSDL http://someDomain.com/someFolder/HelloWorld.asmx?WSDL
</pre></div>

<P>to create a proxy class called HelloWorld.cs.</P>

<P>This class would look very similar to the class created in the previous
section. It would contain a method called SayHelloWorld that returns
a string. Compiling this proxy class into an application and then calling
this proxy class's method results in the proxy class packaging a SOAP
request across HTTP and receiving the SOAP-encoded response, which is then
marshaled as a string.</P>

<P>From the client perspective, the code would be simple, as shown in the following example.</p>

<p><Acme:TabControl runat="server">
<Tab Name="C#">
HelloWorld myHelloWorld = new HelloWorld();
String sReturn = myHelloWorld.SayHelloWorld();
</Tab>

<Tab Name="VB">
Dim myHelloWorld As New HelloWorld()
Dim sReturn As String = myHelloWorld.SayHelloWorld()
</Tab>

<Tab Name="JScript">
var myHelloWorld:HelloWorld = new HelloWorld();
var sReturn:String = myHelloWorld.SayHelloWorld();
</Tab>

</Acme:TabControl><p>

<P>The return would be "Hello World".</p>
<P>
The rest of this section deals with more advanced XML Web services topics,
such as sending and receiving complex data types. There is also a section on
Text Pattern Matching, a technology that addresses any
URI that returns text as if it were a XML Web service. You can also perform data
binding operations with XML Web services; this topic is discussed in the Data section.</p>

