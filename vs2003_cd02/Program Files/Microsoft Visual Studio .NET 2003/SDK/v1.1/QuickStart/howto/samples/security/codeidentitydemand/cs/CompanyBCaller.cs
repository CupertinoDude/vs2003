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

using System;
using System.Reflection;

namespace SecuritySamples {

 public class BadCaller {

  public static void Main() {

   try {
    Console.WriteLine(SharedComponent.GetInfo());
   }
   catch(Exception e) {
    Console.WriteLine("\nException occurred: {0}\n", e);
   }

   Console.Write("\nPress Enter to exit...");
   Console.Read();

  }

 }

}