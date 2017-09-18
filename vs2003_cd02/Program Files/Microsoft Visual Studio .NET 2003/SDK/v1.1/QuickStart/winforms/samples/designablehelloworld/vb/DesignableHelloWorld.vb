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

Public Class DesignableHelloWorld
    Inherits System.Windows.Forms.Form

    Public Sub New()

        MyBase.New()

        DesignableHelloWorld = Me

        'This call is required by the Windows Forms Designer.
        InitializeComponent()

        'Set the minimum form size to the client size + the height of the title bar
        Me.MinimumSize = New Size(392, (117 + SystemInformation.CaptionHeight))

    End Sub

    'Form overrides Dispose to clean up the component list.    
    Protected Overrides Overloads Sub Dispose(ByVal Disposing As Boolean)
        If Disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(Disposing)
    End Sub

    'The main entry point for the application
    <STAThread()> Shared Sub Main()
        System.Windows.Forms.Application.Run(New DesignableHelloWorld())
    End Sub


#Region " Windows Form Designer generated code "

    'Required by the Windows Forms Designer
    Private components As System.ComponentModel.Container
    Private WithEvents textBox1 As System.Windows.Forms.TextBox
    Private WithEvents button1 As System.Windows.Forms.Button

    Private WithEvents DesignableHelloWorld As System.Windows.Forms.Form

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.
    'Do not modify it using the code editor.
    Private Sub InitializeComponent()
        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(DesignableHelloWorld))

        Me.components = New System.ComponentModel.Container()
        Me.textBox1 = New System.Windows.Forms.TextBox()
        Me.button1 = New System.Windows.Forms.Button()

        Me.Text = "Built using the Designer"
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(392, 117)

        textBox1.Location = New System.Drawing.Point(16, 24)
        textBox1.Text = "Hello WinForms World"
        textBox1.TabIndex = 0
        textBox1.Size = New System.Drawing.Size(360, 20)

        button1.ForeColor = System.Drawing.Color.LawnGreen
        button1.BackgroundImage = CType(resources.GetObject("button1.BackgroundImage"), System.Drawing.Image)
        button1.Size = New System.Drawing.Size(120, 40)
        button1.TabIndex = 1
        button1.Location = New System.Drawing.Point(256, 64)
        button1.Text = "Click Me!"

        Me.Controls.Add(button1)
        Me.Controls.Add(textBox1)
    End Sub

#End Region

    Protected Sub button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles button1.Click
        MessageBox.Show("Text is: '" + textBox1.Text + "'")
    End Sub

End Class

