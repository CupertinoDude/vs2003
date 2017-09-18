/*=====================================================================
  File:      CSDerived.cs

  Summary:   Demonstrates a type writen using C# derived from a type
             written in Visual Basic.

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

public class CSDerived:ILDerived{
   public CSDerived(){
      Console.WriteLine("    Executing the CSDerived.CSDerived() constructor");
   }      

   override public void Method(){
      Console.WriteLine(" Executing the CSDerived.Method() virtual method");
   }
}
