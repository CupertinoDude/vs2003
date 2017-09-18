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
Imports System.Windows.Forms
Imports System.Resources
Imports System.Drawing

' <doc>
' <desc>
'     This class demonstrates the LinkLabel control.
' </desc>
' </doc>
Public Class LinkLabelCtl
    Inherits System.Windows.Forms.Form

    Public Sub New()

        MyBase.New()

        LinkLabelCtl = Me

        ' This call is required for support of the Windows Forms Form Designer.
        InitializeComponent()

        'Set the properties window to point at the link label
        propertyGrid1.SelectedObject = linkLabel1

        linkLabel1.Font = new Font(Control.DefaultFont.FontFamily, 12, FontStyle.Bold)

    End Sub

    ' <doc>
    ' <desc>
    '     Handle the click event on the button
    ' </desc>
    ' </doc>
    Private Sub linkLabel1_LinkClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles linkLabel1.LinkClicked
        MessageBox.Show("You clicked on the test Link")
        linkLabel1.LinkVisited = True
    End Sub

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing as Boolean)
        If (disposing) Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub


#Region " Windows Form Designer generated code "

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.Container
    Private WithEvents propertyGrid1 As System.Windows.Forms.PropertyGrid
    Private WithEvents linkLabel1 As System.Windows.Forms.LinkLabel
    Private WithEvents panel1 As System.Windows.Forms.Panel
    Private WithEvents grpBehavior As System.Windows.Forms.GroupBox

    Private WithEvents LinkLabelCtl As System.Windows.Forms.Form

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.
    'Do not modify it using the code editor.
    Private Sub InitializeComponent()
        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(LinkLabelCtl))
        Me.linkLabel1 = New System.Windows.Forms.LinkLabel()
        Me.panel1 = New System.Windows.Forms.Panel()
        Me.propertyGrid1 = New System.Windows.Forms.PropertyGrid()
        Me.grpBehavior = New System.Windows.Forms.GroupBox()
        Me.panel1.SuspendLayout()
        Me.grpBehavior.SuspendLayout()
        Me.SuspendLayout()
        '
        'linkLabel1
        '
        Me.linkLabel1.BackColor = System.Drawing.Color.Transparent
        Me.linkLabel1.DisabledLinkColor = System.Drawing.Color.Blue
        Me.linkLabel1.ForeColor = System.Drawing.Color.Gainsboro
        Me.linkLabel1.Location = New System.Drawing.Point(32, 128)
        Me.linkLabel1.Name = "linkLabel1"
        Me.linkLabel1.Size = New System.Drawing.Size(136, 96)
        Me.linkLabel1.TabIndex = 0
        Me.linkLabel1.TabStop = True
        Me.linkLabel1.Text = "Click on the underlined text to fire the click event"
        '
        'panel1
        '
        Me.panel1.BackgroundImage = CType(resources.GetObject("panel1.BackgroundImage"), System.Drawing.Bitmap)
        Me.panel1.Controls.AddRange(New System.Windows.Forms.Control() {Me.linkLabel1})
        Me.panel1.Location = New System.Drawing.Point(24, 40)
        Me.panel1.Name = "panel1"
        Me.panel1.Size = New System.Drawing.Size(200, 320)
        Me.panel1.TabIndex = 1
        Me.panel1.Text = "panel1"
        '
        'propertyGrid1
        '
        Me.propertyGrid1.CommandsVisibleIfAvailable = True
        Me.propertyGrid1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.propertyGrid1.LargeButtons = False
        Me.propertyGrid1.LineColor = System.Drawing.SystemColors.ScrollBar
        Me.propertyGrid1.Location = New System.Drawing.Point(3, 16)
        Me.propertyGrid1.Name = "propertyGrid1"
        Me.propertyGrid1.Size = New System.Drawing.Size(242, 405)
        Me.propertyGrid1.TabIndex = 0
        Me.propertyGrid1.Text = "propertyGrid1"
        Me.propertyGrid1.ViewBackColor = System.Drawing.SystemColors.Window
        Me.propertyGrid1.ViewForeColor = System.Drawing.SystemColors.WindowText
        '
        'grpBehavior
        '
        Me.grpBehavior.Anchor = (((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                    Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right)
        Me.grpBehavior.Controls.AddRange(New System.Windows.Forms.Control() {Me.propertyGrid1})
        Me.grpBehavior.Location = New System.Drawing.Point(248, 16)
        Me.grpBehavior.Name = "grpBehavior"
        Me.grpBehavior.Size = New System.Drawing.Size(248, 424)
        Me.grpBehavior.TabIndex = 0
        Me.grpBehavior.TabStop = False
        Me.grpBehavior.Text = "LinkLabel Properties"
        '
        'LinkLabelCtl
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(504, 445)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.panel1, Me.grpBehavior})
        Me.Name = "LinkLabelCtl"
        Me.Text = "Link Label"
        Me.panel1.ResumeLayout(False)
        Me.grpBehavior.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region

    ' The main entry point for the application.
    <STAThread()> Public Shared Sub Main()
        Application.Run(New LinkLabelCtl())
    End Sub

End Class
