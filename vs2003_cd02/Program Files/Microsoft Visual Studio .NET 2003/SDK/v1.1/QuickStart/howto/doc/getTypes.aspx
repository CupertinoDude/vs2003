<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/reflectionheader.inc" -->

<h4>How Do I...Get the types in an assembly?</h4>

This sample illustrates how to retrieve all the types for a given assembly. To look through the types of an assembly, you first need to identify the assembly you want to manipulate. Once you have an object reference to the assembly of interest, you can call the <b>GetTypes</b> method on that assembly, which returns an array of all the types in that assembly. You can use control logic to identify the more specific types in that array, and use iterating logic to parse your array, returning the type information to the user if needed. The ability to retrieve type information can be useful for determining alternative types you could use for a given task, or identifying existing elements which could provide you with the functionality you need.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/reflection/gettypes/gettypes.src"
RunSample="/quickstart/howto/samples/reflection/gettypes/CS/gettypes.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="C# GetTypes.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/reflection/gettypes/gettypes.src"
RunSample="/quickstart/howto/samples/reflection/gettypes/VB/gettypes.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB GetTypes.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/reflection/gettypes/gettypes.src"
RunSample="/quickstart/howto/samples/reflection/gettypes/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ GetTypes.exe"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
The first thing to learn when retrieving types from a particular assembly is, how to identify an
assembly. This QuickStart demonstrates two ways to retrieve an assembly. The first is by identifying a particular object that you want to find the assembly of, and requesting the assembly for the module of that object (remember that a module is a logical grouping of types and code, such as a .dll or .exe). The second is by using the <b>LoadFrom</b> method of the <b>Assembly</b> class to load a specific assembly for a named module (such as myapp.exe).
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// don't forget your using statements
using System;
using System.Reflection;
// ...

// Getting an Assembly, method 1. Get the mscorlib assembly
// Note that other types such as String, or Int32 would have worked just as well,
// since they reside in the same assembly
Assembly a = typeof(Object).Module.Assembly;

// Getting an Assembly, method 2. Load a particular assembly, using a reference to a
// module that is within that assembly. Note that this requires a compiled module for
// the reference, and when running in an aspx page, will require a fully qualifed path
// to the file, to ensure it is correctly identified
Assembly b = Assembly.LoadFrom ("GetTypes.exe");

// note that either of the above methods is viable, depending on the information
// you have. Since we know the name of the file which houses all of the base system
// objects, we could do the following to replace the first example, just as effectively
// (the absolute path may change on your machine)
// Assembly a = Assembly.LoadFrom
//			("c:/winserv/microsoft.net/framework/v1.0.2230/mscorlib.dll");
</Tab>
<Tab Name="VB">
'  don't forget your using statements
Imports System
Imports System.Reflection
' ...

'  Getting an Assembly, method 1. Get the mscorlib assembly
'  Note that other types such as String, or Int32 would have worked just as well,
'  since they reside in the same assembly
Dim a As reflection.Assembly = GetType(Object).Module.Assembly

'  Getting an Assembly, method 2. Load a particular assembly, using a reference to a
'  module that is within that assembly. Note that this requires a compiled module for
'  the reference, and when running in an aspx page, will require a fully qualifed path
'  to the file, to ensure it is correctly identified
Dim b As reflection.Assembly = reflection.Assembly.LoadFrom ("GetTypes.exe")

'  note that either of the above methods is viable, depending on the information
'  you have. Since we know the name of the file which houses all of the base system
'  objects, we could do the following to replace the first example, just as effectively
'  (the absolute path may change on your machine)
'  Dim a As reflection.Assembly = reflection.Assembly.LoadFrom _
'			("c:/winserv/microsoft.net/framework/v1.0.2230/mscorlib.dll")
</Tab>
<Tab Name="C++">
// don't forget your using statements
using namespace System;
using namespace System::Reflection;

// Getting an Assembly, method 1. Get the mscorlib assembly
// Note that other types such as String, or Int32 would have worked just as well,
// since they reside in the same assembly
//    Assembly *a = __typeof(Object)->Module->Assembly;

// Getting an Assembly, method 2. Load a particular assembly, using a reference to a
// module that is within that assembly. Note that this requires a compiled module for
// the reference, and when running in an aspx page, will require a fully qualifed path
// to the file, to ensure it is correctly identified
//    Assembly *b = Assembly::LoadFrom ("GetTypes.exe");

