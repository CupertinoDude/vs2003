<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>
<!-- #include virtual="/quickstart/howto/include/remotingheader.inc" -->

<h4>Use the Remoting Samples</h4>

The next few sections contain a number of sample programs that demonstrate
the most important features of the .NET remoting framework.  The
examples are as concise as possible and in many cases omit error handling
and user interfaces in favor of simplicity.  The examples are presented in
a specific sequence, each one building on the concepts illustrated in the
previous one (where applicable).  Each example consists of at least two
executables called server.exe and client.exe.  Some examples
contain more than one client that works with the same server. <br><br>

The three different ways client references to remote objects are resolved at compile time are:<p>

<ul>

<li>Compile the server object and specify the EXE or DLL as a reference to
the compiler when compiling the client.  This is useful when both the
client and server components are developed at the same site.<p>


<li>Derive the server object from an interface class and compile the client
with the interface.  This is useful when the client and server components are not
developed at the same site.  The interface(s) can be compiled to a DLL and
shipped to the client sites as necessary.  Changes to the published
interface should be avoided.  Refer to the COM
guidelines for more information.<p>


<li>Use the SOAPSUDS tool to extract the required metadata from a running
server object.  This is useful when the client and server components are developed at
different sites and no interface classes are available.  Point the
SOAPSUDS tool at a remote URI and generate the required metadata as source or
a DLL.  Note that the SOAPSUDS tool only extracts metadata, and
will not generate the source for the remote object.<p>

</ul>

The majority of the samples presented in this QuickStart compile the
server object to a DLL and use this as a reference to compile the server and
client executables.  In cases where a common class is referenced by both the client
and the server, the common class was added to the server object DLL.  The sample installation
program automatically builds all the samples on the CD using the MAKEFILES
provided.  The server
object is compiled as follows and produces the file share.dll or object.dll.


<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
csc /t:library /debug /r:System.Runtime.Remoting.dll share.cs
</Tab>
<Tab Name="VB">
vbc /t:library /debug /r:System.Runtime.Remoting.dll share.vb
</Tab>
</Acme:TabControl>

<p>
The server is compiled as follows to produce the file server.exe.

<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
csc /debug /r:Share.dll /r:System.Runtime.Remoting.dll server.cs
</Tab>
<Tab Name="VB">
vbc /debug /r:Share.dll /r:System.Runtime.Remoting.dll server.vb
</Tab>
</Acme:TabControl>

<p>
The client is compiled as follows to produce the file client.exe.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
csc /debug /r:Share.dll /r:System.Runtime.Remoting.dll client.cs
</Tab>
<Tab Name="VB">
vbc /debug /r:Share.dll /r:System.Runtime.Remoting.dll client.vb
</Tab>
</Acme:TabControl>
<p>

<span class="subhead">How to run the samples</span><p>

Open two command windows and find the Samples\Quickstart\Remoting
directory.  Start the server
in one command window and run the client in the other.  Make sure
that the server app is closed down before moving on to the next sample.
This step is important since most of the servers use TCP port 8085
and any attempt to run more than one server at a time will generate
an error.<p>

<span class="subhead">Getting more information</span><p>
The samples included with the .NET Framework SDK contain additional remoting examples
that demonstrate features not covered in this QuickStart.

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
