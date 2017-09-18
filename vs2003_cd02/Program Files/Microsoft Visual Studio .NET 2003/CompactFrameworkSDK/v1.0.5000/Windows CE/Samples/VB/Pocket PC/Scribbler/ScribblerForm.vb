'=====================================================================
'  File:      ScribblerForm.vb
'
'
'  ---------------------------------------------------------------------
'   Copyright (C) Microsoft Corporation.  All rights reserved.
'
'  This source code is intended only as a supplement to Microsoft
'  Development Tools and/or on-line documentation.  See these other
'  materials for detailed information regarding Microsoft code samples.
'
'  THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
'  KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
'  IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
'  PARTICULAR PURPOSE.
'=====================================================================

Public Class ScribblerForm
    Inherits System.Windows.Forms.Form
    Friend WithEvents pGreen As System.Windows.Forms.Panel
    Friend WithEvents pBlue As System.Windows.Forms.Panel
    Friend WithEvents pTomato As System.Windows.Forms.Panel
    Friend WithEvents pTray As System.Windows.Forms.Panel
    Friend WithEvents pBlack As System.Windows.Forms.Panel
    Friend WithEvents bClear As System.Windows.Forms.Button
    Friend WithEvents pDrawWindow As System.Windows.Forms.Panel
    Friend WithEvents pMagenta As System.Windows.Forms.Panel
    Friend WithEvents pYellow As System.Windows.Forms.Panel
    Friend WithEvents pRed As System.Windows.Forms.Panel

    Private graphics As graphics
    Private bitmap As bitmap
    Private hasCapture As Boolean
    Private oldX, oldY As Integer
    Private currentColorPanel As Panel

#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()
        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call

        ' Create offscreen drawing surface
        Me.bitmap = New Bitmap(Me.pDrawWindow.Size.Width, Me.pDrawWindow.Size.Height)
        Me.graphics = graphics.FromImage(Me.bitmap)
        Me.graphics.FillRectangle(New SolidBrush(Color.White), 0, 0, Me.Size.Width, Me.Size.Height)

        ' Make the black the default color
        Me.currentColorPanel = Me.pBlack
    End Sub

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        MyBase.Dispose(disposing)
    End Sub

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Private Sub InitializeComponent()
        Me.pGreen = New System.Windows.Forms.Panel
        Me.pBlue = New System.Windows.Forms.Panel
        Me.pTomato = New System.Windows.Forms.Panel
        Me.pTray = New System.Windows.Forms.Panel
        Me.pBlack = New System.Windows.Forms.Panel
        Me.bClear = New System.Windows.Forms.Button
        Me.pDrawWindow = New System.Windows.Forms.Panel
        Me.pMagenta = New System.Windows.Forms.Panel
        Me.pYellow = New System.Windows.Forms.Panel
        Me.pRed = New System.Windows.Forms.Panel
        '
        'pGreen
        '
        Me.pGreen.BackColor = System.Drawing.Color.Green
        Me.pGreen.Location = New System.Drawing.Point(167, 4)
        Me.pGreen.Size = New System.Drawing.Size(22, 18)
        '
        'pBlue
        '
        Me.pBlue.BackColor = System.Drawing.Color.Blue
        Me.pBlue.Location = New System.Drawing.Point(140, 4)
        Me.pBlue.Size = New System.Drawing.Size(22, 18)
        '
        'pTomato
        '
        Me.pTomato.BackColor = System.Drawing.Color.Tomato
        Me.pTomato.Location = New System.Drawing.Point(59, 4)
        Me.pTomato.Size = New System.Drawing.Size(22, 18)
        '
        'pTray
        '
        Me.pTray.BackColor = System.Drawing.Color.SlateGray
        Me.pTray.Controls.Add(Me.pBlack)
        Me.pTray.Controls.Add(Me.bClear)
        Me.pTray.Location = New System.Drawing.Point(0, -1)
        Me.pTray.Size = New System.Drawing.Size(240, 28)
        '
        'pBlack
        '
        Me.pBlack.BackColor = System.Drawing.Color.Black
        Me.pBlack.Location = New System.Drawing.Point(3, 3)
        Me.pBlack.Size = New System.Drawing.Size(26, 22)
        '
        'bClear
        '
        Me.bClear.Location = New System.Drawing.Point(192, 4)
        Me.bClear.Size = New System.Drawing.Size(40, 18)
        Me.bClear.Text = "clear"
        '
        'pDrawWindow
        '
        Me.pDrawWindow.Location = New System.Drawing.Point(0, 27)
        Me.pDrawWindow.Size = New System.Drawing.Size(240, 268)
        '
        'pMagenta
        '
        Me.pMagenta.BackColor = System.Drawing.Color.Magenta
        Me.pMagenta.Location = New System.Drawing.Point(113, 4)
        Me.pMagenta.Size = New System.Drawing.Size(22, 18)
        '
        'pYellow
        '
        Me.pYellow.BackColor = System.Drawing.Color.Yellow
        Me.pYellow.Location = New System.Drawing.Point(86, 4)
        Me.pYellow.Size = New System.Drawing.Size(22, 18)
        '
        'pRed
        '
        Me.pRed.BackColor = System.Drawing.Color.Red
        Me.pRed.Location = New System.Drawing.Point(32, 4)
        Me.pRed.Size = New System.Drawing.Size(22, 18)
        '
        'ScribblerForm
        '
        Me.ClientSize = New System.Drawing.Size(240, 295)
        Me.Controls.Add(Me.pGreen)
        Me.Controls.Add(Me.pBlue)
        Me.Controls.Add(Me.pTomato)
        Me.Controls.Add(Me.pMagenta)
        Me.Controls.Add(Me.pYellow)
        Me.Controls.Add(Me.pRed)
        Me.Controls.Add(Me.pTray)
        Me.Controls.Add(Me.pDrawWindow)
        Me.Text = "Scribbler"

    End Sub

    Public Shared Sub Main()
        Application.Run(New ScribblerForm())
    End Sub

