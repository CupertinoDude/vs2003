/*=====================================================================
  File:      CrossLang.cs

  Summary:   Demonstrates multiple types created in various programming 
             languages co-existing in the same derivation hierarchy.
             Then demonstrates the use of the various types.  This
             module is the main module which shows use of the types.

---------------------------------------------------------------------
  This file is part of the Microsoft .NET SDK Code Samples.

  Copyright (C) Microsoft Corporation.  All rights reserved.

This source code is intended only as a supplement to Microsoft
Development Tools and/or on-line documentation.  See these other
materials for detailed information regarding Microsoft code samples.

THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
PARTICULAR PURPOSE.
=====================================================================*/

using System;
using System.Security;

class App{
   public static void Main(){
      try{
         CrossObj();
      }catch(VerificationException){
         Console.WriteLine("A VerificationException has been thrown "+
            "(and caught). Run this\nsample from your local "+
            "hard-drive to avoid this exception.");
      }
   }
   
   static void CrossObj(){
      // Create an array to hold our objects
      VCBase[] objects = new VCBase[3];

      // New up an object created using an IL module
      Console.WriteLine("\nCreating object:  ILDerived");
      objects[0] = new ILDerived();

      // New up an object created using C#
      Console.WriteLine("\nCreating object:  CSDerived");
      objects[1] = new CSDerived();

      // New up an object created using VB
      Console.WriteLine("\nCreating object:  VBDerived");
      objects[2] = new VBDerived();

      // Call the virtual methods for each object
      Console.WriteLine("\nCalling Methods");
      foreach(VCBase obj in objects){
         obj.Method();
      }

      // Pick an object and attempt a method call that throws
      try{
      (objects[2] as VBDerived).AnotherMethodThatThrows();
      }catch(ApplicationException){
         // Respond to the failure
      }
   }
}