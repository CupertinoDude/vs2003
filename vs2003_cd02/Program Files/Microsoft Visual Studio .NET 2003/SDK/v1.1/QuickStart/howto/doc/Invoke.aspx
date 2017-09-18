<%@ Register TagPrefix="Acme" Namespace="Acme" Assembly="QSTools" %>
<%@ Register TagPrefix="Acme" TagName="SourceRef" Src="/quickstart/howto/util/SrcRef.ascx"%>

<!-- #include virtual="/quickstart/howto/include/reflectionheader.inc" -->

<h4>How Do I...Invoke methods?</h4>

This sample illustrates how to invoke different kinds of methods through reflection. Because the names of the methods being invoked are stored in strings, this mechanism provides the capability to specify methods to be invoked at runtime, rather than at design-time, providing the scope to give your users control over which particular method gets called. Although this demonstration focuses on invoking methods, you can also set and get properties and fields, if required. For another active demonstration of this topic, please see the example under the topic <A HREF="/quickstart/howto/doc/math.aspx">How Do I...Use mathematical functions?</A>.
<p>

<Acme:LangSwitch runat="server">
  <CsTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/reflection/invoke/invoke.src"
RunSample="/quickstart/howto/samples/reflection/invoke/CS/invoke.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="C# ListMembers.aspx"
runat="server" />
  </CsTemplate>
  <VbTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/reflection/invoke/invoke.src"
RunSample="/quickstart/howto/samples/reflection/invoke/VB/invoke.aspx"
Icon = "/quickstart/images/genicon.gif"
Caption="VB ListMembers.aspx"
runat="server" />
  </VbTemplate>
  <CpTemplate>
<Acme:SourceRef
ViewSource="/quickstart/howto/samples/reflection/invoke/invoke.src"
RunSample="/quickstart/howto/samples/reflection/invoke/CP"
Icon = "/quickstart/images/genicon.gif"
Caption="C++ ListMembers.exe"
MapRunSamplePath=true
runat="server" />
  </CpTemplate>
</Acme:LangSwitch>

<p>
In many coding scenarios, you know the task that you want to carry out before you want to do it. Therefore, you can specify the methods that you need to invoke, and the parameters you need to pass them. However, there are also situations where you might want to dynamically invoke methods, based upon specific scenarios, or user actions. This capability is available through the <b>Reflection</b> namespace, by using the <b>InvokeMember</b> method on the <b>Type</b> object.
<p>

You can also take other actions, such as getting or setting the value of a specified property. These actions are available through the <b>BindingFlags</b> enumeration. The second parameter of <b>InvokeMethod</b> is a combination of the <b>BindingFlags</b> actions you specify. For example, if you want to invoke a static method on a class, you would include the static element in <b>BindingFlags</b>, and the <b>InvokeMethod BindingFlag</b>. The following example demonstrates how to invoke a hypothetical method called SayHello, where SayHello is a static method.

<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// calling a static method, receiving no arguments

// don't forget that we are using object in the reflection namespace...
using System;
using System.Reflection;

public class Invoke {

	public static void Main (String [] cmdargs) {

		// Declare a type object, used to call our InvokeMember method...
		Type t = typeof (TestClass);

		// BindingFlags has three bitor'ed elements. Default indicates
		// that default binding rules should be applied.
		t.InvokeMember ("SayHello",
				BindingFlags.Default | BindingFlags.InvokeMethod
				| BindingFlags.Static, null,
				null, new object [] {});
	}
}
</Tab>
<Tab Name="VB">
'  calling a static method, receiving no arguments

'  don't forget that we are using object in the reflection namespace...
Imports System
Imports System.Reflection

Public Class Invoke

	Public Shared Sub Main ()

		'  Declare a type object, used to call our InvokeMember method...
		Dim t As Type = GetType (TestClass)

		'  BindingFlags has three bitor'ed elements. Default indicates that
		'  default binding rules should be applied.
		t.InvokeMember ("SayHello", _
				BindingFlags.Default BitOr BindingFlags.InvokeMethod _
				BitOr BindingFlags.Static, nothing, _
				nothing, new object () {})
	End Sub
