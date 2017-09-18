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
Imports System.Collections
Imports Microsoft.VisualBasic

Namespace Microsoft.Samples.WinForms.VB.Docking

    Public Class Docking
        Inherits System.Windows.Forms.Form

        Private d As System.Collections.Hashtable

        Public Sub New()

            MyBase.New()

            Docking = Me

            'This call is required by the Windows Forms Designer.
            InitializeComponent()

            'Set up hashtable with DockStyle values
            d = New System.Collections.Hashtable()
            d.Add("Left", DockStyle.Left)
            d.Add("Right", DockStyle.Right)
            d.Add("Top", DockStyle.Top)
            d.Add("Bottom", DockStyle.Bottom)
            d.Add("None", DockStyle.None)
            d.Add("Fill", DockStyle.Fill)

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


        'The main entry point for the application
        <STAThread()> Shared Sub Main()
            System.Windows.Forms.Application.Run(New Docking())
        End Sub

#Region " Windows Form Designer generated code "

        'Required by the Windows Form Designer
        Private components As System.ComponentModel.Container
        Private WithEvents StatusBarPanel2 As System.Windows.Forms.StatusBarPanel
        Private WithEvents StatusBarPanel1 As System.Windows.Forms.StatusBarPanel
        Private WithEvents StatusBar1 As System.Windows.Forms.StatusBar
        Private ToolBarButton6 As System.Windows.Forms.ToolBarButton
        Private ToolBarButton5 As System.Windows.Forms.ToolBarButton
        Private ToolBarButton4 As System.Windows.Forms.ToolBarButton
        Private ToolBarButton3 As System.Windows.Forms.ToolBarButton
        Private ToolBarButton2 As System.Windows.Forms.ToolBarButton
        Private ToolBarButton1 As System.Windows.Forms.ToolBarButton
        Private WithEvents ToolBar1 As System.Windows.Forms.ToolBar
        Private WithEvents Button1 As System.Windows.Forms.Button

        Dim WithEvents Docking As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.ToolBarButton6 = New System.Windows.Forms.ToolBarButton()
            Me.StatusBar1 = New System.Windows.Forms.StatusBar()
            Me.ToolBarButton4 = New System.Windows.Forms.ToolBarButton()
            Me.ToolBarButton2 = New System.Windows.Forms.ToolBarButton()
            Me.ToolBarButton3 = New System.Windows.Forms.ToolBarButton()
            Me.ToolBarButton1 = New System.Windows.Forms.ToolBarButton()
            Me.Button1 = New System.Windows.Forms.Button()
            Me.ToolBar1 = New System.Windows.Forms.ToolBar()
            Me.ToolBarButton5 = New System.Windows.Forms.ToolBarButton()
            Me.StatusBarPanel1 = New System.Windows.Forms.StatusBarPanel()
            Me.StatusBarPanel2 = New System.Windows.Forms.StatusBarPanel()

            StatusBarPanel1.BeginInit()
            StatusBarPanel2.BeginInit()
            Me.Text = "Docking"
            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.ClientSize = New System.Drawing.Size(520, 378)

            ToolBarButton6.Text = "Fill"

            StatusBar1.BackColor = System.Drawing.SystemColors.Control
            StatusBar1.Location = New System.Drawing.Point(0, 358)
            StatusBar1.Size = New System.Drawing.Size(520, 20)
            StatusBar1.TabIndex = 2
            StatusBar1.Text = "Use the ToolBar buttons to change the button1.Dock property and then resize the form"
            Me.statusBar1.Panels.AddRange(new System.Windows.Forms.StatusBarPanel() {Me.statusBarPanel1,Me.statusBarPanel2})
            statusBar1.ShowPanels=true

            ToolBarButton4.Text = "Bottom"

            ToolBarButton2.Text = "Right"

            ToolBarButton3.Text = "Top"

            ToolBarButton1.Text = "Left"

            Button1.BackColor = System.Drawing.SystemColors.Desktop
            Button1.Size = New System.Drawing.Size(176, 56)
            Button1.TabIndex = 0
            Button1.Anchor = AnchorStyles.Top Or AnchorStyles.Bottom Or AnchorStyles.Right Or AnchorStyles.Left
            Button1.Location = New System.Drawing.Point(168, 168)
            Button1.Text = "Button1" & Environment.NewLine & "(click to set Dock to DockStyle.None)"

            ToolBar1.Size = New System.Drawing.Size(520, 40)
            ToolBar1.TabIndex = 1
            ToolBar1.DropDownArrows = True
            ToolBar1.ShowToolTips = True

            Me.toolBar1.Buttons.AddRange(new System.Windows.Forms.ToolBarButton() {Me.toolBarButton1, Me.toolBarButton2, Me.toolBarButton3, Me.toolBarButton4, Me.toolBarButton5, Me.toolBarButton6})

            ToolBarButton5.Text = "None"
            StatusBarPanel1.Text = "Panel1"

            StatusBarPanel2.Text = "Panel2"
            Me.Controls.Add(Button1)
            Me.Controls.Add(ToolBar1)
            Me.Controls.Add(StatusBar1)

            StatusBarPanel1.EndInit()
            StatusBarPanel2.EndInit()
        End Sub

#End Region

        Private Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
            Button1.Dock = DockStyle.None
             Button1.Anchor = AnchorStyles.Top Or AnchorStyles.Bottom Or AnchorStyles.Right Or AnchorStyles.Left
        End Sub

        Private Sub ToolBar1_ButtonClick(ByVal sender As Object, ByVal e As System.Windows.Forms.ToolBarButtonClickEventArgs) Handles ToolBar1.ButtonClick
            Button1.Dock = CType(d(e.Button.Text), DockStyle)
            If e.Button.Text = "None" Then
                Button1.Anchor = AnchorStyles.Top Or AnchorStyles.Bottom Or AnchorStyles.Right Or AnchorStyles.Left
            End If
        End Sub

    End Class

End Namespace