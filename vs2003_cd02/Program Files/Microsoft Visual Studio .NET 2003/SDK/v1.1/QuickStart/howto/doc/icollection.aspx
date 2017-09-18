<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/collectionsheader.inc" -->

<h4>How Do I....Implement a collection?</h4>

This example demonstrates how to create a class that is derived from the <b>ICollection</b> interface. There are a number of interfaces in the <b>collection</b> namespace, each with their own set of properties and methods. Knowing the basics of how to implement these collections will allow you to build strongly typed collections that return specific data types, rather than generic objects, as in this example.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/collections/icollection/icollection.src"
RunSample="/quickstart/howto/samples/collections/icollection/CS/icollection.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="C# ICollection.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/collections/icollection/icollection.src"
RunSample="/quickstart/howto/samples/collections/icollection/VB/icollection.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB ICollection.aspx"
runat="server" />
  </VbTemplate>
</Acme:LangSwitch>

<p>
The first step in implementing <b>ICollection</b> is to do just that: Implement the interface in the declaration for the class. At that point, you have made a commitment to support the interface, which means you have to provide implementations for all the methods or properties the interface expects you to use. You don't necessarily have to do anything in all the methods, but note that users who are aware you have implemented a particular interface will certainly expect to see the functionality, so at the least, let them know if you don't actually do anything in certain methods. In this sample code, you don't do anything in <b>CopyTo</b>, but you do let the user know, by throwing an exception. The rest of the methods displayed here are methods you must implement to support <b>ICollection</b>.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
using System.Collections;

class EmployeeCollection : ICollection {

	// The methods you have to support...
	public virtual void CopyTo(Array array, int index) {
		// you would have to make it very clear in documentation that users cannot
		// use this functionality. Ultimately, you need to support all implemented methods
		throw new Exception("This method is not supported in this implementation");
	}

	public virtual int Count { //this will be how we track the size of our collection
		get {
			return _size;
		}
	}

	// these two properties are required to support synchronization
	// only the signatures are included here...
	// Note that they are read-only, so you only have to define a Get procedure
	public virtual Object SyncRoot {}
	public virtual bool IsSynchronized {}

	// this method is what allows your users to parse your collection using foreach
	public virtual IEnumerator GetEnumerator() {
		return new EmployeeEnumerator(this);
	}
}
</Tab>
<Tab Name="VB">
Imports System.Collections

Class EmployeeCollection : Implements ICollection

	'  The methods we have to support...
    	Public Sub CopyTo(arr As Array, index as Integer) Implements ICollection.CopyTo
		'  you would have to make it VERY clear in documentation that users cannot
		'  use this functionality. Ultimately, you need to support all implemented methods
		Throw New Exception("This method is not supported in this implementation")
	End Sub

	Public ReadOnly Property Count As Integer Implements ICollection.Count
		Get
			return _size
		End Get
	End Property

	'  these two properties are required to support synchronization
	'  only the signatures are included here...
	'  Note that they are read-only, so you only have to define a Get procedure
	public ReadOnly Property SyncRoot As Object Implements ICollection.SyncRoot
	public ReadOnly Property IsSynchronized As Boolean Implements ICollection.IsSynchronized

	'  this method is what allows users to parse the collection using foreach
	Public Function GetEnumerator() As IEnumerator Implements ICollection.GetEnumerator
    		return New EmployeeEnumerator(Me)
	End Function
End Class
</Tab>
</Acme:TabControl>

<p>
Now that you have the basis for the new collection, you have to determine how to design the internal mechanisms of the collection itself. A good idea is to use an array for the collection members that you expose through methods. In this example, you are going to use an <b>Employee</b> array, as well as variables to keep track of the current number of elements the user has put in the array (size, or count), and the actual size of the array (known as capacity). You should also decide what constructors you want to support, if any. This scenario supports the zero-argument constructor, which sets the initial capacity of the collection to 16, although it doesn't have any elements yet.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// the internal deployment of the collection.
// Note that you have strongly typed it here to an Employee
private Employee[] _array;

private int _size;
private int _capacity;       // Last valid element in the collection

