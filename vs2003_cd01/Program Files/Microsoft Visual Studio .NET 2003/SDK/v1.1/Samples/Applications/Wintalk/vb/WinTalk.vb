'=====================================================================
'  File:      Wintalk.vb
'
'  Summary:   Demonstrates how to create a socket chat application
'             using various .NET Framework library types.
'
'---------------------------------------------------------------------
'  This file is part of the Microsoft .NET Framework SDK Code Samples.
'
'  Copyright (C) 2000 Microsoft Corporation.  All rights reserved.
'
'This source code is intended only as a supplement to Microsoft
'Development Tools and/or on-line documentation.  See these other
'materials for detailed information regarding Microsoft code samples.
'
'THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
'KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
'IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
'PARTICULAR PURPOSE.
'=====================================================================

Option Explicit On 
Option Strict On

Imports System
Imports System.Globalization
Imports System.IO
Imports System.Text
Imports System.Threading
Imports System.Net
Imports System.Net.Sockets
Imports System.Drawing
Imports System.Windows.Forms
Imports Microsoft.VisualBasic



Class App
    
    ' Entry point
    Public Shared Sub Main(args() As String)
        ' If the args parse in known way then run the app
        If ParseArgs(args) Then
            ' Create a custom Talker object
            Dim talkerObj As New Talker(endPoint, client)
            ' Pass the object reference to a new form object
            Dim form As New TalkForm(talkerObj)
            ' Start the talker "talking"
            talkerObj.Start()
            
            ' Run the applications message pump
            Application.Run(form)
        End If
    End Sub 'Main
    
    ' Parsed Argument Storage
    Private Shared endPoint As IPEndPoint
    Private Shared client As Boolean
    
    
    ' Parse command line arguments
    Private Shared Function ParseArgs(args() As String) As Boolean
        Try
            If args.Length = 0 Then
                client = False
                endPoint = New IPEndPoint(IPAddress.Any, 5150)
                Return True
            End If
            If Not (args(0).ToCharArray()(0) = "/" Or args(0).ToCharArray()(0) = "-") Then
                ShowUsage()
                Return False
            End If
            Dim port As Integer
            Select Case Char.ToUpper(args(0).ToCharArray()(1), CultureInfo.InvariantCulture)
                Case "L"c
                    port = 5150
                    If args.Length > 1 Then
                        port = Convert.ToInt32(args(1))
                    End If
                    endPoint = New IPEndPoint(IPAddress.Any, port)
                    client = False
                Case "C"c
                    port = 5150
                    Dim address As String = "127.0.0.1"
                    client = True
                    If args.Length > 1 Then
                        address = args(1)
                        port = Convert.ToInt32(args(2))
                    End If
                    endPoint = New IPEndPoint(Dns.Resolve(address).AddressList(0), port)
                Case Else
                    ShowUsage()
                    Return False
            End Select
        Catch
        End Try
        
        Return True
    End Function 'ParseArgs
    
    
    ' Show sample usage
    Private Shared Sub ShowUsage()
        MessageBox.Show("WinTalk [switch] [parameters...]" & ControlChars.CrLf & ControlChars.CrLf & _
            "  /L  [port]" & ControlChars.Tab & ControlChars.Tab & "-- Listens on a port.  Default:  5150" & ControlChars.CrLf & _
            "  /C  [address] [port]" & ControlChars.Tab & "-- Connects to an address and port." & ControlChars.CrLf & ControlChars.CrLf & _
            "Example Server - " & ControlChars.CrLf & _
            "Wintalk /L" & ControlChars.CrLf & ControlChars.CrLf & _
            "Example Client - " & ControlChars.CrLf & _
            "Wintalk /C ServerMachine 5150", "WinTalk Usage")
    End Sub 'ShowUsage
End Class 'App


