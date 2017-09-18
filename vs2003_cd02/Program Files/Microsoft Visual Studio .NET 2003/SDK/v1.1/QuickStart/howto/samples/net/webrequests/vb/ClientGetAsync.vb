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
Imports System.Threading
Imports System.Text
Imports System.IO


' The RequestState class is used to pass data
' across async calls
Public Class RequestState

		Public RequestData As New StringBuilder("")
		Public BufferRead(1024) As Byte
		Public Request As HttpWebRequest
		Public ResponseStream As Stream
		' Create Decoder for appropriate encoding type
		Public StreamDecode As Decoder = Encoding.UTF8.GetDecoder()

		Public Sub New
			Request = Nothing
			ResponseStream = Nothing
		End Sub
End Class

' ClientGetAsync issues the async request
Class ClientGetAsync
	Shared allDone As New ManualResetEvent(False)
   	Const BUFFER_SIZE As Integer = 1024

    Shared Sub Main()
        Dim Args As String() = Environment.GetCommandLineArgs()

        If Args.Length < 2 Then
            ShowUsage()
            Return
        End If

		' Get the URI from the command line
        Dim HttpSite As Uri = New Uri(Args(1))

		' Create the request object
        Dim wreq As HttpWebRequest = CType(WebRequest.Create(HttpSite), HttpWebRequest)

		' Create the state object
		Dim rs As RequestState = New RequestState()

		' Add the request into the state so it can be passed around
		rs.Request = wreq

		' Issue the async request
        Dim r As IAsyncResult = CType(wreq.BeginGetResponse(New AsyncCallback(AddressOf RespCallback), rs), IAsyncResult)

		' Set the ManualResetEvent to Wait so that the app
		' doesn't exit until after the callback is called
        allDone.WaitOne()
    End Sub

    Shared Sub ShowUsage()
        Console.WriteLine("Attempts to GET a URL")
        Console.WriteLine()
        Console.WriteLine("Usage:")
        Console.WriteLine("ClientGetAsync URL")
        Console.WriteLine("Examples:")
        Console.WriteLine("ClientGetAsync http://www.microsoft.com/net/")
    End Sub

    Shared Sub RespCallback(ar As IAsyncResult)
    	' Get the RequestState object from the async result
		Dim rs As RequestState = CType(ar.AsyncState, RequestState)

    	' Get the HttpWebRequest from RequestState
        Dim req As HttpWebRequest= rs.Request

    	' Calling EndGetResponse produces the HttpWebResponse object
    	' which came from the request issued above
        Dim resp As HttpWebResponse = CType(req.EndGetResponse(ar), HttpWebResponse)

    	' Now that we have the response, it is time to start reading
    	' data from the response stream
		Dim ResponseStream As Stream = resp.GetResponseStream()

    	' The read is also done using async so we'll want
    	' to store the stream in RequestState
		rs.ResponseStream = ResponseStream

    	' Note that rs.BufferRead is passed in to BeginRead.  This is
    	' where the data will be read into.
		Dim iarRead As IAsyncResult = ResponseStream.BeginRead(rs.BufferRead, 0, BUFFER_SIZE, New AsyncCallback(AddressOf ReadCallBack), rs)
    End Sub

	Shared Sub ReadCallBack(asyncResult As IAsyncResult)
		' Get the RequestState object from the asyncresult
		Dim rs As RequestState = CType(asyncResult.AsyncState, RequestState)

		' Pull out the ResponseStream that was set in RespCallback
		Dim responseStream As Stream = rs.ResponseStream

		' At this point rs.BufferRead should have some data in it.
		' Read will tell us if there is any data there
		Dim read As Integer = responseStream.EndRead( asyncResult )
		If read > 0 Then
			' Prepare Char array buffer for converting to Unicode
			Dim charBuffer(1024) As Char

			' Convert byte stream to Char array and then String
			' len shows how many characters are converted to Unicode
			Dim len As Integer = rs.StreamDecode.GetChars(rs.BufferRead, 0, read, charBuffer, 0)
			Dim str As String = new String(charBuffer, 0, len) 	

			' Append the recently read data to the RequestData stringbuilder object
			' contained in RequestState
			rs.RequestData.Append(str)

			' Now fire off another async call to read some more data
			' Note that this will continue to get called until
			' responseStream.EndRead returns -1
			Dim ar As IAsyncResult = responseStream.BeginRead(rs.BufferRead, 0, BUFFER_SIZE, New AsyncCallback(AddressOf ReadCallBack), rs)
		Else
		    If rs.RequestData.Length > 1 Then
				' All of the data has been read, so display it to the console
				Dim strContent As String
				strContent = rs.RequestData.ToString()
				Console.WriteLine(strContent)
			End If

			' Close down the response stream
			responseStream.Close()

			' Set the ManualResetEvent so the main thread can exit
			allDone.Set()
		End If

		Return
	End Sub
End Class
