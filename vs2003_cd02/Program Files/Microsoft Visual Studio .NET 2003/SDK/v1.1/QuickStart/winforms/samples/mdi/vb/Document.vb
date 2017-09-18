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

Namespace Microsoft.Samples.WinForms.VB.MDI

    Public Class Document
        Inherits System.Windows.Forms.Form

        Private Class FontSizes
            Public Shared Small As Single = 8F
            Public Shared Medium As Single = 12F
            Public Shared Large As Single = 24F
        End Class

        Private fontSize As Single = FontSizes.Medium

        Private miFormatFontChecked As System.Windows.Forms.MenuItem
        Private miFormatSizeChecked As System.Windows.Forms.MenuItem

        Private miSmall As MenuItem
        Private miMedium As MenuItem
        Private miLarge As MenuItem

        Private miSansSerif As MenuItem
        Private miSerif As MenuItem
        Private miMonoSpace As MenuItem

        private currentFontFamily As FontFamily
        private monoSpaceFontFamily As FontFamily
        private sansSerifFontFamily As FontFamily
        private serifFontFamily As FontFamily

        Public Sub New(ByVal docName As String)

            MyBase.New()

            Document = Me

            'This call is required by the Windows Forms Designer.
            InitializeComponent()

            'Initialize Fonts - use generic fonts to avoid problems across
            'different versions of the OS
            monoSpaceFontFamily = new FontFamily (GenericFontFamilies.Monospace)
            sansSerifFontFamily = new FontFamily (GenericFontFamilies.SansSerif)
            serifFontFamily = new FontFamily (GenericFontFamilies.Serif)
            currentFontFamily = sansSerifFontFamily


            Me.Text = docName

            richTextBox1.Text = docName
            richTextBox1.Font = New System.Drawing.Font(currentFontFamily, fontSize)

            'Add File Menu
            Dim miFile As MenuItem = MainMenu.MenuItems.Add("&File")
            miFile.MergeType = MenuMerge.MergeItems
            miFile.MergeOrder = 0

            Dim miLoadDoc As MenuItem = miFile.MenuItems.Add("&Load Document (" + docName + ")", new EventHandler(AddressOf Me.LoadDocument_Clicked))
            miLoadDoc.MergeOrder = 105

            'Add Formatting Menu
            Dim miFormat As MenuItem = MainMenu.MenuItems.Add("F&ormat (" + docName + ")")
            miFormat.MergeType = MenuMerge.Add
            miFormat.MergeOrder = 5

            'Font Face sub-menu
            miSansSerif = New MenuItem("&1." + sansSerifFontFamily.Name, new EventHandler(AddressOf Me.FormatFont_Clicked))
            miSerif = New MenuItem("&2." + serifFontFamily.Name, new EventHandler(AddressOf Me.FormatFont_Clicked))
            miMonoSpace = New MenuItem("&3." + monoSpaceFontFamily.Name, new EventHandler(AddressOf Me.FormatFont_Clicked))
            miSansSerif.Checked = True
            miFormatFontChecked = miSansSerif
            miSansSerif.DefaultItem = True

            miFormat.MenuItems.Add("Font &Face" _
            , (New MenuItem() {miSansSerif, miSerif, miMonoSpace}))

            'Font Size sub-menu
            miSmall = New MenuItem("&Small", new EventHandler(AddressOf Me.FormatSize_Clicked))
            miMedium = New MenuItem("&Medium", new EventHandler(AddressOf Me.FormatSize_Clicked))
            miLarge = New MenuItem("&Large", new EventHandler(AddressOf Me.FormatSize_Clicked))
            miMedium.Checked = True
            miMedium.DefaultItem = True
            miFormatSizeChecked = miMedium

            miFormat.MenuItems.Add("Font &Size" _
            , (New MenuItem() {miSmall, miMedium, miLarge}))

        End Sub

        'File->Load Document Menu item handler
        Protected Sub LoadDocument_Clicked(ByVal sender As Object, ByVal e As System.EventArgs)
            MessageBox.Show(Me.Text)
        End Sub


        'Format->Font Menu item handler
        Protected Sub FormatFont_Clicked(ByVal sender As Object, ByVal e As System.EventArgs)
            Dim miClicked As MenuItem = CType(sender, MenuItem)
            miClicked.Checked = True
            miFormatFontChecked.Checked = False
            miFormatFontChecked = miClicked

            If (miClicked Is miSansSerif) Then
                currentFontFamily = sansSerifFontFamily
            ElseIf (miClicked Is miSerif) Then
                currentFontFamily = serifFontFamily
            Else
                currentFontFamily = monoSpaceFontFamily
            End If

            richTextBox1.Font = new Font(currentFontFamily, fontSize)
        End Sub

        'Format->Size Menu item handler
        Protected Sub FormatSize_Clicked(ByVal sender As Object, ByVal e As System.EventArgs)
            Dim miClicked As MenuItem = CType(sender, MenuItem)
            miClicked.Checked = True
            miFormatSizeChecked.Checked = False
            miFormatSizeChecked = miClicked
            If (miClicked Is miSmall) Then
                fontSize = FontSizes.Small
            ElseIf (miClicked Is miLarge) Then
                fontSize = FontSizes.Large
            Else
                fontSize = FontSizes.Medium
            End IF

            richTextBox1.Font = New Font(currentFontFamily, fontSize)
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
        Private WithEvents richTextBox1 As System.Windows.Forms.RichTextBox
        Private WithEvents mainMenu As System.Windows.Forms.MainMenu

        Private WithEvents Document As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.richTextBox1 = New System.Windows.Forms.RichTextBox()
            Me.mainMenu = New System.Windows.Forms.MainMenu()
            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.Menu = mainMenu
            Me.ClientSize = New System.Drawing.Size(392, 117)

            richTextBox1.Size = New System.Drawing.Size(292, 273)
            richTextBox1.Dock = System.Windows.Forms.DockStyle.Fill
            richTextBox1.TabIndex = 0
            Me.Controls.Add(richTextBox1)
        End Sub

#End Region

    End Class

End Namespace