' UI class for the sample
Class TalkForm
    Inherits Form
    
    Public Sub New(talkerObj As Talker)
        ' Associate for method with the talker object
        Me.talkerObj = talkerObj
        AddHandler talkerObj.Notifications, AddressOf HandleTalkerNotifications
        
        ' Create a UI elements
        Dim talkSplitter As New Splitter()
        Dim talkPanel As New Panel()

        receiveText = New TextBox()
        sendText = New TextBox()
        
        'we'll support up to 64k data in our text box controls
        receiveText.MaxLength = 65536
        sendText.MaxLength = 65536
        
        statusText = New Label()
        
        ' Initialize UI elements
        receiveText.Dock = DockStyle.Top
        receiveText.Multiline = True
        receiveText.ScrollBars = ScrollBars.Both
        receiveText.Size = New Size(506, 192)
        receiveText.TabIndex = 1
        receiveText.Text = ""
        receiveText.WordWrap = False
        receiveText.ReadOnly = True
        
        talkPanel.Anchor = AnchorStyles.Top Or AnchorStyles.Bottom Or AnchorStyles.Left Or AnchorStyles.Right
        talkPanel.Controls.AddRange(New Control() {sendText, talkSplitter, receiveText})
        talkPanel.Size = New Size(506, 371)
        talkPanel.TabIndex = 0
        
        talkSplitter.Dock = DockStyle.Top
        talkSplitter.Location = New Point(0, 192)
        talkSplitter.Size = New Size(506, 6)
        talkSplitter.TabIndex = 2
        talkSplitter.TabStop = False
        
        statusText.Dock = DockStyle.Bottom
        statusText.Location = New Point(0, 377)
        statusText.Size = New Size(507, 15)
        statusText.TabIndex = 1
        statusText.Text = "Status:"
        
        sendText.Dock = DockStyle.Fill
        sendText.Location = New Point(0, 198)
        sendText.Multiline = True
        sendText.ScrollBars = ScrollBars.Both
        sendText.Size = New Size(506, 173)
        sendText.TabIndex = 0
        sendText.Text = ""
        sendText.WordWrap = False
        AddHandler sendText.TextChanged, AddressOf HandleTextChange
        sendText.Enabled = False
        
        AutoScaleBaseSize = New Size(5, 13)
        ClientSize = New Size(507, 392)
        Controls.AddRange(New Control() {statusText, talkPanel})
        Me.Text = "WinTalk"

    End Sub 'New


    ' When the app closes, dispose of the talker object
    Protected Overrides Sub OnClosed(ByVal e As EventArgs)
        If Not (talkerObj Is Nothing) Then
            RemoveHandler talkerObj.Notifications, AddressOf HandleTalkerNotifications
            talkerObj.Dispose()
        End If
        MyBase.OnClosed(e)
    End Sub 'OnClosed


    ' Handle notifications from the talker object
    Private Sub HandleTalkerNotifications(ByVal notify As Talker.Notification, ByVal data As Object)
        Select Case notify
            Case Talker.Notification.Initialized
                ' Respond to status changes
            Case Talker.Notification.StatusChange
                Dim statusObj As Talker.Status = CType(data, Talker.Status)
                statusText.Text = String.Format("Status: {0}", statusObj)
                If statusObj = Talker.Status.Connected Then
                    sendText.Enabled = True
                    sendText.Focus()
                End If
                ' Respond to received text
            Case Talker.Notification.ReceivedAppend
                receiveText.AppendText(data.ToString())
            Case Talker.Notification.ReceivedRefresh
                receiveText.Text = data.ToString()
                receiveText.SelectionStart = Int32.MaxValue
                receiveText.ScrollToCaret()
                ' Respond to error notifications
            Case Talker.Notification.ErrorNotify
                Close(data.ToString())
                ' Respond to end
            Case Talker.Notification.EndNotify
                'Don't send any more text
                RemoveHandler sendText.TextChanged, AddressOf HandleTextChange
                MessageBox.Show(Me, data.ToString(), "Closing WinTalk")
                Close()
            Case Else
                Close()
        End Select
    End Sub 'HandleTalkerNotifications


    ' Handle text change notifications and send talk
    Private Sub HandleTextChange(ByVal sender As Object, ByVal e As EventArgs)
        If Not (talkerObj Is Nothing) Then
            talkerObj.SendTalk(CType(sender, TextBox).Text)
        End If
    End Sub 'HandleTextChange


    ' Close with an explanation
    Private Overloads Sub Close(ByVal message As String)
        MessageBox.Show(message, "Error!")
        Close()
    End Sub 'Close

    ' Private UI elements
    Private receiveText As TextBox
    Private sendText As TextBox
    Private statusText As Label
    Private talkerObj As Talker
End Class 'TalkForm