End Class
</Tab>
<Tab Name="C++">
// calling a static method, receiving no arguments

// don't forget that we are using object in the reflection namespace...
using namespace System;
using namespace System::Reflection;

class Invoke {
	void Main (String [] * cmdargs){
		// Declare a type object, used to call our InvokeMember method...
		Type *t = __typeof (TestClass);
		// BindingFlags has three bitor'ed elements. Default indicates that
		// default binding rules should be applied.
		t->InvokeMember ("SayHello", BindingFlags::InvokeMethod, NULL, NULL, NULL);
	}

}

</Tab>
</Acme:TabControl>

<p>
Take a quick look at the rest of the parameters that were passed to the <b>Invoke</b> method. The first null argument passed is requesting that the default binder be used to bind the method you are invoking. When you invoke the default binder, include the default <b>BindingFlags</b>. Instead of null as the third parameter, you can specify a <b>Binder</b> object that defines a set of properties and enables binding, which may involve selection of an overloaded method or coercion of argument types. The second null argument is the object on which to invoke the method you chose. Finally, pass an object array of the arguments that the member receives. In this case, the SayHello method receives no arguments, therefore we pass an empty array.

<p>
Here is a slightly different stuation. Call another static method called ComputeSum, but in this case, the method needs two arguments. Therefore populate an object array with those arguments, and pass them into <b>InvokeMember</b> as the last parameter.

<p>


<Acme:TabControl runat="server">
<Tab Name="C#">
// Calling a static method, which needs arguments
object [] args = new object [] {100.09, 184.45};


// we know that this particular method returns a value, being the computed sum,
// so we create a variable to hold the return
// note the datatype of the return is object, the only datatype InvokeMethod returns...
object result;

// invoke the method. Note the change in the last parameter: the array we populated...
result = t.InvokeMember ("ComputeSum", BindingFlags.Default | _
		BindingFlags.InvokeMethod | BindingFlags.Static,
		null, null, args);

// write the results to the user's console...
Console.WriteLine ("{0} + {1} = {2}", args[0], args[1], result);
</Tab>
<Tab Name="VB">
'  Calling a static method, which needs arguments
Dim args as object ()
args = new object () {100.09, 184.45}

'  we know that this particular method returns a value, being the computed sum,
'  so we create a variable to hold the return
'  note the datatype of the return is object, the only datatype InvokeMethod returns...
Dim result As object

'  invoke the method. Note the change in the last parameter: the array we populated...
result = t.InvokeMember ("ComputeSum", BindingFlags.Default BitOr _
		BindingFlags.InvokeMethod BitOr BindingFlags.Static, _
		nothing, nothing, args)

'  write the results to the user's console...
Console.WriteLine ("{0} + {1} = {2}", args(0), args(1), result)
</Tab>
<Tab Name="C++">
// Calling a static method, which needs arguments
Object *args[] = {__box(100.09), __box(184.45)};


// we know that this particular method returns a value, being the computed sum,
// so we create a variable to hold the return
// note the datatype of the return is object, the only datatype InvokeMethod returns...
Object *result;


// invoke the method. Note the change in the last parameter: the array we populated...
result = t->InvokeMember (S"ComputeSum", BindingFlags::InvokeMethod, NULL, NULL, args);

</Tab>
</Acme:TabControl>

<p>
In the previous two examples, you have invoked static methods. You can also invoke instance methods. To do this,  pass in an object of the type of which you want to invoke your method on as the third parameter. This example also demonstrates that you do not have to have an actual <b>Type</b> object to use <b>InvokeMember</b>. In this case, you will generally want to use the class instance you have to call GetType, as in the following example. Note that the <b>BindingFlags</b> have changed, now that we are not invoking a static method.

<Acme:TabControl runat="server">
<Tab Name="C#">
// Calling  an instance method
// we need an object reference to invoke an instance member
TestClass c = new TestClass ();


