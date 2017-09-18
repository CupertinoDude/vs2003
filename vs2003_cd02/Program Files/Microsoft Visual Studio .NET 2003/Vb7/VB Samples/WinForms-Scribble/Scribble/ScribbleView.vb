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
Imports System.Collections
Imports System.ComponentModel
Imports System.Windows.Forms

Namespace Scribble

    Public Class ScribbleView
        Inherits System.Windows.Forms.Form

        Private MainDoc As ScribbleDoc
        Private MainWin As MainWindow
        Private PreviousPoint As Point ' The last mouse pt in the stroke in progress.
        Private CurrentStroke As Stroke

#Region " Windows Form Designer generated code "
        Private Components As System.ComponentModel.Container

        ' the stroke in progress
        Public Sub New(ByVal Doc As ScribbleDoc, ByVal Parent As MainWindow)
            InitializeComponent()
            Me.MainDoc = Doc
            Me.MdiParent = Parent 'Make this view Mdi child of the main window
            MainWin = Parent
            Me.Text = "ScribbleDoc" + Doc.DocID.ToString() + ":" + Doc.ViewList.Count.ToString()
        End Sub 'New

        'Form overrides dispose to clean up the component list.
        Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
            If disposing Then
                If Not (Components Is Nothing) Then
                    Components.Dispose()
                End If
            End If
            MyBase.Dispose(disposing)
        End Sub

        Private Sub InitializeComponent()
            '
            'ScribbleView
            '
            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.BackColor = System.Drawing.Color.White
            Me.ClientSize = New System.Drawing.Size(312, 301)
            Me.Name = "ScribbleView"
            Me.Text = "ScribbleDoc"

        End Sub 'InitializeComponent
#End Region


        Private Sub MouseDownHandler(ByVal Sender As System.Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles MyBase.MouseDown
            Try
                Dim NewPoint As New Point(e.X, e.Y)
                CurrentStroke = MainDoc.NewStroke()
                CurrentStroke.PointArray.Add(NewPoint) ' Add first point to the new stroke.
                PreviousPoint = NewPoint
            Catch Ex As Exception
                MsgBox(Ex.Message)
            End Try
        End Sub 'MouseDownHandler

        Private Sub MouseMoveHandler(ByVal Sender As System.Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles MyBase.MouseMove
            If Not Me.Capture Then
                Return
            End If

            Try
                Dim NewPoint As New Point(e.X, e.Y)
                CurrentStroke.PointArray.Add(NewPoint)
                Dim NewGraphic As Graphics = Me.CreateGraphics()
                NewGraphic.DrawLine(MainDoc.GetCurrentPen(), PreviousPoint, NewPoint)
                PreviousPoint = NewPoint
                NewGraphic.Dispose()
            Catch Ex As Exception
                MsgBox(Ex.Message)
            End Try
        End Sub 'MouseMoveHandler

        Private Sub MouseUpHandler(ByVal Sender As System.Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles MyBase.MouseUp
            'If the current stroke is null, ignore this event.
            If CurrentStroke Is Nothing Then
                Return
            End If
            Try
                Dim NewPoint As New Point(e.X, e.Y)
                CurrentStroke.PointArray.Add(NewPoint)
                Dim NewGraphic As Graphics = Me.CreateGraphics()
                NewGraphic.DrawLine(MainDoc.GetCurrentPen(), PreviousPoint, NewPoint)

                PreviousPoint = NewPoint
                ' Tell the stroke item that we're done adding points to it.
                ' This is so it can finish computing its bounding rectangle.
                CurrentStroke.FinishStroke()

                ' Now that a stoke is added, inform all the views of the document about this.
                MainDoc.UpdateAllViews(Me, CurrentStroke)

                NewGraphic.Dispose()
            Catch Ex As Exception
                MsgBox(Ex.Message)
            End Try
        End Sub 'MouseUpHandler

        Private Sub PaintHandler(ByVal Sender As System.Object, ByVal e As System.Windows.Forms.PaintEventArgs) Handles MyBase.Paint
            Dim RectClip As Rectangle = e.ClipRectangle
            RectClip.Inflate(1, 1)
            Dim RectStroke As Rectangle

            Dim i As Integer
            For i = 0 To MainDoc.StrokeList.Count - 1
                Dim St As Stroke = CType(MainDoc.StrokeList(i), Stroke)
                RectStroke = St.GetBoundingRectangle()
                RectStroke.Inflate(1, 1) ' Avoid rounding to nothing.
                If RectStroke.IntersectsWith(RectClip) Then
                    St.DrawStroke(e.Graphics)
                End If
            Next i
        End Sub 'PaintHandler

        Private Sub ClosingHandler(ByVal Sender As [Object], ByVal e As CancelEventArgs) Handles MyBase.Closing
            If MainDoc.IsDirty And MainDoc.ViewList.Count = 1 Then
                Dim Save As DialogResult = MsgBox("Do you want to Save changes ?", MessageBoxButtons.YesNoCancel, "Scribble")
                If Save = DialogResult.Yes Then
                    Dim SaveDialog As New SaveFileDialog
                    SaveDialog.Filter = "Scribble Files (*.scb)|*.scb|All Files (*.*)|*.*"
                    SaveDialog.DefaultExt = ".scb"
                    Dim ResultDialog As DialogResult = SaveDialog.ShowDialog()

                    If ResultDialog = DialogResult.OK Then
                        MainDoc.SaveDocument(SaveDialog.FileName)
                        MainDoc.ViewList.Remove(Me)
                        Me.MdiParent = Nothing ' Remove this view(child) from the parent list.
                    Else
                        If ResultDialog = DialogResult.Cancel Then
                            e.Cancel = True
                        End If
                    End If
                Else
                    If Save = DialogResult.Cancel Then
                        e.Cancel = True 'If user selected 'Cancel',don't close the form.
                    Else
                        If Save = DialogResult.No Then
                            MainDoc.ViewList.Remove(Me)
                            Me.MdiParent = Nothing
                        End If
                    End If
                End If
            Else
                MainDoc.ViewList.Remove(Me)
                Me.MdiParent = Nothing
            End If
        End Sub 'ClosingHandler

        Private Sub ClosedHandler(ByVal Sender As [Object], ByVal e As EventArgs) Handles MyBase.Closed
            'If there are no child views, then disable menu and toolbar items.
            If MainWin.MdiChildren.Length = 0 Then
                MainWin.UpdateEnableDisableState()
            End If
        End Sub 'ClosedHandler

        Public Function GetDocument() As ScribbleDoc
            Return MainDoc
        End Function 'GetDocument

    End Class 'ScribbleView 

End Namespace 'Scribble