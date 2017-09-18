<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/collectionsheader.inc" -->

<h4>How Do I....Create and Use a Hashtable?</h4>

This example illustrates how to create and use a hash table. A hash table is a collection that consists of key-value combinations, organized into 'buckets' for fast searching. You can search a hash table either by the keys, or by the associated values; however, if fast searching is your objective, searching by key will generally be faster.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/collections/hashtable/hashtable.src"
RunSample="/quickstart/howto/samples/collections/hashtable/CS/hashtable.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="C# HashTable.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/collections/hashtable/hashtable.src"
RunSample="/quickstart/howto/samples/collections/hashtable/VB/hashtable.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB HashTable.aspx"
runat="server" />
  </VbTemplate>
</Acme:LangSwitch>

<p>
As mentioned in the introduction, a hash table is a type of collection. When you populate a hash table, you give it a key to add to the table, and a value that goes with the key. In the following example, employee id numbers are used for the key, and then the employee names, to give you an idea of the kind of combinations you can use. Note that the key does not need to be numeric: any object is acceptable.
<p>

Why is a hash table useful? When one of these key-value pairs is added to the hash table, the hash table looks at the key and gives it a hash code, a number that identifies the key (each key you add gets a hash code). These hash codes are then placed in 'buckets' to help organize the entries in the table. This can help later when you try to find something in the table.
<p>

Imagine for a second that these buckets aren't used. If you wanted to find something in an array, you would have to go through every element of the array, looking for the element. You have no idea where it is, so there is no fast way to search through the entries. By contrast, a hash table can search for a particular key faster, because once you give it a key it knows which bucket to look in. This means it only has to look through a subset of all the elements.
<p>

It is important to remember that this faster searching mechanism is only available when searching by keys. Searching by a value is available, but is potentially slower than key searching. Therefore, where possible you should perform key searches.
<p>

To add elements to a hash table, call the <b>Add</b> method, passing in the key-value pairs you want to add.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// Here we'll create a hashtable of employee numbers and employee names
Hashtable table = new Hashtable();

// now, we will add elements to the hashtable, as key-value pairs
table.Add(5123, "Jay");
table.Add(1829, "Tom");
table.Add(2882, "Matt");
</Tab>
<Tab Name="VB">
'  Here we'll create a hashtable of employee numbers and employee names
Dim table As Hashtable = New Hashtable()

'  now, we will add elements to the hashtable, as key-value pairs
table.Add(5123, "Jay")
table.Add(1829, "Tom")
table.Add(2882, "Matt")
</Tab>
</Acme:TabControl>

<p>
Now that the hash table is populated, you can search for elements in it. You are going to search both by key and value. Note that in the actual example, you will accept a value or key to find from the user, so the implementation is slightly different, but the concepts are the same.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// SEARCHING BY VALUE. Use the method ContainsValue
String valueToFind = "Jay";

if (table.ContainsValue(valueToFind)) {
	Console.WriteLine("Found {0} in the list.", valueToFind );
}

// SEARCHING BY KEY. Use the method Contains
int keyToFind = 5123;

if (table.Contains(keyToFind)) {
	Console.WriteLine("Found {0} in the list.", keyToFind);
}
</Tab>
<Tab Name="VB">
'  SEARCHING BY VALUE. Use the method ContainsValue
Dim valueToFind as String = "Jay"

If table.ContainsValue(valueToFind) Then
	Console.WriteLine("Found {0} in the list.", valueToFind )
End If

'  SEARCHING BY KEY. Use the method Contains
Dim keyToFind As Integer = 5123

If table.Contains(keyToFind) Then
	Console.WriteLine("Found {0} in the list.", keyToFind)
End If
</Tab>
</Acme:TabControl>

<p>
Of course, you can do more than simply searching. You can remove entries from the hash table by using the <b>Remove</b> method, which you pass a key identifying the element you want to remove. You can also enumerate over the hash table using the Keys collection or the Values collection inside your instance of the hash table.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// using the Remove method to delete a particular item...
table.Remove(5123);



// enumerating over the collection with a foreach statement
// Note the alternate of iterating through by value is demonstrated
// foreach (Object o in table.Values) {
foreach (Object o in table.Keys) {
	Console.WriteLine(o.ToString());
}
</Tab>
<Tab Name="VB">
'  using the Remove method to delete a particular item...
table.Remove(5123);

Dim o As Object

'  enumerating over the collection with a foreach statement
'  Note the alternate of iterating through by value is demonstrated
'  For Each o In table.Values
For Each o In table.Keys
	Console.WriteLine(o.ToString())
Next
</Tab>
</Acme:TabControl>

<p>
Those are the basics of using a hash table. It is important to know how to iterate through your hash table, once you have it populated with entries. This important topic is covered in the section <A HREF= "/quickstart/howto/doc/list.aspx">How Do I...Iterate over a collection?</A> The following code shows you how to use a foreach (For Each in VB) statement to move through our list, and print each of the key-value combinations to the screen. To do this, you also need to reference the <b>Key</b> and <b>Value</b> properties of each element. The following sample demonstrates iterating through the collection.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// if you are wondering where DictionaryEntry comes from, it is
// the generic object type of each element in the hashtable


foreach (DictionaryEntry d in table) {
	// use the Key and Value properties
	Console.WriteLine ("{0}\t{1}", d.Key, d.Value);
}
</Tab>
<Tab Name="VB">
'  if you are wondering where DictionaryEntry comes from, it is
'  the generic object type of each element in the hashtable
Dim d As DictionaryEntry

For Each d in table
	'  use the Key and Value properties. Note chr(9) is a tab
	Console.WriteLine ("{0}" & chr(9) & "{1}", d.Key, d.Value)
Next d
</Tab>
</Acme:TabControl>

<p>
<!-- #include virtual="/quickstart/howto/include/footer.inc" -->