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
using namespace System::Collections;

void PrintArray(Array* arr); 

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

void main()
{

	//Array.Sort works on any object that implements IComparable such as ints, doubles and strings

	int intArray __gc[] ={43, 12, 1, 17, 23, 36, 11};
	Console::WriteLine( "The unsorted int array: ");
	PrintArray(intArray);

	Console::WriteLine();

	//Sort and print the array
	Array::Sort(intArray);
	Console::WriteLine("The sorted int array: ");
	PrintArray(intArray);

	Console::WriteLine();

	//reverse the array
	Array::Reverse(intArray);
	Console::WriteLine("The sorted int array, in descending order (after a Sort and Reverse): ");
	PrintArray(intArray);

	Console::WriteLine("------------------------------------");
	Console::WriteLine();

	double doubleArray __gc[]={1.5, 4.3, 2.5, 006.9, 2.01, 0.04};
	Console::WriteLine( "The unsorted double array: ");
	PrintArray(doubleArray);

	Console::WriteLine();

	//Sort and print the array
	Array::Sort(doubleArray);
	Console::WriteLine("The sorted double array: ");
	PrintArray(doubleArray);

	Console::WriteLine("------------------------------------");
	Console::WriteLine();

	String*  stringArray[]={S"Michael", S"mary", S"Robert", S"Abigail", S"lorne", S"Therese", S"terrence", S"Samantha"};    
	Console::WriteLine("The unsorted string array: ");
	PrintArray(stringArray);

	Console::WriteLine();

	//Sort and print the array
	Array::Sort(stringArray, Comparer::Default);
	Console::WriteLine("The sorted string array: ");
	PrintArray(stringArray);

	Console::WriteLine();

	//reverse the array
	Array::Reverse(stringArray);
	Console::WriteLine("The sorted string array, in descending order: ");
	PrintArray(stringArray);

	Console::WriteLine("------------------------------------");
	Console::WriteLine();

	//And even your own objects, such as MyType
	MyType* myTypeArray[] = new MyType* [6];
	myTypeArray[0]=new MyType("Max",23);
	myTypeArray[1]=new MyType("Lisa",47);
	myTypeArray[2]=new MyType("Andrea",35);
	myTypeArray[3]=new MyType("Mel",29);
	myTypeArray[4]=new MyType("Andrew",32);
	myTypeArray[5]=new MyType("Ahmed",35);



	Console::WriteLine("The unsorted MyType array: ");

	for(int i=0;i<myTypeArray->Length;i++)
	{
		Console::WriteLine("Name = {0,-7}, Age = {1}", myTypeArray[i]->Name, __box(myTypeArray[i]->Age));
	}
	Console::WriteLine();

	//Sort and print the array
	Array::Sort(myTypeArray);
	Console::WriteLine( "The MyType array, sorted by age (default sort): ");

	for(int i=0;i<myTypeArray->Length;i++)
	{
		Console::WriteLine("Name = {0,-7}, Age = {1}", myTypeArray[i]->Name, __box(myTypeArray[i]->Age));
	}

	Console::WriteLine();

	//You can even compare objects that don't implement IComparable (or ones you want to custom compare).

	//Sort the array using MyTypeNameComparer
	Array::Sort(myTypeArray, new MyTypeNameComparer());
	Console::WriteLine( "The MyType array, sorted by Name (separately defined comparer): ");

	for(int i=0;i<myTypeArray->Length;i++)
	{
		Console::WriteLine("Name = {0,-7}, Age = {1}", myTypeArray[i]->Name, __box(myTypeArray[i]->Age));
	}

	Console::WriteLine();
	Console::WriteLine("Press Enter to close window.");
	Console::Read();
} 

void PrintArray(Array* arr)
{
	bool bEntered = false;

	Console::Write("{");    
	IEnumerator* ie=arr->GetEnumerator();
	while (ie->MoveNext())
	{   					
		if (bEntered)
			Console::Write(", ");
		else
			bEntered = true;

		Console::Write(ie->Current->ToString());
	}

	Console::WriteLine( "}");   
}


