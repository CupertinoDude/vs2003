<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/collectionsheader.inc" -->

<h4>How Do I...Iterate over a collection?</h4>

This topic illustrates how to create and use an <b>ArrayList</b>. 
An important part of this discussion is how to use the foreach 
(For Each in VB) command to loop through the list. An <b>ArrayList</b> 
is a member of the <b>Collection</b> namespace, and can accept any 
type of object as its elements. This topic also covers the methods 
and properties of the <b>ArrayList</b> object.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/collections/list/list.src"
RunSample="/quickstart/howto/samples/collections/list/CS/list.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="C# List.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/collections/list/list.src"
RunSample="/quickstart/howto/samples/collections/list/VB/list.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB List.aspx"
runat="server" />
  </VbTemplate>
</Acme:LangSwitch>

<p>
Collections are very similar to arrays. On the whole, collections can 
be viewed as specialized arrays, with a few more methods and properties 
to help you out. In this demonstration, you will work with one particular 
collection, <b>ArrayList</b>.
<p>

<b>ArrayList</b> can take all kinds of objects, but when working with 
collections, it is beneficial to try to use only one data type.  The 
first piece of sample code you are going to look at is creating the 
list. This is an easy, one line piece of code in which you use the 
constructor for <b>ArrayList</b> to make a new instance of this 
collection. Unlike an array, there is no need to figure out how many 
elements the list is going to take: the <b>ArrayList</b> can do all 
that for you as you add elements to it.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// declare the list, with a default capacity of 16
ArrayList al = new ArrayList();
</Tab>
<Tab Name="VB">
'  declare the list, with a default capacity of 16
Dim al as New ArrayList()
</Tab>
</Acme:TabControl>

<p>
When you make an <b>ArrayList</b>, it has no elements in it, but it has 
the ability to accept up to 16 elements. If you try to add a 17th element, 
the <b>ArrayList</b> helps you out by doubling its capacity. This can be 
useful to know because there is a certain performance hit associated with 
increasing the collection in this way. If you know how many elements your 
collection will need, you can set the capacity in advance, saving on that 
performance issue (however small).
<p>

To prove that the default capacity of <b>ArrayList</b> is greater than 16, 
you need to ask <b>ArrayList</b> what its capacity is, and how many elements 
it has. You can do this by accessing properties of the same name on the list.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// display the initial count, and capacity. 0 and 16
Console.WriteLine("The initial Count of our list is {0} " +
		and its Capacity is {1}", al.Count, al.Capacity);
</Tab>
<Tab Name="VB">
'  display the initial count, and capacity. 0 and 16
Console.WriteLine("The initial Count of our list is {0} " & _
		"and its Capacity is {1}", al.Count, al.Capacity)
</Tab>
</Acme:TabControl>

<p>
Try this out yourself to make sure you agree. You can set the capacity 
property, as long as you don't go below the number of elements currently 
in the list, or below zero. Count is read-only, since it reflects the actual 
number of elements in the list, which is determined by how many you add.
<p>

If you want to add items to the list, use the <b>Add</b> method, which takes 
any object as an argument and places that object at the end of the list. If 
you want to place an object at a particular place in the list, use 
the <b>Insert</b> method, specifying the index to place the new object at, 
and the object to insert.
<p>

Not only can you add elements to your list, you can also take elements 
away from it. To do this, use the <b>Remove</b> method, specifying the 
object to remove (you should use an object reference to do this), or the 
<b>RemoveAt</b> method, passing the index of the element to remove. The 
following code example demonstrates adding and removing objects.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// declare an Int32 object, to add to the list
Int32 intTemp = 12;

// add elements to the list
al.Add("Apple");
al.Add(intTemp);
al.Add( new MyType() ); // a specific object you made.

Console.WriteLine("Removing the integer object...");
// remove a specific element, using the Remove method
al.Remove(intTemp);

Console.WriteLine("Removing the MyType object...");
// remove a specific object, using RemoveAt
al.RemoveAt(1); // remove the MyType. Remember, we just removed intTemp,
		// which reduced all element indexes by 1.

Console.WriteLine("Inserting new object...");
// add an object at a specific location
al.Insert(0, "Grapes");

//display the count, and capacity
Console.WriteLine("After modifying our list, Count is {0} " +
		"and Capacity is {1}", al.Count, al.Capacity);
</Tab>
<Tab Name="VB">
'  declare an Integer object, to add to the list
dim intTemp As Integer = 12

' add elements to the list
al.Add("Apple")
al.Add(intTemp)
al.Add( New MyType() )  '  a specific object we made ourselves

Console.WriteLine("Removing the integer object...")
'  remove a specific element, using the Remove method
al.Remove(intTemp)

Console.WriteLine("Removing the MyType object...")
'  remove a specific object, using RemoveAt
al.RemoveAt(1)  '  remove the MyType. Remember, we just removed intTemp,
		'  which reduced all element indexes by 1.

Console.WriteLine("Inserting new object...")
'  add an object at a specific location
al.Insert(0, "Grapes")

' display the count, and capacity
Console.WriteLine("After modifying our list, Count is {0} " & _
		"and Capacity is {1}", al.Count, al.Capacity)
</Tab>
</Acme:TabControl>

<p>
Notice that the only objects left in the list after running the 
above code are strings. This is going to help with the foreach 
statement. After making the <b>ArrayList</b>, you can iterate 
through that list by making a temporary object that can point 
at each element of the list in turn. The data type of the 
temporary 'pointing' object can help you out. Because you only have 
Strings, you can make it a <b>String</b> object. If you are uncertain, 
use a generic Object. After you have printed out the elements in the 
list, use the <b>Clear</b> method to remove all the elements in the 
list. The following code example demonstrates these concepts.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// note that because we know only Strings are left in our list,
// we can use a String object in our foreach statement. If you
// are at all uncertain, use foreach (Object item in al)


foreach (String item in al) {
	Console.WriteLine(item);
}

// remove all elements from the list
al.Clear();
</Tab>
<Tab Name="VB">
'  note that because we know only Strings are left in our list,
'  we can use a String object in our For Each statement. If you
'  are at all uncertain, use For Each objItem in al
Dim strItem As String

for Each strItem in al
	Console.WriteLine(strItem)
Next strItem

'  remove all elements from the list
al.Clear()
</Tab>
</Acme:TabControl>
<p> Remember that an <b>ArrayList</b> has many other useful methods 
and properties that can help you manipulate your list. Use the .NET 
Framework SDK to determine how these elements work.

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->

