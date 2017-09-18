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
Imports System.Diagnostics

Public Class ChangeToolTips
    Inherits System.Windows.Forms.Form
    Private toolTips() As String

    Public Sub New(ByVal smlImageList As ImageList, ByVal toolTips() As String)
        MyBase.New()
        ChangeToolTips = Me

        'This call is required by the Windows Forms Designer.
        InitializeComponent()

        Me.imgList = smlImageList
        Me.toolTips = toolTips
        listView1.SmallImageList = smlImageList
        SetToolTipRows()
    End Sub

    Private Sub SetToolTipRows()
        Debug.Assert(imgList.Images.Count = toolTips.Length, _
            "Incorrect number of images or tooltips")

        listView1.Columns.Add("ToolTip Text", listView1.Size.Width - 5, _
            HorizontalAlignment.Left)
        Dim i As Integer
        For i = 0 To toolTips.Length - 1
            Dim item As New ListViewItem(toolTips(i), i)
            listView1.Items.Add(item)
        Next i
    End Sub

    Public Overridable Function GetToolTips() As String()
        Return toolTips
    End Function

    Private Sub ListView1_afterLabelEdit(ByVal [source] As System.Object, _
        ByVal e As System.Windows.Forms.LabelEditEventArgs) _
        Handles listView1.AfterLabelEdit
        If e.Label Is Nothing Then
            e.CancelEdit = True
            Return
        End If
        toolTips(e.Item) = e.Label
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

    Private components As System.ComponentModel.IContainer


#Region " Windows Form Designer generated code "

    'Required by the Windows Form Designer
    Protected WithEvents btnOk As System.Windows.Forms.Button
    Protected WithEvents listView1 As System.Windows.Forms.ListView
    Protected WithEvents label1 As System.Windows.Forms.Label
    Protected WithEvents imgList As System.Windows.Forms.ImageList

    Private WithEvents ChangeToolTips As System.Windows.Forms.Form

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.
    'Do not modify it using the code editor.
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Me.btnOk = New System.Windows.Forms.Button
        Me.listView1 = New System.Windows.Forms.ListView
        Me.label1 = New System.Windows.Forms.Label
        Me.imgList = New System.Windows.Forms.ImageList(Me.components)
        Me.SuspendLayout()

        '
        'btnOk
        '
        Me.btnOk.DialogResult = System.Windows.Forms.DialogResult.OK
        Me.btnOk.Location = New System.Drawing.Point(16, 272)
        Me.btnOk.Name = "btnOk"
        Me.btnOk.TabIndex = 1
        Me.btnOk.Text = "&Ok"

        '
        'listView1
        '
        Me.listView1.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable
        Me.listView1.LabelEdit = True
        Me.listView1.Location = New System.Drawing.Point(16, 48)
        Me.listView1.MultiSelect = False
        Me.listView1.Name = "listView1"
        Me.listView1.Size = New System.Drawing.Size(272, 192)
        Me.listView1.TabIndex = 0
        Me.listView1.Text = "listView1"
        Me.listView1.View = System.Windows.Forms.View.Details

        '
        'label1
        '
        Me.label1.Location = New System.Drawing.Point(16, 8)
        Me.label1.Name = "label1"
        Me.label1.Size = New System.Drawing.Size(272, 24)
        Me.label1.TabIndex = 3
        Me.label1.Text = "To change the text for a tooltip, click on a selected label."

        '
        'imgList
        '
        Me.imgList.ColorDepth = System.Windows.Forms.ColorDepth.Depth8Bit
        Me.imgList.ImageSize = New System.Drawing.Size(16, 16)
        Me.imgList.TransparentColor = System.Drawing.Color.Transparent

        '
        'ChangeToolTips
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(302, 302)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.label1, _
            Me.listView1, Me.btnOk})
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "ChangeToolTips"
        Me.ShowInTaskbar = False
        Me.Text = "ChangeToolTips"
        Me.ResumeLayout(False)
    End Sub
#End Region

End Class

