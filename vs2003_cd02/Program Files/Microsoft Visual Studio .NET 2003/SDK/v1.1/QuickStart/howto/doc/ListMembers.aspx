<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/reflectionheader.inc" -->

<h4>How Do I...List all the members of a type?</h4>

This example lets you list the members for a given data type. The ability to list a type's members is a great way to quickly discover which elements are available. It is an important tool for reporting on your system as well as assisting in the development of user documentation. Using the <b>Reflection</b> namespace, you can control what kind of members you want to show to your users, as well as other information (such as the visiblity of a particular method). You can also get information on all of the members in a class, or specify only certain subsets (such as methods or fields).
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/reflection/listmembers/listmembers.src"
RunSample="/quickstart/howto/samples/reflection/listmembers/CS/listmembers.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="C# ListMembers.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/reflection/listmembers/listmembers.src"
RunSample="/quickstart/howto/samples/reflection/listmembers/VB/listmembers.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB ListMembers.aspx"
runat="server" />
  </VbTemplate>
</Acme:LangSwitch>

<p>
You might be wondering why it is important to get information for a particular type. After all, that is what the help system and documentation is for, right? The following example can assist you in creating user documentation, or can be used to assist in dynamically calling methods or setting properties.
<p>

There are a few steps you need to perform. First, you need to get the type that the user wants (in the form of a string) to use. Having determined what type you are working with, you need to assign an object to represent that type. This does two things: it creates an object you can work with for the following steps, and it also makes sure that the specified type exists and can be found by the system. The following example assigns an object to the System.String type. Note that although the example gives feedback to the user through the Console object in the sample here, the actual example sends the feedback to an ASP.NET label object. The interpretation, however, is the same.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// don't forget your using statements at the top of your code...
Using System;
Using System.Reflection;

// class declaration, and method declaration...

// remember that this string is case-sensitive, so be careful
Type t = Type.GetType("System.String");

// check to see if we have a valid value. If our object is null, the type does not exist...
if (t == null) {
	// Don't assume that it is a SYSTEM datatype...
	Console.WriteLine("Please ensure you specify only valid types in the type field.");
	Console.WriteLine("REMEMBER: The Case matters (Byte is not the same as byte).");

	return; // don't continue processing
}
</Tab>
<Tab Name="VB">
'  don't forget your imports statements at the top of your code...
Imports System
Imports System.Reflection

'  class declaration, and method declaration...

'  remember that this string is case-sensitive, so be careful
Dim t As Type = Type.GetType("System.String")

'  check to see if we have a valid value. If our object is null, the type does not exist...
If t Is Nothing Then
	'  Don't assume that it is a SYSTEM datatype...
	Console.WriteLine("Please ensure you specify only valid types in the type field.")
	Console.WriteLine("REMEMBER: The Case matters (Byte is not the same as byte).")

	Exit Sub ' don't continue processing
End If
</Tab>
</Acme:TabControl>

<p>
Now that you have a valid type object, the next question is what kind of members do we want to retrieve for our type? Do we want the methods, the static methods, or perhaps the instance fields? In the <b>Reflection</b> namespace, there are a group of <b>Info</b> objects, each representing a different set of members of your system. For example, there is a <b>MethodInfo</b> object which can represent information about a method.  There is also a generic <b>MemberInfo</b> object, which represents all of the members that can exist in a given class.
<p>

With this information, you can set up the following arrays to look at the type you have just created and find out what kind of information is inside our type. The <b>BitWise</b> operator in the sample below (the | symbol, or BitOr in Visual Basic) requests all the information for the type that meets the specified constraints. This sample demonstrates how to get all fields and all methods.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// declare and populate the arrays to hold the information...
FieldInfo [] fi = t.GetFields (BindingFlags.Static |
		BindingFlags.NonPublic | BindingFlags.Public);     // fields

MethodInfo [] mi = t.GetMethods (BindingFlags.Static |
		BindingFlags.NonPublic | BindingFlags.Public);     // methods
</Tab>
<Tab Name="VB">
'  declare and populate the arrays to hold the information...
Dim fi() As FieldInfo = t.GetFields(BindingFlags.Static BitOr _
		BindingFlags.NonPublic BitOr BindingFlags.Public)  '  fields

Dim mi() As MethodInfo = t.GetMethods(BindingFlags.Static BitOr _
		BindingFlags.NonPublic BitOr BindingFlags.Public)  '  methods
</Tab>
</Acme:TabControl>

<p>
The next step is to iterate through each of the arrays and list the elements in the array on the screen (obviously, you would actually process the elements or identify a paricular element in the array). There are a few ways to do this, but this example uses a <b>foreach</b> (For Each in Visual Basic) statement.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">



// iterate through all the method members
foreach (MethodInfo m in mi) {
	Console.WriteLine(m);
}

// iterate through all the field members
foreach (FieldInfo f in fi) {
	Console.WriteLine(f);
}

// etc.... for each array type
</Tab>
<Tab Name="VB">
Dim m As MethodInfo
Dim f As FieldInfo

'  iterate through all the method members...
For Each m In mi
	Console.WriteLine(m)
Next m

'  iterate through all the field members
For Each f In fi
	Console.WriteLine(f)
Next f

'  etc.... for each array type
</Tab>
</Acme:TabControl>

<p>
The previous code works fine, but notice how similar the two <b>foreach</b> (For Each in Visual Basic) statements are. Writing all of those out is going to be laborious and untidy (and may require a lot of maintenance if you change your code later). You can get around this by returning to the <b>MemberInfo</b> object. The <b>MemberInfo</b> object includes all of the possible information sets (methods and fields and interfaces, and so on). This can assist us because we can write the previous <b>foreach</b> statements as one statement, passing in the array to parse. <p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// call the routine below, passing the relevant array we made in the previous step
PrintMembers( mi ); // the method information
PrintMembers( fi ); // the field information

void PrintMembers (MemberInfo [] ms ) {



	// MemberInfo is the generic info object. This can be any of the other info objects.
	foreach (MemberInfo m in ms) {
		Console.WriteLine(m);
	}
}
</Tab>
<Tab Name="VB">
'  call the routine below, passing the relevant array we made in the previous step
PrintMembers( mi )  '  the method information
PrintMembers( fi )  '  the field information

Sub PrintMembers (ms() As MemberInfo)

	Dim m As MemberInfo

	'  MemberInfo is the generic info object. This can be any of the other info objects.
	For Each  m in ms
		Console.WriteLine(m)
	Next m
End Sub
</Tab>
</Acme:TabControl>
<p>
You will notice when you run the example, a couple of other things are happening along the way. Rather than hard-coding the System.String object, you can specify which class you want to get information about. It also lets you control whether you want to show static or instance information. 
<p>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->