// use the instance of our class to call GetType
// we no longer include the Static element in BindingFlags for our |
// the fourth parameter is no longer null: we instead pass an instance
// of the object we wish to invoke our method on
c.GetType().InvokeMember ("AddUp", BindingFlags.Default | BindingFlags.InvokeMethod,
			null, c, new object [] {});
c.GetType().InvokeMember ("AddUp", BindingFlags.Default | BindingFlags.InvokeMethod,
			null, c, new object [] {});
</Tab>
<Tab Name="VB">
'  Calling  an instance method
'  we need an object reference to invoke an instance member
Dim c as TestClass
c = new TestClass ()

'  use the instance of our class to call GetType
'  we no longer include the Static element in BindingFlags for our bitor
'  the fourth parameter is no longer null: we instead pass an instance
'  of the object we wish to invoke our method on
c.GetType().InvokeMember ("AddUp", BindingFlags.Default BitOr BindingFlags.InvokeMethod, _
			nothing, c, new object () {})
c.GetType().InvokeMember ("AddUp", BindingFlags.Default BitOr BindingFlags.InvokeMethod, _
			nothing, c, new object () {})
</Tab>
<Tab Name="C++">
// Calling  an instance method
// we need an object reference to invoke an instance member
TestClass *c = new TestClass ();


// use the instance of our class to call GetType
// we no longer include the Static element in BindingFlags for our |
// the fourth parameter is no longer null: we instead pass an instance
// of the object we wish to invoke our method on
c->GetType()->InvokeMember (S"AddUp", BindingFlags::InvokeMethod, NULL, c, NULL);
c->GetType()->InvokeMember (S"AddUp", BindingFlags::InvokeMethod, NULL, c, NULL);
</Tab>
</Acme:TabControl>

<p>
Sometimes you will not want to invoke methods, but will instead need to invoke other members, such as properties or fields. To achieve this, simply alter your <b>BindingFlags</b> combination to include the appropriate element, rather than <b>InvokeMethod</b>. The following example demonstrates getting and setting a field value. The field in question is not static, therefore we need to create an instance of an object to request the field. When setting a field value, you need to pass the value you are setting as the only element of our object array parameter. When getting the value, you need to assign the return type from the <b>InvokeMember</b> method to an object.

<Acme:TabControl runat="server">
<Tab Name="C#">
// Setting a field. Assume we are using the same Type and Class declared in the
// previous examples (t and c). The field we are setting is the Name field
// note the BindingFlags argument now includes SetField rather thanInvokeMember
// Further, this is an instance field, so we pass the instance of our class
t.InvokeMember ("Name", BindingFlags.Default | BindingFlags.SetField,
		null, c, new object [] {"NewName"});

// similar usage...
result = t.InvokeMember ("Name", BindingFlags.Default | BindingFlags.GetField,
		null, c, new object [] {});

Console.WriteLine ("Name == {0}", result);
</Tab>
<Tab Name="VB">
'  Setting a field. Assume we are using the same Type and Class declared in the
'  previous examples (t and c). The field we are setting is the Name field
'  note the BindingFlags argument now includes SetField rather thanInvokeMember
'  Further, this is an instance field, so we pass the instance of our class
t.InvokeMember ("Name", BindingFlags.Default BitOr BindingFlags.SetField, _
		nothing, c, new object () {"NewName"})

'  similar usage...
result = t.InvokeMember ("Name", BindingFlags.Default BitOr BindingFlags.GetField, _
		nothing, c, new object () {})

Console.WriteLine ("Name == {0}", result)
</Tab>
<Tab Name="C++">
// Setting a field. Assume we are using the same Type and Class declared in the
// previous examples (t and c). The field we are setting is the Name field
// note the BindingFlags argument now includes SetField rather thanInvokeMember
// Further, this is an instance field, so we pass the instance of our class
t->InvokeMember (S"Name", BindingFlags::GetField, NULL, c, NULL);

// similar usage...
result = t->InvokeMember (S"Name", BindingFlags::GetField, NULL, c, NULL);
Console::WriteLine (S"Name == {0}", result);;
</Tab>
</Acme:TabControl>

