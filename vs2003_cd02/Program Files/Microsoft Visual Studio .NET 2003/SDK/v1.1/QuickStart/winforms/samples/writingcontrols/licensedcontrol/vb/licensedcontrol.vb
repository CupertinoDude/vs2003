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



imports System
imports System.Windows.Forms
imports System.Drawing
imports System.ComponentModel

<LicenseProviderAttribute(GetType(LicFileLicenseProvider))> _
Public Class LicensedControl : Inherits Control

    Private license As License = Nothing

    Public Sub New()
        MyBase.New

        license = LicenseManager.Validate(GetType(LicensedControl), Me)
    End Sub

    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If Not (license Is Nothing) Then
            license.Dispose()
            license = Nothing
        End If

        MyBase.Dispose(disposing)
    End Sub

    Overrides Protected Sub OnPaint(e As PaintEventArgs)
        ' Paint the Text property on the control
         e.Graphics.DrawString(Me.Text, Font, New SolidBrush(ForeColor), ClientRectangle.x, ClientRectangle.y)
    End Sub
End Class ' LicensedControl
