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
Imports System.Drawing.Drawing2D
Imports System.Drawing.Text
Imports System.Reflection
Imports System.Windows.Forms

Namespace Microsoft.Samples.WinForms.Vb.OwnerDrawListBox

    'This sample control demonstrates various properties and
    'methods for the ListBox control.

    Public Class OwnerDrawListBox
        Inherits System.Windows.Forms.Form

        'Used to paint the list box
        Private listBoxBrushes() As Brush
        Private listBoxHeights() As Integer = {50, 25, 33, 15}
        Private sansSerifFontFamily As FontFamily

        'Public Constructor
        Public Sub New()
            MyBase.New()

            sansSerifFontFamily = new FontFamily (GenericFontFamilies.SansSerif)

            ' This call is required for support of the Windows Forms Form Designer.
            InitializeComponent()

            OwnerDrawListBox = Me

            'Set up the brushes we are going to use

            'Load the image to be used for the background from the exe's resource fork
            Dim backgroundImage As Image = New Bitmap([Assembly].GetExecutingAssembly().GetManifestResourceStream("colorbars.jpg"))
            'Now create the brush we are going to use to paint the background
            Dim backgroundBrush As Brush = New TextureBrush(backgroundImage)
            Dim r As Rectangle
            r = New Rectangle(0, 0, listBox1.Width, 100)
            Dim lb As New LinearGradientBrush(r, Color.Red, Color.Yellow, LinearGradientMode.Horizontal)

            listBoxBrushes = New Brush() {backgroundBrush, Brushes.LemonChiffon, lb, Brushes.PeachPuff}
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
        Private components As System.ComponentModel.IContainer
        Private WithEvents listBox1 As System.Windows.Forms.ListBox

        Private WithEvents OwnerDrawListBox As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.listBox1 = New System.Windows.Forms.ListBox()
            Me.listBox1.ColumnWidth = 144
            Me.listBox1.ForeColor = SystemColors.WindowText
            Me.listBox1.IntegralHeight = False
            Me.listBox1.Items.AddRange(New Object() {"First", "Second", "Third", "Fourth"})
            Me.listBox1.Location = New System.Drawing.Point(8, 24)
            Me.listBox1.Size = New System.Drawing.Size(232, 200)
            Me.listBox1.TabIndex = 0
            AddHandler Me.listBox1.DrawItem, AddressOf Me.listBox1_DrawItem
            AddHandler Me.listBox1.MeasureItem, AddressOf Me.listBox1_MeasureItem
            Me.listBox1.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawVariable
            Me.AutoScale = False
            Me.ClientSize = New System.Drawing.Size(248, 248)
            Me.Font = New System.Drawing.Font(sansSerifFontFamily, 12)
            Me.Text = "ListBox"
            Me.Controls.AddRange(New System.Windows.Forms.Control() {listbox1})
        End Sub

#End Region

        Private Sub listBox1_DrawItem(ByVal sender As Object, ByVal e As DrawItemEventArgs)
            Dim brush As Brush
            Dim selected As Boolean
            Dim displayText As String

            ' The following method should generally be called before drawing.
            ' It is actually superfluous here, since the subsequent drawing
            ' will completely cover the area of interest.
            e.DrawBackground()

            'The system provides the context
            'into which the owner custom-draws the required graphics.
            'The context into which to draw is e.graphics.
            'The index of the item to be painted is e.Index.
            'The painting should be done into the area described by e.Bounds.
            brush = listBoxBrushes(e.Index)
            e.Graphics.FillRectangle(brush, e.Bounds)
            e.Graphics.DrawRectangle(SystemPens.WindowText, e.Bounds)

            If (e.State And DrawItemState.Selected) = DrawItemState.Selected Then
                selected = True
            Else
                selected = False
            End If

            displayText = "ITEM #" & e.Index

            If (selected) Then
                displayText &= " SELECTED"
            End If

            e.Graphics.DrawString(displayText, Me.Font, Brushes.Black, e.Bounds.X, e.Bounds.Y)

            e.DrawFocusRectangle()
        End Sub


        'Return the height of the item to be drawn
        Private Sub listBox1_MeasureItem(ByVal sender As Object, ByVal e As MeasureItemEventArgs)
            Dim displayText As String
            Dim stringSize As SizeF

            'Work out what the text will be
            displayText = "ITEM #" & e.Index

            'Get width & height of string
            stringSize = e.Graphics.MeasureString(displayText, Me.Font)

            'Account for top margin
            stringSize.Height += 6

            If listBoxHeights(e.Index) > stringSize.Height Then
                'Now set height to taller of default and text height
                e.ItemHeight = listBoxHeights(e.Index)
            Else
                e.ItemHeight = CInt(stringSize.Height)
            End If
        End Sub

        ' The main entry point for the application.
        Public Shared Sub Main()
            System.Threading.Thread.CurrentThread.ApartmentState = System.Threading.ApartmentState.STA
            Application.Run(New OwnerDrawListBox())
        End Sub

    End Class

End Namespace
