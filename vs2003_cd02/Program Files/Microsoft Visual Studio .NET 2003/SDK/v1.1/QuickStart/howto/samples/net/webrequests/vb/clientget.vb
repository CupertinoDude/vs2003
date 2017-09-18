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

Namespace Client
    Public class ClientGET
        Public Shared bShow As Boolean

        Public Shared Sub   Main()

            Dim args As String ()
            Dim Url As String
            args = Environment.GetCommandLineArgs()

            If (args.Length < 2)
                showusage()
            Else
                If (args.Length = 3)
                    bShow = False
                Else
                    bShow = True
                End If

                getPage(args(1))
            End If

            Console.WriteLine()
            Console.WriteLine("Press Enter to continue...")
            Console.ReadLine()

            Return
        End Sub

        public Shared Sub showusage()
            Console.WriteLine("Attempts to GET a URL")
            Console.WriteLine()
            Console.WriteLine("Usage:")
            Console.WriteLine("ClientGET URL")
            Console.WriteLine()
            Console.WriteLine("Examples:")
            Console.WriteLine("ClientGET http://www.microsoft.com/net/")
        End Sub

        public Shared Sub getPage(url As String)
            Dim result As WebResponse

            Try
                Dim req As WebRequest
                Dim ReceiveStream As Stream
                Dim encode As Encoding
                Dim sr As StreamReader

                req = WebRequest.Create(url)
                result = req.GetResponse()
                ReceiveStream = result.GetResponseStream()
            	encode = System.Text.Encoding.GetEncoding("utf-8")
            	sr = new StreamReader( ReceiveStream, encode )

            	Console.WriteLine()
                Console.WriteLine("Response stream received")
                If bShow
                    Dim read(256) As Char
            	    Dim count As Integer = sr.Read( read, 0, 256 )

                    Console.WriteLine("HTML...")
                    Console.WriteLine()
                    Do While count > 0
        		        Dim str As String = new String(read, 0, count)
                        Console.Write(str)
                        count = sr.Read(read, 0, 256)
                    Loop
                    Console.WriteLine("")
                End If
            Catch Exc As Exception
                Console.WriteLine()
                Console.WriteLine("The request URI could not be found or was malformed")
            Finally
                If Not Result Is Nothing Then
                    Result.Close()
                End If
            End Try
        End Sub
    End Class
End Namespace