' An encapsulation of the Sockets class used for socket chatting
Class Talker
    Implements IDisposable
    
    ' Construct a talker 
    Public Sub New(endPoint As IPEndPoint, client As Boolean)
        Me.endPoint = endPoint
        Me.client = client
        
        socket = Nothing
        reader = Nothing
        writer = Nothing
        
        statusText = String.Empty
        prevSendText = String.Empty 
        prevReceiveText = String.Empty
    End Sub 'New
    
    
    ' Finalize a talker
    Overrides Protected Sub Finalize()
        Dispose()
        MyBase.Finalize()
    End Sub 'Finalize
    
    
    ' Dispose of resources and surpress finalization
    Public Sub Dispose() Implements IDisposable.Dispose
        GC.SuppressFinalize(Me)
        If Not (reader Is Nothing) Then
            reader.Close()
            reader = Nothing
        End If
        If Not (writer Is Nothing) Then
            writer.Close()
            writer = Nothing
        End If
        If Not (socket Is Nothing) Then
            socket.Close()
            socket = Nothing
        End If
    End Sub 'Dispose
    
    
    ' Nested delegate class and matchine event
    Delegate Sub NotificationCallback(notify As Notification, data As Object)
    Public Event Notifications As NotificationCallback
    
    
    ' Nested enum for notifications
    Public Enum Notification
        Initialized = 1
        StatusChange
        ReceivedAppend
        ReceivedRefresh
        EndNotify
        ErrorNotify
    End Enum 'Notification
    
    
    ' Nested enum for supported states
    Public Enum Status
        Listening
        Connected
    End Enum 'Status
    
    
    ' Start up the talker's functionality
    Public Sub Start()
        ThreadPool.QueueUserWorkItem(New System.Threading.WaitCallback(AddressOf EstablishSocket))
    End Sub 'Start
    
    
    ' Establish a socket connection and start receiving
    Private Sub EstablishSocket(ByVal state As Object)
        Dim stream As NetworkStream
        stream = Nothing
        Try
            ' If not client, setup listner
            If Not client Then
                Dim listener As Socket

                Try
                    listener = New Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp)
                    listener.Blocking = True
                    listener.Bind(endPoint)
                    SetStatus(Status.Listening)
                    listener.Listen(0)
                    socket = listener.Accept()
                    listener.Close()
                    stream = New NetworkStream(socket)
                    reader = New StreamReader(stream)
                    writer = New StreamWriter(stream)
                    writer.Write("WINTALK .NET")
                    writer.Flush()
                Catch e As SocketException
                    ' If there is already a listener on this port try client
                    If e.ErrorCode = 10048 Then
                        client = True
                        endPoint = New IPEndPoint(Dns.Resolve("127.0.0.1").AddressList(0), endPoint.Port)
                    Else
                        RaiseEvent Notifications(Notification.ErrorNotify, "Error Initializing Socket:" & ControlChars.CrLf & e.ToString())
                    End If
                End Try
            End If

            ' Try a client connection
            If client Then
                Dim temp As New Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp)
                temp.Blocking = True
                temp.Connect(endPoint)
                socket = temp
                socket.SetSocketOption(SocketOptionLevel.Socket, SocketOptionName.ReceiveTimeout, 5000)
                socket.SetSocketOption(SocketOptionLevel.Socket, SocketOptionName.SendTimeout, 5000)
                stream = New NetworkStream(socket)
                reader = New StreamReader(stream)
                writer = New StreamWriter(stream)
                Dim handshake(11) As Char
                Try
                    If Not (reader.Read(handshake, 0, 12) > 0 And New String(handshake) = "WINTALK .NET") Then
                        socket.Close()
                        socket = Nothing
                    Else
                        socket.SetSocketOption(SocketOptionLevel.Socket, SocketOptionName.ReceiveTimeout, 0)
                        socket.SetSocketOption(SocketOptionLevel.Socket, SocketOptionName.SendTimeout, 0)
                    End If
                Catch
                    socket.Close()
                    socket = Nothing
                End Try
            End If

            ' If it all worked out, create stream objects
            If Not (socket Is Nothing) Then
                SetStatus(Status.Connected)
                RaiseEvent Notifications(Notification.Initialized, Me)
                ' Start receiving talk
                ' Note: on w2k and later platforms, the NetworkStream.Read()
                ' method called in ReceiveTalke will generate an exception when
                ' the remote connection closes. We handle this case in our
                ' catch block below.
                ReceiveTalk()

                ' On Win9x platforms, NetworkStream.Read() returns 0 when
                ' the remote connection closes, prompting a graceful return
                ' from ReceiveTalk() above. We will generate a Notification.End
                ' message here to handle the case and shut down the remaining
                ' WinTalk instance.
                RaiseEvent Notifications(Notification.EndNotify, "Remote connection has closed.")
            Else
                RaiseEvent Notifications(Notification.ErrorNotify, "Failed to Establish Socket, did you specify the correct port?")
            End If


        Catch e As IOException
            Dim sockExcept As SocketException = CType(e.InnerException, SocketException)
            If Not (sockExcept Is Nothing) And 10054 = sockExcept.ErrorCode Then
                RaiseEvent Notifications(Notification.EndNotify, "Remote connection has closed.")
            Else
                RaiseEvent Notifications(Notification.ErrorNotify, "Socket Error:" & ControlChars.CrLf & e.Message)
            End If
        Catch e As Exception
            RaiseEvent Notifications(Notification.ErrorNotify, "Socket Error:" & ControlChars.CrLf & e.Message)
        End Try
    End Sub 'EstablishSocket


    ' Send text to remote connection
    Public Sub SendTalk(ByVal newText As String)
        Dim send As String
        ' Is this an append
        If prevSendText.Length <= newText.Length And String.CompareOrdinal(newText, 0, prevSendText, 0, prevSendText.Length) = 0 Then
            Dim append As [String] = newText.Substring(prevSendText.Length)
            send = String.Format("A{0}:{1}", append.Length, append)
            ' or a complete replacement
        Else
            send = String.Format("R{0}:{1}", newText.Length, newText)
        End If
        ' Send the data and flush it out
        writer.Write(send)
        writer.Flush()
        ' Save the text for future comparison
        prevSendText = newText
    End Sub 'SendTalk


    ' Send a status notification
    Private Sub SetStatus(ByVal statusObj As Status)
        Me.statusObj = statusObj
        RaiseEvent Notifications(Notification.StatusChange, statusObj)
    End Sub 'SetStatus


    ' Receive chat from remote client
    Private Sub ReceiveTalk()
        Dim commandBuffer(19) As Char
        Dim oneBuffer(0) As Char
        Dim readMode As Integer = 1
        Dim counter As Integer = 0
        Dim textObj As New StringBuilder()

        While readMode <> 0
            If reader.Read(oneBuffer, 0, 1) = 0 Then
                readMode = 0
            Else
                Select Case readMode
                    Case 1
                        If counter = commandBuffer.Length Then
                            readMode = 0
                        End If
                        If oneBuffer(0) <> ":"c Then
                            commandBuffer(counter) = oneBuffer(0)
                            counter = counter + 1
                        Else
                            counter = Convert.ToInt32(New String(commandBuffer, 1, counter - 1))
                            If counter > 0 Then
                                readMode = 2
                                textObj.Length = 0
                            Else
                                If commandBuffer(0) = "R"c Then
                                    counter = 0
                                    prevReceiveText = String.Empty
                                    RaiseEvent Notifications(Notification.ReceivedRefresh, prevReceiveText)
                                End If
                            End If
                        End If
                    Case 2
                        textObj.Append(oneBuffer(0))
                        counter = counter - 1
                        If counter = 0 Then
                            Select Case commandBuffer(0)
                                Case "R"c
                                    prevReceiveText = textObj.ToString()
                                    RaiseEvent Notifications(Notification.ReceivedRefresh, prevReceiveText)
                                Case Else
                                    Dim newText As String
                                    newText = textObj.ToString()
                                    prevReceiveText += newText
                                    RaiseEvent Notifications(Notification.ReceivedAppend, newText)
                            End Select
                            readMode = 1                            
                        End If
                    Case Else
                        readMode = 0
                End Select
            End If
        End While
    End Sub 'ReceiveTalk

    Private socket As socket

    Private reader As TextReader
    Private writer As TextWriter

    Private client As Boolean
    Private endPoint As IPEndPoint

    Private prevSendText As String
    Private prevReceiveText As String
    Private statusText As String

    Private statusObj As Status
End Class 'Talker
