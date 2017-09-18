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
    Public class ClientGETntlm
        Public Shared bShow As Boolean

        Public Shared Sub Main()
            Dim args As String ()
            args = Environment.GetCommandLineArgs()

            If (args.Length < 5)
                showusage()
            Else
                If (args.Length > 5)
                    bShow = false
                Else
                    bShow = true
                End If

                getPage(args(1), args(2), args(3), args(4))
            End If

            Console.WriteLine()
            Console.WriteLine("Press Enter to continue...")
            Console.ReadLine()
        End Sub

        public Shared Sub showusage()
            Console.WriteLine("Attempts to GET a URL")
            Console.WriteLine()
            Console.WriteLine("Usage:")
            Console.WriteLine("ClientGETwithNTLM URL username password domain")
            Console.WriteLine()
            Console.WriteLine("Examples:")
            Console.WriteLine("ClientGETwithNTLM http://www.microsoft.com/net/ Bobby BobbyLovesMangos THEDOMAIN")
        End Sub

        public Shared Sub getPage(url As String, username As String, password As String, Domain As String)
            Try
                Dim req As WebRequest
                Dim result As WebResponse
                Dim ReceiveStream As Stream
                Dim encode As Encoding
                Dim sr As StreamReader
                Dim sc As NetworkCredential

                req = WebRequest.Create(url)
                sc = new NetworkCredential(username, password, Domain)
                req.Credentials = sc
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
            End Try
        End Sub
    End Class
End Namespace

