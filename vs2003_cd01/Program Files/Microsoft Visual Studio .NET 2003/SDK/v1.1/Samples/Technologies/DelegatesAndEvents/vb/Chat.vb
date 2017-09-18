'=====================================================================
'  File:      Chat.vb
'  Summary:   Demonstrates how to use delegates and events.
'---------------------------------------------------------------------
'  This file is part of the Microsoft .NET Framework SDK Code Samples.
'  Copyright (C) Microsoft Corporation.  All rights reserved.
'  This source code is intended only as a supplement to Microsoft
'  Development Tools and/or on-line documentation.  See these other
'  materials for detailed information regarding Microsoft code samples.
'  THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
'  KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
'  IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
'  PARTICULAR PURPOSE.
'=====================================================================

Option Explicit On 
Option Strict On


' Add the classes in the following namespaces to our namespace
Imports System
Imports Microsoft.VisualBasic


'/////////////////////////////////////////////////////////////////////////////

Class DChatServer
    
    ' Declare a multicast delegate type
    Delegate Sub OnMsgArrivedDel(message As String)
    
    ' Declare a reference to an OnGetString delegate
    Private Shared onMsgArrived As OnMsgArrivedDel
    
    
    ' Private to prevent instances of this type from being instantiated.
    Private Sub New()
    End Sub 'New
     
    ' This function is necessary because we are not using an event
    Public Shared Sub ClientConnect(onMsgArrivedObj As OnMsgArrivedDel)
        DChatServer.onMsgArrived = CType([Delegate].Combine(DChatServer.onMsgArrived, onMsgArrivedObj), OnMsgArrivedDel)
    End Sub 'ClientConnect
    
    
    ' This function is necessary because we are not using an event
    Public Shared Sub ClientDisconnect(onMsgArrivedObj As OnMsgArrivedDel)
        DChatServer.onMsgArrived = CType([Delegate].Remove(DChatServer.onMsgArrived, onMsgArrivedObj), OnMsgArrivedDel)
    End Sub 'ClientDisconnect
    
    
    Public Shared Sub SendMsg(ByVal msg As String)
        ' Send message to ALL clients
        SendMsg(msg, Nothing)
    End Sub 'SendMsg


    Public Shared Sub SendMsg(ByVal msg As String, ByVal excludeClient As Object)
        ' Send message to all clients except 'excludeClient'
        If excludeClient Is Nothing Then
            onMsgArrived(msg)
        Else
            Dim DelegateList As [Delegate]() = onMsgArrived.GetInvocationList()
            Dim i As Integer
            For i = 0 To DelegateList.Length - 1
                If Not DelegateList(i).Target.Equals(excludeClient) Then
                    CType(DelegateList(i), OnMsgArrivedDel)(msg)
                End If
            Next i
        End If
    End Sub 'SendMsg
End Class 'DChatServer



'/////////////////////////////////////////////////////////////////////////////

Class DChatClient
    
    Private Sub onMsgArrived(msg As String)
        Console.WriteLine("Msg arrived (Client {0}): {1}", clientName, msg)
    End Sub 'onMsgArrived
    
    Private clientName As String
    
    
    Public Sub New(clientName As String)
        Me.clientName = clientName
        DChatServer.ClientConnect(New DChatServer.OnMsgArrivedDel(AddressOf onMsgArrived))
    End Sub 'New
    
    
    Public Sub Dispose()
        Finalize()
        GC.SuppressFinalize(Me)
    End Sub 'Dispose
    
    
    Protected Overrides Sub Finalize()
        DChatServer.ClientDisconnect(New DChatServer.OnMsgArrivedDel(AddressOf onMsgArrived))
    End Sub 'Finalize
End Class 'DChatClient



'/////////////////////////////////////////////////////////////////////////////

