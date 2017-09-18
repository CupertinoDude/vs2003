/*=====================================================================
  File:      ThreadStaticVariables.cs

  Summary:   Demonstrates how to use [ThreadStatic] to create statics
             backed by thread local storage.

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
using System.Threading;

class Operation {
   // NOTE: Only the first instance (Thread 3) of x will be set to 10.
   // When new thread static instances are created (Threads 1 & 2), thread
   // static variables are always zeroed out. This sample demonstrates this.
   [ThreadStatic] static Int32 tsValue = 10;
   Int32 threadId;

   public Operation(Int32 threadId) {
      this.threadId = threadId;
   }
  
   public void ThreadMethod() {
      // Locking is done so that each thread's output is grouped together
      // making the output easier to read
      lock (typeof(Operation)) {
         for (Int32 x = 0 ; x < 10; x++) {
            Console.WriteLine("Thread {0}: {1}", threadId, tsValue++);
         }
      }
   }
}


class App {
   static void Main() {
      // Create 3 Operation objects; each one processed by its own thread
      Operation o1 = new Operation(0);
      Thread t1 = new Thread(new ThreadStart(o1.ThreadMethod));
      t1.Start();

      Operation o2 = new Operation(1);
      Thread t2 = new Thread(new ThreadStart(o2.ThreadMethod));
      t2.Start();

      Operation o3 = new Operation(2);
      o3.ThreadMethod();  // The primary thread will execute this method

      // Wait for the other threads to terminate
      t1.Join();
      t2.Join();
   }
}
