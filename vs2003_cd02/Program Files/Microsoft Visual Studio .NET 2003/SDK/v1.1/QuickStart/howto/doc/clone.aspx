<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/collectionsheader.inc" -->

<h4>How Do I....Clone a collection?</h4>

This example demonstrates using cloning on an <b>ArrayList</b>. Cloning performs a 'shallow' copy of the <b>ArrayList</b>, meaning that any object references in the original list are copied by the target list rather than taking actual copies of the objects themselves. If the cloned list is modified, so is the original, when the list contains object references. For more information, see <A HREF="/quickstart/howto/doc/equals.aspx">How Do I...Compare object references?</A>.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/collections/clone/clone.src"
RunSample="/quickstart/howto/samples/collections/clone/CS/clone.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="C# Clone.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/collections/clone/clone.src"
RunSample="/quickstart/howto/samples/collections/clone/VB/clone.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB Clone.aspx"
runat="server" />
  </VbTemplate>
</Acme:LangSwitch>

<p>
An <b>ArrayList</b> is a generic collection of objects. When you make an ArrayList, you can place value or reference type objects in the collection. The examples included here are Employees (consisting of a Name, and an ID) which are reference types, and Strings which are immutable. The first step is to look at the code necessary to construct an <b>ArrayList</b> and put elements into it.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
//don't forget you are using statements, at the top of your code...
using System;
using System.Collections;

//... class and method declarations...

ArrayList al = new ArrayList();

ArrayList.Add( new Employee(7182, "Laurie Davies") ); //add an employee object to the list
ArrayList.Add( "Test String 1" );                     //add a string to the list
</Tab>
<Tab Name="VB">
' don't forget your Imports statements, at the top of your code...
Imports System
Imports System.Collections

' ... class and method declarations...

Dim al As ArrayList = New ArrayList()

ArrayList.Add( new Employee(7182, "Laurie Davies") )  ' add an employee object to the list
ArrayList.Add( "Test String 1" )                      ' add a string to the list
</Tab>
</Acme:TabControl>

<p>
Now that the list is populated, you will take a 'clone' of it. A clone is often referred to as a 'shallow copy' of an original. This means that any nonreferential data types (such as strings or integers) are actually copied from one list to the other. In contrast, if the original list contains object references, then the references are copied, so that the cloned list contains the same references to the objects in the first list. This is a far faster way of copying one list to another than actually copying all the elements yourself. The following sample shows you how to clone a list. When you modify the object references in the copy, the original will also change, but when you modify the nonreferential items, the original remains unchanged.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
//this line creates a new list, cloned from the list you made in the previous example
ArrayList newList = (ArrayList)al.Clone();

//set the Name property of the Employee object in the copied list to another value
((Employee)newList[0]).Name = "Mary Smith";

//set the String element in the copied list to another value
newList[1] = "Modified String 1";



//print the values of the original list. The employee name has changed,
//while the String has remained the same
foreach(Object o in newList) {
	Console.WriteLine(o.ToString());
}
</Tab>
<Tab Name="VB">
' this line creates a new list, cloned from the list you made in the previous example
Dim nl As ArrayList = CType(al.Clone(), ArrayList)

' set the Name property of the Employee object in our copied list, to another value
CType(nl(0), Employee).Name = "Mary Smith"

' set the String element in our copied list to another value
newList(1) = "Modified String 1"

Dim o As Object

' print the values of the ORIGINAL list. The employee NAME has changed,
' while the String has remained the same
For Each o In newList
	Console.WriteLine(o.ToString())
Next o
</Tab>
</Acme:TabControl>

<p>
Now that you have identified what happens when an <b>ArrayList</b> is cloned (note that other collections also support Clone, as does the <b>Array</b> object), you may wonder how to make an actual copy of the entire collection. Most copies that you can normally do are all similar to the Clone process, since this is the fastest process to copy a collection, and supports most instances you are going to want to program. However, you may also come across situations where you want to do a 'deep copy' of a list. The following code example demonstrates how to make the new list from the old list. 
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
//declare your new list
ArrayList nl = new ArrayList();



//loop through the entries in the original ArrayList
for (int i=0;i < al.Count;i++) {
	if ((al[i]).GetType() == typeof(Employee)) {

		//add the copied object reference to the new list, as a new Object
		nl.Add(new Employee(((Employee)al[i]).ID, ((Employee)al[i]).Name));
	}
	else {
		//non-referential entries can be added as they are...
		nl.Add(al[i]);
	}
}

//use the same code as in the previous sample to modify elements in your new list,
//and see if the original list is affected. In this scenario, the original will not be changed
//by modifying EITHER types of elements
</Tab>
<Tab Name="VB">
' declare your new list
Dim nl As ArrayList = New ArrayList()

Dim i As Integer

' loop through the entries in the original ArrayList
For i = 0 to al.Count - 1
	If (al(i)).GetType() = GetTYpe(Employee) Then

		' add the copied object reference to the new list, as a New Object
		nl.Add(New Employee(CType(al(i), Employee).ID, CType(al(i), Employee).Name))

	Else
		' non-referential entries can be added as they are...
		nl.Add(al(i))
	End If
Next i

' use the same code as in the previous sample to modify elements in your new list,
' and see if the original list is affected. In this scenario, the original will not be changed
' by modifying EITHER types of elements
</Tab>
</Acme:TabControl>

<p>
The concept of shallow and deep copying is useful to be aware of, and is ultimately a reflection of object reference equality. The default cloning is to simply copy object references, rather than remake all the objects in a collection, a potentially lengthy process. For more information on cloning, see <b>ICloneable</b> interface.
<!-- #include virtual="/quickstart/howto/include/footer.inc" -->