<p>

You can also get and set a property, but in this example, imagine that the property you are setting is an array or collection, which has multiple elements. To specifiy the setting of a particular element, you need to specify which index. To set a property, assign the BindingFlags.SetProperty. To specify an index of a collection or array for the property, place the index value of the element you want to set in the first element of the object array, then the value you want to set as the second element. To get the property back out, pass the index as the only element in the object array, specifying BindingFlags.GetProperty.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// Set an indexed property value
int index = 3;

// specify BindingFlags.SetProperty, and because this is an instance property,
// pass the object to call the property on (c). In the object array, make two elements,
// the first being the index, and the second being the value to set
t.InvokeMember ("Item", BindingFlags.Default |BindingFlags.SetProperty,
			null, c, new object [] {index, "NewValue"});

// Get an indexed property value
// specify BindingFlags.GetProperty, and because this is an instance property,
// pass the object to call the property on (c). In the object array, specify the index only
result = t.InvokeMember ("Item", BindingFlags.Default |BindingFlags.GetProperty,
			null, c, new object [] {index});

Console.WriteLine ("Item[{0}] == {1}", index, result);
</Tab>
<Tab Name="VB">
' Set an indexed property value
Dim  index As Int32 = 3

'  specify BindingFlags.SetProperty, and because this is an instance property,
'  pass the object to call the property on (c). In the object array, make two elements,
'  the first being the index, and the second being the value to set
t.InvokeMember ("Item", BindingFlags.Default BitOr BindingFlags.SetProperty, _
			nothing, c, new object () {index, "NewValue"})

'  Get an indexed property value
'  specify BindingFlags.GetProperty, and because this is an instance property,
'  pass the object to call the property on (c). In the object array, specify the index only
result = t.InvokeMember ("Item", BindingFlags.Default BitOr BindingFlags.GetProperty, _
			nothing, c, new object () {index})

Console.WriteLine ("Item[{0}] == {1}", index, result)
</Tab>
<Tab Name="C++">
// Set an indexed property value
int index = 3;

// specify BindingFlags.SetProperty, and because this is an instance property,
// pass the object to call the property on (c). In the object array, make two elements,
// the first being the index, and the second being the value to set
t->InvokeMember (S"Item", BindingFlags::GetProperty , NULL, c, args);

// Get an indexed property value
// specify BindingFlags.GetProperty, and because this is an instance property,
// pass the object to call the property on (c). In the object array, specify the index only
result = t->InvokeMember (S"Item", BindingFlags::GetProperty , NULL, c, args);
Console::WriteLine (S"Item[{0}] == {1}", __box(index), result);
</Tab>
</Acme:TabControl>

<p>


You can also use named arguments, in which case you need to use a different overloaded version of the <b>InvokeMember</b> method. Create the array of object arguments as you have been doing so far, and also create a string array of the names of the parameters being passed. The overloaded method you want to use accepts the list of parameter names as the last parameter, and the list of values you want to set as the fifth parameter. In this demonstration, all other parameters can be null (except, of course, the first two).
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// Calling a method using named arguments

// the argument array, and the parameter name array. Obviously, you will need
// to determine the names of the parameters in advance
object[] argValues = new object [] {"Mouse", "Micky"};
String [] argNames = new String [] {"lastName", "firstName"};

// the first five parameters for this overloaded method are the same as the
// the five parameters we have used to this point. The final parameter needs to be
// set to the names of the parameters
t.InvokeMember ("PrintName", BindingFlags.Default | BindingFlags.InvokeMethod,
			null, null, argValues, null, null, argNames);
</Tab>
<Tab Name="VB">
'  Calling a method using named arguments

'  the argument array, and the parameter name array. Obviously, you will need
'  to determine the names of the parameters in advance
object[] argValues = new object [] {"Mouse", "Micky"};
String [] argNames = new String [] {"lastName", "firstName"};

'  the first five parameters for this overloaded method are the same as the
'  the five parameters we have used to this point. The final parameter needs to be
'  set to the names of the parameters
t.InvokeMember ("PrintName", BindingFlags.Default BitOr BindingFlags.InvokeMethod, _
			nothing, nothing, argValues, nothing, nothing, argNames)
