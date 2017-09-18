<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/basedatatypesheader.inc" -->

<h4>How Do I...Compare the value of two objects?</h4>

This sample illustrates how to compare any two values by using the <b>IComparable</b> interface that all
the base types implement. The <b>Max</b> method shown below returns
the maximum of any two values that implement <b>IComparable</b>. The <b>CompareTo</b> method on <b>IComparable</b>
has the following return values: < 0 if the value is less than the current
instance, == 0 (= 0 in VB) if the value is equal to the current instance, or
 > 0 if value is greater than the current instance. A custom implementation of <b>IComparable</b> is also shown.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/BaseDataTypes/compare/compare.src"
RunSample="/quickstart/howto/samples/BaseDataTypes/compare/CS/compare.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="C# Compare.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/BaseDataTypes/compare/compare.src"
RunSample="/quickstart/howto/samples/BaseDataTypes/compare/VB/compare.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB Compare.aspx"
runat="server" />
  </VbTemplate>
<CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/BaseDataTypes/compare/compare.src"
RunSample="/quickstart/howto/samples/BaseDataTypes/compare/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ Compare.exe"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>
<p>

To compare two objects to each other, they should implement the <b>IComparable</b> interface. This interface has a <b>CompareTo</b> method that allows you to compare one object to another and determine if one object is less than, greater than, or equal to another object. For the moment, assume you are dealing with string or numeric data, where the rules are already known.
<p>

The base data types all support the <b>IComparable</b> interface, which means they can all be compared to one another. The following code example demonstrates a fairly simple routine called Max, which accepts two objects, both of which support <b>IComparable</b>. Using the <b>CompareTo</b> method of those objects, you will do some standard comparisons to determine which one is the greater of the two (which is then returned out of the method). While what you pass into this routine are the objects you want to compare, inside the routine you only deal with the <b>IComparable</b> nature of those objects, which is why the data type of the return value and the parameters is <b>IComparable</b>, not <b>Object</b>. If you try to use this particular routine with objects that do not support <b>IComparable</b>, you will get a compile error.
<p> 

<Acme:TabControl runat="server">
<Tab Name="C#">
public static IComparable Max (IComparable val1,
			IComparable val2) {

	if (val1.CompareTo(val2) > 0) {
		return val1; // val1 > val2
	}

	if (val1.CompareTo(val2) < 0) {
		return val2; // val1 < val2
	}

	if (val1.CompareTo(val2) == 0) {
		return val1; // val1 == val2, return val1
	}
}
</Tab>
<Tab Name="VB">
Public Shared Function Max (val1 As IComparable , _
			val2 As IComparable) As IComparable

	If (val1.CompareTo(val2) > 0)
		Return val1  '  val1 > val2
        End If

	If (val1.CompareTo(val2) < 0)
		Return val2  '  val1 < val2
	End If

	If (val1.CompareTo(val2) = 0)
		Return val1  '  val1 = val2, return val1
	End If
End Function
</Tab>
<Tab Name="C++">
IComparable * Max (IComparable* val1, IComparable *val2)
{
	if (val1->CompareTo(val2) >	0) return val1;	//val1 > val2
	if (val1->CompareTo(val2) <	0) return val2;	//val1 < val2
	if (val1->CompareTo(val2) == 0)	return val1; //val1	== val2, return	val1 by	definition
	return 0;
}
</Tab>
</Acme:TabControl>

<p>

To use the above example, you can pass into the Max routine any two objects that support <b>IComparable</b>. You can flow through the Max routine yourself to determine which object will be passed back as the 'max'. Remember that the nature of how these objects are compared is defined within the objects themselves.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
Console.WriteLine ( Max (5, 10) );            // comparing integers
Console.WriteLine ( Max (4.3, 2.5) );         // comparing doubles
Console.WriteLine ( Max ("Mathew", "Mary") ); // comparing strings
</Tab>
<Tab Name="VB">
Console.WriteLine ( Max (5, 10) )             '  comparing integers
Console.WriteLine ( Max (4.3, 2.5) )          '  comparing doubles
Console.WriteLine ( Max ("Mathew", "Mary") )  '  comparing strings
</Tab>
<Tab Name="C++">
Console::WriteLine ("{0,-35} {1}", S"Comparing Integers:Max (5, 10) =", Max (__box(5),	__box(10)));
Console::WriteLine ("{0,-35} {1}", S"Comparing Doubles:	Max (4.3, 2.5)	=",Max	(__box(4.3), __box(2.5)));
Console::WriteLine ("Comparing Strings:	Max ({0}, {1})	={2}",s1, s2, Max (s1,s2));
</Tab>
</Acme:TabControl>

