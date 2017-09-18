<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>
<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<!-- #include virtual="/quickstart/howto/include/resourcesheader.inc" -->
<h4>
    How Do I...Use resources?
</h4>
This example demonstrates how to use resource files, dynamically loading a 
particular resource based on a selected culture. Resources allow you to develop 
robust, culture-aware programs without having to recompile your application 
because the resources have changed. The code required to access elements of a 
resource is based on the use of the <b>ResourceManager</b> object, and requires 
knowledge of the names of the elements within the resource. In this 
demonstration, the resources are presumed to already exist. Note that although 
Japanese is included in this demonstration, your console application must be 
setup appropriately to use Japanese resources.
<p>
    <Acme:LangSwitch runat="server" id="LangSwitch1">
        <CsTemplate>
            <Acme:SourceRef ViewSource="/quickstart/howto/samples/resources/useresources/useresources.src" RunSample="/quickstart/howto/samples/resources/useresources/CS/" Icon="/quickstart/images/genicon.gif" Caption="C# UseResources.exe" MapRunSamplePath="true" runat="server" />
        </CsTemplate>
        <VbTemplate>
            <Acme:SourceRef ViewSource="/quickstart/howto/samples/resources/useresources/useresources.src" RunSample="/quickstart/howto/samples/resources/useresources/VB/" Icon="/quickstart/images/genicon.gif" Caption="VB UseResources.exe" MapRunSamplePath="true" runat="server" />
        </VbTemplate>
        <CpTemplate>
            <Acme:SourceRef ViewSource="/quickstart/howto/samples/resources/useresources/useresources.src" RunSample="/quickstart/howto/samples/resources/useresources/CP/" Icon="/quickstart/images/genicon.gif" Caption="C++ UseResources.exe" MapRunSamplePath="true" runat="server" />
        </CpTemplate>
    </Acme:LangSwitch>
<p>
Resources are an application-building feature that allow you to place 
culture-specific items inside satellite files, rather than directly in your 
main application. For example, error messages need to be translated into every 
language that is using the application. A resource is a formalized mechanism 
for loading these sets of culture-dependent items.
<p>
    The code needed to load resources from a file is focused on the <b>ResourceManager</b>
    object. The <b>ResourceManager</b> is created by identifying a particular 
    Assembly to base the <b>ResourceManager</b> on, or a Type within a particular 
    assembly. This ensures that the correct set of resources is going to be used 
    (resources are applied to assemblies, which is why an assembly needs to be 
    identified). If you specify an assembly, you also need to specify the root name 
    of the resources file to retrieve. For more information, see <A HREF="/quickstart/howto/doc/createresources.aspx">
        How Do I...Create Resources</A>
.
<p>
    The following sample demonstrates creating a <b>ResourceManager</b>. Because <b>ResourceManagers</b>
    are expensive to use, you may want to declare only one (unless you have a 
    specific need for more), and declare it at the class level. Further, a static 
    (Shared) version of the <b>ResourceManager</b> can be used by many instances of 
    your class, saving even further on memory resources.
    <Acme:TabControl runat="server" id="TabControl1">
<Tab Name="C#">
//declare a ResourceManager, using the GetExecutingAssembly method of the Assembly
//class to determine which Assembly the ResourceManager is based on.
//The first parameter is the root name of the resource file you want to load.
//In this case, the resourcefile's root name is 'strings'.
static ResourceManager rm = new ResourceManager("strings",
			Assembly.GetExecutingAssembly());

//this declaration is similar to the previous declaration, but also allows
//you to pass the Type of a specific ResourceSet object. This constructor should be used
//when you want to develop your own ResourceSet, which could control things such as the
//caching policy for images. When you have designed your own ResourceSet, you should also
//define your own ResourceReader by implementing IResourceReader, and control how your
//ResourceSet is parsed. To use this constructor, the last parameter needs to be the Type
//of the ResourceSet you created.
ResourceSet rs = new ResourceSet("myResources.resources");
static ResourceManager rm = new ResourceManager("myResources",
			Assembly.GetExecutingAssembly(), rs.GetType());

//you can also declare a ResourceManager, passing it a Type. The ResourceManager
//then determines what Assembly that type is a part of, in order to derive information
//about associated resource files
static ResourceManager rm = new ResourceManager(typeof(ThisClass));
</Tab>
<Tab Name="VB">
' declare a ResourceManager, using the GetExecutingAssembly method of the Assembly
' class to determine which Assembly the ResourceManager is based on.
' The first parameter is the rootname of the resource file you want to load.
' In this case, our resourcefile's rootname is 'strings'
Public Shared rm As ResourceManager = New ResourceManager("strings", _
			System.Reflection.Assembly.GetExecutingAssembly())