// the only constructor supported in this example.
// Often you would provide many constructors
public EmployeeCollection() {


	_array = new Employee[16];
	_capacity = 16;
	_size = 0;
}
</Tab>
<Tab Name="VB">
'  the internal deployment of the collection.
'  Note that you have strongly typed it here to an Employee
Private _array() As Employee

Private _size As Integer
Private _capacity As Integer '  Last valid element in the collection

'  the only constructor supported in this example.
'  Often you would provide many constructors
Public Sub New()
	MyBase.New()

	Redim _array(16)
	_capacity = 0
	_size = 0
End Sub
</Tab>
</Acme:TabControl>

<p>
Now that you know the variable used to store elements, the next step is to make the class that the first sample referenced in the <b>GetEnumerator</b> method. This class is going to implement <b>IEnumerator</b>, which has to support two methods and a property: <b>Reset</b>, <b>Current</b>, and <b>MoveNext</b>. There are fairly standard steps for what these methods should do, and in this sample, you are only going to look at <b>MoveNext</b> (the signatures for <b>Reset</b> and <b>Current</b> will be included, but not the code). The <b>MoveNext</b> method is invoked each time a user loops around a foreach (For Each) statement. In the <b>MoveNext</b> method, you keep a pointer to the current element of the collection, and move the pointer to the next element when called. <b>Current</b> will return the element when it is requested.
<p>
Note that in this example, you keep an internal representation of the collection, _ec, as well as the index of the current element. Also note that all these methods are invoked automatically: the user does need to know about them, they only need to know how to use foreach. 
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
//note that you implement IEnumerator
class EmployeeEnumerator : IEnumerator {

	private EmployeeCollection _ec;   // a copy of our collection
	private int _index;               // track the index of the current element
	private Object currentElement;    // the current element, returned by Current

	// our implementation of MoveNext
	public virtual bool MoveNext() {
		if (_index < 0) {  // check to see if you can take this action. False indicates
				   // that the MoveNext did not work
			currentElement = _ec._array;

			return false;
		}

		currentElement = _ec.GetElement(_index); // moved so reset current element
		_index++;                                // increase our index appropriately

		//once at the end of our collection, ensure the user cannot MoveNext
		if (_index == _ec._size) {
			_index = -1;
		}

		return true;
	}

	// these are the signatures for the other methods you need to use. See the
	// major sample for the code we placed in these methods
	public virtual void Reset() {}                 // resets the enumerator

	// do exception checking, and if all is OK, return the current element
	public virtual Object Current {}
}
</Tab>
<Tab Name="VB">
' note that you implement IEnumerator
Class EmployeeEnumerator : Implements IEnumerator

	Private _ec As EmployeeCollection '  a copy of our collection
	Private _index As Integer         '  track the index of the current element
	Private currentElement As Object  '  the current element, returned by Current

	'  our implementation of MoveNext
	Public Function MoveNext() As Boolean Implements IEnumerator.MoveNext
		If _index < 0 Then '  check to see if you can take this action. False indicates
				   '  that the MoveNext did not work
			currentElement = _ec._array

			return false
		End If

		currentElement = _ec.GetElement(_index)  '  moved so reset current element
		_index = _index + 1                      '  increase our index appropriately

		' once at the end of our collection, ensure the user cannot MoveNext
		If _index = _ec._size
			_index = -1
		End If

		return true
	End Function

	'  these are the signatures for the other methods you need to use. See the
	'  major sample for the code we placed in these methods
	Public Sub Reset() Implements IEnumerator.Reset ' simply resets the enumerator
					 '
	'  Do exception checking, and if all is OK, return the current element
	Public ReadOnly Property Current() As Object Implements IEnumerator.Current
End Class
</Tab>
</Acme:TabControl>

