<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/basedatatypesheader.inc" -->

<h4>How Do I...Sort an array?</h4>

This sample illustrates sorting the elements in an array. Using the <b>Array.Sort</b> method,
you can sort any array whose elements implement the <b>IComparable</b> interface. You can
also sort arrays of your own types as long as they implement <b>IComparable</b>.
If a type does not implement <b>IComparable</b> (or if you want to customize the
sort order) you can still use <b>Array.Sort</b> if you provide a Comparer, such as
the <b>MyTypeNameComparer</b> shown in this sample.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/BaseDataTypes/Sort/sort.src"
RunSample="/quickstart/howto/samples/BaseDataTypes/Sort/CS/sort.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="C# Sort.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/BaseDataTypes/Sort/sort.src"
RunSample="/quickstart/howto/samples/BaseDataTypes/Sort/VB/sort.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB Sort.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/BaseDataTypes/Sort/sort.src"
RunSample="/quickstart/howto/samples/BaseDataTypes/Sort/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ Sort.exe"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
Sorting is a standard basic function of any group of objects or data. In the following examples, sorting is performed specifically on an array. Most data types can be sorted when they are stored in an array, as long as they support the <b>IComparable</b> interface. The easiest way to sort an array is to call the <b>Sort</b> method, passing in the array you want to sort. The following code example illustrates populating an array with names, and then calling the <b>Sort</b> method to organize those names in alphabetical, ascending order.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
string [] stringArray={"Michael", "mary", "Robert",
		"Abigail", "lorne", "Therese", "terrence", "Samantha"};

Array.Sort(stringArray);
</Tab>
<Tab Name="VB">
Dim stringArray() As String ={"Michael", "mary", "Robert", _
		"Abigail", "lorne", "Therese", "terrence", "Samantha"}

Array.Sort(stringArray)
</Tab>
<Tab Name="C++">
String*  stringArray[]={"Michael", "mary", "Robert",
		"Abigail", "lorne", "Therese", "terrence", "Samantha"};
Array::Sort(stringArray, Comparer::Default);
</Tab>
</Acme:TabControl>

<p>
If you want to sort your array in descending order, call the <b>Sort</b> method, and then call the <b>Reverse</b> method, passing in the array you want to  sort in each case. Note that calling <b>Reverse</b> reverses the existing entries in the array. To get a descending array, you need to sort the array before reversing it.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
int [] intArray = { 43, 12, 1, 17, 23, 36, 11 };

Array.Sort(intArray);
Array.Reverse(intArray);
</Tab>
<Tab Name="VB">
Dim intArray() As Integer = {43, 12, 1, 17, 23, 36, 11}

Array.Sort(intArray)
Array.Reverse(intArray)
</Tab>
<Tab Name="C++">
int intArray __gc[] ={43, 12, 1, 17, 23, 36, 11};

Array::Sort(intArray);
Array::Reverse(intArray);
</Tab>
</Acme:TabControl>
<p>

You might want to sort more than predefined data types. What if you have defined your own class and want to sort an array of members of that class? To do this, implement the <b>IComparable</b> interface on that class, and then define the rule for comparing an instance of that class to other objects. Generally, you can do this by selecting a variable inside that class that can be used to determine the way your class should be sorted (for example, you might want to sort by 'LastName' for the class 'Employee').<P>

The following code example defines <b>MyType</b>, which has two pieces of information: name and age. In this case, the sort mechanism is based on age. You need to include a <b>CompareTo</b> method, and define the rules for comparison in that method. When one object is compared to another, the return value from this method is used to determine whether the object being compared is greater than or less than the current object (a negative value indicates the comparing object is less than the current object).
<P>

<Acme:TabControl runat="server">
<Tab Name="C#">
// using statements...
using System;
using System.Collections;

class MyType : IComparable {

	// Property, method, and field declarations...
	// included are an Age, and a Name property

	public int CompareTo (object o) {

	        if (!(o is MyType)) {
			throw new ArgumentException ("o must be of type 'MyType'");
		}

	        MyType v = (MyType) o;
        	return _age - v._age;
	}
}
</Tab>
<Tab Name="VB">
'  imports statements...
Imports System
Imports System.Collections

Class MyType: Implements IComparable

	'  Property, method, and field declarations...
	'  included are an Age, and a Name property

	Public Function CompareTo (ByVal o as Object) As Integer _
				Implements IComparable.CompareTo
		If Not (TypeOf o Is MyType) Then
			throw new ArgumentException ("o must be of type 'MyType'")
		End If

	        Dim v As MyType = CType(o, MyType)
	        CompareTo = _age - v._age
	End Function
End Class
</Tab>
<Tab Name="C++">
// using statements...
using namespace System;
using namespace System::Collections;

__gc class MyType : public IComparable
{
	int _age;
	String* _name;

public:
	MyType (String* incName, int incAge)
	{
		_name = incName;
		_age = incAge;
	}

	__property String*  get_Name() {return  _name ;  }
	__property int get_Age() {   return  _age ; }

	int CompareTo (Object* o) 
	{
		MyType*  v = __try_cast<MyType*> (o);
		return _age - v->_age;
	}
}; 
</Tab>
</Acme:TabControl>
<p>

