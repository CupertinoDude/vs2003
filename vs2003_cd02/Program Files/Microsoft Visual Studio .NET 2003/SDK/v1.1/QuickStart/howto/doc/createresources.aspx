<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/resourcesheader.inc" -->

<h4>How Do I...Create Resources?</h4>

Creating resources can help you develop robust, culture-aware programs without having to recompile your application because the resources have changed. The steps for creating and subsequently using resources are covered in this topic.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/resources/createresources/createresources.src"
RunSample="/quickstart/howto/samples/resources/createresources/CS/createResources.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="C# CreateResources.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/resources/createresources/createresources.src"
RunSample="/quickstart/howto/samples/resources/createresources/VB/createResources.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB CreateResources.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/resources/createresources/createresources.src"
RunSample="/quickstart/howto/samples/resources/createresources/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ CreateResources.exe"
MapRunSamplePath
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>
<p>

Resources are an application-building feature that allow you to place culture-specific items inside satellite files, rather than directly in your main application. When you build your application, you can identify aspects that are culture-specific, and make a different resources file for each culture where you think your application may be used. At run time, the appropriate set of resources will be loaded, based on the user's culture settings. The specific setting used is the <b>CurrentUICulture</b> for your Thread, which the user can set programmatically.

<p>
When you make your application, it is housed in an 'assembly'. An assembly consists of the following:
<UL>
<LI>The assembly metadata, also called the assembly manifest
<LI>Type metadata
<LI>The Microsoft intermediate language (MSIL) code that implements the types
<LI>A set of resources
</UL>
<p>

The assembly manifest is the only required item from the list, but either types or resources are needed to give the assembly any meaningful functionality. The set of resources is completely optional. When you have created your application, it is part of an assembly, which is referred to as the 'main' assembly, since it is the central part of your application. Any code aspects of your application are part of this main assembly. If you change any code in this main assembly, you need to recompile the entire assembly, which can mean a lot of work redistributing your application.
<p>

When you make external sets of resources for your application to use (that is, resources that are not a part of your main assembly), these are referred to as 'satellite assemblies'. They are also compiled, and they have their own assembly. If you ever need to change information in a satellite assembly, you can do so without having to change the information in your main assembly, which saves time for you and your users. Satellite assemblies can consist of resources only, therefore they have no code. Satellite assemblies will be compiled as dll's and will be referenced by your main assembly, although this is done for you by the ResourceManager: you do not need any specific code to tell your program how to reference the satellite assemblies.
<p>

So how do you decide what goes in a satellite assembly? Imagine you are designing an application that may be used in many different cultures. If the strings are hard-coded and messages appear as 'welcome to our application', or 'exception: cannot divide by zero', you need to take into consideration the fact that other cultures won't be able to read the messages. Furthermore, if you decide to change any of these messages, which are part of the main assembly, you will need to recompile the application and redistribute it with every change you make. Therefore, all the information that may change with culture (such as message strings or graphics) was placed in resource files. This specifically includes things such as prompts and exception messages, or icons and bitmaps that may not be interpretable for all users if they are only included in (for example) English.
<p>

The first step is to identify all the language or culture-specific string message items and place them in a text file. If you have pictures or other data that may need to be culture-specific, note that also. Here is an example of the kind of things we would include in our file, called strings.txt. The name 'strings' becomes the rootname for our resource, which is important in retrieving the resources later. The name is arbitrary, but strings makes sense for a file of string entries.

<div class="code"><pre>
;the welcome statement we want to make...
welcome = Welcome to our application!

;the prompts for the main screen
PromptName = Please enter your name ==>
PromptState = Please enter the State you live in ==>

;the exception message
NameErr = You must specify your last name
AddressErr = Please ensure you enter the address field

; etc...
</pre></div>
<p>

The lines preceded with a semicolon are comments in this file, and are for your own use to help clarify how you have organized the information. They have no final impact on how the information is read or interpreted. Each actual entry in the file consists of a reference name (the item preceding the equals sign) and then the string you want to present (following the equals sign). When you make your first file, you should create entries for the primary culture that this information will be viewed in. In this demonstration, assume that the application will be used primarily by U.S. English users, so make your first set of entries for that particular culture.
<p>

