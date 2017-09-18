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
Imports Microsoft.Samples.WinForms.VB.HelloWorldControl

Namespace Microsoft.Samples.WinForms.VB.HostApp

    Public Class HostApp
        Inherits System.Windows.Forms.Form

        Public Sub New()

            MyBase.New()

            HostApp = Me

            'This call is required by the Windows Forms Designer.
            InitializeComponent()

            helloWorldControl1.Font = new Font(Control.DefaultFont.FontFamily, 14, FontStyle.Bold)

        End Sub

        'Form overrides dispose to clean up the component list.
        Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
            If disposing Then
                If Not (components Is Nothing) Then
                    components.Dispose()
                End If
            End If
            MyBase.Dispose(disposing)
        End Sub



#Region " Windows Form Designer generated code "

        'Required by the Windows Form Designer
        Private components As System.ComponentModel.Container
        Private WithEvents helloWorldControl1 As Microsoft.Samples.WinForms.VB.HelloWorldControl.HelloWorldControl

        Private WithEvents HostApp As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.helloWorldControl1 = New Microsoft.Samples.WinForms.VB.HelloWorldControl.HelloWorldControl()

            helloWorldControl1.Dock = System.Windows.Forms.DockStyle.None
            helloWorldControl1.Size = New System.Drawing.Size(600, 450)
            helloWorldControl1.TabIndex = 0
            helloWorldControl1.Text = "Hello Windows Forms Control World"

            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.Text = "Control Example"
            Me.ClientSize = New System.Drawing.Size(600, 450)

            Me.Controls.Add(helloWorldControl1)
        End Sub

#End Region

        'The main entry point for the application
        <STAThread()> Shared Sub Main()
            System.Windows.Forms.Application.Run(New HostApp())
        End Sub

    End Class

End Namespace





