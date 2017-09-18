 <%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/inputoutputheader.inc" -->

<h4>How Do I...Read and write large files?</h4>

This sample demonstrates how to write a large file and read it back in. This sample also shows how to time such operations. It accepts a file size (measured in kilobytes) from the user, indicating the size of the file to create. The larger the specified size, the longer the process will take to both write and read the temporary file created. When working with large files, it is a good idea to give consideration to mechanisms to divert a user's attention away from the processing, such as progress indicators, or splash screens.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/IO/LargeReadWrite/LargeReadWrite.src"
RunSample="/quickstart/howto/samples/IO/LargeReadWrite/CS/LargeReadWrite.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="C# LargeReadWrite.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/IO/LargeReadWrite/LargeReadWrite.src"
RunSample="/quickstart/howto/samples/IO/LargeReadWrite/VB/LargeReadWrite.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB LargeReadWrite.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/IO/LargeReadWrite/LargeReadWrite.src"
RunSample="/quickstart/howto/samples/IO/LargeReadWrite/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ LargeReadWrite.exe"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
This sample uses objects found in the <b>IO</b> namespace, but now you will write a large amount to a file. This concept builds on the issues discussed in <A HREF="/quickstart/howto/doc/logfile.aspx">How Do I...Create a log  file?</A>. However, this time you will use Binary readers and writers. This sample will also demonstrate how to measure the length of the process.
<p>

The first thing you have to do is determine the size of the file to create. This example asks the user to specify a file size, making sure that they are warned in advance about specifying numbers which are too large. The information comes from the user through a text field on our aspx page. For more details on creating the ASP.NET aspects of our example application, please review the topics listed under <A TARGET="_top" HREF="/quickstart/aspplus/">Welcome to the ASP.Net QuickStart Tutorial</A>.
<p>

Once you have the file size from the user, the next step is to create a file of that size. You could create a file that specifies the size, but you generally do not know in advance how big you are going to make your file (the situation we have here is fictitious, and just for demonstration). Therefore, this example only writes one byte at a time to the file. As you can imagine, this could potentially be a very long process.
<p>

There are a few steps required to make the file. First, you need to take the size specifed by the user and convert it to bytes, so you multiply their number by 1024. Now that you have the correct total, you need to create a reference to the temporary file. This example uses a <b>FileStream</b> object. When you make your reference, you need to specify a file name (make sure it is a test file because you do not want to accidently replace a necessary file), and the <b>FileMode</b> in which to open the file. Since you are not concerned if the file already exists (just in case you forgot to remove it previously), this example specifies how to open the file in <b>OpenOrCreate</b> <b>FileMode</b>. This means that it will open the file if it exists, or create it if it does not. Having made the reference, you can ensure the file is empty by setting the length of the <b>Stream</b> to zero, as in the following sample.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
//a variable to hold the size of the file as specified by the user (fileSize)
double origTestSize = fileSize;

//a variable to hold the actual size of the file we want to make
Double testSize = origTestSize * 1024;

Console.WriteLine ("Running test with size {0} KB", origTestSize.ToString());
Console.WriteLine ("This may take a while...");

FileStream fs = new FileStream(Environment.GetEnvironmentVariable("TEMP") + 
    "data.bin", FileMode.OpenOrCreate);
fs.SetLength(0);
</Tab>
<Tab Name="VB">
' a variable to hold the size of the file as specified by the user (fileSize)
Dim origTestSize As double = fileSize

' a variable to hold the actual size of the file we want to make
Dim testSize As double = origTestSize * 1024

Console.WriteLine ("Running test with size {0} KB", origTestSize.ToString())
Console.WriteLine ("This may take a while...")

FileStream fs = new FileStream(Environment.GetEnvironmentVariable("TEMP") & _
    "\\data.bin", FileMode.OpenOrCreate)
fs.SetLength(0)
</Tab>
<Tab Name="C++">
//a variable to hold the size of the file as specified by the user (fileSize)
Double origTestSize = fileSize;

//a variable to hold the actual size of the file we want to make
double testSize = origTestSize * 1024 ;

Console.WriteLine ("Running test with size {0} KB", origTestSize.ToString());
Console.WriteLine ("This may take a while...");

FileStream* fs = new FileStream("data.bin", FileMode::OpenOrCreate);    
fs->SetLength(0);
</Tab>
</Acme:TabControl>

<p>
Now that you have your file ready to populate, you can begin the writing process. In this example, you will make a binary file, so you are going to create a <b>BinaryWriter</b> object. You need to make sure that the writer is pointing to the beginning of our file, so use the <b>Seek</b> method to move to the front of the file, and then loop through the file, writing the specified number of bytes to the writer. The nature of the information does not matter, since the process is important here, so we are just writing a series of ones. Once finished, you force the changes back into the file by flushing the stream. Note that at the point you write the first byte to the file, you get the current <b>TickCount</b> from the <b>Environment</b> you are operating in. You will use this to determine when you began the writing process. You can also take a count once the write is over, to determine the total duration for the write process.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
BinaryWriter w = new BinaryWriter(fs);            //create a BinaryWriter

