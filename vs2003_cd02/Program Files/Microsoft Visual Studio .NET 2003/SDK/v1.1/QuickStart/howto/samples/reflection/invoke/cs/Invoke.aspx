<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Reflection" %>

<script language="C#" runat=server>

void Page_Load(Object source, EventArgs e) {

	output.Text = "<pre>" + Invoke.Go() + "</pre>";
}

class Invoke
{
   	public static string Go()
	{
		StringWriter strWriter = new StringWriter();
		Console.SetOut(strWriter);

		//Call a static method
		Type t = typeof (TestClass);

		Console.WriteLine();
		Console.WriteLine("Invoking a Static method");
		Console.WriteLine("---------------------------------");
		t.InvokeMember ("SayHello", BindingFlags.InvokeMethod, null, null, new object [] {});

		//Call an instance method
		TestClass c = new TestClass ();

		Console.WriteLine();
		Console.WriteLine("Invoking an Instance method");
		Console.WriteLine("---------------------------------");
		c.GetType().InvokeMember ("AddUp", BindingFlags.InvokeMethod, null, c, new object [] {});
		c.GetType().InvokeMember ("AddUp", BindingFlags.InvokeMethod, null, c, new object [] {});

		//Call a method with args
		object [] args = new object [] {100.09, 184.45};
		object result;

		Console.WriteLine();
		Console.WriteLine("Invoking a method with arguments/parameters");
		Console.WriteLine("---------------------------------");
		result = t.InvokeMember ("ComputeSum", BindingFlags.InvokeMethod, null, null, args);
		Console.WriteLine ("{0} + {1} = {2}", args[0], args[1], result);

		Console.WriteLine();
		Console.WriteLine("Invoking a Field (Setting and Getting)");
		Console.WriteLine("---------------------------------");
		//Get a field value
		result = t.InvokeMember ("Name", BindingFlags.GetField, null, c, new object [] {});
		Console.WriteLine ("Name == {0}", result);

		//Set a field
		t.InvokeMember ("Name", BindingFlags.SetField, null, c, new object [] {"NewName"});
		result = t.InvokeMember ("Name", BindingFlags.GetField, null, c, new object [] {});
		Console.WriteLine ("Name == {0}", result);

		Console.WriteLine();
		Console.WriteLine("Invoking an indexed Property (Setting and Getting)");
		Console.WriteLine("---------------------------------");
		//Get an indexed property value
		int  index = 3;
		result = t.InvokeMember ("Item", BindingFlags.GetProperty , null, c, new object [] {index});
		Console.WriteLine ("Item[{0}] == {1}", index, result);

		//Set an indexed property value
		index = 3;
		t.InvokeMember ("Item", BindingFlags.SetProperty, null, c, new object [] {index, "NewValue"});
		result = t.InvokeMember ("Item", BindingFlags.GetProperty , null, c, new object [] {index});
		Console.WriteLine ("Item[{0}] == {1}", index, result);

		Console.WriteLine();
		Console.WriteLine("Getting a field or property");
		Console.WriteLine("---------------------------------");
		//Get a field or property
		result = t.InvokeMember ("Name", BindingFlags.GetField | BindingFlags.GetProperty, null, c, new object [] {});
		Console.WriteLine ("Name == {0}", result);
		result = t.InvokeMember ("Value", BindingFlags.GetField | BindingFlags.GetProperty, null, c, new object [] {});
		Console.WriteLine ("Value == {0}", result);

		Console.WriteLine();
		Console.WriteLine("Invoking a method with named arguments");
		Console.WriteLine("---------------------------------");
		//Call a method using named arguments
		object[] argValues = new object [] {"Mouse", "Micky"};
		String [] argNames = new String [] {"lastName", "firstName"};
		t.InvokeMember ("PrintName", BindingFlags.InvokeMethod, null, null, argValues, null, null, argNames);

		Console.WriteLine();
		Console.WriteLine("Invoking a default member of a type");
		Console.WriteLine("---------------------------------");
		//Call the default member of a type
		Type t3 = typeof (TestClass2);
		t3.InvokeMember ("", BindingFlags.InvokeMethod, null, new TestClass2(), new object [] {});

		Console.WriteLine();
		Console.WriteLine("Invoking a Method with ByRef parameters");
		Console.WriteLine("---------------------------------");
		//Invoking a ByRef member
		MethodInfo m = t.GetMethod("Swap");
		args = new object[2];
		args[0] = 1;
		args[1] = 2;
		m.Invoke(new TestClass(),args);
		Console.WriteLine ("{0}, {1}", args[0], args[1]);

		return strWriter.ToString();
	}
}

public class TestClass
{
	public String Name;
	private Object [] values = new Object [] {0, 1,2,3,4,5,6,7,8,9};

	public Object this [int index]
	{
		get {
			return values[index];
		}
		set {
			values[index] = value;
		}
	}

	public Object Value {
		get
		{
			return "the value";
		}
	}

	public TestClass ()
	{
		Name = "initalName";
	}

	int methodCalled = 0;

	public static void SayHello ()
	{
		Console.WriteLine ("Hello");
	}

	public void AddUp ()
	{
		methodCalled++;
		Console.WriteLine ("AddUp Called {0} times", methodCalled);
	}

	public static double ComputeSum (double d1, double d2)
	{
		return d1 + d2;
	}

	public static void PrintName (String firstName, String lastName)
	{
		Console.WriteLine ("{0},{1}", lastName,firstName);
	}

	public void PrintTime ()
	{
		Console.WriteLine (DateTime.Now);
	}

	public void Swap(ref int a, ref int b)
	{
		int x = a;
		a = b;
		b = x;
	}
}

[DefaultMemberAttribute ("PrintTime")]
public class TestClass2
{
	public void PrintTime ()
	{
		Console.WriteLine (DateTime.Now);
	}
}

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