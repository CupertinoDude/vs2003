'==========================================================================
'  File:       DirectHost.vb
'
'  Summary:    This file provides a hosting environment for Managed Remoting
'            Objects. It uses a configuration file is used to configure:
'                  Channels, WellKnown Objects, etc.
'
'            Channels can also be registerd by calling:
'            ChannelServices.RegisterChannel
'
'  Classes:    DirectHost
'
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
'==========================================================================
Imports System
Imports System.Globalization
Imports System.IO
Imports System.Runtime.Remoting
Imports System.Runtime.Remoting.Channels
Imports System.Runtime.Remoting.Channels.Http
Imports Microsoft.VisualBasic


Public Class DirectHost
    
    Public Shared Sub Main(ByVal args() As String)
        Dim ret As Integer = Initialize(args)
        If ret <> 0 Then
            Return
        End If 
        Console.WriteLine("DirectHost is ready to process remote messages.")
        
        Dim keyState As [String] = ""
        While [String].Compare(keyState, "0", True,CultureInfo.InvariantCulture) <> 0
            Console.WriteLine("Press a key and ENTER: G" + ChrW(61) + "GC.Collect, 0" + ChrW(61) + "Exit")
            keyState = Console.ReadLine()
            
            Console.WriteLine(("Pressed: " + keyState))
            
            ' Force a GC
            If [String].Compare(keyState, "G", True,CultureInfo.InvariantCulture) = 0 Then
                Console.WriteLine("GC Collect - start")
                GC.Collect()
                GC.WaitForPendingFinalizers()
                Console.WriteLine("GC Collect - done")
            End If
        End While
    End Sub 'Main
     
    
    
    Public Shared Function Initialize(args() As [String]) As Integer
        If args.Length = 0 Then
            Usage()
            Return - 1
        End If
        
        Dim i As Integer
        For i = 0 To args.Length - 1
            If [String].Compare(args(i), "HELP", True,CultureInfo.InvariantCulture) = 0 Or _
                [String].Compare(args(i), "?", True,CultureInfo.InvariantCulture) = 0 Or _
                [String].Compare(args(i), "/h", True,CultureInfo.InvariantCulture) = 0 Or _
                [String].Compare(args(i), "-h", True,CultureInfo.InvariantCulture) = 0 Or _
                [String].Compare(args(i), "-?", True,CultureInfo.InvariantCulture) = 0 Or _
                [String].Compare(args(i), "/?", True,CultureInfo.InvariantCulture) = 0 Then
                
                Usage()
                Return - 1
            End If
            
            ' Load Configuration
            If [String].Compare(args(i),"-cfg",True,CultureInfo.InvariantCulture) = 0 Then
                RemotingConfiguration.Configure(args((i + 1)))
            End If
        Next i
        
        Return 0
    End Function 'Initialize
    
    
    Public Shared Sub Usage()
        Console.WriteLine("Usage: DirectHost [-cfg ConfigFileName.exe.config]" + ControlChars.Cr)
        Console.WriteLine("Examples : DirectHost -cfg DirectHost.exe.config")
    End Sub 'Usage
End Class 'DirectHost 



