/*=====================================================================

  File:      FooAssembly.cs

---------------------------------------------------------------------
This file is part of the Microsoft .NET Framework SDK Code Samples.

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
using System.Reflection;
using System.Runtime.Remoting;
using System.Runtime.Remoting.Messaging;

namespace FooAssembly
{
    [Serializable]
    public class CallContextString : ILogicalThreadAffinative
    {
      String _str ="";
      public CallContextString(String str)
      {
        _str = str;
      }

      public override String ToString()
      {
        return _str;
      }
    }

    public class ValueObject
    {
        public ValueObject()
        {
        }

        public String DoWork()
        {
                CallContextString z = (CallContextString) CallContext.GetData("USER");
                Console.WriteLine("USER = " + z.ToString());

            return z.ToString();
        }

        ~ValueObject()
        {
        }
    }

    public class SimpleObject: MarshalByRefObject
    {
        public SimpleObject()
        {
            Console.WriteLine("SimpleObject Constructor is Running ...");
        }

        public string DoWork()
        {
            CallContextString z = (CallContextString) CallContext.GetData("USER");
            Console.WriteLine("USER = " + z);

            return z.ToString();
        }

        public string DoValueWork(ValueObject o)
        {
            Type t = o.GetType();
            MethodInfo method = t.GetMethod("DoWork");
            object r = method.Invoke((object) o, (object[]) null);

            return (String) r;
        }

        
        ~SimpleObject()
        {
        }
    }
}
