Option Explicit On 
Option Strict On

'Copyright (C) 2000 Microsoft Corporation.  All rights reserved.
'This source code is intended only as a supplement to Microsoft
'Development Tools and/or on-line documentation.  See these other
'materials for detailed information regarding Microsoft code samples.
'THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
'KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
'IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
'PARTICULAR PURPOSE.
Imports System
Imports System.IO
Imports System.Drawing
Imports System.Drawing.Printing
Imports System.Collections
Imports System.ComponentModel
Imports System.Windows.Forms

Namespace Scribble
    _

    Public Class MainWindow
        Inherits System.Windows.Forms.Form

        Private Shared documentCount As Integer
        Private Shared parentWindow As MainWindow

        Private components As System.ComponentModel.IContainer

#Region " Windows Form Designer generated code "
        Private HelpProvider1 As System.Windows.Forms.HelpProvider
        Private WithEvents statusBar1 As System.Windows.Forms.StatusBar
        Private WithEvents ImageList1 As System.Windows.Forms.ImageList
        Private WithEvents HelpButton1 As System.Windows.Forms.ToolBarButton
        Private WithEvents PrintButton As System.Windows.Forms.ToolBarButton
        Private WithEvents PreviewButton As System.Windows.Forms.ToolBarButton
        Private WithEvents SaveButton As System.Windows.Forms.ToolBarButton
        Private WithEvents OpenButton As System.Windows.Forms.ToolBarButton
        Private WithEvents NewButton As System.Windows.Forms.ToolBarButton
        Private WithEvents toolBar1 As System.Windows.Forms.ToolBar
        Private WithEvents PrintDoc As System.Drawing.Printing.PrintDocument
        Private WithEvents MenuItemAbout As System.Windows.Forms.MenuItem
        Private WithEvents MenuItem37 As System.Windows.Forms.MenuItem
        Private WithEvents MenuItemHelpTopics As System.Windows.Forms.MenuItem
        Private WithEvents MenuItemTile As System.Windows.Forms.MenuItem
        Private WithEvents MenuItemCascade As System.Windows.Forms.MenuItem
        Private WithEvents MenuItemNewWindow As System.Windows.Forms.MenuItem
        Private WithEvents MenuItemStatusbar As System.Windows.Forms.MenuItem
        Private WithEvents MenuItemToolbar As System.Windows.Forms.MenuItem
        Private WithEvents MenuItemPenWidths As System.Windows.Forms.MenuItem
        Private WithEvents MenuItemThickLine As System.Windows.Forms.MenuItem
        Private WithEvents MenuItemClearAll As System.Windows.Forms.MenuItem
        Private WithEvents MenuItemExit As System.Windows.Forms.MenuItem
        Private WithEvents MenuItemPreview As System.Windows.Forms.MenuItem
        Private WithEvents MenuItemPrint As System.Windows.Forms.MenuItem
        Private WithEvents MenuItem12 As System.Windows.Forms.MenuItem
        Private WithEvents MenuItemSaveAs As System.Windows.Forms.MenuItem
        Private WithEvents MenuItemSave As System.Windows.Forms.MenuItem
        Private WithEvents MenuItemClose As System.Windows.Forms.MenuItem
        Private WithEvents MenuItemOpen As System.Windows.Forms.MenuItem
        Private WithEvents MenuItemNew As System.Windows.Forms.MenuItem
        Private WithEvents MenuItemHelp As System.Windows.Forms.MenuItem
        Private WithEvents MenuItemWindow As System.Windows.Forms.MenuItem
        Private WithEvents MenuItemView As System.Windows.Forms.MenuItem
        Private WithEvents MenuItemPen As System.Windows.Forms.MenuItem
        Private WithEvents MenuItemEdit As System.Windows.Forms.MenuItem
        Private WithEvents MenuItemFile As System.Windows.Forms.MenuItem
        Private WithEvents mdiClient1 As System.Windows.Forms.MdiClient
        Private WithEvents MainMenu1 As System.Windows.Forms.MainMenu

        Public Sub New()
            ParentWindow = Me

            InitializeComponent()
            DocumentCount = 0
            CreateDocument()
        End Sub 'New


        'Form overrides dispose to clean up the component list.
        Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
            If disposing Then
                If Not (components Is Nothing) Then
                    components.Dispose()
                End If
            End If
            MyBase.Dispose(disposing)
        End Sub

        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(MainWindow))
            Me.toolBar1 = New System.Windows.Forms.ToolBar()
            Me.NewButton = New System.Windows.Forms.ToolBarButton()
            Me.OpenButton = New System.Windows.Forms.ToolBarButton()
            Me.SaveButton = New System.Windows.Forms.ToolBarButton()
            Me.PreviewButton = New System.Windows.Forms.ToolBarButton()
            Me.PrintButton = New System.Windows.Forms.ToolBarButton()
            Me.HelpButton1 = New System.Windows.Forms.ToolBarButton()
            Me.ImageList1 = New System.Windows.Forms.ImageList(Me.components)
            Me.MenuItemOpen = New System.Windows.Forms.MenuItem()
            Me.MenuItemNewWindow = New System.Windows.Forms.MenuItem()
            Me.MenuItemExit = New System.Windows.Forms.MenuItem()
            Me.MenuItemPrint = New System.Windows.Forms.MenuItem()
            Me.MenuItemClose = New System.Windows.Forms.MenuItem()
            Me.MenuItemCascade = New System.Windows.Forms.MenuItem()
            Me.MenuItem12 = New System.Windows.Forms.MenuItem()
            Me.MenuItemThickLine = New System.Windows.Forms.MenuItem()
            Me.MenuItemFile = New System.Windows.Forms.MenuItem()
            Me.MenuItemNew = New System.Windows.Forms.MenuItem()
            Me.MenuItemSave = New System.Windows.Forms.MenuItem()
            Me.MenuItemSaveAs = New System.Windows.Forms.MenuItem()
            Me.MenuItemPreview = New System.Windows.Forms.MenuItem()
            Me.statusBar1 = New System.Windows.Forms.StatusBar()
            Me.MenuItemView = New System.Windows.Forms.MenuItem()
            Me.MenuItemToolbar = New System.Windows.Forms.MenuItem()
            Me.MenuItemStatusbar = New System.Windows.Forms.MenuItem()
            Me.MenuItemClearAll = New System.Windows.Forms.MenuItem()
            Me.PrintDoc = New System.Drawing.Printing.PrintDocument()
            Me.MenuItemHelpTopics = New System.Windows.Forms.MenuItem()
            Me.MainMenu1 = New System.Windows.Forms.MainMenu()
            Me.MenuItemEdit = New System.Windows.Forms.MenuItem()
            Me.MenuItemPen = New System.Windows.Forms.MenuItem()
            Me.MenuItemPenWidths = New System.Windows.Forms.MenuItem()
            Me.MenuItemWindow = New System.Windows.Forms.MenuItem()
            Me.MenuItemTile = New System.Windows.Forms.MenuItem()
            Me.MenuItemHelp = New System.Windows.Forms.MenuItem()
            Me.MenuItem37 = New System.Windows.Forms.MenuItem()
            Me.MenuItemAbout = New System.Windows.Forms.MenuItem()
            Me.HelpProvider1 = New System.Windows.Forms.HelpProvider()
            Me.mdiClient1 = New System.Windows.Forms.MdiClient()
            Me.SuspendLayout()
            '
            'toolBar1
            '
            Me.toolBar1.Buttons.AddRange(New System.Windows.Forms.ToolBarButton() {Me.NewButton, Me.OpenButton, Me.SaveButton, Me.PreviewButton, Me.PrintButton, Me.HelpButton1})
            Me.toolBar1.DropDownArrows = True
            Me.toolBar1.ImageList = Me.ImageList1
            Me.toolBar1.Name = "toolBar1"
            Me.toolBar1.ShowToolTips = True
            Me.toolBar1.Size = New System.Drawing.Size(588, 25)
            Me.toolBar1.TabIndex = 1
            '
            'NewButton
            '
            Me.NewButton.ImageIndex = 0
            Me.NewButton.ToolTipText = "New"
            '
            'OpenButton
            '
            Me.OpenButton.ImageIndex = 1
            Me.OpenButton.ToolTipText = "Open"
            '
            'SaveButton
            '
            Me.SaveButton.ImageIndex = 2
            Me.SaveButton.ToolTipText = "Save"
            '
            'PreviewButton
            '
            Me.PreviewButton.ImageIndex = 3
            Me.PreviewButton.ToolTipText = "Print Preview"
            '
            'PrintButton
            '
            Me.PrintButton.ImageIndex = 4
            Me.PrintButton.ToolTipText = "Print"
            '
            'HelpButton1
            '
            Me.HelpButton1.ImageIndex = 5
            Me.HelpButton1.ToolTipText = "Help"
            '
            'ImageList1
            '
            Me.ImageList1.ColorDepth = System.Windows.Forms.ColorDepth.Depth8Bit
            Me.ImageList1.ImageSize = New System.Drawing.Size(16, 16)
            Me.ImageList1.ImageStream = CType(resources.GetObject("ImageList1.ImageStream"), System.Windows.Forms.ImageListStreamer)
            Me.ImageList1.TransparentColor = System.Drawing.Color.Transparent
            '
            'MenuItemOpen
            '
            Me.MenuItemOpen.Index = 1
            Me.MenuItemOpen.Text = "Open..."
            '
            'MenuItemNewWindow
            '
            Me.MenuItemNewWindow.Index = 0
            Me.MenuItemNewWindow.Text = "New Window"
            '
            'MenuItemExit
            '
            Me.MenuItemExit.Index = 8
            Me.MenuItemExit.Text = "Exit"
            '
            'MenuItemPrint
            '
            Me.MenuItemPrint.Index = 6
            Me.MenuItemPrint.Text = "Print..."
            '
            'MenuItemClose
            '
            Me.MenuItemClose.Index = 2
            Me.MenuItemClose.Text = "Close"
            '
            'MenuItemCascade
            '
            Me.MenuItemCascade.Index = 1
            Me.MenuItemCascade.Text = "Cascade"
            '
            'MenuItem12
            '
            Me.MenuItem12.Index = 5
            Me.MenuItem12.Text = "-"
            '
            'MenuItemThickLine
            '
            Me.MenuItemThickLine.Index = 0
            Me.MenuItemThickLine.Text = "Thick Line"
            '
            'MenuItemFile
            '
            Me.MenuItemFile.Index = 0
            Me.MenuItemFile.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItemNew, Me.MenuItemOpen, Me.MenuItemClose, Me.MenuItemSave, Me.MenuItemSaveAs, Me.MenuItem12, Me.MenuItemPrint, Me.MenuItemPreview, Me.MenuItemExit})
            Me.MenuItemFile.Text = "File"
            '
            'MenuItemNew
            '
            Me.MenuItemNew.Index = 0
            Me.MenuItemNew.Text = "New"
            '
            'MenuItemSave
            '
            Me.MenuItemSave.Index = 3
            Me.MenuItemSave.Text = "Save"
            '
            'MenuItemSaveAs
            '
            Me.MenuItemSaveAs.Index = 4
            Me.MenuItemSaveAs.Text = "Save As..."
            '
            'MenuItemPreview
            '
            Me.MenuItemPreview.Index = 7
            Me.MenuItemPreview.Text = "Print Preview"
            '
            'statusBar1
            '
            Me.statusBar1.Font = New System.Drawing.Font("Arial", 8.0!)
            Me.statusBar1.Location = New System.Drawing.Point(0, 384)
            Me.statusBar1.Name = "statusBar1"
            Me.statusBar1.Size = New System.Drawing.Size(588, 16)
            Me.statusBar1.TabIndex = 2
            Me.statusBar1.Text = "For Help,  press F1"
            '
            'MenuItemView
            '
            Me.MenuItemView.Index = 3
            Me.MenuItemView.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItemToolbar, Me.MenuItemStatusbar})
            Me.MenuItemView.Text = "View"
            '
            'MenuItemToolbar
            '
            Me.MenuItemToolbar.Checked = True
            Me.MenuItemToolbar.Index = 0
            Me.MenuItemToolbar.Text = "Toolbar"
            '
            'MenuItemStatusbar
            '
            Me.MenuItemStatusbar.Checked = True
            Me.MenuItemStatusbar.Index = 1
            Me.MenuItemStatusbar.Text = "Status Bar"
            '
            'MenuItemClearAll
            '
            Me.MenuItemClearAll.Index = 0
            Me.MenuItemClearAll.Text = "Clear All"
            '
            'PrintDoc
            '
            '
            'MenuItemHelpTopics
            '
            Me.MenuItemHelpTopics.Index = 0
            Me.MenuItemHelpTopics.Text = "Help Topics"
            '
            'MainMenu1
            '
            Me.MainMenu1.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItemFile, Me.MenuItemEdit, Me.MenuItemPen, Me.MenuItemView, Me.MenuItemWindow, Me.MenuItemHelp})
            '
            'MenuItemEdit
            '
            Me.MenuItemEdit.Index = 1
            Me.MenuItemEdit.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItemClearAll})
            Me.MenuItemEdit.Text = "Edit"
            '
            'MenuItemPen
            '
            Me.MenuItemPen.Index = 2
            Me.MenuItemPen.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItemThickLine, Me.MenuItemPenWidths})
            Me.MenuItemPen.Text = "Pen"
            '
            'MenuItemPenWidths
            '
            Me.MenuItemPenWidths.Index = 1
            Me.MenuItemPenWidths.Text = "Pen Widths..."
            '
            'MenuItemWindow
            '
            Me.MenuItemWindow.Index = 4
            Me.MenuItemWindow.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItemNewWindow, Me.MenuItemCascade, Me.MenuItemTile})
            Me.MenuItemWindow.Text = "Window"
            '
            'MenuItemTile
            '
            Me.MenuItemTile.Index = 2
            Me.MenuItemTile.Text = "Tile"
            '
            'MenuItemHelp
            '
            Me.MenuItemHelp.Index = 5
            Me.MenuItemHelp.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItemHelpTopics, Me.MenuItem37, Me.MenuItemAbout})
            Me.MenuItemHelp.Text = "Help"
            '
            'MenuItem37
            '
            Me.MenuItem37.Index = 1
            Me.MenuItem37.Text = "-"
            '
            'MenuItemAbout
            '
            Me.MenuItemAbout.Index = 2
            Me.MenuItemAbout.Text = "About Scribble"
            '
            'HelpProvider1
            '
            Me.HelpProvider1.HelpNamespace = "..\Scribble\help\scribble.chm"
            '
            'mdiClient1
            '
            Me.mdiClient1.Dock = System.Windows.Forms.DockStyle.Fill
            Me.mdiClient1.Location = New System.Drawing.Point(0, 25)
            Me.mdiClient1.Name = "mdiClient1"
            Me.mdiClient1.TabIndex = 0
            '
            'MainWindow
            '
            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.ClientSize = New System.Drawing.Size(588, 400)
            Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.toolBar1, Me.statusBar1, Me.mdiClient1})
            Me.IsMdiContainer = True
            Me.Menu = Me.MainMenu1
            Me.Name = "MainWindow"
            Me.HelpProvider1.SetShowHelp(Me, True)
            Me.Text = "Scribble"
            Me.ResumeLayout(False)

        End Sub 'InitializeComponent
