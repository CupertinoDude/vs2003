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
Imports System.Reflection

<Assembly: AssemblyKeyFile("../keypair.dat")>

Namespace SecuritySamples
    
    Public Class GoodCaller
        
        Public Shared Sub Main()
            
            Try
                Console.WriteLine(SharedComponent.GetInfo())
            Catch e As Exception
                Console.WriteLine("Exception occurred: {0}", e)
            End Try
            
            Console.WriteLine("")
            Console.Write("Press Enter to exit...")
            Console.Read()
        
        End Sub 'Main
        
    End Class 'GoodCaller
    
End Namespace 'SecuritySamples
