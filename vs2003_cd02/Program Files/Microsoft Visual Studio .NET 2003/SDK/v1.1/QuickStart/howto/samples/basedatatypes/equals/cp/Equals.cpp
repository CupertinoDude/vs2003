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
void compareStrings();
void compareBooleans();
void compareCultures();

__gc class Car {
	String * _color;
public:
	Car(String* colorValue)
	{
		_color =colorValue;
	}	

	__property String *get_Color() { return _color; }
	__property void set_Color (String * colorValue) { _color = colorValue; }



};

void main()
{


	compareStrings();

	Console::WriteLine();
	Console::WriteLine();

	compareBooleans();

	Console::WriteLine();
	Console::WriteLine();

	compareCultures();

	Console::WriteLine();
	Console::WriteLine();

	Console::WriteLine("Object Reference Example");
	Console::WriteLine("------------------------");


	Car* MyCar = new Car("Red");       // My Car, red!

	Console::WriteLine("I just made a Car. Its color is {0}" , MyCar->Color);

	Car* YourCar = MyCar;               // Your Car, referring to the SAME car...

	Console::WriteLine("YourCar and MyCar refer to the same car. YourCar's color is therefore {0}" , MyCar->Color);

	YourCar->Color = "Pink";           // change the Color of YourCar...

	Console::WriteLine("If you change the color of YourCar to {0}, MyCar's color also changes to {1}.", 
		YourCar->Color, MyCar->Color);

	String* MyName = "Kayleen";        // make MyName

	Console::WriteLine();

	Console::WriteLine("In contrast, Strings are different. MyName is {0}" , MyName);

	String* YourName = MyName;         // Make yourName, which appears to reference the same string?

	Console::WriteLine("Initially, I can set YourName to MyName, so YourName is {0}" , YourName);

	YourName = "Mary";                // change YourName...

	Console::WriteLine("But if I change YourName to {0}, MyName ({1}) remains the same.", YourName, MyName);

}

void compareStrings()
{

	String* firstVal = "hello";
	String* secondVal = "goodbye";
	String* thirdVal = "hello";
	String* fourthVal = firstVal;

	Console::WriteLine("Comparing Strings");
	Console::WriteLine("-----------------");

	Console::WriteLine("Does the String {0} {1} the String {2}? {3}",
		firstVal, S"==", secondVal, (firstVal == secondVal ? S"Yes" : S"No"));
	Console::WriteLine("Does the String {0} {1} the String {2} (Different Reference)? {3}",
		firstVal, S"==", thirdVal, (firstVal == thirdVal ? S"Yes" : S"No"));
	Console::WriteLine("Does the String {0} {1} the String {2} (Same Reference)? {3}",
		firstVal, S"==", fourthVal, (firstVal == fourthVal ? S"Yes" : S"No"));

	Console::WriteLine();

	Console::WriteLine("Does the String {0} {1} the String {2}? {3}",
		firstVal, S".Equals", secondVal, (firstVal->Equals (secondVal) ? S"Yes" : S"No"));
	Console::WriteLine("Does the String {0} {1} the String {2} (Different Reference)? {3}",
		firstVal, S".Equals", thirdVal, (firstVal->Equals (thirdVal) ? S"Yes" : S"No"));
	Console::WriteLine("Does the String {0} {1} the String {2} (Same Reference)? {3}",
		firstVal, S".Equals", fourthVal, (firstVal->Equals (fourthVal) ? S"Yes" : S"No"));
}

static void compareBooleans()
{

	Boolean firstVal = false;
	Boolean secondVal = true;
	Boolean thirdVal = false;
	Boolean fourthVal = firstVal;

	Console::WriteLine("Comparing base Boolean datatypes");
	Console::WriteLine("--------------------------------");

	Console::WriteLine("Does the Boolean {0} {1} the Boolean {2}? {3}", 
		__box(firstVal), S"==", __box(secondVal), (firstVal == secondVal ? S"Yes" : S"No"));
	Console::WriteLine("Does the Boolean {0} {1} the Boolean {2} (Different Reference)? {3}", 
		__box(firstVal), S"==", __box(thirdVal), (firstVal == thirdVal ? S"Yes" : S"No"));
	Console::WriteLine("Does the Boolean {0} {1} the Boolean {2} (Same Reference)? {3}", 
		__box(firstVal), S"==", __box(fourthVal), (firstVal == fourthVal ? S"Yes" : S"No"));

	Console::WriteLine();

	Console::WriteLine("Does the Boolean {0} {1} the Boolean {2}? {3}",
		__box(firstVal),S"Equals", __box(secondVal), (firstVal.Equals (__box(secondVal)) ?S"Yes" :S"No"));
	Console::WriteLine("Does the Boolean {0} {1} the Boolean {2} (Different Reference)? {3}",
		__box(firstVal),S"Equals", __box(thirdVal), (firstVal.Equals (__box(thirdVal)) ?S"Yes" :S"No"));
	Console::WriteLine("Does the Boolean {0} {1} the Boolean {2} (Same Reference)? {3}",
		__box(firstVal),S"Equals", __box(fourthVal), (firstVal.Equals (__box(fourthVal)) ?S"Yes" :S"No"));
}

static void compareCultures()
{

	CultureInfo* firstVal = new CultureInfo("en-NZ");
	CultureInfo* secondVal = new CultureInfo("en-US");
	CultureInfo* thirdVal = new CultureInfo("en-NZ");
	CultureInfo* fourthVal = firstVal;

	Console::WriteLine("Comparing Culture object References");
	Console::WriteLine("-----------------------------------");

	Console::WriteLine("Does the CultureInfo {0} {1} the CultureInfo {2}? {3}", 
		firstVal,S"==", secondVal, (firstVal == secondVal ?S"Yes" :S"No"));
	Console::WriteLine("Does the CultureInfo {0} {1} the CultureInfo {2} (Different Reference)? {3}", 
		firstVal,S"==", thirdVal, (firstVal == thirdVal ?S"Yes" :S"No"));
	Console::WriteLine("Does the CultureInfo {0} {1} the CultureInfo {2} (Same Reference)? {3}", 
		firstVal,S"==", fourthVal, (firstVal == fourthVal ?S"Yes" :S"No"));

	Console::WriteLine();

	Console::WriteLine("Does the cultureInfo {0} {1} the CultureInfo {2}? {3}",
		firstVal,S"->Equals", secondVal, (firstVal->Equals (secondVal) ?S"Yes" :S"No"));
	Console::WriteLine("Does the cultureInfo {0} {1} the CultureInfo {2} (Different Reference)? {3}",
		firstVal,S"->Equals", thirdVal, (firstVal->Equals (thirdVal) ?S"Yes" :S"No"));
	Console::WriteLine("Does the cultureInfo {0} {1} the CultureInfo {2} (Same Reference)? {3}",
		firstVal,S"->Equals", fourthVal, (firstVal->Equals (fourthVal) ?S"Yes" :S"No"));

}



