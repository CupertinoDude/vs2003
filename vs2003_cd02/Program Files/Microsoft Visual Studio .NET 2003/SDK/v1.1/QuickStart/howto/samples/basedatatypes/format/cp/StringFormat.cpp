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
using namespace System;
using namespace System::IO;
using namespace System::Globalization;
void PrintFormat (IFormattable* value, String *formatString);
__gc class MyType;
__gc class BaseFormatter ;

// This is my own custom type that implements IFormattable and respects the "b" format for binary
// as well as all the formatting codes for Int32.
// Console::WriteLine, String.Format, etc will call the Format method to get the string form of an
// instance of this type


__gc class MyType : public IFormattable
{

private:
	int _value;// to store the value internal
public:
	MyType (int value)
	{
		_value = value;
	}
	// This is the formatting method called by String.Format.  In it, we look for the "b" format
	// which we respect  and then fall through to Int32's format for anything else we don't know about.
	String* Format (String *format, IFormatProvider* sop)
	{
		if (format->Equals ("b"))
			return Convert::ToString (_value, 2);
		else if (format->Equals ("o"))
			return Convert::ToString (_value, 8);
		else if (format->Equals ("d"))
			return Convert::ToString (_value, 10);
		else if (format->Equals ("h"))
			return Convert::ToString (_value, 16);

		return _value.ToString (format, sop);
	}

	String* ToString (String* format, IFormatProvider* sop) // included via requirements
	{ 
		if (format->Equals ("b"))
			return Convert::ToString (_value, 2);
		else if (format->Equals ("o"))
			return Convert::ToString (_value, 8);
		else if (format->Equals ("d"))
			return Convert::ToString (_value, 10);
		else if (format->Equals ("h"))
			return Convert::ToString (_value, 16);

		return _value.ToString (format, sop);
	}
};

__value  enum Color
{
	Red,
	Blue,
	Green
};


void main()
{

	// Formatting a table
	Console::WriteLine("Formatting in a table");

	String * names[]= {S"Mary-Beth", S"Aunt Alma", S"Sue", S"My Really Long Name", S"Matt"};
	for (int k = 0; k < 5; k++)
	{
		Console::WriteLine ("| {0,-4}{1,-20} |", k.ToString(), names[k]);
	}
	Console::WriteLine();



	// Enum formatting
	Console::WriteLine("Enum Formatting");
	Console::WriteLine ("Name: {0}, Value: {1}", __box(Color::Red)->ToString("G"), __box(Color::Red)->ToString ("D"));
	Console::WriteLine();


	// DateTime built in formats


	Console::WriteLine("DateTime Formatting:  Predefined formats");
	Console::WriteLine("");
	Console::WriteLine ("{0}\t{1}" ,S"Code", S"Format");
	Console::WriteLine ("{0}\t{1}" ,S"----", S"------");

	DateTime  d = DateTime::Now;
	IFormattable * id = __box( d );
	PrintFormat (id, "d");
	PrintFormat (id, "D");
	PrintFormat (id, "f");
	PrintFormat (id, "F");
	PrintFormat (id, "g");
	PrintFormat (id, "G");
	PrintFormat (id, "m");
	PrintFormat (id, "r");
	PrintFormat (id, "s");
	PrintFormat (id, "t");
	PrintFormat (id, "T");
	PrintFormat (id, "u");
	PrintFormat (id, "U");
	Console::WriteLine();

	// DateTime picture  formats

	Console::WriteLine("DateTime Formatting:  Picture formats");
	Console::WriteLine ("{0}\t{1}" ,S"Code", S"Format");
	Console::WriteLine ("{0}\t{1}" ,S"----", S"------");
	PrintFormat (id, "ddd");
	PrintFormat (id, "MMMM dd, yyyy");

	Console::WriteLine();

	// Number standard formats
	double num = 12.9625;

	Console::WriteLine("Numeric Formatting:  Predefined formats");
	Console::WriteLine ("{0}\t{1}" ,S"Code", S"Format");
	Console::WriteLine ("{0}\t{1}" ,S"----", S"------");
	IFormattable *  inum = __box(num);   
	PrintFormat (inum, "c");
	PrintFormat (__box(103), "d");
	PrintFormat (inum, "e");
	PrintFormat (inum, "f");
	PrintFormat (inum, "g");
	PrintFormat (inum, "n");
	PrintFormat (__box(1102), "x");

	Console::WriteLine ();


	// Number custom formats
	int i = 25;

	Console::WriteLine("Numeric Formatting:  Picture formats");
	Console::WriteLine ("{0}\t{1}" ,S"Code", S"Format");
	Console::WriteLine ("{0}\t{1}" ,S"----", S"------");
	IFormattable* bi=__box(i);
	PrintFormat (bi, "#");
	PrintFormat (bi, "###");
	PrintFormat (bi, "#.00");
	PrintFormat (__box(i/100.0), "%#");
	PrintFormat (bi, "D4");

	Console::WriteLine ();

	// User defined types can specify their own formatting that works in exactly the same way.
	// See the definition of MyType below

	Console::WriteLine ("Formatting Custom Types");
	Console::WriteLine ("{0}\t{1}" ,S"Code", S"Format");
	Console::WriteLine ("{0}\t{1}" ,S"----", S"------");

	MyType* t = new MyType(43);

	PrintFormat (t, "b");
	PrintFormat (t, "o");
	PrintFormat (t, "d");
	PrintFormat (t, "h");

} //  end Go

void PrintFormat (IFormattable* value, String *formatString)
{
	Console::WriteLine ("{0}\t{1}", formatString, value->ToString (formatString, 0));
}


