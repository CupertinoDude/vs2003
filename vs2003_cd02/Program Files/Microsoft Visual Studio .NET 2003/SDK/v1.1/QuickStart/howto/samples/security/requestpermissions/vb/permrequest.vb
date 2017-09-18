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
Imports System.Collections
Imports System.Security
Imports System.Security.Permissions

<Assembly: EnvironmentPermission(SecurityAction.RequestMinimum, _
    Read := "PROCESSOR_IDENTIFIER;PROCESSOR_REVISION;NUMBER_OF_PROCESSORS;OS")>
<Assembly: EnvironmentPermission(SecurityAction.RequestOptional, Unrestricted := True)>
<Assembly: EnvironmentPermission(SecurityAction.RequestRefuse, _
    Read := "USERNAME;USERDOMAIN;USERDNSDOMAIN;COMPUTERNAME;LOGONSERVER", _
    Write := "USERNAME;USERDOMAIN;USERDNSDOMAIN;COMPUTERNAME;LOGONSERVER")>

Namespace SecuritySamples
    Public Class PermRequest
        Public Shared Sub Main()

            'We are guaranteed to get these (providing they are set, of course)
            Console.WriteLine("Processor: {0}", GetEnvironmentValue("PROCESSOR_IDENTIFIER"))
            Console.WriteLine("Revision: {0}", GetEnvironmentValue("PROCESSOR_REVISION"))
            Console.WriteLine("Count: {0}", Environment.GetEnvironmentVariable("NUMBER_OF_PROCESSORs"))
            Console.WriteLine("Operating System: {0}", GetEnvironmentValue("OS"))

            'We may or may not get these depending upon security policy
            Console.WriteLine("System Drive: {0}", GetEnvironmentValue("SYSTEMDRIVE"))
            Console.WriteLine("System Path: {0}", GetEnvironmentValue("SYSTEMROOT"))
            Console.WriteLine("Extensions: {0}", GetEnvironmentValue("PATHEXT"))

            'Should always return a security exception
            Console.WriteLine("ComputerName: {0}", GetEnvironmentValue("COMPUTERNAME"))

            Console.WriteLine("")
            Console.Write("Press Enter to exit...")
            Console.Read()

        End Sub 'Main

        Private Shared Function GetEnvironmentValue(Var As String) As String
            Try
                Dim Val As String = Environment.GetEnvironmentVariable(Var)
                If Val Is Nothing Then
                    Return "*Not Set*"
                Else
                    Return Val
                End If
            Catch sec As SecurityException
                Return "*Inadequate Permissions*"
            Catch e As Exception
                Return "*Exception: " & e.Message & "*"
            End Try
        End Function 'GetEnvironmentValue
    End Class 'PermRequest
End Namespace 'SecuritySamples
