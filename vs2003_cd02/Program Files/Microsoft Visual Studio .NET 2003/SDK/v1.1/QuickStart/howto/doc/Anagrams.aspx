<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/inputoutputheader.inc" -->

<h4>How Do I...Read a text file?</h4>

This sample retrieves information from a text file, and uses an <b>ArrayList</b> to display that information for the user.
<p>

Opening and reading files for read access is an important part of IO functionality, even if you do not need to write to the file in question. In this example, we open a file for reading. This is useful for reading text files, but inappropriate for binary files. In this example, we use one of many methods available for opening the file. Although many data structures are available for storing information retrieved from the file, an <b>ArrayList</b> is the easiest to use. A more detailed analysis of the code follows the example.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/IO/anagrams/anagrams.src"
RunSample="/quickstart/howto/samples/IO/anagrams/CS/anagrams.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="C# Anagrams.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/IO/anagrams/anagrams.src"
RunSample="/quickstart/howto/samples/IO/anagrams/VB/anagrams.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB Anagrams.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/IO/anagrams/anagrams.src"
RunSample="/quickstart/howto/samples/IO/anagrams/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ Anagrams.exe"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
To open a file, you need to manipulate a number of objects found in the <b>IO</b> namespace. The first class of interest is the <b>File</b> class, which defines the general methods and rules for dealing with files. The <b>File</b> class has a number of different methods for opening files, but for this specific scenario, the most appropriate is <b>OpenText</b>. This is because this particular method returns a <b>StreamReader</b> object, which is ideal for reading lines of information from a standard text file. The following code demonstrates using the <b>OpenText</b> method, passing it the name of the file you intend to open. You can include a fully-qualified path when specifying the file.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
StreamReader din = File.OpenText ("words.txt");
</Tab>
<Tab Name="VB">
Dim din As StreamReader = File.OpenText ("words.txt")
</Tab>
<Tab Name="C++">
StreamReader * din = File::OpenText("words.txt");
</Tab>
</Acme:TabControl>

<p>
Here are some other ways in which you can open files. Each of these alternative samples could replace the previous sample, although with this code, you have to do a bit more work to translate the return value back to a <b>StreamReader</b> object. This is because each of these methods returns a <b>Stream</b> object, which can be used to construct a new instance of <b>StreamReader</b>. While you can use a <b>Stream</b> to read information from a file, a <b>StreamReader</b> lessens your workload by providing you with a richer set of methods that you can use to get information from the file that you have opened.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// Use OpenRead which opens a file in read-only mode
StreamReader din = new StreamReader( File.OpenRead("words.txt") );

// Use Open, which accepts the FileMode to open the file in.
// This is a request FileMode.Open, but an alternative would have been Create, or OpenOrCreate
StreamReader din = new StreamReader( File.Open("words.txt", FileMode.Open) );
</Tab>
<Tab Name="VB">
'  Use OpenRead which opens a file in read-only mode
Dim din As StreamReader = New StreamReader( File.OpenRead("words.txt") )

'  Use Open, which accepts the FileMode to open the file in.
'  Here we request FileMode.Open, but an alternative would have been Create, or OpenOrCreate
Dim din As StreamReader = New StreamReader( File.Open("words.txt", FileMode.Open) )
</Tab>
<Tab Name="C++">
// Use OpenRead which opens a file in read-only mode
StreamReader * din  = new StreamReader( File::OpenRead("words.txt") );

// Use Open, which accepts the FileMode to open the file in.
// This is a request FileMode.Open, but an alternative would have been Create, or OpenOrCreate
StreamReader * din = new StreamReader( File::Open("words.txt", FileMode::Open) );
</Tab>
</Acme:TabControl>

<p>
Once you have opened your file, you will need to get the information from it. As mentioned earlier, the <b>StreamReader</b> is good for this because it provides you with the <b>ReadLine</b> method which enables you to get one line at a time. Of course, you need to know how the information in your file is stored to interpret it correctly. In this sample, the input file consists of one-word lines of information, making it easier to interpret.
<p>

You can place the information you retrieve into a number of datastores. In this example, you could just place each line in a string, but that is not typically what would happen. An array is a possible solution, but there is no way to tell in advance how many lines it is going to read. It would have to keep resizing, or remaking, the array (which would require extra work). The ideal solution in this scenario is to choose an <b>ArrayList</b>, a collection on which we can simply use the <b>Add</b> method to add more elements. This saves a lot of effort.
<p>

The following sample reads each new line from our opened file and places each new piece of information into an <b>ArrayList</b>. You can detect the end of the file by checking to see if the last thing that was read was null. If it was, then it has reached the end of the file (note that an empty line will not equal null).
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
String str;
ArrayList al = new ArrayList();       //make our temporary storage object

//loop through all the rows, stopping when we reach the end of file
do {
	str = din.ReadLine();

	if (str != null) {
		al.Add(str);          //add each element to our ArrayList
	}
} while ( str != null );
</Tab>
<Tab Name="VB">
Dim str As String
Dim al As ArrayList = New ArrayList() ' make our temporary storage object

' loop through all the rows, stopping when we reach the end of file
Do
	str = din.ReadLine()

	If str <> Nothing Then
		al.Add(str)           ' add each element to our ArrayList
	End If
Loop Until str = Nothing
</Tab>
<Tab Name="C++">
String str;
ArrayList* al = new ArrayList();       //make our temporary storage object

//loop through all the rows, stopping when we reach the end of file
while ((str=din->ReadLine()) != 0) {
    al->Add(str);
}
</Tab>
</Acme:TabControl>

<p>
Now that you have all your information from the file, you can manipulate it at will. In this example, you can choose to simply print out the information for the user. To do this, you can use a <b>for each</b> statement to go through all the elements in the <b>ArrayList</b>, printing each item to the <b>Console</b> object.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">


foreach (String s in al) {
	Console.WriteLine (s);
}
</Tab>
<Tab Name="VB">
Dim s As String

For Each s in al
	Console.WriteLine (s)
Next s
</Tab>
<Tab Name="C++">
IEnumerator* ie=al->GetEnumerator();
while (ie->MoveNext())
{      String* s= __try_cast<String*> (ie->Current);
	   Console::WriteLine (s);
}
</Tab>
</Acme:TabControl>

<p>

<H4>Summary</H4>

You can read information from a text file in a number of ways. One of the easiest is to use the <b>File</b> object's <b>OpenText</b> method, in combination with a <b>StreamReader</b> object to to retrieve one line of information at a time. It is recommended that you store the information you are retrieving in a temporary store such as an array, or an <b>ArrayList</b>.

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->

