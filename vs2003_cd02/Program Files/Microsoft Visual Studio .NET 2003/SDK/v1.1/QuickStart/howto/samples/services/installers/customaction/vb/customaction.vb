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

public class Installers
	public shared sub Main()
		Dim assemblyName As String = Environment.GetCommandLineArgs()(0)
		If(Not assemblyName.EndsWith(".exe")) Then
			assemblyName = assemblyName + ".exe"
		End If
		Console.WriteLine("Please run InstallUtil.exe " + assemblyName)
        Console.WriteLine ()
        Console.WriteLine ("Press Enter to continue...")
        Console.ReadLine()
	end sub
end class