Class EChatServer
    
    ' Declare a multicast (because return type is void) delegate type
    Delegate Sub OnMsgArrivedDel(message As String)
    
    ' Declaring an event causes the compiler to generate a PRIVATE field 
    ' (onMsgArrived) that references the tail of an OnMsgArrived delegate 
    ' linked-list. The compiler also generates two PUBLIC methods, 
    ' add_onMsgArrived and remove_onMsgArrived which are called when the 
    ' AddHandler and RemoveHandler operators are applied to the event's delegate.
    Public Shared Event onMsgArrived As OnMsgArrivedDel
    
    
    ' Private to prevent instances of this type from being instantiated.
    Private Sub New()
    End Sub 'New
     
    Public Shared Sub SendMsg(ByVal msg As String)
        ' Send message to ALL clients
        SendMsg(msg, Nothing)
    End Sub 'SendMsg


    Public Shared Sub SendMsg(ByVal msg As String, ByVal excludeClient As Object)
        ' Send message to all clients except 'excludeClient'
        If excludeClient Is Nothing Then
            RaiseEvent onMsgArrived(msg)
        Else
            Dim DelegateList As [Delegate]() = onMsgArrivedEvent.GetInvocationList()
            Dim i As Integer
            For i = 0 To DelegateList.Length - 1
                If Not DelegateList(i).Target.Equals(excludeClient) Then
                    CType(DelegateList(i), OnMsgArrivedDel)(msg)
                End If
            Next i
        End If
    End Sub 'SendMsg
End Class 'EChatServer



'/////////////////////////////////////////////////////////////////////////////

Class EChatClient
    
    Private Sub onMsgArrived(msg As String)
        Console.WriteLine("Msg arrived (Client {0}): {1}", clientName, msg)
    End Sub 'onMsgArrived
    
    Private clientName As String
    
    
    Public Sub New(clientName As String)
        Me.clientName = clientName
        AddHandler EChatServer.onMsgArrived, AddressOf onMsgArrived
    End Sub 'New
    
    
    Public Sub Dispose()
        Finalize()
        GC.SuppressFinalize(Me)
    End Sub 'Dispose
    
    
    Protected Overrides Sub Finalize()
        RemoveHandler EChatServer.onMsgArrived, AddressOf onMsgArrived
    End Sub 'Finalize
End Class 'EChatClient



'/////////////////////////////////////////////////////////////////////////////

Class Application
    
    Private Shared Sub DelegateChatServerDemo()
        Console.WriteLine("Demo start: Delegate Chat Server.")
        
        Dim cc1 As New DChatClient("1")
        Dim cc2 As New DChatClient("2")
        Dim cc3 As New DChatClient("3")
        
        DChatServer.SendMsg("Hi to all clients")
        DChatServer.SendMsg("Hi to all clients except client 2", cc2)
        
        ' Explicitly disconnect the clients from the chat server.
        ' If we didn't do this, the clients' memory could not be 
        ' reclaimed until the server is collected (app shutdown time).
        cc1.Dispose()
        cc2.Dispose()
        cc3.Dispose()
        Console.WriteLine("Demo stop: Delegate Chat Server.")
    End Sub 'DelegateChatServerDemo
    
    
    Private Shared Sub EventChatServerDemo()
        Console.WriteLine(ControlChars.CrLf & ControlChars.CrLf & "Demo start: Event Chat Server.")
        Dim cc1 As New EChatClient("1")
        Dim cc2 As New EChatClient("2")
        Dim cc3 As New EChatClient("3")
        
        EChatServer.SendMsg("Hi to all clients")
        EChatServer.SendMsg("Hi to all clients except client 2", cc2)
        
        ' Explicitly disconnect the clients from the chat server.
        ' If we didn't do this, the clients' memory could not be 
        ' reclaimed until the server is collected (app shutdown time).
        cc1.Dispose()
        cc2.Dispose()
        cc3.Dispose()
        Console.WriteLine("Demo stop: Event Chat Server.")
    End Sub 'EventChatServerDemo
    
    
    Public Shared Sub Main()
        DelegateChatServerDemo()
        EventChatServerDemo()
    End Sub 'Main
End Class 'Application


'/////////////////////////////// End of File /////////////////////////////////