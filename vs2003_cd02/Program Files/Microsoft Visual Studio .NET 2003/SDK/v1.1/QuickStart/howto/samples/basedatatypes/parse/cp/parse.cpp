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

void main() {


	int intExample = 76;
	String* strExample = intExample.ToString();

	Console::WriteLine("Converting an integer value to a string");
	Console::WriteLine("---------------------------------------");

	//example one, having put the value in a string
	Console::WriteLine("The string value is {0}" , strExample);

	//example two, converting the integer to a string on the fly
	Console::WriteLine("The string value is {0}", intExample.ToString());

	//example three, not converting the integer to a string at all???
	Console::WriteLine("The string value is {0}" , __box(intExample)) ;

	Console::WriteLine();

	Console::WriteLine("Using The Convert object's methods");
	Console::WriteLine("------------------------------");

	//the methods inside convert...
	Console::WriteLine("Using Convert::ToString, result = {0}", Convert::ToString(intExample));//   'String conversion, displays 76
	Console::WriteLine("Using Convert::ToBoolean, result = {0}", __box(Convert::ToBoolean(intExample)));// 'Boolean conversion, displays True
	Console::WriteLine("Using Convert::ToByte, result = {0}", __box(Convert::ToByte(intExample)));//       'Byte conversion, displays 76
	Console::WriteLine("Using Convert::ToChar, result =  {0}", __box(Convert::ToChar(intExample)));//      'Char conversion, displays L (char value of 76)
	Console::WriteLine("Using Convert::ToDouble, result = {0}", __box(Convert::ToDouble(intExample)));//   'Double conversion, displays 76

	Console::WriteLine();

	Console::WriteLine("Using the non-instantiated Parse method");
	Console::WriteLine("---------------------------------------");

	String* strExample1 = "true";
	String* strExample2 = "00.987";
	String* strExample3 = "127";
	String* strExample4 = "42";

	Console::WriteLine( "Parsing {0} = {1}", strExample1, __box(Boolean::Parse(strExample1)) );// ' convert to a boolean
	Console::WriteLine( "Parsing {0} = {1}", strExample2, __box(Double::Parse(strExample2)) );//  ' convert to a double value
	Console::WriteLine( "Parsing {0} = {1}", strExample3, __box(Int32::Parse( strExample3)) );//  ' convert to an Int
	Console::WriteLine( "Parsing {0} = {1}", strExample4, __box(Byte::Parse(strExample4)) );//    ' convert to a byte

	Console::WriteLine();

	Console::WriteLine("Using Exception Handling when converting");
	Console::WriteLine("----------------------------------------");

	String* strExample5 = "three";

	// catching any exceptions...
	try {
		Console::WriteLine("The integer value is {0} " , __box( Int32::Parse(strExample5)));
	} catch(Exception *) {
		Console::WriteLine("The value '{0}' cannot be converted to a integer value.", strExample5);
	}

	Console::WriteLine();

	Console::WriteLine("Attempting an illegal, implicit conversion");
	Console::WriteLine("------------------------------------------");
	intExample = 76;
	Console::WriteLine("Adding the following code to a program would cause a compiler error in MC++");
	Console::WriteLine("String* strExample = intExample");
	Console::Write("The error received will be: ");
	Console::WriteLine("error C2440: 'initializing' : cannot convert from 'int' to 'System::String __gc *'");

	Console::WriteLine();

	Console::WriteLine("Converting Strings to Dates");
	Console::WriteLine("---------------------------");


	/* This variable forces the data parsing to succeed.  If you'd like
	to see the parsing work in your own locale, you can remove this
	call and then replace all dates with ones that are formatted in
	your locale specific manner.
	*/
	System::Threading::Thread::CurrentThread->CurrentCulture = new CultureInfo("en-US");

	String* strDate = "03/17/77";

	// Simple DateTime parsing
	Console::WriteLine("Parsing {0}, using the Parse method.", strDate);
	DateTime d = DateTime::Parse(strDate);
	Console::WriteLine("The date parsed as {0}",__box(d));

	// DateTime parsing using ParseExact
	Console::WriteLine();
	String* strDate2 = "Thursday, March 17, 1977";
	Console::WriteLine("Parsing {0}, using the ParseExact method.", strDate2);
	DateTime d2 = DateTime::ParseExact(strDate2,"D", 0);
	Console::WriteLine("The date parsed as {0}",__box(d2));

	Console::WriteLine();

	Console::WriteLine("Converting String information to other datatypes");
	Console::WriteLine("------------------------------------------------");
	strExample = "123456";

	//using Parse to convert strings to other datatypes...
	Console::WriteLine("The Double value when using Double::Parse is {0}", __box(Double::Parse(strExample)));//    'converting a string to an Double
	Console::WriteLine("The Int32 value when using Int32::Parse is {0}", __box(Int32::Parse(strExample)));//    'converting a string to an int

	Console::WriteLine();

	Console::WriteLine("Extending the use of the Parse method");
	Console::WriteLine("-------------------------------------");

	// Parsing using NumberStyles
	String* toBeParsed = "   (555)   ";

	Console::WriteLine("Parsing the string \t{0}\t which contains leading/trailing white space and parentheses", toBeParsed);
	int j = Int32::Parse(toBeParsed,static_cast<NumberStyles>( NumberStyles::AllowParentheses | NumberStyles::AllowLeadingWhite | NumberStyles::AllowTrailingWhite));
	Console::WriteLine("The string parsed to {0}.",__box(j));// 'note that the output may well be negative, because of the parentheses

}


