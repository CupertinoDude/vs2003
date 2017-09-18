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

Imports System
Imports System.Runtime.Remoting
Imports System.Runtime.Remoting.Channels.TCP

Namespace RemotingSamples

    Public Class ForwardMe
        Inherits MarshalByRefObject

        Public Function CallMe(name as String) As Object
        Console.WriteLine(name)
        End Function
    End Class

    Public Class HelloServer
        Inherits MarshalByRefObject

        Public Sub New()
            Console.WriteLine("HelloServer activated")
        End Sub

        Public Function HelloMethod(name as String,obj as ForwardMe) as String
            obj.CallMe("Regards from the server")
            Console.WriteLine("Hello.HelloMethod : {0}", name)
            Return String.Format("Hi there {0}", name)
        End Function
    End Class

End Namespace
