//-----------------------------------------------------------------------
//  This file is part of the Microsoft .NET SDK Code Samples.
// 
//  Copyright (C) Microsoft Corporation.  All rights reserved.
// 
//This source code is intended only as a supplement to Microsoft
//Development Tools and/or on-line documentation.  See these other
//materials for detailed information regarding Microsoft code samples.
// 
//THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
//KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
//PARTICULAR PURPOSE.
//-----------------------------------------------------------------------

#using <mscorlib.dll>

using namespace System;
using namespace System::IO;
using namespace System::Reflection;

#define NULL 0


[DefaultMemberAttribute ("Item")]
public __gc class TestClass
{
public:
	String *Name;

private:
	static Object *values [] = {__box(0), __box(1), __box(2), __box(3), __box(4), __box(5), __box(6), __box(7), __box(8), __box(9)};

public:
	__property Object * get_Item (int index)
	{
		return values[index];
	}


	__property void set_Item (int index, Object *value)
	{
		values[index] = value;
	}
	
public:
	__property Object *get_Value (void) { return __try_cast<Object*>(S"the value"); }

public:
	TestClass ()
	{
		Name = S"initalName";
		methodCalled = 0;
	}

private:
	int methodCalled;

public:
	static void SayHello ()
	{
		Console::WriteLine (S"Hello");
	}

	void AddUp ()
	{
		methodCalled++;
		Console::WriteLine (S"AddUp Called {0} times", __box(methodCalled));
	}

	static double ComputeSum (double d1, double d2)
	{
		return d1 + d2;
	}

	static void PrintName (String *firstName, String *lastName)
	{
		Console::WriteLine (S"{0},{1}", lastName, firstName);
	}

	void PrintTime ()
	{
		Console::WriteLine (__box(DateTime::Now));
	}

	void Swap(Int32 &a, Int32 &b)
	{
		Int32 x = a;
		a = b;
		b = x;
	}

};

[DefaultMemberAttribute ("PrintTime")]
public __gc class TestClass2
{
public:
	void PrintTime ()
	{
		Console::WriteLine (__box(DateTime::Now));
	}
};

void main (void)
{
	//Call a static method
	Type *t = __typeof (TestClass);

	Console::WriteLine();
	Console::WriteLine(S"Invoking a Static method");
	Console::WriteLine(S"---------------------------------");
	t->InvokeMember (S"SayHello", BindingFlags::InvokeMethod, NULL, NULL, NULL);

	//Call an instance method
	TestClass *c = new TestClass ();

	Console::WriteLine();
	Console::WriteLine(S"Invoking an Instance method");
	Console::WriteLine(S"---------------------------------");
	c->GetType()->InvokeMember (S"AddUp", BindingFlags::InvokeMethod, NULL, c, NULL);
	c->GetType()->InvokeMember (S"AddUp", BindingFlags::InvokeMethod, NULL, c, NULL);

	
	//Call a method with args
	Object *args[] = {__box(100.09), __box(184.45)};
	Object *result;

	Console::WriteLine();
	Console::WriteLine(S"Invoking a method with arguments/parameters");
	Console::WriteLine(S"---------------------------------");
	result = t->InvokeMember (S"ComputeSum", BindingFlags::InvokeMethod, NULL, NULL, args);
	Console::WriteLine (S"{0} + {1} = {2}", args[0], args[1], result);

	Console::WriteLine();
	Console::WriteLine(S"Invoking a Field (Setting and Getting)");
	Console::WriteLine(S"---------------------------------");
	//Get a field value
	result = t->InvokeMember (S"Name", BindingFlags::GetField, NULL, c, NULL);
	Console::WriteLine (S"Name == {0}", result);

	//Set a field
	args = new Object *[1];
	args[0] = new String(S"NewName");
	t->InvokeMember (S"Name", BindingFlags::SetField, NULL, c, args);
	result = t->InvokeMember (S"Name", BindingFlags::GetField, NULL, c, NULL);
	Console::WriteLine (S"Name == {0}", result);

	Console::WriteLine();
	Console::WriteLine(S"Invoking an indexed Property (Setting and Getting)");
	Console::WriteLine(S"---------------------------------");
	//Get an indexed property value
	int  index = 3;
	args = new Object*[1];
	args[0] = __box(index);
	result = t->InvokeMember (S"Item", BindingFlags::GetProperty , NULL, c, args);
	Console::WriteLine (S"Item[{0}] == {1}", __box(index), result);

	//Set an indexed property value
	index = 3;
	args = new Object*[2];
	args[0] = __box(index);
	args[1] = new String (S"NewValue");
	t->InvokeMember (S"Item", BindingFlags::SetProperty, NULL, c, args);
	args = new Object*[1];
	args[0] = __box(index);
	result = t->InvokeMember (S"Item", BindingFlags::GetProperty , NULL, c, args);
	Console::WriteLine (S"Item[{0}] == {1}", __box(index), result);

	Console::WriteLine();
	Console::WriteLine(S"Getting a field or property");
	Console::WriteLine(S"---------------------------------");
	//Get a field or property
	result = t->InvokeMember (S"Name", static_cast<System::Reflection::BindingFlags>(BindingFlags::GetField | BindingFlags::GetProperty), NULL, c, NULL);
	Console::WriteLine (S"Name == {0}", result);
	result = t->InvokeMember (S"Value", static_cast<System::Reflection::BindingFlags>(BindingFlags::GetField | BindingFlags::GetProperty), NULL, c, NULL);
	Console::WriteLine (S"Value == {0}", result);

	Console::WriteLine();
	Console::WriteLine(S"Invoking a method with named arguments");
	Console::WriteLine(S"---------------------------------");
	//Call a method using named arguments
	Object *argValues[] = {S"Mouse", S"Micky"};
	String *argNames[] = {S"lastName", S"firstName"};
	t->InvokeMember (S"PrintName", BindingFlags::InvokeMethod, NULL, NULL, argValues, NULL, NULL, argNames);

	Console::WriteLine();
	Console::WriteLine(S"Invoking a default member of a type");
	Console::WriteLine(S"---------------------------------");
	//Call the default member of a type
	Type *t3 = __typeof (TestClass2);
	t3->InvokeMember (S"", BindingFlags::InvokeMethod, NULL, new TestClass2(), NULL);

	Console::WriteLine();
	Console::WriteLine(S"Invoking a Method with ByRef parameters");
	Console::WriteLine(S"---------------------------------");
	//Invoking a ByRef member
	MethodInfo *m = t->GetMethod(S"Swap");
	args = new Object *[2];
	args[0] = __box(1);
	args[1] = __box(2);
	m->Invoke(new TestClass(),args);
	Console::WriteLine (S"{0}, {1}", args[0], args[1]);

	Console::WriteLine();
	Console::WriteLine (S"Press Enter to continue...");
	Console::Read ();
}
