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

Namespace Microsoft.Samples.WinForms.VB.HelloWorldControl

    Public Class HelloWorldControl
        Inherits Control

        Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)

            'Paint the Text property on the control
            Dim rect As RectangleF = New RectangleF(ClientRectangle.X, ClientRectangle.Y, ClientRectangle.Width, ClientRectangle.Height)
            e.Graphics.DrawString(Me.Text, Font, New SolidBrush(ForeColor), rect)

        End Sub

    End Class

End Namespace