To sort members of this class, populate an array with entries and call the <b>Array.Sort</b> method. Because you implemented the <b>IComparable</b> interface, <b>Sort</b> knows to use the <b>CompareTo</b> method of the class to determine how to sort the array.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
MyType[] myTypeArray = new MyType [] {new MyType("Max",23),
		new MyType("Lisa",47), new MyType("Andrea",35),
		new MyType("Mel",29), new MyType("Andrew",32), new MyType("Ahmed",35)};

Array.Sort(myTypeArray);
</Tab>
<Tab Name="VB">
Dim myTypeArray() As MyType = New MyType() { New MyType("Max",23), _
		New MyType("Lisa",47), New MyType("Andrea",35), _
		New MyType("Mel",29), New MyType("Andrew",32), New MyType("Ahmed",35) }

Array.Sort(myTypeArray)
</Tab>
<Tab Name="C++">
MyType* myTypeArray[] = new MyType [] {new MyType("Max",23),
		new MyType("Lisa",47), new MyType("Andrea",35),
		new MyType("Mel",29), new MyType("Andrew",32), new MyType("Ahmed",35)};

Array::Sort(myTypeArray);
</Tab>
</Acme:TabControl>

<p>

The <b>Sort</b> method can also accept a class defining the comparison mechanism to apply to that array, if you want to override the default sorting that will be provided. You can make your own comparison mechanism by defining a class that implements the <b>IComparer</b> interface. By defining a comparer in this manner, you can specify different sorting techniques.<P>

The following code example defines a comparer that allows you to compare the names, rather than ages, inside the <b>MyType</b> class. This means that you won't be able to apply the comparer to other classes, but you can define different modes of sorting this specific object.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
class MyTypeNameComparer: IComparer {

	public int Compare (object x, object y) {


	        if (!(x is MyType && y is MyType)) {
				throw new ArgumentException
				("The objects to compare must be of type 'MyType'");
		}

		string tempObj1 = ((MyType)x).Name;
		string tempObj2 = ((MyType)y).Name;

		return tempObj1.ToString().CompareTo (tempObj2.ToString ());
	}
}
</Tab>
<Tab Name="VB">
class MyTypeNameComparer: Implements IComparer

 	Public Function CompareTo(ByVal x As Object, ByVal y As Object) As Integer _
				Implements IComparer.Compare

		If Not (TypeOf x is MyType And TypeOf y is MyType) Then
				Throw New ArgumentException _
				("The objects to compare must be of type 'MyType'")
		End If

		Dim tempObj1 As String = CType(x, MyType).Name
		Dim tempObj2 As String = CType(y, MyType).Name

		CompareTo = tempObj1.ToString().CompareTo (tempObj2.ToString ())
	End Function
End Class
</Tab>
<Tab Name="C++">

__gc class MyTypeNameComparer: public IComparer
{
public:
	int Compare (Object * x, Object * y) 
	{

		String* tempObj1 = (__try_cast<MyType*>(x))->Name;
		String* tempObj2 = (__try_cast<MyType*>(y))->Name;

		return tempObj1->ToString()->CompareTo (tempObj2->ToString ());
	}
};
</Tab>
</Acme:TabControl>
<p>

To use the comparer, you have to pass <b>Array.Sort</b> the comparer as the second parameter. After it is sorted, you can use a foreach (For Each in VB) statement to iterate through the array, and print out the elements to the Console, formatting the information for easier reading.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
Array.Sort(myTypeArray, new MyTypeNameComparer());



foreach( MyType t in myTypeArray) {
	Console.WriteLine("Name = {0, -7}, Age = {1}", t.Name, t.Age);
}
</Tab>
<Tab Name="VB">
Array.Sort(myTypeArray, new MyTypeNameComparer())

Dim t As MyType

For Each t in myTypeArray
	Console.WriteLine("Name = {0, -7}, Age = {1}", t.Name, t.Age)
Next t
</Tab>
<Tab Name="C++">
Array::Sort(myTypeArray, new MyTypeNameComparer());


for(int i=0;i<myTypeArray->Length;i++)
{
    Console::WriteLine("Name = {0,-7}, Age = {1}", myTypeArray[i]->Name, __box(myTypeArray[i]->Age));
}
</Tab>
</Acme:TabControl>
<p>

Note that the <b>Sort</b> method also allows you to sort only a specified section of an array. See the .NET Framework SDK for more information on <b>Sort</b>, <b>Reverse</b>, and other <b>Array</b> functions.

<p>

<H4>Summary</H4>
<OL>
<LI>To sort a set of like elements (specifically, an array) in ascending order, use the <b>Sort</b> method on an array.<BR>
The basis of the sort used will be the datatype of the elements in the array (datatype of the array).
<LI>To sort the elements of an array in descending order, use the <b>Sort</b> method, followed by the <b>Reverse</b> method.
<LI>To sort your own arrays of objects, implement the <b>IComparable</b> interface on that object.<BR>
You have to define a <b>CompareTo</b> method inside your object in order to specify how this object should be compared.<BR>
<LI>To define a specific way to compare objects, create a class that implements the <b>IComparer</b> interface.<BR>
Inside this class, you must include a <b>Compare</b> method that accepts two objects to  compare.<BR>
It helps to know how you want to compare those objects, and which objects should be allowed to use the interface you define.

</LI></OL>

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->
</xml>

