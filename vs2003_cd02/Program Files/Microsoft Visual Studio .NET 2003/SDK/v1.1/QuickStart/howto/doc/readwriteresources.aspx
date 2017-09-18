<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/resourcesheader.inc" -->

<h4>How Do I...Read and Write Resources?</h4>

This example illustrates how to read and write resource files through code. You can use other tools (such as Resgen) to write resource files; however, you can also use the <b>ResourceWriter</b> object to create new resource files from scratch, providing the potential to create your own environment for making resource files from the bottom up. This process skips the step of having to create an intermediary text file for your string resources.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/resources/readwriteresources/readwriteresources.src"
RunSample="/quickstart/howto/samples/resources/readwriteresources/CS/readwriteresources.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="C# ReadWriteResources.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/resources/readwriteresources/readwriteresources.src"
RunSample="/quickstart/howto/samples/resources/readwriteresources/VB/readwriteresources.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB ReadWriteResources.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/resources/readwriteresources/readwriteresources.src"
RunSample="/quickstart/howto/samples/resources/readwriteresources/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ ReadWriteResources.exe"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>
<p>

The easiest way to make resource files is through the Resgen utility. This has the advantage of being developed from a pre-existing text file, which can be easily modified. Even if you don't use Resgen to create your resources file, you can use it to retrieve the information back out from a resources file, creating a resultant text file.
<p>

The <b>ResourceWriter</b> object can be also used to create resource files. The <b>ResourceWriter</b> is constructed by specifying the name of the target resources file, and can be used as many times as you would like to add items to the new file. Use the <b>AddResource</b> method to specify the name of the item you are adding, and then the value you want to retrieve. The name must be a string, however the value can be a string, or any object if you are using resources for objects. The following example demonstrates creating a <b>ResourceWriter</b>, and adding string entries to the file. Note that when you are finished, you call the <b>Generate</b> method to save the information you are creating.

<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
//Create a .resources file, specifying a new resources file
ResourceWriter rw = new ResourceWriter("Greeting.resources");

//add some strings to the file
rw.AddResource("Greeting", "Welcome to Microsoft .Net Framework!");
rw.AddResource("PasswordException", "Sorry, that is not the correct password.");
rw.AddResource("Purchase", "Please select an item to purchase from the store:");
rw.AddResource("Goodbye", "Thank you for visiting Microsoft .Net Framework!");

//create and write to the file
rw.Generate();

//close the resourcewriter. Note that if you close without calling generate
//first, the generate method is implicitly called
rw.Close();
</Tab>
<Tab Name="VB">
' Create a .resources file, specifying a new resources file
Dim rw As ResourceWriter = New ResourceWriter("Greeting.resources")

' add some strings to the file
rw.AddResource("Greeting", "Welcome to Microsoft .Net Framework!")
rw.AddResource("PasswordException", "Sorry, that is not the correct password.")
rw.AddResource("Purchase", "Please select an item to purchase from the store:")
rw.AddResource("Goodbye", "Thank you for visiting Microsoft .Net Framework!")

' create and write to the file
rw.Generate()

' close the resourcewriter. Note that if you close without calling generate
' first, the generate method is implicitly called
rw.Close();
</Tab>
<Tab Name="C++">
//Create a .resources file, specifying a new resources file
ResourceWriter * rw = new ResourceWriter("Greeting.resources");

//add some strings to the file
rw->AddResource("Greeting", "Welcome to Microsoft .Net Framework!");
rw->AddResource("PasswordException", "Sorry, that is not the correct password.");
rw->AddResource("Purchase", "Please select an item to purchase from the store:");
rw->AddResource("Goodbye", "Thank you for visiting Microsoft .Net Framework!");

//create and write to the file
rw->Generate();

//close the resourcewriter. Note that if you close without calling generate
//first, the generate method is implicitly called
rw->Close();
</Tab>
</Acme:TabControl>

<p>
Having made the file, you can use the <b>GetString</b> method on a <b>ResourceManager</b> to retrieve the information back out of the resources file just created. You must specify a particular item to retrieve, as in the following sample. Note that you construct the <b>ResourceManager</b> using the static (shared) method, <b>CreateFileBasedResourceManager</b>.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
//make a ResourceManager, as an assembly-ignorant ResourceManager through the
//CreateFileBasedResourceManager method. Simply specify the name of the resources
//file, and the location. The single "." indicates that the current directory should
//be searched the null indicates to use the default resourceset
ResourceManager rm = CreateFileBasedResourceManager( "Greeting", ".", null);

//having got a reference to the resources, retrieve specific strings...
//Note that the CASE MATTERS
rm.GetString("Greeting");
rm.GetString("PasswordException");
rm.GetString("Purchase");
rm.GetString("Goodbye");
</Tab>
<Tab Name="VB">
' make a ResourceManager, as an assembly-ignorant ResourceManager through the
' CreateFileBasedResourceManager method. Simply specify the name of the resources
' file, and the location. The single "." indicates that the current directory should
' be searched the null indicates to use the default resourceset
Dim rm As ResourceManager = CreateFileBasedResourceManager( "Greeting", ".", null)

