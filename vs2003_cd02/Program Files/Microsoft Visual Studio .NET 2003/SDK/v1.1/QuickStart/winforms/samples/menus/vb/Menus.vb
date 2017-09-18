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
Imports System.Drawing.Text
Imports System.Windows.Forms

Namespace Microsoft.Samples.WinForms.VB.Menus

    Public Class Menus
        Inherits System.Windows.Forms.Form

        Private Class FontSizes
            Public Shared Small As Single = 8F
            Public Shared Medium As Single = 12F
            Public Shared Large As Single = 24F
        End Class

        'Font face and size
        Private fontFace As String = "Arial"
        Private fontSize As Single = FontSizes.Medium

        'Used to track which menu items are checked/unchecked
        Private mmiSansSerif As MenuItem
        Private mmiSerif As MenuItem
        Private mmiMonoSpace As MenuItem
        Private mmiSmall As MenuItem
        Private mmiMedium As MenuItem
        Private mmiLarge As MenuItem
        Private cmiSansSerif As MenuItem
        Private cmiSerif As MenuItem
        Private cmiMonoSpace As MenuItem
        Private cmiSmall As MenuItem
        Private cmiMedium As MenuItem
        Private cmiLarge As MenuItem

        Private miMainFormatFontChecked As MenuItem
        Private miMainFormatSizeChecked As MenuItem
        Private miContextFormatFontChecked As MenuItem
        Private miContextFormatSizeChecked As MenuItem

        Private currentFontFamily As FontFamily
        Private monoSpaceFontFamily As FontFamily
        Private sansSerifFontFamily As FontFamily
        Private serifFontFamily As FontFamily

        Public Sub New()

            MyBase.New()

            Menus = Me

            'This call is required by the Windows Forms Designer.
            InitializeComponent()

            monoSpaceFontFamily = new FontFamily (GenericFontFamilies.Monospace)
            sansSerifFontFamily = new FontFamily (GenericFontFamilies.SansSerif)
            serifFontFamily = new FontFamily (GenericFontFamilies.Serif)
            currentFontFamily = sansSerifFontFamily

            label1.Font = New Font(fontFace, fontSize)

            'Add File Menu
            Dim miFile As MenuItem = MainMenu.MenuItems.Add("&File")
            miFile.MenuItems.Add(New MenuItem("&Open...", New EventHandler(AddressOf Me.FileOpen_Clicked), Shortcut.CtrlO))
            miFile.MenuItems.Add("-")     ' Gives us a seperator
            miFile.MenuItems.Add(New MenuItem("E&xit", New EventHandler(AddressOf Me.FileExit_Clicked), Shortcut.CtrlX))

            'Add Format Menu
            Dim miFormat As MenuItem = MainMenu.MenuItems.Add("F&ormat")

            'Font Face sub-menu
            mmiSansSerif = New MenuItem("&1. " & sansSerifFontFamily.Name, New EventHandler(AddressOf Me.FormatFont_Clicked))
            mmiSansSerif.Checked = True
            mmiSansSerif.DefaultItem = True
            mmiSerif = New MenuItem("&2. " & serifFontFamily.Name, New EventHandler(AddressOf Me.FormatFont_Clicked))
            mmiMonoSpace = New MenuItem("&3. " & monoSpaceFontFamily.Name, New EventHandler(AddressOf Me.FormatFont_Clicked))

            miFormat.MenuItems.Add("Font &Face" _
                                  , (New MenuItem() {mmiSansSerif, mmiSerif, mmiMonoSpace}))

            'Font Size sub-menu
            mmiSmall = New MenuItem("&Small", New EventHandler(AddressOf Me.FormatSize_Clicked))
            mmiMedium = New MenuItem("&Medium", New EventHandler(AddressOf Me.FormatSize_Clicked))
            mmiMedium.Checked = True
            mmiMedium.DefaultItem = True
            mmiLarge = New MenuItem("&Large", New EventHandler(AddressOf Me.FormatSize_Clicked))

            miFormat.MenuItems.Add("Font &Size" _
                                  , (New MenuItem() {mmiSmall, mmiMedium, mmiLarge}))

            'Add Format to label context menu
            'Note have to add a clone because menus can't belong to 2 parents
            label1ContextMenu.MenuItems.Add(miFormat.CloneMenu)

            ' Set up the context menu items - we use these to check and uncheck items
            cmiSansSerif = label1ContextMenu.MenuItems(0).MenuItems(0).MenuItems(0)
            cmiSerif = label1ContextMenu.MenuItems(0).MenuItems(0).MenuItems(1)
            cmiMonoSpace = label1ContextMenu.MenuItems(0).MenuItems(0).MenuItems(2)
            cmiSmall = label1ContextMenu.MenuItems(0).MenuItems(1).MenuItems(0)
            cmiMedium = label1ContextMenu.MenuItems(0).MenuItems(1).MenuItems(1)
            cmiLarge = label1ContextMenu.MenuItems(0).MenuItems(1).MenuItems(2)

            'We use these to track which menu items are checked
            'This is made more complex because we have both a menu and a context menu
            miMainFormatFontChecked = mmiSansSerif
            miMainFormatSizeChecked = mmiMedium
            miContextFormatFontChecked = cmiSansSerif
            miContextFormatSizeChecked = cmiMedium

        End Sub

        'File->Exit Menu item handler
        Private Sub FileExit_Clicked(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.Close()
        End Sub

        'File->Open Menu item handler
        Private Sub FileOpen_Clicked(ByVal sender As Object, ByVal e As System.EventArgs)
            MessageBox.Show("And why would this open a file?")
        End Sub

        'Format->Font Menu item handler
        Private Sub FormatFont_Clicked(ByVal sender As Object, ByVal e As System.EventArgs)

            Dim miClicked As MenuItem = CType(sender, MenuItem)

            miMainFormatFontChecked.Checked = False
            miContextFormatFontChecked.Checked = False

            If miClicked Is mmiSansSerif Or miClicked Is cmiSansSerif Then
                miMainFormatFontChecked = mmiSansSerif
                miContextFormatFontChecked = cmiSansSerif
                currentFontFamily = sansSerifFontFamily
            ElseIf miClicked Is mmiSerif Or miClicked Is cmiSerif Then
                miMainFormatFontChecked = mmiSerif
                miContextFormatFontChecked = cmiSerif
                currentFontFamily = serifFontFamily
            Else
                miMainFormatFontChecked = mmiMonoSpace
                miContextFormatFontChecked = cmiMonoSpace
                currentFontFamily = monoSpaceFontFamily
            End If

            miMainFormatFontChecked.Checked = True
            miContextFormatFontChecked.Checked = True

            label1.Font = New Font(currentFontFamily, fontSize)

        End Sub

        'Format->Size Menu item handler
        Private Sub FormatSize_Clicked(ByVal sender As Object, ByVal e As System.EventArgs)

            Dim miClicked As MenuItem = CType(sender, MenuItem)

            miMainFormatSizeChecked.Checked = False
            miContextFormatSizeChecked.Checked = False

            Dim fontSizeString As String = miClicked.Text

            If (fontSizeString = "&Small") Then
                miMainFormatSizeChecked = mmiSmall
                miContextFormatSizeChecked = cmiSmall
                fontSize = FontSizes.Small
            ElseIf (fontSizeString = "&Large") Then
                miMainFormatSizeChecked = mmiLarge
                miContextFormatSizeChecked = cmiLarge
                fontSize = FontSizes.Large
            Else
                miMainFormatSizeChecked = mmiMedium
                miContextFormatSizeChecked = cmiMedium
                fontSize = FontSizes.Medium
            End If

            miMainFormatSizeChecked.Checked = True
            miContextFormatSizeChecked.Checked = True

            label1.Font = New Font(currentFontFamily, fontSize)
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
        Private WithEvents label1 As System.Windows.Forms.Label
        Private WithEvents mainMenu As System.Windows.Forms.MainMenu
        Private label1ContextMenu As System.Windows.Forms.ContextMenu

        Private WithEvents Menus As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.mainMenu = New System.Windows.Forms.MainMenu()
            Me.label1 = New System.Windows.Forms.Label()
            Me.label1ContextMenu = New System.Windows.Forms.ContextMenu()
            Me.Text = "Menus 'R Us"
            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.Menu = mainMenu
            Me.ClientSize = New System.Drawing.Size(392, 117)

            label1.BackColor = System.Drawing.Color.LightSteelBlue
            label1.Location = New System.Drawing.Point(16, 24)
            label1.TabIndex = 0
            label1.Size = New System.Drawing.Size(360, 50)
            label1.Text = "Right Click on me - I have a context menu!"
            label1.ContextMenu = label1ContextMenu

            Me.Controls.Add(label1)
        End Sub

#End Region

        'Run the application
        'The main entry point for the application
        <STAThread()> Shared Sub Main()
            System.Windows.Forms.Application.Run(New Menus())
        End Sub

    End Class

End Namespace