w.BaseStream.Seek(0,SeekOrigin.Begin);            //seek the beginning of the file
int beginWrite = Environment.TickCount;           //get the start time



for (int i = 0; i < testSize; i++) {              //loop through the file, writing the bytes

	w.Write( (byte) 1);                       //do the write

}

fs.Flush();

int endWrite = Environment.TickCount;             //get the end time
//... feed the information back to the user ...
</Tab>
<Tab Name="VB">
Dim w As BinaryWriter = New BinaryWriter(fs)      ' create a BinaryWriter

w.BaseStream.Seek(0,SeekOrigin.Begin)             ' seek the beginning of the file
Dim beginWrite As Integer = Environment.TickCount ' get the start time

Dim intCount As Integer

For intCount = 0 To testSize - 1                  ' loop through the file, writing the bytes

	w.Write( CType(1, byte))                  ' do the write
	intCount = intCount + 1
Next intCount

fs.Flush()

Dim endWrite As Integer = Environment.TickCount   ' get the end time
' ... feed the information back to the user ...
</Tab>
<Tab Name="C++">
BinaryWriter* w = new BinaryWriter(fs);            //create a BinaryWriter

w->BaseStream->Seek(0,SeekOrigin::Begin);            //seek the beginning of the file
int beginWrite = Environment::TickCount;          //get the start time

for (int i = 0; i < testSize; i++)      // loop through the file, writing the bytes
{
      w->Write( (Byte) 1);                 // do the write
}

fs->Flush();

int endWrite = Environment::TickCount;             //get the end time
//... feed the information back to the user ...
</Tab>
</Acme:TabControl>

<p>
Having performed the Write, it is important to let the user know the results, so you will notice that the complete sample feeds back the information to the console. The next important step is to get the information out of the file, to see how long it takes us to read the file. In a fashion similar to writing, create a <b>BinaryReader</b>, once again setting the current postiion to the beginning of the file using the <b>Seek</b> method. Again take a <b>TickCount</b> to determine the start time, and loop through the file, reading each subsequent byte until the end of the file. Once again, flush the information from the <b>Stream</b>, and take a count of the ticks at the end of the process. Once you give the information back to the user, it's important to close the <b>FileStream</b>, and because you are making a demonstration file, use the <b>Delete</b> method of the <b>File</b> class to remove the file.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
BinaryReader r = new BinaryReader(fs);           //create a BinaryReader

w.BaseStream.Seek(0,SeekOrigin.Begin);           //set the file pointer to the beginning
int beginRead = Environment.TickCount;           //get the start time

for (int i = 0; i < testSize; i++) {             //loop through, reading the bytes

	dummyInt = r.ReadByte();                 //do the read

}

fs.Flush();

int endRead = Environment.TickCount;             //determine the end time
//... feed the information back to the user ...

fs.Close();                                      //close the file

//delete the file
System.IO.File.Delete(Environment.GetEnvironmentVariable("TEMP") + "\\data.bin");
</Tab>
<Tab Name="VB">
Dim r As BinaryReader = New BinaryReader(fs)     ' create a BinaryReader

w.BaseStream.Seek(0,SeekOrigin.Begin)            ' set the file pointer to the beginning
Dim beginRead As Integer = Environment.TickCount ' get the start time

For intCount = 0 To testSize - 1                 ' loop through, reading the bytes

	dummyInt = r.ReadByte()                  ' do the read
	intCount = intCount + 1
Next intCount

fs.Flush()

Dim endRead As Integer = Environment.TickCount   ' determine the end time
' ... feed the information back to the user ...

fs.Close()                                       ' close the file
' delete the file
System.IO.File.Delete(Environment.GetEnvironmentVariable("TEMP") & "\\data.bin")
</Tab>
<Tab Name="C++">
BinaryReader* r = new BinaryReader(fs);           //create a BinaryReader

w->BaseStream->Seek(0,SeekOrigin::Begin);           //set the file pointer to the beginning
int dummyInt;

int beginRead = Environment::TickCount; // get the start time

for (int i = 0; i < testSize; i++)     // loop through, reading the bytes
{
	dummyInt = r->ReadByte();           // do the read
}

fs->Flush();

int endRead = Environment::TickCount;             //determine the end time
//... feed the information back to the user ...

fs->Close();                                      //close the file

//delete the file
File::Delete("data.bin");
</Tab>
</Acme:TabControl>

<p>
Creating and reading a large file is not much different from creating files of other types. It is good to be aware of the specific methods and properties associated with different input and output techniques, and the classes available to assist you with your <b>IO</b> tasks, such as Binary Readers and Writers. Make sure that you keep in mind your current position when dealing with large files.

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->

