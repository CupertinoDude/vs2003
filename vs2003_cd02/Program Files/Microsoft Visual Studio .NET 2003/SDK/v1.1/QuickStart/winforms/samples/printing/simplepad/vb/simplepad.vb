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
Imports System.Drawing
Imports System.Drawing.Printing
Imports System.Collections
Imports System.Globalization
Imports System.IO
Imports System.ComponentModel
Imports System.Windows.Forms
Imports Microsoft.VisualBasic

Namespace Microsoft.Samples.WinForms.Vb.SimplePad
    _

    Public Class SimplePad
        Inherits System.Windows.Forms.Form
        '/ <summary>
        '/    Required designer variable.
        '/ </summary>
        Private components As System.ComponentModel.Container
        Protected Friend menuItem22 As System.Windows.Forms.MenuItem
        Protected Friend WithEvents selectAllMenu As System.Windows.Forms.MenuItem
        Protected Friend menuItem20 As System.Windows.Forms.MenuItem
        Protected Friend WithEvents gotoMenu As System.Windows.Forms.MenuItem
        Protected Friend menuItem18 As System.Windows.Forms.MenuItem
        Protected Friend menuItem17 As System.Windows.Forms.MenuItem
        Protected Friend menuItem16 As System.Windows.Forms.MenuItem
        Protected Friend menuItem15 As System.Windows.Forms.MenuItem
        Protected Friend WithEvents DeleteMenu As System.Windows.Forms.MenuItem
        Protected Friend pasteMenu As System.Windows.Forms.MenuItem
        Protected Friend copyMenu As System.Windows.Forms.MenuItem
        Protected Friend CutMenu As System.Windows.Forms.MenuItem
        Protected Friend menuItem8 As System.Windows.Forms.MenuItem
        Protected Friend UndoMenu As System.Windows.Forms.MenuItem
        Protected Friend optionsMenu As System.Windows.Forms.MenuItem
        Protected Friend menuItem7 As System.Windows.Forms.MenuItem
        Protected Friend fontMenu As System.Windows.Forms.MenuItem
        Protected Friend wordWrapMenu As System.Windows.Forms.MenuItem
        Protected Friend printDialog1 As System.Windows.Forms.PrintDialog
        Protected Friend fontDialog1 As System.Windows.Forms.FontDialog
        Protected Friend saveFileDialog1 As System.Windows.Forms.SaveFileDialog
        Protected Friend openFileDialog1 As System.Windows.Forms.OpenFileDialog
        Protected Friend linePanel As System.Windows.Forms.StatusBarPanel
        Protected Friend statusPanel As System.Windows.Forms.StatusBarPanel
        Protected Friend statusBar1 As System.Windows.Forms.StatusBar
        Protected Friend WithEvents textArea As System.Windows.Forms.RichTextBox
        Protected Friend exitMenu As System.Windows.Forms.MenuItem
        Protected Friend menuItem12 As System.Windows.Forms.MenuItem
        Protected Friend printMenu As System.Windows.Forms.MenuItem
        Protected Friend pageSetupMenu As System.Windows.Forms.MenuItem
        Protected Friend menuItem9 As System.Windows.Forms.MenuItem
        Protected Friend saveAsMenu As System.Windows.Forms.MenuItem
        Protected Friend saveMenu As System.Windows.Forms.MenuItem
        Protected Friend openMenu As System.Windows.Forms.MenuItem
        Protected Friend newMenu As System.Windows.Forms.MenuItem
        Protected Friend menuItem4 As System.Windows.Forms.MenuItem
        Protected Friend menuItem3 As System.Windows.Forms.MenuItem
        Protected Friend menuItem2 As System.Windows.Forms.MenuItem
        Protected Friend menuItem1 As System.Windows.Forms.MenuItem
        Protected Friend mainMenu As System.Windows.Forms.MainMenu
        Protected Friend printPreviewMenu As System.Windows.Forms.MenuItem
        Protected Friend dirWatcher As System.IO.FileSystemWatcher

        Private Shared noFilename As String = "Untitled"
        Private Shared notDirtyCaptionFormat As String = "{0} - SimplePad+"
        Private Shared dirtyCaptionFormat As String = "{0}* - SimplePad+"
        Private editingFileName As String = Nothing
        Private dirty As Boolean = False
        Private fileOnDiskModified As Boolean = False
        Private storedPageSettings As PageSettings = Nothing


        Public Sub New()
            '
            ' Required for Windows Form Designer support
            '
            InitializeComponent()

            UpdateFormText()
        End Sub 'New


        '/ <summary>
        '/    Clean up any resources being used.
        '/ </summary>
        Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
            If disposing Then
                If Not (components Is Nothing) Then
                    components.Dispose()
                End If
            End If
            MyBase.Dispose(disposing)
        End Sub 'Dispose


        '/ <summary>
        '/    Required method for Designer support - do not modify
        '/    the contents of this method with the code editor.
        '/ </summary>
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.wordWrapMenu = New System.Windows.Forms.MenuItem()
            Me.mainMenu = New System.Windows.Forms.MainMenu()
            Me.statusBar1 = New System.Windows.Forms.StatusBar()
            Me.menuItem4 = New System.Windows.Forms.MenuItem()
            Me.menuItem20 = New System.Windows.Forms.MenuItem()
            Me.textArea = New System.Windows.Forms.RichTextBox()
            Me.linePanel = New System.Windows.Forms.StatusBarPanel()
            Me.newMenu = New System.Windows.Forms.MenuItem()
            Me.saveMenu = New System.Windows.Forms.MenuItem()
            Me.menuItem18 = New System.Windows.Forms.MenuItem()
            Me.pasteMenu = New System.Windows.Forms.MenuItem()
            Me.exitMenu = New System.Windows.Forms.MenuItem()
            Me.statusPanel = New System.Windows.Forms.StatusBarPanel()
            Me.selectAllMenu = New System.Windows.Forms.MenuItem()
            Me.gotoMenu = New System.Windows.Forms.MenuItem()
            Me.DeleteMenu = New System.Windows.Forms.MenuItem()
            Me.menuItem15 = New System.Windows.Forms.MenuItem()
            Me.menuItem17 = New System.Windows.Forms.MenuItem()
            Me.copyMenu = New System.Windows.Forms.MenuItem()
            Me.menuItem16 = New System.Windows.Forms.MenuItem()
            Me.optionsMenu = New System.Windows.Forms.MenuItem()
            Me.menuItem9 = New System.Windows.Forms.MenuItem()
            Me.saveFileDialog1 = New System.Windows.Forms.SaveFileDialog()
            Me.fontMenu = New System.Windows.Forms.MenuItem()
            Me.UndoMenu = New System.Windows.Forms.MenuItem()
            Me.menuItem12 = New System.Windows.Forms.MenuItem()
            Me.CutMenu = New System.Windows.Forms.MenuItem()
            Me.menuItem22 = New System.Windows.Forms.MenuItem()
            Me.menuItem8 = New System.Windows.Forms.MenuItem()
            Me.dirWatcher = New System.IO.FileSystemWatcher()
            Me.menuItem7 = New System.Windows.Forms.MenuItem()
            Me.printMenu = New System.Windows.Forms.MenuItem()
            Me.printDialog1 = New System.Windows.Forms.PrintDialog()
            Me.saveAsMenu = New System.Windows.Forms.MenuItem()
            Me.fontDialog1 = New System.Windows.Forms.FontDialog()
            Me.openFileDialog1 = New System.Windows.Forms.OpenFileDialog()
            Me.menuItem1 = New System.Windows.Forms.MenuItem()
            Me.openMenu = New System.Windows.Forms.MenuItem()
            Me.menuItem2 = New System.Windows.Forms.MenuItem()
            Me.pageSetupMenu = New System.Windows.Forms.MenuItem()
            Me.menuItem3 = New System.Windows.Forms.MenuItem()
            Me.printPreviewMenu = New System.Windows.Forms.MenuItem()

            dirWatcher.BeginInit()

            wordWrapMenu.BarBreak = False
            wordWrapMenu.Break = False
            wordWrapMenu.Text = "&Word Wrap"
            wordWrapMenu.Index = 0
            wordWrapMenu.DefaultItem = False
            AddHandler wordWrapMenu.Click, AddressOf WordWrapMenu_Click

            mainMenu.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {menuItem1, menuItem2, menuItem3, menuItem4})

            statusBar1.Location = New System.Drawing.Point(0, 379)
            statusBar1.BackColor = SystemColors.Control
            statusBar1.Size = New System.Drawing.Size(512, 20)
            statusBar1.TabIndex = 1
            statusBar1.ShowPanels = True
            statusBar1.Text = "statusBar1"
            statusBar1.Panels.AddRange(New System.Windows.Forms.StatusBarPanel() {statusPanel, linePanel})

            menuItem4.BarBreak = False
            menuItem4.Break = False
            menuItem4.Text = "&Help"
            menuItem4.Index = 3
            menuItem4.DefaultItem = False

            menuItem20.BarBreak = False
            menuItem20.Break = False
            menuItem20.Text = "-"
            menuItem20.Index = 11
            menuItem20.DefaultItem = False

            textArea.Text = ""
            textArea.Size = New System.Drawing.Size(512, 379)
            textArea.TabIndex = 0
            textArea.Dock = System.Windows.Forms.DockStyle.Fill
            textArea.WordWrap = False
            textArea.AcceptsTab = True
            AddHandler textArea.TextChanged, AddressOf TextArea_TextChanged

            Me.AutoScaleBaseSize = New System.Drawing.Size(6, 16)
            Me.Text = "SimplePad+"
            Me.Menu = mainMenu
            Me.ClientSize = New System.Drawing.Size(512, 399)

            newMenu.BarBreak = False
            newMenu.Break = False
            newMenu.Text = "&New"
            newMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlN
            newMenu.Index = 0
            newMenu.DefaultItem = False
            AddHandler newMenu.Click, AddressOf NewMenu_Click

            saveMenu.BarBreak = False
            saveMenu.Break = False
            saveMenu.Text = "&Save"
            saveMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlS
            saveMenu.Index = 2
            saveMenu.DefaultItem = False
            AddHandler saveMenu.Click, AddressOf SaveMenu_Click

            pasteMenu.BarBreak = False
            pasteMenu.Break = False
            pasteMenu.Text = "&Paste"
            pasteMenu.Index = 4
            pasteMenu.DefaultItem = False
            pasteMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlV
            AddHandler pasteMenu.Click, AddressOf PasteMenu_Click

            exitMenu.BarBreak = False
            exitMenu.Break = False
            exitMenu.Text = "E&xit"
            exitMenu.Index = 8
            exitMenu.DefaultItem = False
            AddHandler exitMenu.Click, AddressOf ExitMenu_Click

            statusPanel.Text = "Ready"
            statusPanel.BorderStyle = StatusBarPanelBorderStyle.None
            statusPanel.Width = 396
            statusPanel.AutoSize = StatusBarPanelAutoSize.Spring

            selectAllMenu.BarBreak = False
            selectAllMenu.Break = False
            selectAllMenu.Text = "Select &All"
            selectAllMenu.Index = 12
            selectAllMenu.DefaultItem = False
            selectAllMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlA
            AddHandler selectAllMenu.Click, AddressOf SelectAllMenu_Click

            gotoMenu.BarBreak = False
            gotoMenu.Break = False
            gotoMenu.Text = "&Go To..."
            gotoMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlG
            gotoMenu.Index = 10
            gotoMenu.DefaultItem = False
            AddHandler gotoMenu.Click, AddressOf GotoMenu_Click

            DeleteMenu.BarBreak = False
            DeleteMenu.Break = False
            DeleteMenu.Text = "De&lete"
            DeleteMenu.Index = 5
            DeleteMenu.DefaultItem = False
            AddHandler DeleteMenu.Click, AddressOf DeleteMenu_Click

            menuItem15.BarBreak = False
            menuItem15.Break = False
            menuItem15.Text = "-"
            menuItem15.Index = 6
            menuItem15.DefaultItem = False

            copyMenu.BarBreak = False
            copyMenu.Break = False
            copyMenu.Text = "&Copy"
            copyMenu.Index = 3
            copyMenu.DefaultItem = False
            copyMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlC
            AddHandler copyMenu.Click, AddressOf CopyMenu_Click

            optionsMenu.BarBreak = False
            optionsMenu.Break = False
            optionsMenu.Text = "&Options..."
            optionsMenu.Index = 3
            optionsMenu.DefaultItem = False
            AddHandler optionsMenu.Click, AddressOf OptionsMenu_Click

            menuItem9.BarBreak = False
            menuItem9.Break = False
            menuItem9.Text = "-"
            menuItem9.Index = 4
            menuItem9.DefaultItem = False

            saveFileDialog1.Filter = "Text Files (*.txt)|*.txt|Rich Text Format (*.rtf)|*.rtf|All Files (*.*)|*.*"
            saveFileDialog1.Title = "Save As"

            fontMenu.BarBreak = False
            fontMenu.Break = False
            fontMenu.Text = "&Font..."
            fontMenu.Index = 1
            fontMenu.DefaultItem = False
            AddHandler fontMenu.Click, AddressOf FontMenu_Click

            UndoMenu.BarBreak = False
            UndoMenu.Break = False
            UndoMenu.Text = "&Undo"
            UndoMenu.Index = 0
            UndoMenu.DefaultItem = False
            UndoMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlZ
            AddHandler UndoMenu.Click, AddressOf UndoMenu_Click

            menuItem12.BarBreak = False
            menuItem12.Break = False
            menuItem12.Text = "-"
            menuItem12.Index = 7
            menuItem12.DefaultItem = False

            CutMenu.BarBreak = False
            CutMenu.Break = False
            CutMenu.Text = "Cu&t"
            CutMenu.Index = 2
            CutMenu.DefaultItem = False
            CutMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlX
            AddHandler CutMenu.Click, AddressOf CutMenu_Click

            menuItem8.BarBreak = False
            menuItem8.Break = False
            menuItem8.Text = "-"
            menuItem8.Index = 1
            menuItem8.DefaultItem = False

            AddHandler dirWatcher.Changed, AddressOf DirWatcher_Changed

            menuItem7.BarBreak = False
            menuItem7.Break = False
            menuItem7.Text = "-"
            menuItem7.Index = 2
            menuItem7.DefaultItem = False

            printMenu.BarBreak = False
            printMenu.Break = False
            printMenu.Text = "&Print..."
            printMenu.Index = 6
            printMenu.DefaultItem = False
            printMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlP
            AddHandler printMenu.Click, AddressOf PrintMenu_Click

            printPreviewMenu.BarBreak = False
            printPreviewMenu.Break = False
            printPreviewMenu.Text = "Print Pre&view..."
            printPreviewMenu.Index = 6
            printPreviewMenu.DefaultItem = False
            AddHandler printPreviewMenu.Click, AddressOf PrintPreviewMenu_Click

            saveAsMenu.BarBreak = False
            saveAsMenu.Break = False
            saveAsMenu.Text = "Save &As..."
            saveAsMenu.Index = 3
            saveAsMenu.DefaultItem = False
            AddHandler saveAsMenu.Click, AddressOf SaveAsMenu_Click

            fontDialog1.ShowColor = True
            fontDialog1.ShowEffects = True

            openFileDialog1.Filter = "Text Files (*.txt)|*.txt|Rich Text Format (*.rtf)|*.rtf|All Files (*.*)|*.*"
            openFileDialog1.Title = "Open"
            openFileDialog1.DefaultExt = ".rtf"

            menuItem1.BarBreak = False
            menuItem1.Break = False
            menuItem1.Text = "&File"
            menuItem1.Index = 0
            menuItem1.DefaultItem = False
            menuItem1.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {newMenu, openMenu, saveMenu, saveAsMenu, menuItem9, printMenu, printPreviewMenu, pageSetupMenu, menuItem12, exitMenu})

            openMenu.BarBreak = False
            openMenu.Break = False
            openMenu.Text = "&Open..."
            openMenu.Index = 1
            openMenu.Shortcut = System.Windows.Forms.Shortcut.CtrlO
            openMenu.DefaultItem = False
            AddHandler openMenu.Click, AddressOf OpenMenu_Click

            menuItem2.BarBreak = False
            menuItem2.Break = False
            menuItem2.Text = "&Edit"
            menuItem2.Index = 1
            menuItem2.DefaultItem = False
            menuItem2.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {UndoMenu, menuItem8, CutMenu, copyMenu, pasteMenu, DeleteMenu, menuItem15, gotoMenu, menuItem20, selectAllMenu})

            pageSetupMenu.BarBreak = False
            pageSetupMenu.Break = False
            pageSetupMenu.Text = "Page Set&up..."
            pageSetupMenu.Index = 5
            pageSetupMenu.DefaultItem = False
            AddHandler pageSetupMenu.Click, AddressOf PageSetupMenu_Click

            menuItem3.BarBreak = False
            menuItem3.Break = False
            menuItem3.Text = "F&ormat"
            menuItem3.Index = 2
            menuItem3.DefaultItem = False
            menuItem3.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {wordWrapMenu, fontMenu, menuItem7, optionsMenu})

            Me.Controls.Add(statusBar1)
            Me.Controls.Add(textArea)

            dirWatcher.EndInit()
        End Sub 'InitializeComponent


        Private Sub PromptForReload()
            fileOnDiskModified = False

            Dim dr As System.Windows.Forms.DialogResult = MessageBox.Show(Me, "The current file has been changed, do you want to reload it?", "File Change Notification", MessageBoxButtons.YesNo, MessageBoxIcon.Question)

            If dr = System.Windows.Forms.DialogResult.Yes Then
                ReadEditingFile()
            End If
        End Sub 'PromptForReload


        Protected Overrides Sub OnActivated(ByVal e As EventArgs)
            MyBase.OnActivated(e)

            If fileOnDiskModified Then
                PromptForReload()
            End If
        End Sub 'OnActivated


        Protected Overrides Sub OnClosing(ByVal e As CancelEventArgs)
            MyBase.OnClosing(e)

            If dirty Then
                Dim dr As System.Windows.Forms.DialogResult = MessageBox.Show(Me, "Do you want to save the current changes?", "Save Changes?", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question)

                Select Case dr
                    Case System.Windows.Forms.DialogResult.Yes
                        Save()
                    Case System.Windows.Forms.DialogResult.No
                    Case System.Windows.Forms.DialogResult.Cancel
                        e.Cancel = True
                End Select
            End If
        End Sub 'OnClosing


        Private Sub DirWatcher_Changed(ByVal sender As Object, ByVal e As FileSystemEventArgs)
            If Me.ContainsFocus Then
                PromptForReload()
            Else
                fileOnDiskModified = True
            End If
        End Sub 'DirWatcher_Changed


        Private Sub TextArea_TextChanged(ByVal sender As Object, ByVal e As EventArgs)
            If Not dirty Then
                dirty = True
                UpdateFormText()
            End If
        End Sub 'TextArea_TextChanged


        Private Sub SaveAs()
            Dim dr As System.Windows.Forms.DialogResult = saveFileDialog1.ShowDialog()
            If dr = System.Windows.Forms.DialogResult.OK Then
                editingFileName = saveFileDialog1.FileName
                Dim efInfo As New FileInfo(editingFileName)
                dirWatcher.EnableRaisingEvents = False
                dirWatcher.Path = efInfo.DirectoryName
                dirWatcher.Filter = efInfo.Name
                Save()
                UpdateFormText()
            End If
        End Sub 'SaveAs


        Private Sub Save()
            If editingFileName Is Nothing Then
                SaveAs()
                Return
            ElseIf editingFileName.Length < 1 Then
                SaveAs()
                Return
            End If

            dirWatcher.EnableRaisingEvents = False
            Dim fs As FileStream = Nothing
            Try
                If File.Exists(editingFileName) Then
                    fs = New FileStream(editingFileName, FileMode.Open)
                Else
                    fs = New FileStream(editingFileName, FileMode.Create)
                End If

                Dim fext As String = New FileInfo(editingFileName).Extension.ToUpper(CultureInfo.InvariantCulture)

                Console.WriteLine(editingFileName)

                If fext.Equals(".RTF") Then
                    textArea.SaveFile(fs, RichTextBoxStreamType.RichText)
                Else
                    textArea.SaveFile(fs, RichTextBoxStreamType.PlainText)
                End If
            Finally
                If Not (fs Is Nothing) Then
                    fs.Flush()
                    fs.Close()
                    dirty = False
                End If
                dirWatcher.EnableRaisingEvents = True
            End Try
        End Sub 'Save


        Private Sub ExitMenu_Click(ByVal sender As Object, ByVal e As EventArgs)
            Me.Close()
        End Sub 'ExitMenu_Click


        Private Sub SaveMenu_Click(ByVal sender As Object, ByVal e As EventArgs)
            Save()
        End Sub 'SaveMenu_Click


        Private Sub GotoLine(ByVal line As Integer)
            Dim text As String = textArea.Text
            Dim cur As Integer = 0
            Dim i As Integer

            If line > textArea.Lines.Length Then
                line = textArea.Lines.Length
            End If

            For i = 1 To line - 1
                Dim nextLine As Integer = text.IndexOf(ControlChars.Lf, cur + 1)
                If nextLine = -1 Then
                    Exit For
                End If
                cur = nextLine
            Next i
            If line > 1 Then
                textArea.Select(cur + 1, 0)
            Else
                textArea.Select(cur, 0)
            End If
        End Sub 'GotoLine


        Private Function GetCurrentLine() As Integer
            Dim text As Char() = textArea.Text.ToCharArray()
            Dim cur As Integer = textArea.SelectionStart
            Dim line As Integer = 1
            Dim i As Integer
            For i = 0 To cur - 1
                If text(i) = ControlChars.Lf Then
                    line += 1
                End If
            Next i
            Return line
        End Function 'GetCurrentLine


        Private Sub GotoMenu_Click(ByVal sender As Object, ByVal e As EventArgs)
            Dim dr As System.Windows.Forms.DialogResult
            Dim f As New GotoForm
            f.Line = GetCurrentLine()
            dr = f.ShowDialog(Me)
            If (dr = System.Windows.Forms.DialogResult.OK) And (f.Line <> -1) Then
                GotoLine(f.Line)
            End If
        End Sub 'GotoMenu_Click


        Private Sub SaveAsMenu_Click(ByVal sender As Object, ByVal e As EventArgs)
            SaveAs()
        End Sub 'SaveAsMenu_Click


        Private Sub WordWrapMenu_Click(ByVal sender As Object, ByVal e As EventArgs)
            wordWrapMenu.Checked = Not wordWrapMenu.Checked
            textArea.WordWrap = wordWrapMenu.Checked
        End Sub 'WordWrapMenu_Click


        Private Sub NewMenu_Click(ByVal sender As Object, ByVal e As EventArgs)
            MessageBox.Show("Not implemented")
        End Sub 'NewMenu_Click


        Private Sub OpenMenu_Click(ByVal sender As Object, ByVal e As EventArgs)
            If openFileDialog1.ShowDialog() = System.Windows.Forms.DialogResult.OK Then
                editingFileName = openFileDialog1.FileName
                ReadEditingFile()
            End If
        End Sub 'OpenMenu_Click


        Private Sub FontMenu_Click(ByVal sender As Object, ByVal e As EventArgs)
            If fontDialog1.ShowDialog() = System.Windows.Forms.DialogResult.OK Then
                textArea.SelectionFont = fontDialog1.Font
                textArea.SelectionColor = fontDialog1.Color
            End If
        End Sub 'FontMenu_Click


        Private Sub OptionsMenu_Click(ByVal sender As Object, ByVal e As EventArgs)
            Dim f As New OptionsForm(New SimplePadOptions(Me))
            f.ShowDialog(Me)
        End Sub 'OptionsMenu_Click


        Private Sub CutMenu_Click(ByVal sender As Object, ByVal e As EventArgs)
            If textArea.SelectedText.Equals("") Then
                Return
            End If
            Clipboard.SetDataObject(textArea.SelectedRtf, True)
            textArea.SelectedRtf = ""
        End Sub 'CutMenu_Click


        Private Sub UndoMenu_Click(ByVal sender As Object, ByVal e As EventArgs)
            textArea.Undo()
        End Sub 'UndoMenu_Click


        Private Sub CopyMenu_Click(ByVal sender As Object, ByVal e As EventArgs)
            If textArea.SelectedText.Equals("") Then
                Return
            End If
            Clipboard.SetDataObject(textArea.SelectedRtf, True)
        End Sub 'CopyMenu_Click


        Private Sub SelectAllMenu_Click(ByVal sender As Object, ByVal e As EventArgs)
            textArea.SelectAll()
        End Sub 'SelectAllMenu_Click


        Private Sub DeleteMenu_Click(ByVal sender As Object, ByVal e As EventArgs)
            textArea.SelectedRtf = ""
        End Sub 'DeleteMenu_Click


        Private Sub PasteMenu_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try
                Dim data As DataObject = CType(Clipboard.GetDataObject(), DataObject)
                If data.GetDataPresent(DataFormats.Rtf) Then
                    Dim text As String = CStr(data.GetData(DataFormats.Rtf))
                    If Not text.Equals("") Then
                        textArea.SelectedRtf = text
                    End If
                Else
                    If data.GetDataPresent(DataFormats.Text) Then
                        Dim text As String = CStr(data.GetData(DataFormats.Text))
                        If Not text.Equals("") Then
                            textArea.SelectedText = text
                        End If
                    End If
                End If
            Catch ex As Exception
                MessageBox.Show(ex.Message)
            End Try
        End Sub 'PasteMenu_Click



        Private Sub PrintMenu_Click(ByVal sender As Object, ByVal e As EventArgs)
            Dim streamToPrint As New StringReader(textArea.Text)

            'Assumes the default printer
            Dim pd As New TextPrintDocument(streamToPrint, textArea.Font)

            If Not (storedPageSettings Is Nothing) Then
                pd.DefaultPageSettings = storedPageSettings
            End If

            Dim dlg As New PrintDialog
            dlg.Document = pd
            Dim result As DialogResult = dlg.ShowDialog()

            If result = DialogResult.OK Then
                pd.Print()
            End If
        End Sub 'PrintMenu_Click


        Private Sub PageSetupMenu_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try
                Dim psDlg As New PageSetupDialog

                If storedPageSettings Is Nothing Then
                    storedPageSettings = New PageSettings
                End If

                psDlg.PageSettings = storedPageSettings
                psDlg.ShowDialog()

            Catch ex As Exception
                MessageBox.Show(("An error occurred - " + ex.Message))
            End Try
        End Sub 'PageSetupMenu_Click


        Private Sub PrintPreviewMenu_Click(ByVal sender As Object, ByVal e As EventArgs)

            Try
                Dim streamToPrint As New StringReader(textArea.Text)

                'Assumes the default printer
                Dim pd As New TextPrintDocument(streamToPrint, textArea.Font)

                If Not (storedPageSettings Is Nothing) Then
                    pd.DefaultPageSettings = storedPageSettings
                End If

                Dim dlg As New PrintPreviewDialog
                dlg.Document = pd
                dlg.ShowDialog()
            Catch ex As Exception
                MessageBox.Show(("An error occurred attempting to preview the file to print - " + ex.Message))
            End Try
        End Sub 'PrintPreviewMenu_Click



        Private Sub ReadEditingFile()
            RemoveHandler textArea.TextChanged, AddressOf Me.TextArea_TextChanged
            dirWatcher.EnableRaisingEvents = False
            Try

                Dim s = New FileStream(editingFileName, FileMode.Open)
                Dim efInfo As New FileInfo(editingFileName)

                Dim fext As String = efInfo.Extension.ToUpper(CultureInfo.InvariantCulture)

                If fext.Equals(".RTF") Then
                    textArea.LoadFile(s, RichTextBoxStreamType.RichText)
                Else
                    textArea.LoadFile(s, RichTextBoxStreamType.PlainText)
                End If
                s.Close()

                dirWatcher.Path = efInfo.DirectoryName
                dirWatcher.Filter = efInfo.Name

                dirty = False
                UpdateFormText()
            Finally
                AddHandler textArea.TextChanged, AddressOf Me.TextArea_TextChanged
                dirWatcher.EnableRaisingEvents = True
            End Try
        End Sub 'ReadEditingFile


        Private Sub UpdateFormText()
            Dim file As String = noFilename
            If Not (editingFileName Is Nothing) Then
                If editingFileName.Length > 1 Then
                    file = editingFileName
                End If
            End If

            If dirty Then
                Me.Text = String.Format(dirtyCaptionFormat, file)
            Else
                Me.Text = String.Format(notDirtyCaptionFormat, file)
            End If
        End Sub 'UpdateFormText

        '/ <summary>
        '/ The main entry point for the application.
        '/ </summary>
        <STAThread()> _
        Public Overloads Shared Sub Main(ByVal args() As String)
            Application.Run(New SimplePad)
        End Sub 'Main
       _

        Friend Class SimplePadOptions
            Private owner As SimplePad


            Public Sub New(ByVal owner As SimplePad)
                Me.owner = owner
            End Sub 'New


            <Description("Color used for the background of the text"), Category("Text Display")> _
            Public Property BackColor() As Color
                Get
                    Return owner.textArea.BackColor
                End Get
                Set(ByVal Value As Color)
                    owner.textArea.BackColor = Value
                End Set
            End Property '

            <Description("Color used for the forecolor of the text"), Category("Text Display")> _
            Public Property ForeColor() As Color
                Get
                    Return owner.textArea.ForeColor
                End Get
                Set(ByVal Value As Color)
                    owner.textArea.ForeColor = Value
                End Set
            End Property '

            <Description("Adjusts the font used to display text in SimplePad+"), Category("Text Display")> _
            Public Property DefaultFont() As Font
                Get
                    Return owner.textArea.Font
                End Get
                Set(ByVal Value As Font)
                    owner.textArea.Font = Value
                End Set
            End Property '

            <Description("Determines if text will word wrap"), Category("Text Display"), DefaultValue(False)> _
            Public Property WordWrap() As Boolean
                Get
                    Return owner.wordWrapMenu.Checked
                End Get
                Set(ByVal Value As Boolean)
                    owner.wordWrapMenu.Checked = (owner.textArea.WordWrap = Value)
                End Set
            End Property '

            <Description("Modifies the opacity of SimplePad+. Windows 2000 only."), Category("Application"), TypeConverterAttribute(GetType(OpacityConverter)), DefaultValue(1.0)> _
            Public Property Opacity() As Double
                Get
                    Return owner.Opacity
                End Get
                Set(ByVal Value As Double)
                    owner.Opacity = Value
                End Set
            End Property
        End Class 'SimplePadOptions
    End Class 'SimplePad
End Namespace 'Microsoft.Samples.WinForms.Vb.SimplePad