<p>
The next step is to determine what functionality you want the collection to provide. This is exposed through the methods you want to add to your collection. Be sure to consider the other interfaces you could implement (such as <b>IList</b>), because they might provide you with functionality that more closely matches your needs. <b>ICollection</b> is selected here purely for demonstration purposes. 
<p>
The following sample code demonstrates the <b>GetEmployee</b> method and the <b>Clear</b> method. See the major example for the other methods included (<b>AddEmployee</b> and <b>SetName</b>).
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// routine to return an employee, specified by id
public Employee GetEmployee(int id) {
	if (_size == 0) {
		throw new InvalidOperationException
				("You cannot get an employee when the collection is empty.");
	}



	foreach (Employee e in _array) { // loop through the array, searching for the employee
		if ( id == e.ID) {

			return e; // return the element found!
		}
	}

	return null;   // if the employee wasn't found, return null. Note that your user
		// documentation would explain that this is what you do in this scenario
}

public void Clear() { //clear the array
	if (_capacity > 0) {
		Array.Clear(_array, 0, _size); //clear the array
	}
	else {
		Array.Clear(_array, 0, _array.Length);
		Array.Clear(_array, 0, _capacity);
	}

	_capacity = 0; //reset the capacity, and size of the array
	_size = 0;
}
</Tab>
<Tab Name="VB">
'  routine to return a employee, specified by id
Public Function GetEmployee(id As Integer) As Employee
	If _size = 0 Then
		Throw New InvalidOperationException( _
				"You cannot get an employee when the collection is empty.")
	End If

	Dim e As Employee

	Fpr Each e In _array             '  loop through the array, searching for the employee
		If id = e.ID Then

			return e  '  return the element found!
		End If
	Next e

	return Nothing '  if the employee wasn't found, return null. Note that your user
		'  documentation would explain that this is what you do in this scenario
End Function

public Sub Clear()    ' clear the array
	If _capacity > 0 Then
		Array.Clear(_array, 0, _size)  ' simply clear the array

	Else
		Array.Clear(_array, 0, _array.Length)
		Array.Clear(_array, 0, _capacity)
	End If

	_capacity = 0  ' reset the capacity, and size of the array
	_size = 0
End Sub
</Tab>
</Acme:TabControl>

<p>
How do users now use the collection? Because  enumerator support (through <b>GetEnumerator</b>) is included, using a foreach (For Each) statement is supported. Users need to know what the collection can and can't do, but otherwise, they need to call the methods as expected. The following code example shows how a user would use the collection.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// declare the collection, using the default constructor provided
// it is a good idea to include many overloaded constructors, for all the items that can be set
EmployeeCollection ec = new EmployeeCollection();

Console.WriteLine("Adding elements to the EmployeeCollection");
ec.AddEmployee( 1234, "John" );
ec.AddEmployee( 5678, "Lisa" );
ec.AddEmployee( 3283, "Max" );
ec.AddEmployee( 1928, "Regina" );
ec.AddEmployee( 4019, "Clarence" );



foreach(Employee e in ec) // iterate over the collection using foreach
	Console.WriteLine(ec.GetEmployee(e.ID));

Console.WriteLine("Retrieving the employee with id 4019...");
Console.WriteLine(ec.GetEmployee(4019).ToString());

Console.WriteLine("Clearing the collection...");
ec.Clear();

Console.WriteLine("Setting the name of existing employee with id 5678...");
ec.SetName(5678, "Katherine");
</Tab>
<Tab Name="VB">
'  declare our collection, using the default constructor provided
'  its a good idea to include many overloaded constructors, for all the items that can be set
Dim ec As EmployeeCollection = New EmployeeCollection()

Console.WriteLine("Adding elements to the EmployeeCollection")
ec.AddEmployee( 1234, "John" )
ec.AddEmployee( 5678, "Lisa" )
ec.AddEmployee( 3283, "Max" )
ec.AddEmployee( 1928, "Regina" )
ec.AddEmployee( 4019, "Clarence" )

Dim e As Employee

For Each e In ec          '  iterate over the collection using foreach
	Console.WriteLine(ec.GetEmployee(e.ID))

Console.WriteLine("Retrieving the employee with id 4019...")
Console.WriteLine(ec.GetEmployee(4019).ToString())

Console.WriteLine("Clearing the collection...")
ec.Clear()

Console.WriteLine("Setting the name of existing employee with id 5678...")
ec.SetName(5678, "Katherine")
</Tab>
</Acme:TabControl>
<!-- #include virtual="/quickstart/howto/include/footer.inc" -->