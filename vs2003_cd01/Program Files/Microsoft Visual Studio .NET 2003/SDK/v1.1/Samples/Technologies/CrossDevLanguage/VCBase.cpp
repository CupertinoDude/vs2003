/*=====================================================================
  File:      VCBase.cpp

  Summary:   Demonstrates a simple abstract base class written in C++.
             The remaining modules in this sample show classes that 
             derive from this base class, but are written in Visual
             Basic, C#, and IL.

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

#using <mscorlib.dll>
using namespace System;

__gc public class VCBase
{
protected:
   VCBase(){
      Console::WriteLine(" Executing the VCBase::VCBase() constructor");
   }
	
public:
   virtual void Method() = 0;
   void MethodThatThrows(){
      // Pretend that this code just tried to access some resource
      // that was not available (rather than an explicit throw)
      throw(new OutOfMemoryException("We are out of some resource!"));
   }

};
