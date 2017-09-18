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
void main()
    {
        int i = -10;

        double d1 = 39.25;
        double d2 = -27.84;

        Console::WriteLine();
        Console::WriteLine("Constants");
        Console::WriteLine("-----------------------------------");
		Console::WriteLine("The constant value e is {0}", Math::E.ToString());
        Console::WriteLine("The constant value PI is {0}", Math::PI.ToString());
        Console::WriteLine();

        Console::WriteLine("Using the Abs Method");
        Console::WriteLine("-----------------------------------");
        Console::WriteLine("The absolute value of {0} is {1}", i.ToString(), Math::Abs(i).ToString());
        Console::WriteLine("The absolute value of {0} is {1}", d1.ToString(), Math::Abs(d1).ToString());
        Console::WriteLine("The absolute value of {0} is {1}", d2.ToString(), Math::Abs(d2).ToString());
        Console::WriteLine();

        Console::WriteLine("Using the Floor Method");
        Console::WriteLine("-----------------------------------");
        Console::WriteLine("Using the Floor method to round down {0} you get {1}", i.ToString(), Math::Floor(i).ToString());
        Console::WriteLine("Using the Floor method to round down {0} you get {1}", d1.ToString(), Math::Floor(d1).ToString());
        Console::WriteLine("Using the Floor method to round down {0} you get {1}", d2.ToString(), Math::Floor(d2).ToString());
        Console::WriteLine();

        Console::WriteLine("Using the Ceiling Method");
        Console::WriteLine("-----------------------------------");
        Console::WriteLine("Using the Ceiling method to round down {0} you get {1}", i.ToString(),  Math::Ceiling(i).ToString());  
        Console::WriteLine("Using the Ceiling method to round down {0} you get {1}", d1.ToString(), Math::Ceiling(d1).ToString()); 
        Console::WriteLine("Using the Ceiling method to round down {0} you get {1}", d2.ToString(), Math::Ceiling(d2).ToString()); 
        Console::WriteLine();

        Console::WriteLine("Using the Max Method");
        Console::WriteLine("-----------------------------------");
        Console::WriteLine("The maximum value of {0} and {1} is {2}", i.ToString(), d1.ToString(),  Math::Max((double)i, d1).ToString());
        Console::WriteLine("The maximum value of {0} and {1} is {2}", d2.ToString(), i.ToString(), Math::Max(d2, (double)i).ToString());
        Console::WriteLine("The maximum value of {0} and {1} is {2}", d1.ToString(), d2.ToString(), Math::Max(d1, d2).ToString());
        Console::WriteLine();

        Console::WriteLine("Using the Sqrt Method");
        Console::WriteLine("-----------------------------------");
        Console::WriteLine("The square root of {0} is {1}", d1.ToString(), Math::Sqrt(d1).ToString());
        Console::WriteLine("The square root of {0} is {1}", i.ToString(), Math::Sqrt(i).ToString());
        Console::WriteLine();

        Console::WriteLine("Using the Pow Method");
        Console::WriteLine("-----------------------------------");
        Console::WriteLine("{0} raised to the power 2 is {1}", i.ToString(), Math::Pow(i, 2).ToString());
        Console::WriteLine("{0} raised to the power 0.3 is {1}", d1.ToString(),  Math::Pow(d1, 0.3).ToString());
        Console::WriteLine("{0} raised to the power -4 is {1}", d2.ToString(),  Math::Pow(d2, -4).ToString());
        Console::WriteLine();

    }