#End Region

    Private Sub bClear_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles bClear.Click
        Me.graphics.FillRectangle(New SolidBrush(Color.White), 0, 0, Me.pDrawWindow.Size.Width, Me.pDrawWindow.Size.Height)
        Me.pDrawWindow.Invalidate()
    End Sub

    Private Sub pDrawWindow_Paint(ByVal sender As System.Object, ByVal e As PaintEventArgs) Handles pDrawWindow.Paint
        e.Graphics.DrawImage(Me.bitmap, 0, 0)
    End Sub

    Private Sub pDrawWindow_MouseDown(ByVal sender As System.Object, ByVal e As MouseEventArgs) Handles pDrawWindow.MouseDown
        Me.hasCapture = True
        Me.oldX = e.X
        Me.oldY = e.Y
    End Sub

    Private Sub pDrawWindow_MouseMove(ByVal sender As Object, ByVal e As MouseEventArgs) Handles pDrawWindow.MouseMove
        Dim x, y As Integer
        If Me.hasCapture Then
            x = e.X
            y = e.Y

            ' Draw line from last hit point to current hit point
            Me.graphics.DrawLine(New Pen(Me.currentColorPanel.BackColor), Me.oldX, Me.oldY, x, y)
            Me.pDrawWindow.Invalidate(New Rectangle(Math.Min(x, Me.oldX), Math.Min(y, Me.oldY), Math.Abs(Me.oldX - x) + 1, Math.Abs(Me.oldY - y) + 1))
            Me.oldX = x
            Me.oldY = y
        End If
    End Sub

    Private Sub pDrawWindow_MouseUp(ByVal sender As Object, ByVal e As MouseEventArgs) Handles pDrawWindow.MouseUp
        Me.hasCapture = False
    End Sub

    Private Sub colorPanel_Click(ByVal sender As Object, ByVal e As EventArgs) Handles pBlack.Click, pBlue.Click, pGreen.Click, pMagenta.Click, pRed.Click, pTomato.Click, pYellow.Click
        ' deselect the current color panel
        Me.currentColorPanel.Location = New System.Drawing.Point(Me.currentColorPanel.Location.X + 2, Me.currentColorPanel.Location.Y + 2)
        Me.currentColorPanel.Size = New System.Drawing.Size(22, 18)

        ' select the panel that was clicked on
        Dim selectedPanel As Panel = CType(sender, Panel)
        selectedPanel.Location = New System.Drawing.Point(selectedPanel.Location.X - 2, selectedPanel.Location.Y - 2)
        selectedPanel.Size = New System.Drawing.Size(26, 22)
        Me.currentColorPanel = selectedPanel
    End Sub

End Class
