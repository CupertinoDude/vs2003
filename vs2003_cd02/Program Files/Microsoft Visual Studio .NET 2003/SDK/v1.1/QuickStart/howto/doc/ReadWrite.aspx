<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/inputoutputheader.inc" -->

<h4>How Do I...Read and write binary data?</h4>

<p>
This sample illustrates basic binary file input and output using the <b>BinaryReader</b>, <b>BinaryWriter</b> and <b>FileStream</b> classes. A similar topic is presented under the heading <A HREF="/quickstart/howto/doc/logfile.aspx">How Do I...Create a log file?</A>. Reading and writing binary information enables you to create and use files that are not accessible through other input and output methods. This example also demonstrates writing non-string data, and demonstrates the capabilities of binary I/O.
</p>
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/IO/readwrite/readwrite.src"
RunSample="/quickstart/howto/samples/IO/readwrite/cs/readwrite.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="ReadWrite.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/IO/readwrite/readwrite.src"
RunSample="/quickstart/howto/samples/IO/readwrite/VB/readwrite.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB ReadWrite.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/IO/readwrite/readwrite.src"
RunSample="/quickstart/howto/samples/IO/readwrite/cP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ ReadWrite.exe"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
Although files on your computer can be stored in different types and files, one of the more common
formats for files is a binary format. This short introduction to creating binary files uses the
base classes <b>BinaryReader</b> and <b>BinaryWriter</b> to get information from, and put information into a file.
Each of these classes wraps a stream of information, so before going further, you need create a stream
which you can use to write your information to and from. Because you will be creating files, you will use a <b>FileStream</b> to expose a specific file, which in this case, you can modify if it already exists, or create if it does not exist. Once you have your <b>FileStream</b>, you can use it to construct your <b>BinaryReader</b> and <b>BinaryWriter</b>, as in the following example.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
//Make a new FileStream object, exposing our data file.
//If the file exists, open it, and if it doesn't, then Create it.
FileStream fs = new FileStream(Environment.GetEnvironmentVariable("TEMP") + 
    "\\data.bin", FileMode.OpenOrCreate);

//create the reader and writer, based on our file stream
BinaryWriter w = new BinaryWriter(fs);
BinaryReader r = new BinaryReader(fs);
</Tab>
<Tab Name="VB">
' Make a new FileStream object, exposing our data file.
' If the file exists, open it, and if it doesn't, then Create it.
Dim fs As FileStream = New FileStream(Environment.GetEnvironmentVariable("TEMP") & _
    "\\data.bin", FileMode.OpenOrCreate)

' create the reader and writer, based on our file stream
Dim w As BinaryWriter = New BinaryWriter(fs)
Dim r As BinaryReader = New BinaryReader(fs)
</Tab>
<Tab Name="C++">
//Make a new FileStream object, exposing our data file.
//If the file exists, open it, and if it doesn't, then Create it.
FileStream* fs = new FileStream("data.bin", FileMode::OpenOrCreate);

//create the reader and writer, based on our file stream
BinaryWriter* w = new BinaryWriter(fs);
BinaryReader* r = new BinaryReader(fs);
</Tab>
</Acme:TabControl>

<p>
To use the <b>BinaryReader</b>, a number of different <b>Read</b> methods are available to interpret the binary
information being read from your chosen stream. This example deals with strings of information, so you will be using the <b>ReadString</b> method, but the <b>BinaryReader</b> exposes other readers such as <b>ReadBoolean</b>, or <b>ReadChar</b> for intepreting other data types. When reading information from your stream, use the <b>PeekChar</b> method to determine when you have reached the end of your stream (in this case, the end of the file). <b>PeekChar</b> returns a negative value when you have reached the end of the stream, as in the following sample.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
//make an appropriate receptacle for the information being read in...
//a StringBuilder is a good choice
StringBuilder output = new StringBuilder();

//set the file pointer to the beginning of our file...
r.BaseStream.Seek(0, SeekOrigin.Begin);

//continue to perform this loop while not at the end of our file...
while (r.PeekChar() > -1)
{
	output.Append( r.ReadString() ); //use ReadString to read from the file
}
</Tab>
<Tab Name="VB">
' make an appropriate receptacle for the information being read in...
' a StringBuilder is a good choice
Dim output as StringBuilder = New StringBuilder()

' set the file pointer to the beginning of our file...
r.BaseStream.Seek(0, SeekOrigin.Begin)

' continue to perform this loop while not at the end of our file...
Do While r.PeekChar() > -1

	output.Append( r.ReadString() )  ' use ReadString to read from the file
Loop
</Tab>
<Tab Name="C++">
//make an appropriate receptacle for the information being read in...
//a StringBuilder is a good choice
StringBuilder * output = new StringBuilder();

//set the file pointer to the beginning of our file...
r->BaseStream->Seek(0,SeekOrigin::Begin);

// while not at the end of the file
while (r->BaseStream->Position < r->BaseStream->Length)                
{
  output->Append( r->ReadInt32().ToString() );
}
</Tab>
</Acme:TabControl>

<p>
Once you have read in the information, you can do whatever you need with it. At some point however, you are probably going to want to write information back out to the file, so we are going to need our <b>BinaryWriter</b>. In this example, you are going to append information to the end of the file using the <b>Seek</b> method, so make sure the pointer to your file is at the end of the file before beginning our write. There are a couple of choices when writing information with the <b>BinaryWriter</b>. You can use the <b>Write</b> method to write any standard form of information to the stream your writer wraps, since the <b>Write</b> method has plenty of overloads for all the kinds of information you can write. In this situation, you can also use the <b>WriteString</b> method to write a length-prefixed string to the stream. This example uses the <b>Write</b> method. Note that the <b>Write</b> method does accept a string.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
//set the file pointer to the end of our file...
w.BaseStream.Seek(0, SeekOrigin.End);

w.Write("Putting a new set of entries into the binary file...\r\n");



for (int i = 0; i < 5; i++) //some arbitrary information to write to the file
{
	w.Write( i.ToString() );
}
</Tab>
<Tab Name="VB">
' set the file pointer to the end of our file...
w.BaseStream.Seek(0, SeekOrigin.End)

w.Write("Putting a new set of entries into the binary file..." & chr(13))

Dim i As Integer

For i = 0 To 5 Step 1       ' some arbitrary information to write to the file

	w.Write( i.ToString() )
Next i
</Tab>
<Tab Name="C++">
//set the file pointer to the end of our file...
w->BaseStream->Seek(0, SeekOrigin::End);

w->Write("Putting a new set of entries into the binary file...\r\n");

for (int i = 0; i < 5; i++) //some arbitrary information to write to the file
{
	w->Write( i.ToString() );
}
</Tab>
</Acme:TabControl>

<p>
Having demonstrated the basics of reading and writing binary information, it is always a good idea to open the file you have created with an an application such as Microsoft Word or notepad, just to see what the file looks like. You will notice that the file is not human-readable, since the information gets transformed by the writing process to a form which is easier for the computer to use.
<p>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->