' This declaration is similar to the previous declaration, but also allows
' you to pass the Type of a specific resourceset object. This constructor should be used
' when you want to develop your own ResourceSet, which could control things such as the
' caching policy for images. When you have designed your own resourcset, you should also
' define your own ResourceReader by implementing IResourceReader, and control how your
' ResourceSet is parsed. To use this constructor, the last parameter needs to be the Type
' of the resourceSet you created.
Dim rs As ResourceSet = New ResourceSet("myResources.resources")
static ResourceManager rm = new ResourceManager("myResources", _
			Assembly.GetExecutingAssembly(), GetType(rs))

' you can also declare a ResourceManager, passing it a Type. The ResourceManager
' then determines what Assembly that type is a part of, in order to derive information
' about associated resource files
Shared rm AS ResourceManager = New ResourceManager(GetType(ThisClass))
</Tab>
<Tab Name="C++">
//declare a ResourceManager, using the GetExecutingAssembly method of the Assembly
//class to determine which Assembly the ResourceManager is based on.
//The first parameter is the root name of the resource file you want to load.
//In this case, the resourcefile's root name is 'strings'.
static ResourceManager* rm = new ResourceManager("strings",
			Assembly::GetExecutingAssembly());

//this declaration is similar to the previous declaration, but also allows
//you to pass the Type of a specific ResourceSet object. This constructor should be used
//when you want to develop your own ResourceSet, which could control things such as the
//caching policy for images. When you have designed your own ResourceSet, you should also
//define your own ResourceReader by implementing IResourceReader, and control how your
//ResourceSet is parsed. To use this constructor, the last parameter needs to be the Type
//of the ResourceSet you created.
ResourceSet* rs = new ResourceSet("myResources.resources");
static ResourceManager* rm = new ResourceManager("myResources",
			Assembly::GetExecutingAssembly(), rs->GetType());

//you can also declare a ResourceManager, passing it a Type. The ResourceManager
//then determines what Assembly that type is a part of, in order to derive information
//about associated resource files
static ResourceManager* rm = new ResourceManager(typeof(ThisClass));
</Tab>
</Acme:TabControl>
<p>
    Once you have created your <b>ResourceManager</b>
, the next step is to identify the elements to retrieve. In almost all 
situations, you will know what your specific resources are, so you will be 
aware of the names given to them. This demonstration focuses on retrieving 
string resources; however, you can also retrieve other resource types such as 
images.
<p>
    To retrieve string entries from a resources file, use the <b>GetString</b> method 
    of <b>ResourceManager</b>. The resources file in question usually consists of 
    many string values, each having an identifier (name) and value. When you call <b>GetString</b>, 
    pass the name of the entry you want to retrieve; the associated value is 
    returned. You can also pass a <b>CultureInfo</b> object to <b>GetString</b> , 
    which identifies the culture to retrieve (the current UICulture is used unless 
    you specify otherwise). Remember, you will have many resource files that can 
    have entries for the same value (for example, they may all have a 'welcome' 
    entry). Each resource file is associated with a particular culture. When you 
    call <b>GetString</b>, you can specify the culture to attempt to retrieve, and 
    if the <b>ResourceManager</b> can find an appropriate entry in the resource 
    file, it will be returned. If it cannot be found, then the <b>ResourceManager</b>
falls back through the parent chain, trying to find an appropriate resource 
entry (rather than causing an exception to occur). This is demonstrated in the 
following example.
<p>
<Acme:TabControl runat="server" id="TabControl2">
<Tab Name="C#">
//These two entries are in a strings.resources file, and are in the default
//language of the software developers (which happens to be US-English, en-US). These are
//the neutral resources
//welcome = Hello and welcome to this application. Click 'Go' to continue...
//goodbye = Thank you for using this application

//This entry is in a strings.en-AU.resources file, identified as the Australian resources file
//welcome = Gidday, ladies and gents. Hit the 'Go button, and hold on to yer seats!

//declare a CultureInfo object, as a US-English resource
CultureInfo ci1 = new CultureInfo("en-US");

//declare a CultureInfo object, as an Australian-English resource
CultureInfo ci2 = new CultureInfo("en-AU");

//get the Welcome and goodbye strings...
rm.GetString( "welcome", ci1 );  //returns  'Hello and welcome...'
rm.GetString( "welcome", ci2 );  //returns  'Gidday ladies and...'
rm.GetString( "goodbye", ci1 );  //returns  'Thank you for using...'
rm.GetString( "goodbye", ci2 );  //returns  'Thank you for using...'
                      //the last return is because the specified resource could not
                      //be found in the specified file, therefore the default is used
</Tab>
<Tab Name="VB">
' These two entries are in a strings.resources file, and are in the default
' language of the software developers (which happens to be US-English, en-US). These are
' the neutral resources
' welcome = Hello and welcome to this application. Click 'Go' to continue...
' goodbye = Thank you for using this application

