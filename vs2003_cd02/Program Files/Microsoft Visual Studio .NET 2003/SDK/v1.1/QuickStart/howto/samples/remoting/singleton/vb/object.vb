'-----------------------------------------------------------------------
'  This file is part of the Microsoft .NET SDK Code Samples.
' 
'  Copyright (C) Microsoft Corporation.  All rights reserved.
' 
'This source code is intended only as a supplement to Microsoft
'Development Tools and/or on-line documentation.  See these other
'materials for detailed information regarding Microsoft code samples.
' 
'THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
'KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
'IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
'PARTICULAR PURPOSE.
'-----------------------------------------------------------------------

imports System
imports System.Threading
imports System.Runtime.Remoting
imports System.Runtime.Remoting.Channels
imports System.Runtime.Remoting.Channels.TCP
imports System.Runtime.Remoting.Channels.HTTP

namespace RemotingSamples

  public class HelloServer
    inherits MarshalByRefObject

    public shared mCounter as integer = 0

    public sub HelloServer()
      Console.WriteLine("HelloServer activated")
    end sub


    public function HelloMethod(name as String) as String
      Console.WriteLine("Hello.HelloMethod : {0}", name)
      Return String.Format("Hi there {0}", name)
    end function


    public function CountMe() as integer
      Monitor.Enter(Me)
        mCounter = mCounter + 1
        CountMe = mCounter
      Monitor.Exit(Me)
    end function

  end class

end namespace
