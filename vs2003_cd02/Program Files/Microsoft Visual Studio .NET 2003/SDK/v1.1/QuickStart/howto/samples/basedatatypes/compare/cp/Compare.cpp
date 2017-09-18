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

#using<mscorlib.dll>
using namespace	System;
using namespace	System::IO;
using namespace	System::Globalization; 
__gc class MyType;
IComparable	* Max (IComparable*	val1, IComparable *val2);


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

void main()
{

	Console::WriteLine("\r\n");

	//this example will	compare	some ints
	Console::WriteLine ("We	have defined a Max method, that	works on any types which implement the IComparable interface....\r\n");


	Console::WriteLine ("{0,-35} {1}", S"Comparing Integers:	Max (5, 10) =", Max (__box(5),	__box(10)));
	Console::WriteLine();

	Console::WriteLine ("{0,-35} {1}", S"Comparing Doubles:	Max (4.3, 2.5)	=",	Max	(__box(4.3), __box(2.5)));
	Console::WriteLine();

	Decimal	d1 = 1235698;
	Decimal	d2 = -234238;
	Console::WriteLine ("Comparing Decimals:	Max ({0}, {1}) ={2}",d1.ToString(),d2.ToString(), Max (__box(d1), __box(d2)));
	Console::WriteLine();

	String*	s1 = "Mathew";
	String*	s2 = "Mark";
	Console::WriteLine ("Comparing Strings:	Max ({0}, {1})	={2}",s1, s2, Max (s1,s2));
	Console::WriteLine();

	Char c1	= 't';
	Char c2	= 'a';
	Console::WriteLine ("Comparing Chars:	Max ({0},{1}) ={2}", c1.ToString(),c2.ToString(), Max (__box(c1), __box(c2)));
	Console::WriteLine();

	MyType *t1 =	new	MyType (12);
	MyType *t2 = new MyType	(17);
	Console::WriteLine ("Comparing Custom Types:	Max ({0}, {1}) ={2}",t1,t2, Max (t1,t2));


}  

IComparable * Max (IComparable* val1, IComparable *val2)
{
	if (val1->CompareTo(val2) >	0) return val1;	//val1 > val2
	if (val1->CompareTo(val2) <	0) return val2;	//val1 < val2
	if (val1->CompareTo(val2) == 0)	return val1; //val1	== val2, return	val1 by	definition
	return 0;
}


