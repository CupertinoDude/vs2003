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
Imports System.Net
Imports System.IO
Imports System.Text
Imports microsoft.visualbasic

Namespace Client
Public Class ClientWebException

    Public Shared Sub Main()
        Dim ResolvedURI As Boolean = False
        Dim UriToResolve As String
        Dim ReceiveStream As Stream
        Dim encode As Encoding
        Dim sr As StreamReader
        Dim read(256) As Char

        While (Not ResolvedURI)
            Try
                ' Get a uri from the user
                Console.Write("Please enter the uri to resolve: ")
                UriToResolve = Console.ReadLine()
                Console.WriteLine()

                ' Create the request object
                Dim request As WebRequest = WebRequest.Create(UriToResolve)
                request.Credentials = New NetworkCredential("invaliduser", "invalidpassword")

                ' Create the response object
                Dim response As WebResponse = request.GetResponse()
                Console.WriteLine("URI Resolved!")

                ' Successfully resolved the URI
                ResolvedURI = True

                ReceiveStream = response.GetResponseStream()
            	encode = System.Text.Encoding.GetEncoding("utf-8")
            	sr = new StreamReader( ReceiveStream, encode )

                Console.WriteLine()
                Console.WriteLine("Response stream received")
        	    Dim count As Integer = sr.Read( read, 0, 256 )

                Console.WriteLine("HTML...")
                Console.WriteLine()
                Do While count > 0
    		        Dim str As String = new String(read, 0, count)
                    Console.Write(str)
                    count = sr.Read(read, 0, 256)
                Loop
                Console.WriteLine("")

            Catch WebExcp As WebException
                '  If you get to this point, the exception has been caught
                Console.WriteLine("A WebException has been caught!")

                '  Write out the Exception message
                Console.WriteLine(WebExcp.ToString())

                '  Get the WebException status code
                If (WebExcp.Status = WebExceptionStatus.ProtocolError) Then '  7 indicates a protocol error, thus a WebResonse object should exist
                    '  Write out the WebResponse protocol status
                    Console.WriteLine("Error received from Server")
                End If
            Catch UriExcp As URIFormatException
                '  If you get to this point, the exception has been caught
                Console.WriteLine("A URIFormatException has been caught!")
                '  Write out the Exception message
                Console.WriteLine(UriExcp.ToString())
            Catch e As Exception
                console.WriteLine(e.ToString())
            End Try
        End While

        Console.WriteLine()
        Console.WriteLine("Press Enter to continue...")
        Console.ReadLine()
    End Sub
End Class
End Namespace
