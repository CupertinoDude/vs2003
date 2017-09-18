<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/collectionsheader.inc" -->

<h4>How Do I....Choose a collection to use?</h4>

This example discusses the storage procedures and capabilities of three different collections: Queue, SortedList, and Hashtable. The primary purpose of this demonstration is to help developers understand the functions of the different collection types, so that they can choose one that will meet their needs. 
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/collections/queue/queue.src"
RunSample="/quickstart/howto/samples/collections/queue/CS/queue.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="C# Collections.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/collections/queue/queue.src"
RunSample="/quickstart/howto/samples/collections/queue/VB/queue.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB Collections.aspx"
runat="server" />
  </VbTemplate>
</Acme:LangSwitch>

<p>
At first, you may find it difficult to determine which collection best suits your needs. With experience, you will become familiar with each of the different collections you can use, and even customize your own by extending ICollection or IList. The three collections discussed here are: Queue, SortList, and Hashtable. For more detailed information on Hashtable, see <A HREF="/quickstart/howto/doc/hashtable.aspx">How Do I...Use a hashtable?</A>. 
<p>

A Queue is an unsorted collection, which is meant to be used on a 'first-in, first-out' basis.
<UL>
<LI>Do use a Queue when you need entries to be stored in the same order they were entered</b>
<LI>Do use a Queue when you want to be able to easily add elements to the end of the Queue. The <b>Enqueue</b> method provides this functionality</b>
<LI>Do use a Queue if you want to easily be able to read and remove the top item from the Queue. This is the capability provided by the <b>Dequeue</b> method. If you don't want to remove the element but still what to see what it is, use the <b>Peek</b> method
<LI>Don't use a Queue if you need fast searching capabilities. Queue searching is not fast
<LI>Don't use a Queue if you need to remove a particular element specified by you or the user
<LI>Don't use a Queue if you need to be able to reorder or sort the elements.
</UL>

A SortedList is exactly that: a collection of sorted items. A SortedList consists of key-value pairs, and the sort is organized by the key, not the values.
<UL>
<LI>Do use a SortedList if you want to sort your items, without having to do much work
<LI>Do use a SortedList if you want to control how the elements are sorted (how they are compared)
<LI>Do use a SortedList if you can use fast searching capabilities of the keys of the SortedList
<LI>Do use a SortedList if you want to be able to remove specific elements (use the <b>Remove</b> or <b>RemoveAt</b> methods)
<LI>Don't use a SortedList if you need to insert an element in a particular location. It will just be sorted anyway
<LI>Don't use a SortedList if you want to store multiple keys with the same value. All keys inside a SortedList must be unique
<LI>Consider using a different collection (such as Hashtable) if fast searching (particularly by Value) is your highest priority.
</UL>

A hash table is a set of elements also requiring key-value pairs. It sorts the key-value pairs using an internal algorithm, which is not known to the user. The key-value pairs are stored in 'buckets' which makes searching for values very fast.
<UL>
<LI>Use a hash table if searching is a priority. Hash tables provide very quick search mechanisms when searching by key, and fairly good searching when searching by value
<LI>Use a hash table if you want to be able to remove specific elements (use the <b>Remove</b> method)
<LI>Use a hash table when the order the elements is stored is irrelevant to you
<LI>Don't use a hash table if you need the elements in some specific order. You cannot rely on how a Hashtable will sort its elements
<LI>Don't use a hash table if you need to insert an element in a particular location
<LI>Don't use a hash table if you want to store multiple keys with the same value. All keys inside a hash table must be unique
</UL>

The next step is to look at declaring each collection, and populating each with the same set of information. Remember that the Hashtable and the SortedList both need key-value combinations, but in this example, you are going to use the same entries for both the key and the value. That is, you will make collections of last names, and use the same last name for the key, and the value of a particular pair (for example, one pair will be "Smith"-"Smith").
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// don't forget to include those 'using' statements
using System;
using System.Collections;

// ... class and method declarations...

// the declaration for an array of information
String names = new String[] {"Simpson", "Bristow", "Walls",
		"Gilligan","Davidson","Laurence",
		"Jackson","Singh","O'Connor","Moynagh"};

// the declarations for each of the three collections
Queue q = new Queue();
SortedList sl = new SortedList();
Hashtable ht = new Hashtable();



// we use a foreach statement to populate our collections
foreach (String s in names)
{
	// to add an element to the queue, use Enqueue
	// A queue only receives the value you want to add
	q.Enqueue(s);

	// Use Add of SortedList/Hashtable to add elements
	// Note that you must add key-value pairs
	sl.Add(s, s);
	ht.Add(s, s);
}
</Tab>
<Tab Name="VB">
// don't forget to include those 'Imports' statements
Imports System
Imports System.Collections

'  ... class and method declarations...

'  the declaration for an array of information
Dim names() As String = New String() {"Simpson","Bristow","Walls", _
		"Gilligan","Davidson","Laurence", _
		"Jackson","Singh","O'Connor","Moynagh"}

'  the declarations for each of the three collections
Dim q As Queue q = new Queue()
Dim sl As SortedList = New SortedList()
Dim ht As Hashtable = New Hashtable()

Dim s As String

'  we use a foreach statement to populate our collections
For Each s In names

	'  to add an element to the queue, use Enqueue
	'  A queue only receives the value you want to add
	q.Enqueue(s)

	'  Use Add of SortedList/Hashtable to add elements
	'  Note that you must add key-value pairs
	sl.Add(s, s)
	ht.Add(s, s)
Next s
</Tab>
</Acme:TabControl>

