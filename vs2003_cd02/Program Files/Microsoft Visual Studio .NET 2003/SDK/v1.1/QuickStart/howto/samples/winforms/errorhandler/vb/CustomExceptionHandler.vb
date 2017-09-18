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
Imports System.ComponentModel
Imports System.Drawing
Imports System.Windows.Forms
Imports System.Threading
Imports Microsoft.VisualBasic

Namespace Microsoft.Samples.WinForms.Vb.ErrorHandler

    'The Error Handler class
    'We need a class because event handling methods can't be static
    Friend Class CustomExceptionHandler

        'Handle the exception  event
        Public Sub OnThreadException(ByVal sender As Object, ByVal t As ThreadExceptionEventArgs)
            Dim result As DialogResult = DialogResult.Cancel

            Try
                result = Me.ShowThreadExceptionDialog(t.Exception)
            Catch
                Try
                    MessageBox.Show("Fatal Error", "Fatal Error", MessageBoxButtons.AbortRetryIgnore, MessageBoxIcon.Stop)
                Finally
                    Application.Exit()
                End Try
            End Try

            If (result = DialogResult.Abort) Then
                Application.Exit()
            End If

        End Sub

        Private Function ShowThreadExceptionDialog(ByVal e As Exception) As DialogResult
            Const myCRLF As String = ControlChars.CrLf
            Dim errorMsg As String = "An error occurred please contact the adminstrator with the following information:"
            errorMsg &= myCRLF & myCRLF
            errorMsg &= e.Message & myCRLF & myCRLF & "Stack Trace:" & myCRLF & e.StackTrace
            Return MessageBox.Show(errorMsg, "Application Error", MessageBoxButtons.AbortRetryIgnore, MessageBoxIcon.Stop)
        End Function

    End Class

End Namespace
