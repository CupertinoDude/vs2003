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

Namespace Microsoft.Samples.WinForms.VB.AxHosting

    Public Class MainForm
        Inherits System.Windows.Forms.Form

        'Required by the Windows Forms Designer
        Private components As System.ComponentModel.Container
        Private mainMenu As System.Windows.Forms.MainMenu
        Friend  statusBar1 As System.Windows.Forms.StatusBar

        Public Sub New()
            MyBase.New

            'This call is required by the Windows Forms Designer.
            InitializeComponent

            'Setup MDI stuff
            Me.IsMDIContainer = true
            AddHandler Me.MDIChildActivate, AddressOf Me.MDIChildActivated

            'Add File Menu
            Dim miFile As MenuItem = mainMenu.MenuItems.Add("&File")
            miFile.MenuItems.Add(new MenuItem("&Add Document", new EventHandler(AddressOf Me.FileAdd_Clicked), Shortcut.CtrlA))
            miFile.MenuItems.Add("-")     ' Gives us a seperator
            miFile.MenuItems.Add(new MenuItem("E&xit", new EventHandler(AddressOf Me.FileExit_Clicked), Shortcut.CtrlX))

            'Add Window Menu
            Dim miWindow As MenuItem = mainMenu.MenuItems.Add("&Window")
            miWindow.MenuItems.Add("&Cascade", New EventHandler(AddressOf Me.WindowCascade_Clicked))
            miWindow.MenuItems.Add("&Tile Horizontal", New EventHandler(AddressOf Me.WindowTileH_Clicked))
            miWindow.MenuItems.Add("&Tile Vertical", New EventHandler(AddressOf Me.WindowTileV_Clicked))
            miWindow.MDIList = true  'Adds the AxHosting Window List to the bottom of the menu

            AddDocument() 'Add an initial doc
        End Sub


        'Add a browser document
        Private Sub AddDocument()
            Dim doc As Document = new Document() 'Create the form
            doc.MDIParent = Me                   'Set its MDI parent to this form
            doc.Show()                           'Show the form
        End Sub


        'File->Add Menu item handler
        Private Sub FileAdd_Clicked(sender As object, e As System.EventArgs)
            AddDocument()
        End Sub


        'File->Exit Menu item handler
        Private Sub FileExit_Clicked(sender As object, e As System.EventArgs)
            Me.Close
        End Sub


        'One of the MDI Child windows has been activated - set the status bar
        'text to the window title
        Private Sub MDIChildActivated(sender As object, e As System.EventArgs)
            If Not Me.ActiveMDIChild Is Nothing Then
                statusBar1.Text = Me.ActiveMDIChild.Text
            End If
        End Sub

        'Window->Cascade Menu item handler
        Private Sub WindowCascade_Clicked(sender As object, e As System.EventArgs)
            Me.LayoutMDI(MDILayout.Cascade)
        End Sub


        'Window->Tile Horizontally Menu item handler
        Private Sub WindowTileH_Clicked(sender As object, e As System.EventArgs)
            Me.LayoutMDI(MDILayout.TileHorizontal)
        End Sub


        'Window->Tile Vertically Menu item handler
        Private Sub WindowTileV_Clicked(sender As object, e As System.EventArgs)
            Me.LayoutMDI(MDILayout.TileVertical)
        End Sub

        Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
            If disposing Then
                If Not (components Is Nothing) Then
                    components.Dispose()
                End If
            End If
            MyBase.Dispose(disposing)
        End Sub

        Private Sub InitializeComponent()

            Me.components = new System.ComponentModel.Container()
            Me.mainMenu = new System.Windows.Forms.MainMenu()
            Me.statusBar1 = new System.Windows.Forms.StatusBar()

            Me.AutoScaleBaseSize = new System.Drawing.Size(5, 13)
            Me.Text = "AxHosting Example"
            Me.Menu = mainMenu
            Me.ClientSize = new System.Drawing.Size(700, 550)

            statusBar1.BackColor = System.Drawing.SystemColors.Control
            statusBar1.Size = new System.Drawing.Size(496, 20)
            statusBar1.TabIndex = 1
            statusBar1.Text = ""
            statusBar1.Location = new System.Drawing.Point(0, 273)

            Me.Controls.Add(statusBar1)
	    End Sub

        'Run the application
        'The main entry point for the application
        <STAThread()> Shared Sub Main()
            System.Windows.Forms.Application.Run(New MainForm())
        End Sub


    End Class

End NameSpace

