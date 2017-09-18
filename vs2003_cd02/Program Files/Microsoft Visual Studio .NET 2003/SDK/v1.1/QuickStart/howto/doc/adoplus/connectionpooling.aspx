<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/dataheader.inc" -->

<h4>ADO.NET: Connection Pooling</h4>

<p>
This sample illustrates how to construct a pool of connections to a datasource.
You will want to do this to deploy high-performance applications. In this example the
pool is established in the connection string and managed automatically by the <b>SqlConnection</b>.
<p>

<Acme:LangSwitch runat="server" ID=LangSwitch1>
  <CsTemplate>
<Acme:SourceRef
RunSample="/quickstart/howto/samples/adoplus/ConnectionPooling/CS/ConnectionPooling.aspx"
ViewSource="/quickstart/howto/samples/adoplus/ConnectionPooling/ConnectionPooling.src"
Icon = "/quickstart/images/genicon.gif"
Caption="C# ConnectionPooling.aspx"
runat="server" ID=SourceRef1/>
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/adoplus/ConnectionPooling/ConnectionPooling.src"
RunSample="/quickstart/howto/samples/adoplus/ConnectionPooling/VB/ConnectionPooling.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB ConnectionPooling.aspx"
runat="server" ID=SourceRef2/>
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/adoplus/ConnectionPooling/ConnectionPooling.src"
RunSample="/quickstart/howto/samples/adoplus/ConnectionPooling/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ ConnectionPooling.exe"
MapRunSamplePath=true
runat="server" ID=SourceRef2/>
  </CpTemplate>
</Acme:LangSwitch>

<p>
In this example we specify the pooling characteristics in the connection string when the
<B>SqlConnection</B> is constructed, as shown in the following code sample. Please note: 
Pooling is implicit, you automatically get it unless you disable it. Therefore, "true" is 
the default for the pooling keyword (pooling=true).
<Acme:TabControl runat="server" >
<Tab Name="C#">
String connString;

// Specification in the connection string:
// Please note: Pooling is implicit, you automatically get it unless you disable it. 
//              Therefore, "true" is the default for the pooling keyword (pooling=true).   
// Connection Reset:    False
// Connection Lifetime: 5
// Enlist:              true
// Min Pool Size:       1
// Max Pool Size:       50

connString = "server=(local)\\NetSDK;Integrated Security=SSPI;database=northwind;" +
             "connection reset=false;" +
             "connection lifetime=5;" +
             "min pool size=1;" +
             "max pool size=50";

SqlConnection myConnection1 = new SqlConnection(connString);
SqlConnection myConnection2 = new SqlConnection(connString);
SqlConnection myConnection3 = new SqlConnection(connString);
</Tab>
<Tab Name="VB">
Dim connString as String

' Specification in the connection string:
' Please note: Pooling is implicit, you automatically get it unless you disable it. 
'              Therefore, "true" is the default for the pooling keyword (pooling=true).   
' Connection Reset:    False
' Connection Lifetime: 5
' Enlist:              true
' Min Pool Size:       1
' Max Pool Size:       50

connString = "server=(local)\NetSDK;Integrated Security=SSPI;database=northwind;" & _
             "connection reset=false;" & _
             "connection lifetime=5;" & _
             "enlist=true;" & _
             "min pool size=1;" & _
             "max pool size=50"

Dim myConnection1 as SqlConnection = new SqlConnection(connString)
Dim myConnection2 as SqlConnection = new SqlConnection(connString)
Dim myConnection3 as SqlConnection = new SqlConnection(connString)
</Tab>
<Tab Name="C++">
String connString;

// Specification in the connection string:
// Please note: Pooling is implicit, you automatically get it unless you disable it. 
//              Therefore, "true" is the default for the pooling keyword (pooling=true).   
// Connection Reset:    False
// Connection Lifetime: 5
// Enlist:              true
// Min Pool Size:       1
// Max Pool Size:       50

connString = String::Concat(String::Concat(S"server=(local)\\NetSDK;Trusted_Connection=yes;database=northwind;provider=sqloledb;",
           S"connection reset=false;",
           S"connection lifetime=5;",
           S"min pool size=1;"), 
           S"max pool size=50");

SqlConnection * myConnection1 = new SqlConnection(connString);
SqlConnection * myConnection2 = new SqlConnection(connString);
SqlConnection * myConnection3 = new SqlConnection(connString);
</Tab>
</Acme:TabControl>

<P>Now we have code to use several of the connections in our pool. 
First, open two connections and return both of the connections to the pool.
Then, open three connections from the pool and return all three connections to the pool.
</P>
<Acme:TabControl runat="server" >
<Tab Name="C#">
// Open two connections. One is from the pool (see min pool size), the other is created.
Console.WriteLine ("Open two connections.");
myConnection1.Open();
myConnection2.Open();

// Now there are two connections in the pool that matches the connection string.
// Return the both connections to the pool. 
Console.WriteLine ("Return both of the connections to the pool.");
myConnection1.Close();
myConnection2.Close();

// Get a connection out of the pool.
Console.WriteLine ("Open a connection from the pool.");
myConnection1.Open();

// Get a second connection out of the pool.
Console.WriteLine ("Open a second connection from the pool.");
myConnection2.Open();

// Open a third connection.
Console.WriteLine ("Open a third connection.");
myConnection3.Open();

// Return the all connections to the pool.  
Console.WriteLine ("Return all three connections to the pool.");
myConnection1.Close();
myConnection2.Close();
myConnection3.Close();
</Tab>
<Tab Name="VB">
' Open two connections. One is from the pool (see min pool size), the other is created.
Console.WriteLine ("Open two connections.")
myConnection1.Open()
myConnection2.Open()

' Now there are two connections in the pool that matches the connection string.
' Return the both connections to the pool. 
Console.WriteLine ("Return both of the connections to the pool.")
myConnection1.Close()
myConnection2.Close()

' Get a connection out of the pool.
Console.WriteLine ("Open a connection from the pool.")
myConnection1.Open()

' Get a second connection out of the pool.
Console.WriteLine ("Open a second connection from the pool.")
myConnection2.Open()

' Open a third connection.
Console.WriteLine ("Open a third connection.")
myConnection3.Open()

' Return the all connections to the pool.  
Console.WriteLine ("Return all three connections to the pool.")
myConnection1.Close()
myConnection2.Close()
myConnection3.Close()
 </Tab>
<Tab Name="C++">
// Open two connections. One is from the pool (see min pool size), the other is created.
Console::WriteLine (S"Open two connections.");
myConnection1->Open();
myConnection2->Open();

// Now there are two connections in the pool that matches the connection string.
// Return the both connections to the pool. 
Console::WriteLine (S"Return both of the connections to the pool.");
myConnection1->Close();
myConnection2->Close();

// Get a connection out of the pool.
Console::WriteLine (S"Open a connection from the pool.");
myConnection1->Open();

// Get a second connection out of the pool.
Console::WriteLine (S"Open a second connection from the pool.");
myConnection2->Open();

// Open a third connection.
Console::WriteLine (S"Open a third connection.");
myConnection3->Open();

// Return the all connections to the pool.  
Console::WriteLine (S"Return all three connections to the pool.");
myConnection1->Close();
myConnection2->Close();
myConnection3->Close();
</Tab>
</Acme:TabControl>

<P>The model for pooled connections is the similar to non-pooled
connections. However, it is especially important to call Close when you finish
with a pooled connection to release it back into the pool.</P>

<p>

<!-- #include virtual="/quickstart/include/footer.inc" -->
