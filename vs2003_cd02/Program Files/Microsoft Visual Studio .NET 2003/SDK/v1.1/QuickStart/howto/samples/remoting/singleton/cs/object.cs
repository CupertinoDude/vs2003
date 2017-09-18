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
using System.Runtime.Remoting;
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Channels.Tcp;
using System.Runtime.Remoting.Channels.Http;

namespace RemotingSamples {
  public class HelloServer : MarshalByRefObject {

    private static int mCounter = 0;

    public HelloServer()
    {
      Console.WriteLine("HelloServer activated");
    }

    public String HelloMethod(String name)
    {
      Console.WriteLine("Hello.HelloMethod : {0}", name);
      return String.Format("Hi there {0}", name);
    }

    public int CountMe()
    {
      lock(this) {
        return mCounter++;
      }
    }
  }
}