After you create the file, you can make other similar files, one for each culture you want your application to be presented in. You can do this at any point, providing users with specific culture support at a later date (even after you ship your product), allowing you to focus on the development of your core application. When you do make files for other cultures, make sure you give the culture-specific files the same name as the base file, only differentiated by embedding the name of the culture inside the name of the file (see the sample below).
<p>

It is a good idea to organize the files in subfolders (this helps with the next steps). In this example, you will design the application for U.S., New Zealand, and German usage. Consequently, the primary (strings.txt) file is the default file (in the same location where main assembly will reside), but we have also made two other files, and organized them in the application directory as in the following diagram.
<p>

<div class="code"><pre>
<b>app directory</b>
      |
      ----->   strings.txt               default text resources
      ----->   myApp.cs  <b>or</b>  myApp.vb    our application source file (C# or VB)
      |
      ----->   <b>en-NZ</b>                   New Zealand directory
      |          |
      |          -----> strings.en-NZ.txt    New Zealand text resources,
      |                                      culture embedded in filename
      |
      ----->   <b>de</b>                   German directory
                 |
                 -----> strings.de.txt       German text resources,
                                             culture embedded in filename
</pre></div>

<p>
You may be wondering where the names of the subdirectories come from. Each major language is given a two letter acronym in lowercase, such as en for English or bg for Bulgarian. For subcultures or other regions, a second, capitalized acronym is developed. This allows you to identify culture and region specific combinations such as en-CA for Canadian English, or fr-CA for Canadian French. In the example above, de indicates German (regardless of the sub-locale). It is important that these directories are correctly named, since they will be searched later for resources. If they are not named correctly, then your resources will not be found by the system.
<p>

Now that you have the directory structure, the next step is to actually create the resource files. Up to this point, you have made human-readable text files, but these need to be translated into files that can be used by your application. This can be done through code (see <a HREF="/quickstart/howto/doc/readwriteresources.aspx">How Do I...Read and Write Resources</a>), but in this example, the simplest solution is to use an application called Resgen (Resource Generator). Resgen can take .txt files and turn them into .resources files, which can then be used for the next steps. To do this, call Resgen from a command prompt, specifying the .txt file you want to turn into a .resources file, as in this example. You can specify a different name for the output file if you want, as the second parameter to the Resgen utility.
<p>

<div class="code"><pre>
;from inside your app directory
;output file is strings.resources, in this directory
resgen strings.txt


;from inside the en-NZ directory
;output file is strings.en-NZ.resources, in this directory
resgen strings.en-NZ.txt
</pre></div>
<p>

The Resgen utility can convert resource files back into text files. Note however that you lose any comments when converting this way (the comments were already stripped as unnecessary information when making the .resources file). If you do convert this way, you must give Resgen the name of an output file; it will not work if you specify the input file only.
<p>

Resgen can also convert information into and out of another intermediary format called ResX. The ResX format is an XML-based format that wraps the name-value pairs you place in the .txt file into XML instructions. The advantage a .ResX file gives you over a .txt file is that you can store object structures inside a ResX file, so long as the object is serializable. Remember that resources can contain string information, but they can also contain objects, if this makes sense for your resource-aware application. The kind of objects you might want to store include fonts, or actual picture images such as bitmaps (a typical example is the ability to show a particular nation's flag based on the culture setting used).
<p>

As with .txt files, Resgen can be used to convert .ResX files into and out of resource files. The following sample demonstrates converting ResX into resources, and resources back into .txt, or .ResX. Note that once you have a resources file, it does not matter how it was constructed: it can be converted back into either .ResX or .txt files. In addition, .txt and .resx files can be converted into each other directly if required.

<div class="code"><pre>
;from inside your app directory
;convert a .ResX file into a resources file
resgen strings.ResX

;now, convert the resources file just made (strings.resources), back into a .txt file
;the second parameter is the output file. Note that the extensions of the files
;must be correct for resgen to function properly
resgen strings.resources strings.txt

;now, convert the <b>same</b> strings.resources file back into a ResX file
;how the resources file was constructed does not matter.
resgen strings.resources strings.ResX

;you can also convert .txt or .resx files to and from one another
resgen strings.txt strings.ResX
resgen strings.ResX strings.txt
</pre></div>
<p>

Note that because a ResX file can contain embedded objects, but a .txt file cannot, if you Resgen a ResX file into a .txt file and the ResX file has embedded objects (or if you convert a resources file with objects in it into a .txt file), the objects cannot be preserved. Instead, the datatype of the object is written to the .txt file (to give you some kind of feedback). You will be informed by Resgen that an error occurred, and all string resources will be correctly created.
<p>

The following sample is taken directly from a ResX file. You can see in this sample that an image has been embedded directly into the ResX file, which is not possible in a .txt file. The  first section is labeled as [header] (this is not allowed in an actual Resx file) so you can see how a ResX file begins. Subsequent [entries] are the name value combinations for strings or objects. The XML code reflects this by having a data structure that defines a name-value pair, just as a .txt file would. The following code example demonstrates using ResX files.

<p>
<div class="code"><pre>
<b>[header]</b>

<?xml version="1.0" encoding="utf-8"?>
<root>
  <xsd:schema id="root" targetNamespace="" xmlns="" xmlns:xsd="http://www.w3.org/1999/XMLSchema" xmlns:msdata="urn:schemas-microsoft-com:xml-msdata">
    <xsd:element name="data">
      <xsd:complexType content="mixed">
        <xsd:all>
          <xsd:element name="value" minOccurs="0" type="xsd:string"/>
...

<b>[entries: strings]</b>

  <data name="welcome">
    <value>Welcome to our application!</value>

  <data name="PromptName">
    <value>Please enter your name ==></value>

  <data name="PromptState">
    <value>Please enter the State you live in ==></value>

<b>[entries: objects. This is an actual embedded image]</b>

  <data name="flag" mimetype="text/microsoft-urt/psuedoml-serialized/base64">
    <value>AAEAAAD/////AQAAAAAAAAAMAgAAADtTeX    ...  </value>

...

</pre></div>

<p>

Having constructed the resources, you can now move on to the next step: compiling your main assembly. This consists of compiling your assembly as you would normally, with an extra /res: switch in order to place your primary resources file into your main assembly. This is a very critical step, because this becomes your fallback resource, if others can't be found.
<p>

The following rules are used for looking up resources. Suppose someone is trying to access a Mexican Spanish (es-MX) resource inside your application. When your program is running, it has a standard process for looking for any Spanish resources, which includes taking the following steps:
<UL>
<LI>The global assembly cache is checked to see if it includes an es-MX assembly for your application. The global assembly cache is an area that allows you to reference shared resources for many applications, rather than having to include many copies of the same set of resources in the directory structure of every application you make. If the assembly is found, then that assembly is searched for the specific resource requested, and if found, the requested resource is used. If not found, then the search continues through the next steps.
<LI>The directory of the currently executing assembly is checked to see if it contains an es-MX directory. If it does, that directory is searched to see if it has a valid satellite assembly for the requested culture. That assembly is then searched for the specific resource requested and if found, the requested resource is used. If not found or the assembly did not exist, then the search continues through the next steps.
<LI>The global assembly cache is searched for the parent assembly of the requested resource, for your application. The parent is defined as the appropriate fallback culture. In this case, es-MX (Mexican Spanish) will fallback to es (Spanish). Note that providing any resource is viewed as a better alternative to throwing an exception, which is why this system is adopted. Parents are viewed as 'best-fit' candidates. This process also allows scope for reuse of resources: you need only include a particular resource at the parent level, if the child culture does not need to localize the requested resource. If the parent assembly exists in the global cache, then that assembly is searched for the specific resource requested and if found, the requested resource is used. If it is not found, then the search continues through the next steps.
<LI>The directory of the currently executing assembly is checked to see if it contains a parent directory for es-MX (the parent directory for es-MX is es). If the parent directory exists, that directory is searched to see if it has a valid satellite assembly for the parent culture. If it does, then that assembly is searched for the specific resource requested and if found, the requested resource is used. If not found, then the search continues through the next steps.
<LI>Parent assemblies are continually searched as in the previous step through many potential levels (each culture only has one parent, but a parent may have another parent). After all the original culture and parents have been searched for the resource and it is still not found, then the default is used.
<LI>The default resource is that resource that is included with the main assembly when it is compiled (strings.txt). The default resource is viewed as the absolute fallback (the final parent), and it is strongly suggested that a default set of resources always be included. This helps ensure that exceptions are not thrown. Using resources should not result in exceptions.
<LI>If the resource has not been found, then an exception is thrown indicating that the resource could not be found.
</UL>
<p>

The process for trying to find an appropriate culture without throwing an exception is quite involved. In addition, different locations are searched when trying to find the specified culture. Including a default resource file simply ensures that at least some reasonable value will be found, without causing an exception to be thrown. In most cases, you will need to provide a full set of resources for each localized culture you are providing support for. A missing resources file should never be enough of a cause to throw exceptions back to the user. Your default resource therefore needs to include an entry for all potential resource searches.
<p>

Now that you know why a default resources file is important, remember that your default should be that which will be used by most users. To embed it in your main assembly, use the following command-line instruction.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
//This line creates your main assembly, and links the resources file to it
//The /t: switch specifies the output type (executable, not .dll)
//The /res: switch specifies the resources file to embed
//The final argument is the main source file used to construct our assembly
//This code is run from your main application directory

csc /t:exe /res:strings.resources myApp.cs
</Tab>
<Tab Name="VB">
' This line makes your main assembly, and links the resources file to it
' The /t: switch specifies the output type (executable, not .dll)
' The /res: switch specifies the resources file to embed
' The final argument is the main source file used to construct our assembly
' This code is run from your main application directory

vbc /t:exe /res:strings.resources myApp.vb
</Tab>
<Tab Name="C++">
//This line creates your main assembly, and links the resources file to it
//The /t: switch specifies the output type (executable, not .dll)
//The /res: switch specifies the resources file to embed
//The final argument is the main source file used to construct our assembly
//This code is run from your main application directory


</Tab>
</Acme:TabControl>

<p>

You could run the application now, using the default resources. Hopefully, this will satisfy most of your users (who should be requesting the default resources directly); however, now you need to setup your satellite resources. There are few things to note about these other resources before continuing:
<UL>
<LI>If you want to replace the satellite resources (satellite assemblies once compiled), you can do so at any time, without having to recompile your main assembly
<LI>Remember that satellite assemblies consist of resources only (no code is permitted)
<LI>The resources in the assembly must match those expected as indicated by the name of the file, and the location of the file. Do not create a jp-JP resource (Japanese) and place it in an en (English) directory. It will be ignored.
</UL>

For each subculture you want to compile as a separate satellite assembly, rename the file as <section>.<culture>.<resources>. The following sample demonstrates how to compile your resources file. Use the Assembly Linker Utility (al), which is a stripped down version of the main compiler. Note that you could use the main compiler if you want, but the Assembly Linker Utility works just as well, and is easier to ship with products.
<div class="code"><pre>
;move into the en-NZ directory (not essential, but it makes things easier)
;ensure your strings file has the appropriate culture name in it;
;For New Zealand, the file should be named strings.en-NZ.txt

;use resgen to generate the resources file from the txt file
the following command will create the file strings.en-NZ.resources
resgen strings.en-NZ.txt

;- Invoke this command-line inside the en-NZ directory
;- The /t: switch specifies the type of the output file; a dll
;- The /embed: switch specifies the filename to include
;  inside the satellite assembly being created
;- The /out: switch specifies the name of the output file
;- It needs to be named according to the following pattern:
;  <app-name>.resources.dll

al /t:lib /culture:en-NZ /embed:strings.en-NZ.resources /out:myapp.resources.dll

;complete the above steps for each satellite assembly you wish to create,
; changing the culture name appropriately.
</pre></div>
<p>

Note the name of the output file in the above sample. This is critical, because if the files are not named correctly, they will not be found (this is a commonly mistaken step). You need to make sure that the name of the satellite assembly (the dll file) is <app-name>.resources.dll. Also ensure that you specify the correct culture switch. Without the culture tag, the resources you request cannot be correctly identified.
<p>

You may be asking how you get to install resources into the global assembly cache, which we mentioned earlier. Storing resource files in the global assembly cache allows them to be used by multiple applications, without having to store the same resources with many different assemblies. When you use the al utility, you can also use the /install: switch, which allows you to specify the name of your output assembly file. When you use this switch, the resource is saved into the global assembly cache.
<p>

At this point, you know the steps needed to create a console application. The critical files and directories are highlighted in the following sample. Although the rest have been helpful to the process, they should be retained by you and not shipped with your product. They can be useful for making changes and creating updates. They are included in the following diagram to remind you what files you will have in your development area. Your directory tree structure will look as follows:
<p>

<div class="code"><pre>
<b>app directory</b>
      |
      ----->   strings.txt
      ----->   strings.resources
      ----->   myApp.cs   <b>or</b>   myApp.vb   (C# or VB source file)
      ----->   <b>myApp.exe</b>              the actual application
      |                               (strings.resources is embedded in this file)
      |
      ----->   <b>en-NZ</b>
      |          |
      |          -----> strings.en-NZ.txt
      |          -----> <b>myApp.resources.dll</b>    The satellite assembly for New Zealand
      |
      ----->   <b>de</b>
                 |
                 -----> strings.de.txt
                 -----> <b>myApp.resources.dll</b>    The satellite assembly for German
</pre></div>
<p>

It is useful to know that there is another format for saving resources called ResX. ResX files are a resource equivalent to .txt files and are comprised of XML code, but can store objects as well as strings. They are generally generated through code (for more information, see <a href="/quickstart/howto/doc/useresources.aspx">How Do I... Use resources</a>). An object such as an image is actually embedded into the ResX file as an equivalent form of binary information. You can only store serializable objects in ResX files, which are by definition available to be used in resource files. Once your .resx file has been created, you can use the Resgen utility on it to create a resources file, just as you would with a .txt file. Note that if you get errors when attempting to use the Resgen utility on a .resx file, a likely cause is that you are attempting to use non-serializable objects.
<p>

Up to this point, the discussion has focused on setting up your resources for use with a console application. If you are developing other applications however, such as an ASP.NET application, you may want to set up your resources differently. An example of this different setup is portrayed in the next diagram. Note that the code inside the application changes a little in order to be able to handle the fact that this application uses a different location for its resource files. In this approach, you can store all of your resources files in the <b>same directory</b>. The location of this shared directory is not critical, although the suggested location is a subdirectory of your main application. You do not need to differentiate them by their directory structure (although they do still need to be differentiated by name).
<p>

You do not compile an aspx page as such, and therefore, it is difficult to identify the assembly for an aspx application. Because of this, you cannot 'embed' your default resource file into your main assembly: it too must be placed in the shared resources directory you create.
<p>

up to this point the resources have been assembled into satellite assemblies. However, this example demonstrates that you do not need to actually compile your resources into libraries: you can leave them as .resources files and they are still deployable. Therefore, remember that you only need to generate your resources in this approach; you do not need to manually compile either your main aspx page, or your resources.
<p>

<div class="code"><pre>
<b>app directory</b>
      |
      -----> <b>myApp.aspx</b>            an ASP.NET application. You cannot embed a
      |                            resources file into this application!
      |                            The aspx file knows to look in the single resources
      |                            directory for the files.
      |
      -----> <b>resources</b>
                 |
                 -----> strings.txt
                 -----> strings.de.txt
                 -----> strings.en-NZ.txt
                 |
                 -----> <b>strings.resources</b>         the default resources file
                 |                                You can tell it is the default, because
                 |                                it does not have a specific culture embedded
                 |                                in it's name
                 -----> <b>strings.en-NZ.resources</b>   the New Zealand resources file
                 -----> <b>strings.de.resources</b>   the German resources file

<b>Note:</b> There are no dlls: therefore, there are no satellite assemblies.
      The resources are loaded directly from the resources files.
      This is NOT the suggested approach, but it is viable.
</pre></div>
<p>

The following sample demonstrates how to set up your aspx application. Note that when selecting a site for this application, you must ensure that it is in a Web directory so that the aspx control can behave appropriately.

<p>
<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/resources/createresources/createaspxRes.src"
RunSample="/quickstart/howto/samples/resources/createresources/CS/createaspx.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="C# CreateAspxRes.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/resources/createresources/createaspxRes.src"
RunSample="/quickstart/howto/samples/resources/createresources/VB/createaspx.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB CreateAspxRes.aspx"
runat="server" />
  </VbTemplate>
</Acme:LangSwitch>
<p>

A second approach to using resources in ASP.NET pages is also available. You can actually use satellite assemblies (rather than referencing resources files directly), when you are creating ASP.NET Controls. For more information, see <a href="/quickstart/aspplus/doc/resourcefiles.aspx">Working with resource files</a>.
<p>

You have now finished setting up your resource-aware applications. You can modify the satellite assemblies and resources files without requiring to recompile and distribute your main assembly or application, and you can even add in completely new satellite assemblies, although you may need to modify your code to recognize them.
<!-- #include virtual="/quickstart/howto/include/footer.inc" -->

