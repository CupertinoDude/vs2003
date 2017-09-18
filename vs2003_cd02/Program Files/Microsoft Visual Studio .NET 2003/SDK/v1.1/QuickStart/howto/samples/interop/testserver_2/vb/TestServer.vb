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
Imports System.Runtime.CompilerServices

<assembly:AssemblyKeyFile("TestKey.snk")>
<assembly:AssemblyVersion("1.0.0.0")>

Namespace TestServer

	Public Interface ITest
		Function GetArray() As String()
	End Interface

	Public Class Test : Implements ITest
		Function GetArray() As String() Implements ITest.GetArray
			Dim stringArray() As String = {"one", "two", "three"}
			Return stringArray
		End Function
	End Class
	
End Namespace
