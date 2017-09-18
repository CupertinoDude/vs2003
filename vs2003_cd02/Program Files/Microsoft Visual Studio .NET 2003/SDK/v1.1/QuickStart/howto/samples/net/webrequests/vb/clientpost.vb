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
Imports System.Web
Imports Microsoft.VisualBasic

Namespace Client
    Public class ClientPOST
        Public Shared Sub  Main()
            Dim args As String ()

            args = Environment.GetCommandLineArgs()

            If (args.Length < 2)
                showusage()
            Else
                If args.Length < 3 Then
                    getPage(args(1), "sl=foo&s2=bar")
                Else
                    getPage(args(1), args(2))
                End If
            End If

            Console.WriteLine()
            Console.WriteLine("Press any key to continue...")
            Console.ReadLine()
        End Sub

        Public Shared Sub showusage()
            Console.WriteLine("Attempts to POST to a URL")
            Console.WriteLine()
            Console.WriteLine("Usage:")
            Console.WriteLine("ClientPOST URL [postdata]")
            Console.WriteLine()
            Console.WriteLine("Examples:")
            Console.WriteLine("ClientPOST http://www.nba.com [s1=foo&s2=bar]")
        End Sub

        Public Shared Sub getPage(url As String, payload as String)
            Dim result As WebResponse

            Try
                Dim req As WebRequest
                Dim RequestStream As Stream
                Dim ReceiveStream As Stream
                Dim encode As Encoding
                Dim sr As StreamReader

                req = WebRequest.Create(url)
                req.Method = "POST"
                req.ContentType = "application/x-www-form-urlencoded"
                Dim SomeBytes() as Byte
		Dim UrlEncoded As New StringBuilder
		Dim reserved() As Char = {ChrW(63),ChrW(61), ChrW(38)}

                if payload <> Nothing
		    Dim i As Integer = 0
		    Dim j As Integer
		    while i<payload.Length
			j=payload.IndexOfAny(reserved, i)
			if j=-1
			    UrlEncoded.Append(HttpUtility.UrlEncode(payload.Substring(i, payload.Length-i)))
			    Exit while
			End if
			UrlEncoded.Append(HttpUtility.UrlEncode(payload.Substring(i, j-i)))
			UrlEncoded.Append(payload.Substring(j,1))
			i = j+1
		    End while
                    SomeBytes = System.Text.Encoding.UTF8.GetBytes(UrlEncoded.ToString())
                    req.ContentLength = SomeBytes.Length
                    RequestStream = req.GetRequestStream()
                    RequestStream.Write(SomeBytes, 0, SomeBytes.Length)
                    RequestStream.Close()
                Else
                    req.ContentLength = 0
                End if
                result = req.GetResponse()
                ReceiveStream = result.GetResponseStream()
            	encode = System.Text.Encoding.GetEncoding("utf-8")
            	sr = new StreamReader( ReceiveStream, encode )

            	Console.WriteLine()
                Console.WriteLine("Response stream received")
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