' This entry is in a strings.en-AU.resources file, identified as the Australian resources file
' welcome = Gidday, ladies and gents. Hit the 'Go button, and hold on to yer seats!

' declare a CultureInfo object, as a US-English resource
Dim ci1 As CultureInfo = New CultureInfo("en-US")

' declare a CultureInfo object, as an Australian-English resource
Dim ci2 AS CultureInfo = New CultureInfo("en-AU")

//get the Welcome and goodbye strings...
rm.GetString( "welcome", ci1 )   ' returns  'Hello and welcome...'
rm.GetString( "welcome", ci2 )   ' returns  'Gidday ladies and...'
rm.GetString( "goodbye", ci1 )   ' returns  'Thank you for using...'
rm.GetString( "goodbye", ci2 )   ' returns  'Thank you for using...'
                      ' the last return is because the specified resource could not
                      ' be found in the specified file, therefore the default is used
</Tab>
<Tab Name="C++">
//These two entries are in a strings.resources file, and are in the default
//language of the software developers (which happens to be US-English, en-US). These are
//the neutral resources
//welcome = Hello and welcome to this application. Click 'Go' to continue...
//goodbye = Thank you for using this application

//This entry is in a strings.en-AU.resources file, identified as the Australian resources file
//welcome = Gidday, ladies and gents. Hit the 'Go button, and hold on to yer seats!

//declare a CultureInfo object, as a US-English resource
CultureInfo * ci1 = new CultureInfo("en-US");

//declare a CultureInfo object, as an Australian-English resource
CultureInfo * ci2 = new CultureInfo("en-AU");

//get the Welcome and goodbye strings...
rm->GetString( "welcome", ci1 );  //returns  'Hello and welcome...'
rm->GetString( "welcome", ci2 );  //returns  'Gidday ladies and...'
rm->GetString( "goodbye", ci1 );  //returns  'Thank you for using...'
rm->GetString( "goodbye", ci2 );  //returns  'Thank you for using...'
                      //the last return is because the specified resource could not
                      //be found in the specified file, therefore the default is used
</Tab>
</Acme:TabControl>
<p>
    Try to use Assembly-aware <b>ResourceManagers</b> whenever possible. This means 
    you should use a <b>ResourceManager</b>
by declaring it through one of its constructors, as shown in the first sample. 
However, there may be situations when you want to place your family of resource 
files in one directory, rather than having to split them up into the separate 
subdirectory structure. This method avoids using resources through their 
associated assemblies, which means that you don't have to associate the 
resources files with assemblies. Keep in mind that this is not how resources 
are intended to be used, but is available in certain scenarios.
<p>
    The following sample uses the <b>CreateFileBasedResourceManager</b> method of 
    the <b>ResourceManager</b> to create your <b>ResourceManager</b>. This method 
    needs the base name of the resources file you will be using (as in one of the 
    previous examples), and the location and name of the resources file you are 
    using. The final parameter is an optional Type of a ResourceSet (which you will 
    not specify, indicating the default should be used, but you could specify your 
    own resource format here). Once created, the <b>ResourceManager</b>
can be used as in the previous examples.
<p>
<Acme:TabControl runat="server" id="TabControl3">
<Tab Name="C#">
//use the assembly-ignorant method to create a resourceManager.
//The file you look at is the Australia strings resources file. Note that all you need to specify
//is the directory you want to look in for the resources. ALL resources can be placed in the
//same directory, so long as each is differentiated by the name of the culture for that resource.
//In this example, you have placed all the resources in a subdirectory of the application,
//called "resDir".
static ResourceManager rm = ResourceManager.CreateFileBasedResourceManager(
		"strings", Server.MapPath("ResDir") + Environment.DirectorySpearatorChar, null);

//Using the ResourceManager just created...
rm.GetString( "welcome");
rm.GetString( "goodbye");
</Tab>
<Tab Name="VB">
' use the assembly-ignorant method to create a resourceManager.
' The file you look at is the Australia strings resources file. Note that all you need to specify
' is the directory you want to look in for the resources. ALL resources can be placed in the
' same directory, as long as each is differentiated by the name of the culture for that resource.
' In this example, you have placed all the resources in a subdirectory of the application,
' called "resDir".
Public Shared rm As ResourceManager = ResourceManager.CreateFileBasedResourceManager( _
		"strings", Server.MapPath("ResDir") & Environment.DirectorySpearatorChar, Nothing)

' Using the ResourceManager just created...
rm.GetString( "welcome")
rm.GetString( "goodbye")
</Tab>
<Tab Name="C++">
//use the assembly-ignorant method to create a resourceManager.
//The file you look at is the Australia strings resources file. Note that all you need to specify
//is the directory you want to look in for the resources. ALL resources can be placed in the
//same directory, so long as each is differentiated by the name of the culture for that resource.
//In this example, you have placed all the resources in a subdirectory of the application,
//called "resDir".
static ResourceManager* rm = ResourceManager::CreateFileBasedResourceManager(
		"strings", Server::MapPath("ResDir") + Environment::DirectorySpearatorChar, null);

