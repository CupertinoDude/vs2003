/*=====================================================================
  File:      ILDerived.il

  Summary:   Demonstrates a type writen using IL derived from a type
             written in C#.

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

.module extern VBDerived.netmodule

.class public auto ansi ILDerived
       extends [.module VBDerived.netmodule]VBDerived
{
  .method public specialname rtspecialname 
          instance void .ctor() il managed
  {
    .maxstack  1
    .locals init (class System.Object[] V_0)
    IL_0000:  ldarg.0
    IL_0001:  call       instance void [.module VBDerived.netmodule]VBDerived::.ctor()
    IL_0006:  ldstr      "   Executing the ILDerived::ctor() constructor"
    IL_000b:  call       void [mscorlib]System.Console::WriteLine(class System.String)
    IL_0010:  ret
  } 

  .method public virtual instance void Method() il managed
  {
    .maxstack  1
    .locals init (class System.Object[] V_0)
    IL_0000:  ldstr      " Executing the ILDerived::Method() virtual method"
    IL_0005:  call       void [mscorlib]System.Console::WriteLine(class System.String)
    IL_000a:  ret
  }
} 