#End Region

        Public Shared Function GetDocumentCount() As Integer
            Return documentCount
        End Function
        Private Sub ToolBar1_ButtonClick(ByVal Sender As System.Object, ByVal e As System.Windows.Forms.ToolBarButtonClickEventArgs) Handles toolBar1.ButtonClick

            If e.Button Is NewButton Then
                NewDoc()
            ElseIf e.Button Is OpenButton Then
                Open()
            ElseIf e.Button Is SaveButton Then
                Save()
            ElseIf e.Button Is PreviewButton Then
                PrintPreview()
            ElseIf e.Button Is PrintButton Then
                Print()
            ElseIf e.Button Is HelpButton1 Then
                ShowHelpTopics()
            End If

        End Sub 'ToolBar1_ButtonClick

        Private Sub AboutHelp()
            MsgBox("Scribble Version 1.0", MsgBoxStyle.OKOnly, "About Scribble")
        End Sub 'AboutHelp

        'Help Topics
        Private Sub ShowHelpTopics()
            Dim filePath As String = Path.Combine(Directory.GetCurrentDirectory(), "..\help\scribble.chm")
            Help.ShowHelp(Me, filePath)
        End Sub 'ShowHelpTopics

        'Print.
        Private Sub Print()
            Try
                PrintDoc.Print()
            Catch e As Exception
                MsgBox(e.Message)
            End Try
        End Sub 'Print

        'PrintPage event handler.
        Private Sub ScribblePrintPage(ByVal Sender As Object, ByVal ev As PrintPageEventArgs) Handles PrintDoc.PrintPage
            Try
                Dim ActiveView As ScribbleView = CType(Me.ActiveMdiChild, ScribbleView)
                If Not ActiveView Is Nothing Then
                    Dim ActiveDoc As ScribbleDoc = ActiveView.GetDocument()

                    Dim i As Integer
                    For i = 0 To ActiveDoc.StrokeList.Count - 1
                        Dim BrushStroke As Stroke = CType(ActiveDoc.StrokeList(i), Stroke)
                        BrushStroke.DrawStroke(ev.Graphics)
                    Next i
                    ev.HasMorePages = False
                End If

            Catch Ex As Exception
                MsgBox(Ex.Message)
            End Try
        End Sub 'ScribblePrintPage

        'PrintPreview
        Private Sub PrintPreview()
            Try
                Dim PrevDialog As New PrintPreviewDialog
                PrevDialog.Document = PrintDoc
                PrevDialog.Size = New System.Drawing.Size(600, 329)
                PrevDialog.ShowDialog()
            Catch Ex As Exception
                MsgBox(Ex.Message)
            End Try
        End Sub 'PrintPreview

        'Exit
        Private Sub ExitApp()
            Dim ChildForm As Form() = Me.MdiChildren
            'Make sure to ask for saving the doc before exiting the app
            Dim i As Integer
            For i = 0 To ChildForm.Length - 1
                ChildForm(i).Close()
            Next i
            Application.Exit()
        End Sub 'Exit

        'Close the View.
        Private Sub CloseView()
            Dim ActiveView As ScribbleView
            If Not Me.ActiveMdiChild Is Nothing Then
                ActiveView = CType(Me.ActiveMdiChild, ScribbleView)
                ActiveView.Close()
            End If
        End Sub 'CloseView

        'Tile
        Private Sub Tile()
            Me.LayoutMdi(MdiLayout.TileHorizontal)
        End Sub 'Tile

        'Cascade
        Private Sub Cascade()
            Me.LayoutMdi(MdiLayout.Cascade)
        End Sub 'Cascade

        'Clear the contents of the active document.
        Private Sub Clear()
            Dim ActiveView As ScribbleView = CType(Me.ActiveMdiChild, ScribbleView)
            If Not (ActiveView Is Nothing) Then
                Dim ActiveDoc As ScribbleDoc = ActiveView.GetDocument()
                ActiveDoc.DeleteContents()
            End If
        End Sub 'Clear

        'Open an existing document.
        Private Sub Open()
            Dim OpenDialog As New OpenFileDialog
            OpenDialog.Filter = "Scribble Files (*.scb)|*.scb|All Files (*.*)|*.*"
            OpenDialog.FileName = ""
            OpenDialog.DefaultExt = ".scb"
            OpenDialog.CheckFileExists = True
            OpenDialog.CheckPathExists = True

            Dim ResultDialog As DialogResult = OpenDialog.ShowDialog()

            If ResultDialog = DialogResult.OK Then
                If Not OpenDialog.FileName.ToLower(Globalization.CultureInfo.InvariantCulture).EndsWith(".scb") Then
                    MsgBox("Unexpected file format", MsgBoxStyle.OKOnly, "Scribble")
                Else
                    Dim NewDoc As ScribbleDoc = CreateDocument()
                    NewDoc.OpenDocument(OpenDialog.FileName)
                End If
                UpdateEnableDisableState()
            End If
        End Sub 'Open

        'Save the document.
        Private Sub Save()
            Dim SelectedView As ScribbleView = CType(Me.ActiveMdiChild, ScribbleView)
            If Not SelectedView Is Nothing Then
                Dim SaveDialog As New SaveFileDialog
                SaveDialog.Filter = "Scribble Files (*.scb)|*.scb|All Files (*.*)|*.*"
                SaveDialog.DefaultExt = ".scb"
                SaveDialog.FileName = "Scribb1.scb"
                Dim ResultDialog As DialogResult = SaveDialog.ShowDialog()

                If ResultDialog = DialogResult.OK Then
                    SelectedView.GetDocument().SaveDocument(SaveDialog.FileName)
                End If
            End If
        End Sub 'Save

        'Open new document.
        Private Sub NewDoc()
            'If this is the first child window, enable the Menu and Toolbar items.
            CreateDocument()
            UpdateEnableDisableState()
        End Sub 'New

        'NewWindow
        Private Sub NewWindow()
            Dim ActiveView As ScribbleView = CType(Me.ActiveMdiChild, ScribbleView)
            If Not ActiveView Is Nothing Then
                Dim NewView As New ScribbleView(ActiveView.GetDocument(), parentWindow)
                NewView.GetDocument().ViewList.Add(NewView)
                NewView.Show()
            End If
        End Sub 'NewWindow

        'Creates a new document.
        Private Function CreateDocument() As ScribbleDoc
            Dim NewDoc As New ScribbleDoc(parentWindow)
            documentCount += 1
            Return NewDoc
        End Function 'CreateDocument

        Private Sub PenWidthsDlg()
            Dim NewForm As New Form

            'Get the document of active view.
            Dim ActiveView As ScribbleView = CType(Me.ActiveMdiChild, ScribbleView)
            Dim ActiveDoc As ScribbleDoc = ActiveView.GetDocument()

            NewForm.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            NewForm.Text = "Pen Widths"

            NewForm.ClientSize = New System.Drawing.Size(352, 125)

            Dim Button1 As New Button
            Button1.Location = New System.Drawing.Point(264, 36)
            Button1.Size = New System.Drawing.Size(75, 23)
            Button1.TabIndex = 1
            Button1.Text = "OK"
            Button1.DialogResult = System.Windows.Forms.DialogResult.OK
            Dim Button2 As New Button
            Button2.Location = New System.Drawing.Point(264, 76)
            Button2.Size = New System.Drawing.Size(75, 23)
            Button2.TabIndex = 6
            Button2.Text = "Cancel"

            Dim TextBox1 As New TextBox
            TextBox1.Location = New System.Drawing.Point(140, 36)
            TextBox1.Text = ActiveDoc.ThinWidth.ToString()
            TextBox1.TabIndex = 1
            TextBox1.Size = New System.Drawing.Size(75, 20)
            TextBox1.AutoSize = True

            Dim TextBox2 As New TextBox
            TextBox2.Location = New System.Drawing.Point(140, 76)
            TextBox2.Text = ActiveDoc.ThickWidth.ToString()
            TextBox2.TabIndex = 2
            TextBox2.Size = New System.Drawing.Size(75, 20)
            TextBox2.AutoSize = True


            Dim Label1 As New Label
            Label1.Location = New System.Drawing.Point(16, 36)
            Label1.Text = "Thin Pen Width:"
            Label1.Size = New System.Drawing.Size(75, 16)
            Label1.TabIndex = 3
            Label1.AutoSize = True

            Dim Label2 As New Label
            Label2.Location = New System.Drawing.Point(16, 76)
            Label2.Text = "Thick Pen Width:"
            Label2.Size = New System.Drawing.Size(75, 16)
            Label2.TabIndex = 4
            Label2.AutoSize = True

            NewForm.FormBorderStyle = FormBorderStyle.FixedDialog
            ' Set the MaximizeBox to false to remove the maximize box.
            NewForm.MaximizeBox = False
            ' Set the MinimizeBox to false to remove the minimize box.
            NewForm.MinimizeBox = False
            ' Set the accept button of the form to button1.
            NewForm.AcceptButton = Button1
            ' Set the cancel button of the form to button2.
            NewForm.CancelButton = Button2

            NewForm.StartPosition = FormStartPosition.CenterScreen

            NewForm.Controls.Add(Button1)
            NewForm.Controls.Add(Button2)
            NewForm.Controls.Add(Label1)
            NewForm.Controls.Add(Label2)
            NewForm.Controls.Add(TextBox1)
            NewForm.Controls.Add(TextBox2)

            Dim ResultDialog As DialogResult = NewForm.ShowDialog()

            If ResultDialog = System.Windows.Forms.DialogResult.OK Then
                Try
                    ActiveDoc.ThinWidth = UInt32.Parse(TextBox1.Text)
                    ActiveDoc.ThickWidth = UInt32.Parse(TextBox2.Text)
                Catch ex As Exception
                    MsgBox(ex.Message, MsgBoxStyle.Critical, "Scribble.vb")
                End Try
                ActiveDoc.ReplacePen()
                NewForm.Close()
            End If
        End Sub 'PenWidthsDlg

        Private Sub ThickPen()
            Dim ActiveView As ScribbleView = CType(Me.ActiveMdiChild, ScribbleView)
            If Not ActiveView Is Nothing Then
                Dim ActiveDoc As ScribbleDoc = ActiveView.GetDocument()
                ActiveDoc.ThickPen = Not ActiveDoc.ThickPen
                ActiveDoc.ReplacePen()
                Me.MenuItemThickLine.Checked = ActiveDoc.ThickPen
            End If
        End Sub 'ThickPen

        Public Sub UpdateEnableDisableState()
            Dim ActiveView As ScribbleView = CType(Me.ActiveMdiChild, ScribbleView)
            If ActiveView Is Nothing Then
                Me.MenuItemEdit.Visible = False
                Me.MenuItemPen.Visible = False
                Me.MenuItemWindow.Visible = False
                Me.MenuItemClose.Visible = False
                Me.MenuItemSave.Visible = False
                Me.MenuItemSaveAs.Visible = False
                Me.MenuItemPrint.Visible = False
                Me.MenuItemPreview.Visible = False
                Me.SaveButton.Enabled = False
                Me.PreviewButton.Enabled = False
                Me.PrintButton.Enabled = False
            Else
                Me.MenuItemEdit.Visible = True
                Me.MenuItemPen.Visible = True
                Me.MenuItemWindow.Visible = True
                Me.MenuItemClose.Visible = True
                Me.MenuItemSave.Visible = True
                Me.MenuItemSaveAs.Visible = True
                Me.MenuItemPrint.Visible = True
                Me.MenuItemPreview.Visible = True
                Me.SaveButton.Enabled = True
                Me.PreviewButton.Enabled = True
                Me.PrintButton.Enabled = True
            End If

        End Sub
        'App closing handler.
        Private Sub ClosingMainAppHander(ByVal Sender As [Object], ByVal e As CancelEventArgs) 'Handles MyBase.ClosingMainAppHander
            Me.ExitApp()
        End Sub 'ClosingMainAppHander

        Private Sub MenuItemNew_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItemNew.Click
            NewDoc()
        End Sub

        Private Sub MenuItemOpen_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItemOpen.Click
            Open()
        End Sub

        Private Sub MenuItemClose_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItemClose.Click
            CloseView()
        End Sub

        Private Sub MenuItemSave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItemSave.Click
            Save()
        End Sub

        Private Sub MenuItemSaveAs_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItemSaveAs.Click
            Save()
        End Sub

        Private Sub MenuItemPrint_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItemPrint.Click
            Print()
        End Sub

        Private Sub MenuItemPreview_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItemPreview.Click
            PrintPreview()
        End Sub

        Private Sub MenuItemExit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItemExit.Click
            ExitApp()
        End Sub

        Private Sub MenuItemClearAll_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItemClearAll.Click
            Clear()
        End Sub

        Private Sub MenuItemThickLine_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItemThickLine.Click
            ThickPen()
        End Sub

        Private Sub MenuItemPenWidths_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItemPenWidths.Click
            PenWidthsDlg()
        End Sub

        Private Sub MenuItemToolbar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItemToolbar.Click
            If MenuItemToolbar.Checked = True Then
                MenuItemToolbar.Checked = False
                toolBar1.Visible = False
            Else
                MenuItemToolbar.Checked = True
                toolBar1.Visible = True
            End If
        End Sub

        Private Sub MenuItemStatusbar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItemStatusbar.Click
            If MenuItemStatusbar.Checked = True Then
                MenuItemStatusbar.Checked = False
                statusBar1.Visible = False
            Else
                MenuItemStatusbar.Checked = True
                statusBar1.Visible = True
            End If
        End Sub

        Private Sub MenuItemNewWindow_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItemNewWindow.Click
            NewWindow()
        End Sub

        Private Sub MenuItemCascade_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItemCascade.Click
            Cascade()
        End Sub

        Private Sub MenuItemTile_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItemTile.Click
            Tile()
        End Sub

        Private Sub MenuItemHelpTopics_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItemHelpTopics.Click
            ShowHelpTopics()
        End Sub

        Private Sub MenuItemAbout_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItemAbout.Click
            AboutHelp()
        End Sub
    End Class 'MainWindow

End Namespace 'Scribble