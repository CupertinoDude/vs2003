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
imports System.Runtime.InteropServices

Namespace TestClient
	Public Class Test 
		Public Shared Sub Main()
			Dim strServer As StringTest2Lib.ITestString
			strServer = New StringTest2Lib.TestString
			
			Dim param1 As String = "String Sample 1"
			Dim param2 As String = "String Sample 2"
			Dim param3 As String = "String Sample 3"			
			
			
		        Console.WriteLine("Calling PassBSTR with s = {0}", param1)
		        strServer.PassBStr(param1)
		        Console.WriteLine("After call s = {0}", param1)			
				
		        Console.WriteLine("Calling PassLPStr with s = {0}", param2)
		        strServer.PassLPStr(param2)
		        Console.WriteLine("After call s = {0}", param2)
		
		        Console.WriteLine("Calling PassLPWStr with s = {0}", param3)
		        strServer.PassLPWStr(param3)
		        Console.WriteLine("After call s = {0}", param3)


		        Console.WriteLine("Calling PassBSTRRef with s = {0}", param1)
		        strServer.PassBStrRef(param1)
		        Console.WriteLine("After call s = {0}", param1)	
		 
		        Console.WriteLine("Calling PassLPStrRef with s = {0}", param2)
		   	strServer.PassLPStrRef(param2)
		        Console.WriteLine("After call s = {0}", param2)
		
		        Console.WriteLine("Calling PassLPWStrRef with s = {0}", param3)
		        strServer.PassLPWStrRef(param3)
		        Console.WriteLine("After call s = {0}", param3)			
			
			
			Console.Write("Press Enter to quit")
			Dim s As String = Console.ReadLine
			
			Do While s <> ""
				s = Console.ReadLine
			Loop			
		
		End Sub
	End Class
End Namespace