<p>
To compare your own objects, you need to implement the <b>IComparable</b> interface on your object. Then, you need to create a <b>CompareTo</b> method inside your object, which defines the rules for comparing your object to other objects. Often, you will want to compare your object only to other objects of the same type. For instance, how do you compare a car object to a tree object? You might suggest comparing the weights of the objects, but you could also compare the shape or color of the objects. This is what you need to decide when defining the <b>CompareTo</b> method, and unless you are certain that comparisons to other types are acceptable, you should inform the user that such comparisons are not supported, or are undefined.
<p>
In the next sample, you make an object that implements the <b>IComparable</b> interface, and also defines a <b>CompareTo</b> method for comparing itself to other objects. Note that you can only compare this object to its own data type, and not other data types. If the comparable object is not <b>MyType</b>, an <b>ArgumentException</b> is thrown.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
class MyType : IComparable {

	private int _value;

	public MyType (int value) {

        	_value = value;
	}

	public int CompareTo (object o) {

		if (!(o is MyType)) {
			throw new ArgumentException ("o must be of type 'MyType'");
		}

		MyType v = (MyType) o;

		return _value - v._value;
	}

	override public string ToString () {

		return String.Format ("MyType({0})", _value);
	}
}
</Tab>
<Tab Name="VB">
Public Class MyType : Implements IComparable

	Private _value As Integer

	Public Sub New(value As Integer)
		MyBase.New()
		_value = value
	End Sub

	Public Function CompareTo (o As Object) As Integer _
				Implements IComparable.CompareTo
		If (Not (TypeOf(o) is MyType))
			Throw New ArgumentException ("o must be of type 'MyType'")
		End If

		Dim v As MyType = CType (o, MyType)

		Return _value - v._value
	End Function

	Overrides Public Function  ToString () As String

		Return String.Format ("MyType({0})", _value)
	End Function
End Class
</Tab>
<Tab Name="C++">
__gc class MyType :	public IComparable
{
	int _value;
public:
	MyType (int	value)
	{
		_value = value;
	}
	int CompareTo (Object*	o)
	{

		MyType*	v =	 __try_cast<MyType *>(o);;
		return _value -	v->_value;
	}
	String*	ToString ()
	{
		return String::Format ("MyType({0})", __box(_value));
	}
};
</Tab>
</Acme:TabControl>

<p>
Now that you have defined the object, you can use the above Max routine for the base data types. The following sample compares two objects of <b>MyType</b>. It's a good idea to flow through the logic, and see how the <b>IComparable</b> interface is used within the <b>Max</b> method, to compare one of the objects to the other. Note that inside the <b>Max</b> method, you invoke <b>CompareTo</b> on the <b>MyType</b> object.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
MyType t1 = new MyType (12);
MyType t2 = new MyType (17);

Console.WriteLine ( Max (t1, t2) ); // comparing MyTypes
</Tab>
<Tab Name="VB">
Dim t1 As MyType = new MyType (12)
Dim t2 As MyType = new MyType (17)

Console.WriteLine ( Max (t1, t2) )  '  comparing MyTypes
</Tab>
<Tab Name="C++">
MyType *t1 = new MyType (12);
MyType *t2 = new MyType	(17);
Console::WriteLine ("Comparing Custom Types:Max ({0}, {1}) ={2}",t1,t2, Max (t1,t2)); // comparing MyTypes
</Tab>
</Acme:TabControl>

<p>

<H4>Summary</H4>

All the base data types can be compared because they support the <b>IComparable</b> interface. To compare objects, use the <b>CompareTo</b> method on one of the objects, passing the object you want to compare as a parameter. The rules for the comparison are defined by the <b>CompareTo</b> method for the object in question. You can create your own objects that may be compared to each other by implementing the <b>IComparable</b> interface on the object, and defining a <b>CompareTo</b> method within it.

<!-- #include virtual="/quickstart/howto/include/footer.inc" -->