</Tab>
<Tab Name="C++">
// Calling a method using named arguments

// the argument array, and the parameter name array. Obviously, you will need
// to determine the names of the parameters in advance
Object *argValues[] = {S"Mouse", S"Micky"};
String *argNames[] = {S"lastName", S"firstName"};

// the first five parameters for this overloaded method are the same as the
// the five parameters we have used to this point. The final parameter needs to be
// set to the names of the parameters
t->InvokeMember (S"PrintName", BindingFlags::InvokeMethod, NULL, NULL, argValues, NULL, NULL, argNames);
</Tab>
</Acme:TabControl>

<p>
This next example demonstrates how to invoke the default member on a class. Make sure that the class you are invoking upon has a default member specified. Then, in the <b>InvokeMember</b> method, do not specify a name for the member to invoke, as in this example.

<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// our class with it's default member specified, using the defaultmemeber attribute
[DefaultMemberAttribute ("PrintTime")]
public class TestClass2 {

	public void PrintTime () {
		Console.WriteLine (DateTime.Now);
	}
}

// the client code that uses the above class...


Type t3 = typeof (TestClass2);
t3.InvokeMember ("", BindingFlags.Default |BindingFlags.InvokeMethod,
			null, new TestClass2(), new object [] {});
</Tab>
<Tab Name="VB">
'  our class with it's default member specified, using the defaultmemeber attribute

public  class <DefaultMemberAttribute ("PrintTime")> TestClass2

	public Sub PrintTime ()
		Console.WriteLine (DateTime.Now)
	End Sub
End Class

'  the client code that uses the above class...
Dim t3 As Type

t3 = GetType (TestClass2)
t3.InvokeMember ("", BindingFlags.Default  BitOr BindingFlags.InvokeMethod, _
			nothing, new TestClass2(), new object () {})
</Tab>
<Tab Name="C++">
// our class with it's default member specified, using the defaultmemeber attribute
[DefaultMemberAttribute ("PrintTime")]
public __gc class TestClass2
{
public:
	void PrintTime ()
	{
		Console::WriteLine (__box(DateTime::Now));
	}
};

// the client code that uses the above class...


Type *t3 = __typeof (TestClass2);
t3->InvokeMember (S"", BindingFlags::InvokeMethod, NULL, new TestClass2(), NULL);

</Tab>
</Acme:TabControl>

<p>

The final example uses a slightly different process to invoke a method. Rather than using the <b>Type</b> object directly, create a separate <b>MethodInfo</b> object directly to represent the method you will be invoking. Then, call the <b>Invoke</b> method on your <b>MethodInfo</b> object, passing an instance of the object you need to invoke your method on (if you are invoking an instance method, but null if your method is static). As before, an object array of the parameters is required. This particular sample allows you to pass parameters by reference, if required.
<p>

<Acme:TabControl runat="server">
<Tab Name="C#">
// Invoking a ByRef member
MethodInfo m = t.GetMethod("Swap");


args = new object[2];
args[0] = 1;
args[1] = 2;

m.Invoke(new TestClass(),args);

Console.WriteLine ("{0}, {1}", args[0], args[1]);
</Tab>
<Tab Name="VB">
'  Invoking a ByRef member
Dim m as MethodInfo =
m = t.GetMethod("Swap")

args = new object() {CObj(1), CObj(2)}



m.Invoke(new TestClass(),args)

Console.WriteLine ("{0}, {1}", args(0), args(1))
</Tab>
<Tab Name="C++">
// Invoking a ByRef member
MethodInfo *m = t->GetMethod(S"Swap");
args = new Object *[2];
args[0] = __box(1);
args[1] = __box(2);
m->Invoke(new TestClass(),args);
Console::WriteLine (S"{0}, {1}", args[0], args[1]);
</Tab>
</Acme:TabControl>
<!-- #include virtual="/quickstart/howto/include/footer.inc" -->