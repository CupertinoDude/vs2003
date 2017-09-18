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
imports System.Runtime.Remoting
imports System.Runtime.Remoting.Channels.TCP

namespace RemotingSamples

  <Serializable()> public class ForwardMe

    dim mValue as integer = 1

    public function CallMe() As Object
      mValue = mValue + 1
    end function

    public function getValue() As Integer
      getValue = mValue
    end function

  end class

  public class HelloServer
    inherits MarshalByRefObject

    public sub HelloServer()
      Console.WriteLine("HelloServer activated")
    end sub


    public function HelloMethod(obj as ForwardMe) as ForwardMe

      dim i as integer

      for i = 0 to 5
        obj.CallMe()
      next i

      HelloMethod = obj
    end function

  end class

end namespace
