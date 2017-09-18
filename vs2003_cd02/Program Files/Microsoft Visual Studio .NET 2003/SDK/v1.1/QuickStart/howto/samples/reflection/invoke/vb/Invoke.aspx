<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Reflection" %>

<%@ Page Language="VB" Debug="true" %>

<script language="VB" runat=server>

Sub Page_Load(Source As Object, E As EventArgs)

	output.Text = "<pre>" & Invoke.Go() & "</pre>"
End Sub

Public class Invoke

   	public shared Function Go() As String

		Dim strWriter As StringWriter = New StringWriter()
		Console.SetOut(strWriter)

		'Call a static method
		Dim t As Type
		t = GetType (TestClass)

		Console.WriteLine()
		Console.WriteLine("Invoking a Static method")
		Console.WriteLine("---------------------------------")
		t.InvokeMember ("SayHello", BindingFlags.InvokeMethod, nothing, nothing, new object () {})

		'Call an instance method
		Dim c as TestClass
		c = new TestClass ()

		Console.WriteLine()
		Console.WriteLine("Invoking an Instance method")
		Console.WriteLine("---------------------------------")
		c.GetType().InvokeMember ("AddUp", BindingFlags.InvokeMethod, nothing, c, new object () {})
		c.GetType().InvokeMember ("AddUp", BindingFlags.InvokeMethod, nothing, c, new object () {})

		'Call a method with args
		Dim args as object ()
		args = new object () {100.09, 184.45}
		Dim result As object

		Console.WriteLine()
		Console.WriteLine("Invoking a method with arguments/parameters")
		Console.WriteLine("---------------------------------")
		result = t.InvokeMember ("ComputeSum", BindingFlags.InvokeMethod, nothing, nothing, args)
		Console.WriteLine ("{0} + {1} = {2}", args(0), args(1), result)

		Console.WriteLine()
		Console.WriteLine("Invoking a Field (Setting and Getting)")
		Console.WriteLine("---------------------------------")
		'Get a field value
		result = t.InvokeMember ("Name", BindingFlags.GetField, nothing, c, new object () {})
		Console.WriteLine ("Name == {0}", result)

		'Set a field
		t.InvokeMember ("Name", BindingFlags.SetField, nothing, c, new object () {"NewName"})
		result = t.InvokeMember ("Name", BindingFlags.GetField, nothing, c, new object () {})
		Console.WriteLine ("Name == {0}", result)

		Console.WriteLine()
		Console.WriteLine("Invoking an indexed Property (Setting and Getting)")
		Console.WriteLine("---------------------------------")
		'Get an indexed property value
		Dim  index As Int32
		index = 3
		result = t.InvokeMember ("Item", BindingFlags.GetProperty , nothing, c, new object () {index})
		Console.WriteLine ("Item[{0}] == {1}", index, result)

		'Set an indexed property value
		index = 3
		t.InvokeMember ("Item", BindingFlags.SetProperty, nothing, c, new object () {index, "NewValue"})
		result = t.InvokeMember ("Item", BindingFlags.GetProperty , nothing, c, new object () {index})
		Console.WriteLine ("Item[{0}] == {1}", index, result)

		Console.WriteLine()
		Console.WriteLine("Getting a field or property")
		Console.WriteLine("---------------------------------")
		'Get a field or property
		result = t.InvokeMember ("Name", BindingFlags.GetField Or BindingFlags.GetProperty, nothing, c, new object () {})
		Console.WriteLine ("Name == {0}", result)
		result = t.InvokeMember ("Value", BindingFlags.GetField Or BindingFlags.GetProperty, nothing, c, new object () {})
		Console.WriteLine ("Value == {0}", result)

		Console.WriteLine()
		Console.WriteLine("Invoking a method with named arguments")
		Console.WriteLine("---------------------------------")
		'Call a method using named arguments
		dim argValues as object()
		argValues = new object () {"Mouse", "Micky"}
		dim argNames as String ()
		argNames = new String () {"lastName", "firstName"}
		t.InvokeMember ("PrintName", BindingFlags.InvokeMethod, nothing, nothing, argValues, nothing, nothing, argNames)

		Console.WriteLine()
		Console.WriteLine("Invoking a default member of a type")
		Console.WriteLine("---------------------------------")
		'Call the default member of a type
		Dim t3 As Type
		t3 = GetType (TestClass2)
		t3.InvokeMember ("", BindingFlags.InvokeMethod, nothing, new TestClass2(), new object () {})

		Console.WriteLine()
		Console.WriteLine("Invoking a Method with ByRef parameters")
		Console.WriteLine("---------------------------------")
		'Invoking a ByRef member
		Dim m as MethodInfo
		m = t.GetMethod("Swap")
		args = new object() {CObj(1), CObj(2)}

		m.Invoke(new TestClass(),args)
		Console.WriteLine ("{0}, {1}", args(0), args(1))

		return strWriter.ToString()
	End Function
End Class


public class TestClass

	public Name As String
	private values () As Object  = new Object () {0, 1,2,3,4,5,6,7,8,9}

	public Property Item (index As Int32) As Object
		Get
			return values(index)
		End Get
		Set
			values(index) = value
		End Set

	End Property

	public ReadOnly Property  Value as Object
		Get

			return "the value"
		End Get
	End Property

	Public Sub New()
		MyBase.New()
		Name = "initalName"
	End Sub

	Shared methodCalled as Int32 = 0

	Public Shared Sub SayHello ()
		Console.WriteLine ("Hello")
	End Sub

	Public Shared Sub AddUp ()
		methodCalled = methodCalled + 1
		Console.WriteLine ("AddUp Called {0} times", methodCalled)
	End Sub


	Public Shared Function  ComputeSum (d1 as double , d2 as double) as Double

		return d1 + d2
	End Function

	public Shared Sub PrintName (firstName as String , lastName as String )

		Console.WriteLine ("{0},{1}", lastName,firstName)
	End Sub

	public Shared Sub PrintTime ()

		Console.WriteLine (DateTime.Now)
	End Sub

	public Shared Sub Swap(ByRef a As Int32 , ByRef b as Int32)

		Dim x as Int32
		x = a
		a = b
		b = x
	End Sub
End Class

<DefaultMemberAttribute ("PrintTime")> public class TestClass2

	public Sub PrintTime ()
		Console.WriteLine (DateTime.Now)
	End Sub

End Class

</script>


<html>
<head>
          <link rel="stylesheet" href="intro.css">
</head>

<body style="background-color:f6e4c6">
    <p>

    <table>
    <tr align=left><td><b>The following example illustrates how to use the reflection classes to dynamically invoke methods.</b> The InvokeMember method on the Type object is used to specify the name of a method to invoke, as well as its style (instance/static) and any parameters required. In this demonstration, you can also learn how to dynamically invoke fields and properties, or use the MemberInfo object to dynamically invoke a method requiring parameters to be passed by reference. Please see the code creating this page to see how the output was achieved.
		<hr>
    </td></tr>

    <tr><td><h4><asp:label id="output" runat="server"/></h4></td></tr>
    </table>

</body>
</html>