//Using the ResourceManager just created...
rm->GetString( "welcome");
rm->GetString( "goodbye");
</Tab>
</Acme:TabControl>
<p>
    You can also save nonstring resources. To access these resources, create a <b>ResourceManager</b>, 
    and instead of using the <b>GetString</b> method, use <b>GetObject</b>. As with 
    a String, the object in question will have been placed into the resources file 
    as a name-value pair, so you can use <b>GetObject</b> the same way you would 
    use <b>GetString</b>
.
<p>
<Acme:TabControl runat="server" id="TabControl4">
<Tab Name="C#">
//create a ResourceManager...
//note that the base file is named differently to reflect the kind of resources
//that are being stored. The file has three pictures in it
static ResourceManager rm = new ResourceManager("images",
			Assembly.GetExecutingAssembly());

//get the resources out of the resource, specifying different cultures to retrieve
rm.GetObject("flag1", new CultureInfo("ja-JP"));  //a Japanese flag image
rm.GetObject("car1", new CultureInfo("it-IT"));   //an Italian car image
rm.GetObject("Sport1", new CultureInfo("ta-IN")); //a snapshot of India's national sport
</Tab>
<Tab Name="VB">
' create a ResourceManager...
' note you named the base file differently, to reflect the kind of resources
' you are storing. The file has three pictures in it
Public Shared rm As ResourceManager = new ResourceManager("images", _
			System.Reflection.Assembly.GetExecutingAssembly());

' get the resources out of the resource, specifying different cultures to retrieve
rm.GetObject("flag1", new CultureInfo("ja-JP"))   ' a Japanese flag image
rm.GetObject("car1", new CultureInfo("it-IT"))    ' an Italian car image
rm.GetObject("Sport1", new CultureInfo("ta-IN"))  ' a snapshot of India's national sport
</Tab>
<Tab Name="C++">
//create a ResourceManager...
//note that the base file is named differently to reflect the kind of resources
//that are being stored. The file has three pictures in it
static ResourceManager* rm = new ResourceManager("images",
			Assembly::GetExecutingAssembly());

//get the resources out of the resource, specifying different cultures to retrieve
rm->GetObject("flag1", new CultureInfo("ja-JP"));  //a Japanese flag image
rm->GetObject("car1", new CultureInfo("it-IT"));   //an Italian car image
rm->GetObject("Sport1", new CultureInfo("ta-IN")); //a snapshot of India's national sport
</Tab>
</Acme:TabControl>
<p>
To put this concept into practice, in the final example, you will create a 
small demonstration WinForms application. This application has string 
resources, but it also has an image resource to demonstrate that objects can 
also be made into resources. You will create a short program to write all of 
the resources into the same resources file, which saves work later. The code 
for the sample simply loads in the appropriate resources, and makes WinForms 
objects from them, which are then displayed to the user.
<p>
To change the particular resources that you see in this demonstration, you can 
go to your regional options (Start/Settings/Control Panel, and then select 
Regional Options) and on the General tab, change your locale to English (NZ), 
English (US), Japanese (which may require installation of the Japanese 
character set), or German. If you set it to any other culture, the default is 
used (in this example, U.S. English). Review the code for this demonstration to 
see how this setting was used (Thread.CurrentThread.CurrentCulture). The 
executable you need to run is MultipleResources. This executable actually 
creates the resources that will be used, and then the automation for the page 
turns the resources into the satellite assemblies you will find in the culture 
specific subdirectories.
<p>
A good test for this demonstration is to set the culture setting to something 
other than the four supported settings. Because standard fallback is used, the 
resources displayed should be the default (neutral) resources, which in this 
case are the U.S. English resources.
<p>
    <Acme:LangSwitch runat="server" id="LangSwitch2">
        <CsTemplate>
            <Acme:SourceRef ViewSource="/quickstart/howto/samples/resources/multipleresources/multipleresources.src" RunSample="/quickstart/howto/samples/resources/multipleresources/CS/" Icon="/quickstart/images/genicon.gif" Caption="C# MultipleResources.exe" MapRunSamplePath="true" runat="server" />
        </CsTemplate>
        <VbTemplate>
            <Acme:SourceRef ViewSource="/quickstart/howto/samples/resources/multipleresources/multipleresources.src" RunSample="/quickstart/howto/samples/resources/multipleresources/VB/" Icon="/quickstart/images/genicon.gif" Caption="VB MultipleResources.exe" MapRunSamplePath="true" runat="server" />
        </VbTemplate>
    </Acme:LangSwitch>
    <!-- #include virtual="/quickstart/howto/include/footer.inc" -->
</p>
