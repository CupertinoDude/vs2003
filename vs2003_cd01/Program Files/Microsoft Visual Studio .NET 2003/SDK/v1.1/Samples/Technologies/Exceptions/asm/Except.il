//=====================================================================
//  File:      Except.il
//
//  Summary:   Demonstrates how to use exceptions
//
//---------------------------------------------------------------------
//  This file is part of the Microsoft .NET SDK Code Samples.
//
//  Copyright (C) Microsoft Corporation.  All rights reserved.
//
//This source code is intended only as a supplement to Microsoft
//Development Tools and/or on-line documentation.  See these other
//materials for detailed information regarding Microsoft code samples.
//
//THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
//KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
//PARTICULAR PURPOSE.
//=====================================================================

//This source was created using IlDasm.exe

.assembly extern mscorlib
{
}

.assembly extern System.Windows.Forms
{
}

.assembly Except
{
}

.class private auto ansi beforefieldinit App
       extends [mscorlib]System.Object
{
  .method public hidebysig static void  Main() cil managed
  {
    .entrypoint
    // Code size       82 (0x52)
    .maxstack  4
    IL_0000:  call       class [mscorlib]System.AppDomain [mscorlib]System.Threading.Thread::GetDomain()
    IL_0005:  ldnull
    IL_0006:  ldftn      void App::HandleUnhandled(object,
                                                   class [mscorlib]System.UnhandledExceptionEventArgs)
    IL_000c:  newobj     instance void [mscorlib]System.UnhandledExceptionEventHandler::.ctor(object,
                                                                                              native int)
    IL_0011:  callvirt   instance void [mscorlib]System.AppDomain::add_UnhandledException(class [mscorlib]System.UnhandledExceptionEventHandler)
    IL_0016:  ldc.i4.1
    IL_0017:  call       void App::ProtectedFunction(int32)
    IL_001c:  call       void [mscorlib]System.Console::WriteLine()
    IL_0021:  ldc.i4.2
    IL_0022:  call       void App::ProtectedFunction(int32)
    IL_0027:  call       void [mscorlib]System.Console::WriteLine()
    IL_002c:  ldc.i4.3
    IL_002d:  call       void App::ProtectedFunction(int32)
    IL_0032:  call       void [mscorlib]System.Console::WriteLine()
    IL_0037:  ldstr      "Just about to execute code that throws an unhandle"
    + "d exception:"
    IL_003c:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_0041:  ldc.i4.1
    IL_0042:  call       void App::MethodThatThrows(int32)
    IL_0047:  ldstr      "This code never executes!"
    IL_004c:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_0051:  ret
  } // end of method App::Main

  .method private hidebysig static void  MethodThatThrows(int32 option) cil managed
  {
    // Code size       60 (0x3c)
    .maxstack  2
    .locals init ([0] int32 x,
             [1] object o,
             [2] int32 CS$00000002$00000000)
    IL_0000:  ldarg.0
    IL_0001:  stloc.2
    IL_0002:  ldloc.2
    IL_0003:  ldc.i4.1
    IL_0004:  sub
    IL_0005:  switch     ( 
                          IL_0018,
                          IL_0021,
                          IL_0030)
    IL_0016:  br.s       IL_003b

    IL_0018:  ldc.i4.0
    IL_0019:  stloc.0
    IL_001a:  ldc.i4.s   10
    IL_001c:  ldloc.0
    IL_001d:  div
    IL_001e:  stloc.0
    IL_001f:  br.s       IL_003b

    IL_0021:  ldnull
    IL_0022:  stloc.1
    IL_0023:  ldloc.1
    IL_0024:  callvirt   instance string [mscorlib]System.Object::ToString()
    IL_0029:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_002e:  br.s       IL_003b

    IL_0030:  ldstr      "This is a custom exception"
    IL_0035:  newobj     instance void MyException::.ctor(string)
    IL_003a:  throw

    IL_003b:  ret
  } // end of method App::MethodThatThrows

  .method private hidebysig static void  ProtectedFunction(int32 option) cil managed
  {
    // Code size       81 (0x51)
    .maxstack  3
    .locals init ([0] class [mscorlib]System.Exception e)
    .try
    {
      IL_0000:  ldarg.0
      IL_0001:  call       void App::MethodThatThrows(int32)
      IL_0006:  leave.s    IL_0050

    }  // end .try
    catch [mscorlib]System.Exception 
    {
      IL_0008:  stloc.0
      IL_0009:  ldstr      "Exception:\n   {0}"
      IL_000e:  ldloc.0
      IL_000f:  callvirt   instance class [mscorlib]System.Type [mscorlib]System.Object::GetType()
      IL_0014:  callvirt   instance string [mscorlib]System.Type::ToString()
      IL_0019:  call       void [mscorlib]System.Console::WriteLine(string,
                                                                    object)
      IL_001e:  ldstr      "Message:\n   {0}"
      IL_0023:  ldloc.0
      IL_0024:  callvirt   instance string [mscorlib]System.Exception::get_Message()
      IL_0029:  call       void [mscorlib]System.Console::WriteLine(string,
                                                                    object)
      IL_002e:  ldstr      "Stack Trace:\n{0}"
      IL_0033:  ldloc.0
      IL_0034:  callvirt   instance string [mscorlib]System.Exception::get_StackTrace()
      IL_0039:  call       void [mscorlib]System.Console::WriteLine(string,
                                                                    object)
      IL_003e:  ldstr      "Help Link:\n   {0}"
      IL_0043:  ldloc.0
      IL_0044:  callvirt   instance string [mscorlib]System.Exception::get_HelpLink()
      IL_0049:  call       void [mscorlib]System.Console::WriteLine(string,
                                                                    object)
      IL_004e:  leave.s    IL_0050

    }  // end handler
    IL_0050:  ret
  } // end of method App::ProtectedFunction

  .method public hidebysig static void  HandleUnhandled(object sender,
                                                        class [mscorlib]System.UnhandledExceptionEventArgs args) cil managed
  {
    // Code size       38 (0x26)
    .maxstack  3
    IL_0000:  ldstr      "Unhandled Exception!\n"
    IL_0005:  ldarg.1
    IL_0006:  callvirt   instance object [mscorlib]System.UnhandledExceptionEventArgs::get_ExceptionObject()
    IL_000b:  callvirt   instance class [mscorlib]System.Type [mscorlib]System.Object::GetType()
    IL_0010:  callvirt   instance string [mscorlib]System.Type::ToString()
    IL_0015:  call       string [mscorlib]System.String::Concat(string,
                                                                string)
    IL_0024:  call       void [mscorlib]System.Console::WriteLine(string)
    IL_0025:  ret
  } // end of method App::HandleUnhandled

  .method public hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // Code size       7 (0x7)
    .maxstack  1
    IL_0000:  ldarg.0
    IL_0001:  call       instance void [mscorlib]System.Object::.ctor()
    IL_0006:  ret
  } // end of method App::.ctor

} // end of class App

.class private auto ansi beforefieldinit MyException
       extends [mscorlib]System.ApplicationException
{
  .method public hidebysig specialname rtspecialname 
          instance void  .ctor(string msg) cil managed
  {
    // Code size       19 (0x13)
    .maxstack  2
    IL_0000:  ldarg.0
    IL_0001:  ldarg.1
    IL_0002:  call       instance void [mscorlib]System.ApplicationException::.ctor(string)
    IL_0007:  ldarg.0
    IL_0008:  ldstr      "http://NotARealURL.Microsoft.com/help.html"
    IL_000d:  callvirt   instance void [mscorlib]System.Exception::set_HelpLink(string)
    IL_0012:  ret
  } // end of method MyException::.ctor

} // end of class MyException


