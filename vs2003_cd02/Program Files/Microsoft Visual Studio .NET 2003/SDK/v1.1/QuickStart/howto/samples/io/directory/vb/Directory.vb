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
Imports System.IO

Class DirectoryLister

    public shared sub Main()

        if(Environment.GetCommandLineArgs().Length = 2)
	    ListDirectory( Environment.GetCommandLineArgs()(1) )
	else
            Console.WriteLine("Usage: Directory.exe <directory>")
	end if
    End Sub
    Public Shared Function ListDirectory( dirToList As String ) As String

	' declare the StreamReader, for accessing the file
	Dim strWriter As StringWriter = New StringWriter()

	Try
		Dim dir As DirectoryInfo = New DirectoryInfo( dirToList )

		Console.WriteLine()
		Console.WriteLine()
		Console.WriteLine("Following is a listing for directory: {0}", Path.GetFullPath(dir.ToString()))
		Console.WriteLine()
	        Console.WriteLine("{0, -25} {1,-12:N0} {2, -12} {3,-20:g}", "Name", _
				("Size").PadLeft(12), "Type", "Creation Time")
        	Console.WriteLine("------------------------------------------------------------------")

		Dim fsi As FileSystemInfo

		For Each fsi In dir.GetFileSystemInfos()
		    Try
			Dim creationTime As DateTime = fsi.CreationTime
			Dim subLength As Integer = 25

                If TypeOf fsi Is FileInfo Then

				Dim f As FileInfo = CType( fsi, FileInfo )

				' this if statement simply ensures that we do not shorten the name of the file too much!
				If (f.Name.Length < subLength) Then
					subLength = f.Name.Length
				End If

		        	Dim name As String = f.Name.Substring(0, subLength)

		                Dim size As Long = f.Length

				'  format the output to the screen
        			Console.WriteLine("{0, -25} {1,-12:N0} {2, -12} {3,-20:g}", _
						name, (size & " KB").PadLeft(12), "File", creationTime)

	        	Else ' it must be a directory

				Dim d As DirectoryInfo = CType( fsi, DirectoryInfo )

				' this if statement simply ensures that we do not shorten the name of the file too much!
				If (d.Name.Length < subLength) Then
					subLength = d.Name.Length
				End If

				Dim dirName As String = d.Name.Substring(0, subLength)

				'  format the output to the screen
        		        Console.WriteLine("{0, -25} {1,-12:N0} {2, -12} {3,-20:g}", _
					dirName, ("").PadLeft(12), "File Folder", creationTime)
		        End If
		    Catch E As Exception
			' ignore the error, and try the next item...
		    End Try
		Next fsi

	Catch E As Exception
		Console.WriteLine("--- PROCESS ENDED ---")
		Console.WriteLine(e.Message)
		return strWriter.ToString()
	End Try

	ListDirectory = strWriter.ToString()
    End Function
End Class