// note that either of the above methods is viable, depending on the information
// you have. Since we know the name of the file which houses all of the base system
// objects, we could do the following to replace the first example, just as effectively
// (the absolute path may change on your machine)
//    Assembly *a = Assembly::LoadFrom
//			("c:/winserv/microsoft.net/framework/v1.0.2230/mscorlib.dll");
</Tab>
</Acme:TabControl>

<p>
Having identified the assembly, you can now go ahead and retrieve the types, assigning the return value from the <b>GetTypes</b> method to an array of <b>Type</b> objects. You can now manipulate the types. In the following sample, you get the types for the core runtime library, and take separate counts of the different styles of the types in that assembly (if you need more information on the foreach (For Each) statement, please look under the topic <A HREF="/quickstart/howto/doc/list.aspx">How Do I...Iterate through a collection?</A>). In this sample, we demonstrate how to count the number of interfaces only, although we could count other members such as classes, and enums.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
//Get all the types in the assembly identified in the previous example
Type [] types = a.GetTypes ();

int numInterfaces = 0;



foreach (Type t in types) {

	//the following line uses a set of methods which identify what
	//kind of type we are currently querying
	if (t.IsInterface) {
		// only print out the names of the Interfaces
		Console.WriteLine (t.Name + "");
		numInterfaces++;
	}
}

// write out the totals
Console.WriteLine("Out of {0} types in the {1} library:",
			types.Length, typeof(Object).Module.ToString());
Console.WriteLine ("{0} are interfaces (listed)", types.Length, numInterfaces);
</Tab>
<Tab Name="VB">
' Get all the types in the assembly identified in the previous example
Dim types() As Type = a.GetTypes ()

Dim numInterfaces As Integer = 0

Dim t As Type

For Each t in types

	' the following line uses a set of methods which identify what
	' kind of type we are currently querying
	If t.IsInterface Then
		'  only print out the names of the Interfaces
		Console.WriteLine (t.Name + "'")
		numInterfaces = numInterfaces + 1
	End If
Next t

'  write out the totals
Console.WriteLine("Out of {0} types in the {1} library:", _
			types.Length, GetType(Object).Module.ToString())
Console.WriteLine ("{0} are interfaces (listed)", types.Length, numInterfaces)
</Tab>

<Tab Name="C++">
//Get all the types in the assembly identified in the previous example
Type * types[] = a->GetTypes();

int numInterfaces = 0;

for (i=0; i<types->Length; i++)
{
	if (types[i]->IsClass) numClasses++;
	if (types[i]->IsValueType) numValueTypes++;
	if (types[i]->IsArray) numArrays++;

	if (types[i]->IsInterface) 
	{
		Console::WriteLine (types[i]->Name); //only print out the names of the Interfaces
		numInterfaces++;
	}
}

// write out the totals
Console::WriteLine(S"Out of {0} types in the {1} library:", types->Length.ToString(), __typeof(Object)->Module->ToString());
Console::WriteLine(S"{0} are interfaces (listed)", numInterfaces.ToString());
</Tab>
</Acme:TabControl>
<p>
You can also use the second method identified in the first sample to retrieve the types of a given assembly. In the following sample, you will notice that it does not use the same base structure for looping through the types because you do not need keep a track of the different kinds of types. This works well when looking at a small assembly, such as the currently running application (getting a list of all the types for MSCorLib results in a very large list).
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// Get all the types in the assembly identified in the previous example (this assembly)
Type [] types2 = b.GetTypes ();

Console.WriteLine ("Get all the types from the assembly: '{0}'", b.GetName());

foreach (Type t in types2)
{
    Console.WriteLine (t.FullName);
}
</Tab>
<Tab Name="VB">
'  Get all the types in the assembly identified in the previous example (this assembly)
Dim types2() As Type = b.GetTypes ()

Console.WriteLine ("Get all the types from the assembly: '{0}'", b.GetName())

For Each t in types2

	Console.WriteLine(t.FullName) ' not many types, so we can print them all
Next t
</Tab>
<Tab Name="C++">
// Get all the types in the assembly identified in the previous example (this assembly)
Type *types2[] = b->GetTypes ();

Console::WriteLine (S"Get all the types from the assembly: '{0}'", b->GetName());

for (i=0; i<types2->Length; i++)
    Console::WriteLine (types2[i]->FullName); //not many types, so we can print them all
</Tab>
</Acme:TabControl>

<p>
<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
</xml>