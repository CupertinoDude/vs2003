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
Imports System.Security
Imports System.Security.Permissions
Imports System.Security.Principal

<Assembly: SecurityPermission(SecurityAction.RequestMinimum, ControlPrincipal := True) >

Namespace SecuritySamples

    Public Class IdentityCheck

        Public Shared Sub Main()

            AppDomain.CurrentDomain.SetPrincipalPolicy(PrincipalPolicy.WindowsPrincipal)

            Dim user As WindowsPrincipal = CType(System.Threading.Thread.CurrentPrincipal, WindowsPrincipal)

            Console.WriteLine("User name: {0}", user.Identity.Name)
            Console.WriteLine("Authentication type: {0}", user.Identity.AuthenticationType)
            Console.WriteLine("Is in Administrators group: {0}", user.IsInRole(WindowsBuiltInRole.Administrator))
            Console.WriteLine("Is in Guests group: {0}", user.IsInRole(WindowsBuiltInRole.Guest))

            Try
                Console.WriteLine()
                Console.WriteLine("{0}", DeclAdminCheck())
            Catch e As Exception
                If (TypeOf e Is SecurityException) And (CType(e, SecurityException).PermissionType Is GetType(PrincipalPermission)) Then
                    Console.WriteLine("Declarative check for Administrators group failed!")
                Else
                    Console.WriteLine("Exception occurred: {0}", e)
                End If
            End Try

            Try
                Console.WriteLine()
                Console.WriteLine("{0}", DeclGuestCheck())
            Catch e As Exception
                If (TypeOf e Is SecurityException) And (CType(e, SecurityException).PermissionType Is GetType(PrincipalPermission)) Then
                    Console.WriteLine("Declarative check for Guests group failed!")
                Else
                    Console.WriteLine("Exception occurred: {0}", e)
                End If
            End Try

            Console.WriteLine()
            Console.Write("Press Enter to exit...")
            Console.Read()

        End Sub 'Main

        <PrincipalPermission(SecurityAction.Demand, Role := "BUILTIN\Administrators")> Private Shared Function DeclAdminCheck() As String

            Return "Declarative check for Administrators group passed!"

        End Function 'DeclAdminCheck

        <PrincipalPermissionAttribute(SecurityAction.Demand, Role := "BUILTIN\Guests")> Private Shared Function DeclGuestCheck() As String

            Return "Declarative check for Guests group passed!"

        End Function 'DeclGuestCheck

    End Class 'IdentityCheck

End Namespace 'SecuritySamples