' having got a reference to the resources, retrieve specific strings...
' Note that the CASE MATTERS
rm.GetString("Greeting")
rm.GetString("PasswordException")
rm.GetString("Purchase")
rm.GetString("Goodbye")
</Tab>
<Tab Name="C++">
//make a ResourceManager, as an assembly-ignorant ResourceManager through the
//CreateFileBasedResourceManager method. Simply specify the name of the resources
//file, and the location. The single "." indicates that the current directory should
//be searched the null indicates to use the default resourceset
ResourceManager * rm = CreateFileBasedResourceManager( "Greeting", ".", null);

//having got a reference to the resources, retrieve specific strings...
//Note that the CASE MATTERS
rm->GetString("Greeting");
rm->GetString("PasswordException");
rm->GetString("Purchase");
rm->GetString("Goodbye");
</Tab>
</Acme:TabControl>
<p>

The <b>ResourceReader</b> can be used to parse all the resources in a given resource file, allowing you to quickly retrieve all the resources without having to specify their names (that is, you don't have to know what they are). This can be useful if you want to print out the resources, or remake the original entries to modify them. The following code demonstrates creating a <b>ResourceReader</b> for a particular file, and iterating through that file, printing out the names (keys) and values.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
//declare and create an instance of ResourceReader
//it is declared for a particular .resources file
ResourceReader rr = new ResourceReader("file.resources");

String s = "";


//iterate through the reader, printing out the name-value pairs
foreach (DictionaryEntry d in rr) {
	Console.WriteLine(d.Key + ":   " + d.Value);
}

//close the reader
rr.Close();
</Tab>
<Tab Name="VB">
' declare and create an instance of ResourceReader
' it is declared for a particular .resources file
Dim rr As ResourceReader = New ResourceReader("file.resources")

Dim s As String = ""
Dim d As DictionaryEntry

' iterate through the reader, printing out the name-value pairs
For Each  d in rr
	Console.WriteLine(d.Key & ":   " & d.Value)
Next d

' close the reader
rr.Close()
</Tab>
<Tab Name="C++">
//declare and create an instance of ResourceReader
//it is declared for a particular .resources file
ResourceReader* rr = new ResourceReader( String::Concat( name, S".resources" ) );

String  * s = "";


//iterate through the reader, printing out the name-value pairs
IDictionaryEnumerator* resourceElement;
resourceElement = rr->GetEnumerator();
	
while( resourceElement->MoveNext() ) {
  Console::WriteLine( String::Concat( resourceElement->Key, S":   ", resourceElement->Value ) );
}

//close the reader
rr.Close();
</Tab>
</Acme:TabControl>
<p>

Remember that you can also save objects into your resource files. A perfect example is saving the flag images, so that a particular nation's flag is displayed when you load its corresponding resources. To save nonstring objects, use the <b>AddResource</b> method just as you would for strings, but specify the object you want to save, rather than a string. You must still specify a name for the resource you are saving, so that it can be identified and retrieved later.
<p>

The following code example demonstrates creating a couple of objects and saving them to file. When you choose objects to save to file, make sure that they are serializable.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
//declare your ResourceWriter
ResourceWriter rw = new ResourceWriter("items.resources");

//create an object to save to the resource file... it is the US flag
Bitmap b = new Bitmap("us50.gif");

//we can create, and add String resources as well, in the same file
String message = "Hello, and welcome!";

//repeat for other serializable objects...

//add the object and string to the ResourceWriter
rw.AddResource("flag", b);
rw.AddResource("welcome", message);

//Generate the file
rw.Generate();

//repeat this process for each set of resources you want to create,
//such as items.de.resources, or items.ja.resources
</Tab>
<Tab Name="VB">
' declare your ResourceWriter
Dim rw As ResourceWriter = New ResourceWriter("items.resources")

' create an object to save to the resource file... it is the US flag
Dim b As Bitmap = New Bitmap("us50.gif")

' we can create, and add String resources as well, in the same file
Dim message As String = "Hello, and welcome!";

' repeat for other serializable objects...

' add the object and string to the ResourceWriter
rw.AddResource("flag", b)
rw.AddResource("welcome", message)

' Generate the file
rw.Generate()

' repeat this process for each set of resources you want to create,
' such as items.de.resources, or items.ja.resources
</Tab>
<Tab Name="C++">
//declare your ResourceWriter
ResourceWriter * rw = new ResourceWriter("items.resources");

//create an object to save to the resource file... it is the US flag
Bitmap * b = new Bitmap("us50.gif");

//we can create, and add String resources as well, in the same file
String * message = "Hello, and welcome!";

//repeat for other serializable objects...

//add the object and string to the ResourceWriter
rw->AddResource("flag", b);
rw->AddResource("welcome", message);

//Generate the file
rw->Generate();

//repeat this process for each set of resources you want to create,
//such as items.de.resources, or items.ja.resources
</Tab>
</Acme:TabControl>
<p>

Just as you can use a <b>ResourceReader</b> and <b>ResourceWriter</b>, so too can you use a <b>ResXResourceReader</b> and <b>ResXResourceWriter</b>. A <b>ResXResourceWriter</b> creates an intermediate .Resx file, which is a combination of binary information (such as images) and XML data. You can use the <b>ResXResourceReader</b> and <b>ResXResourceWriter</b> just as you would in the examples above. After you run your finished code, if you are writing out information, note that the output will be a .Resx file, which you need to use the Resgen utility on to turn it into a .resources file.

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->