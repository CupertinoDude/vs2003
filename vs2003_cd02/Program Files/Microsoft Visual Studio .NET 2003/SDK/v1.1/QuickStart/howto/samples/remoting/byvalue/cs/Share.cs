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

namespace RemotingSamples {

  [Serializable]
  public class ForwardMe {

    private int mValue = 1;

    public void CallMe()
    {
      mValue++;
    }

    public int getValue()
    {
      return mValue;
    }
  }

  public class HelloServer : MarshalByRefObject {

    public HelloServer()
    {
      Console.WriteLine("HelloServer activated");
    }

    public ForwardMe HelloMethod(ForwardMe obj)
    {
      for (int i=0; i < 5; i++) obj.CallMe();
      return obj;
    }
  }
}
