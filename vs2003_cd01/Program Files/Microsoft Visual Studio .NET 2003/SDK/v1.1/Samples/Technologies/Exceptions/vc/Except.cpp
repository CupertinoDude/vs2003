/*=====================================================================
  File:      Except.cpp

  Summary:   Demonstrates how to use exceptions

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
#using <System.Windows.Forms.dll>

using namespace System;
using namespace System::Threading;
using namespace System::Windows::Forms;

// Custom exception class derived from ApplicationException
__gc class MyException:public ApplicationException{
   public: 
      MyException(String *msg):ApplicationException(msg){
      HelpLink = "http://NotARealURL.Microsoft.com/help.html";
   }
};

// This method is designed to throw one of three exceptions
void MethodThatThrows(int option){
      int x = 0;
      Object *o = (Object *)0;

      switch(option){
      case 1:
         x = 10 / x;
         break;
      case 2:
         Console::WriteLine(o->ToString());
         break;
      case 3:  
         throw(new MyException("This is a custom exception"));
      }
}

// This method calls the MethodThatThrows, but catches the exceptions   
void ProtectedFunction(int option){
      try{
         MethodThatThrows(option);
      }catch(Exception *e){
         Console::WriteLine ("Exception:\n   {0}", e->GetType()->ToString());
         Console::WriteLine ("Message:\n   {0}", e->Message);
         Console::WriteLine ("Stack Trace:\n{0}", e->StackTrace);
         Console::WriteLine ("Help Link:\n   {0}", e->HelpLink);
      }
}

// Not the most exciting unhandled exception handler in the world
__gc class Handler{
   public:
   static void HandleUnhandled(Object *sender, UnhandledExceptionEventArgs *args){
      MessageBox::Show(String::Concat("Unhandled Exception!\n", args->ExceptionObject->GetType()->ToString()), "Exceptions");         
   }
};

void main(){
      // Setup unhandled exception handler
      Thread::GetDomain()->UnhandledException += new UnhandledExceptionEventHandler(__typeof(Handler), Handler::HandleUnhandled);

      // Function calls that use exception handling blocks to catch exceptions
      ProtectedFunction(1);
      Console::WriteLine();
      ProtectedFunction(2);
      Console::WriteLine();
      ProtectedFunction(3);
      Console::WriteLine();

      // This one just throws
      Console::WriteLine("Just about to execute code that throws an unhandled exception:");
      MethodThatThrows(1);
      // This code is never executed
      Console::WriteLine("This code never executes!");
}