<p>You can also remove items from collections, although different methods must be used depending on the collection in question. Many collections support the <b>Remove</b> method to remove a specified element. Both Hashtable and SortedList support this method, to remove the element you specify. <b>RemoveAt</b> is also supported by many collections; however, out of the three collections mentioned in this discussion, only SortedList supports the <b>RemoveAt</b> method. <b>RemoveAt</b> requires you to supply an index of the element to remove, which doesn't really make sense in the case of a Queue or Hashtable (which is why they don't support it). A Queue is a special case since removing elements in a Queue can be performed only on the top element off the Queue. Use the <b>Dequeue</b> method to achieve this, as in the following sample.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
//to remove an element with a specific key, use the Remove method
//where the concept of a key  is invalid, specify the object to remove
sl.Remove(keyValue); // removes the arbitrary keyvalue
ht.Remove(keyValue); // removes the arbitrary keyvalue

//to remove an element at a specific index, use the RemoveAt method
//This does not make sense for collections such as a Hashtable/Queue
sl.RemoveAt(indexValue); //removes the specified index

//A Queue does not have the concept of an arbitrary remove
//Use Dequeue to read, AND remove the top element off the Queue
q.Dequeue(); //remove the top value
</Tab>
<Tab Name="VB">
' to remove an element with a specific key, use the Remove method
' where the concept of a key is invalid, specify the object to remove
sl.Remove(keyValue); '  removes the arbitrary keyvalue
ht.Remove(keyValue); '  removes the arbitrary keyvalue

' to remove an element at a specific index, use the RemoveAt method
' This does not make sense for collections such as a Hashtable/Queue
sl.RemoveAt(indexValue); ' removes the specified index

' A Queue does not have the concept of an arbitrary remove
' Use Dequeue to read, AND remove the top element off the Queue
q.Dequeue(); ' remove the top value
</Tab>
</Acme:TabControl>

<p>
After you create the collection, you can look at the information inside those collections by using a simple iteration statement to print the values out. It is difficult to show here what the results will be, so it requires you to test the output. Note that the Queue will not change the order of the items, the SortedList will sort them alphabetically, and the Hashtable will change the order, but not necessarily to anything that you or I could understand: it uses its own sorting mechanism.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">


Console.WriteLine("The Entries In The Queue");
foreach (String s in q) {
	Console.WriteLine(s);
}

// note that we have to parse the Values of the SortedList, rather than
// the actual SortedList itself
Console.WriteLine("The Entries In The SortedList");
foreach (String s in sl.Values) {
	Console.WriteLine(s);
}

// note that we have to parse the Values of the Hashtable, rather than
// the actual Hashtable itself
Console.WriteLine("The Entries In The SortedList");
foreach (String s in ht.Values) {
	Console.WriteLine(s);
}
</Tab>
<Tab Name="VB">
Dim s As String

Console.WriteLine("The Entries In The Queue")
For Each s In q
	Console.WriteLine(s)
Next s

'  note that we have to parse the Values of the SortedList, rather than
'  the actual SortedList itself
Console.WriteLine("The Entries In The SortedList")
For Each s In sl.Values
	Console.WriteLine(s)
Next s

'  note that we have to parse the Values of the Hashtable, rather than
'  the actual Hashtable itself
Console.WriteLine("The Entries In The SortedList")
For Each s In ht.Values
	Console.WriteLine(s)
Next s
</Tab>
</Acme:TabControl>

<p>
So far, you have looked at the code that demonstrates how each of the collections is organized, and how to retrieve their values. However, you also need to consider how to search for values inside each of the different collections. The following code example shows you the commands needed to find a value inside each collection. The methods to search by key and by value are displayed for both SortedList and Hashtable. Recall that hash tables are very good for searching, and sorted lists are fairly good, especially when searching by key. Queues also provide a searching capability, but this is not really a Queue's purpose, and the search mechanism is slower.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// use these lines of code to retrieve the time before the search
Int64 startTime;
startTime = Environment.TickCount;

// use these lines of code to retrieve the time, after the search.
// You can subtract this value from the above, to get a duration.
Int64 endTime;
endTime = Environment.TickCount;

// use Contains to search a Queue for an entry,
// or a Hashtable/SortedList for a KEY
// Contains returns a boolean, indicating if value/key was found
bool foundValue;
Dim valToFind as Int64
foundValue = q.Contains(valToFind);
foundValue = sl.Contains(valToFind);
foundValue = ht.Contains(valToFind);

// use ContainsValue to search a SortedList/Hashtable for a VALUE
foundValue = sl.ContainsValue(valToFind);
foundValue = ht.ContainsValue(valToFind);
</Tab>
<Tab Name="VB">
'  use these lines of code to retrieve the time before the search...
Dim startTime as Int64
startTime = Environment.TickCount

'  use these lines of code to retrieve the time, after the search.
'  You can subtract this value from the above, to get a duration.
Dim endTime as Int64
endTime = Environment.TickCount

'  use Contains to search a Queue for an entry,
'  or a Hashtable/SortedList for a KEY
'  Contains returns a boolean, indicating if value/key was found
Dim foundValue As Boolean
Dim valToFind as Int64
foundValue = q.Contains(valToFind)
foundValue = sl.Contains(valToFind)
foundValue = ht.Contains(valToFind)

'  use ContainsValue to search a SortedList/Hashtable for a VALUE
foundValue = sl.ContainsValue(valToFind)
foundValue = ht.ContainsValue(valToFind)
</Tab>
</Acme:TabControl>

<p>
<H4>Summary</H4>
Within the <b>Collections</b> namespace, there are many collections that providing different functionality. It is a good idea to familiarize yourself with the different collections available, so that you know which collection to use in each situation you encounter. For information on more specialized collections, see the <b>Collections.Specialized</b> namespace.

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->