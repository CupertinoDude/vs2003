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
Imports System.Collections
Imports System.Drawing
Imports System.Runtime.Serialization
Imports System.Runtime.Serialization.Formatters.Binary
Imports System.Windows.Forms

Namespace Scribble
    ' Class Stroke.
    ' A stroke is a series of connected points in the scribble drawing.
    ' A scribble document may have multiple strokes.
    ' Mark this class with Serializable attribute because this needs to be serialized to disk.
    <Serializable()> Public Class Stroke
        Private penWidth As Single ' One pen width applies to entire stroke.
        Private pointArrayList As New ArrayList   ' Series of connected points.
        Private boundingRect As Rectangle
        'Smallest rect that surrounds all of the points in the stroke.
        Public Sub New(ByVal PenSize As Single)
            penWidth = PenSize
        End Sub 'New

        Public ReadOnly Property PointArray() As ArrayList
            Get
                Return pointArrayList
            End Get
        End Property

        Public Function GetBoundingRectangle() As Rectangle
            Return boundingRect
        End Function 'GetBoundingRectangle

        Public Sub FinishStroke()
            ' Calculate the bounding rectangle.  It's needed for smart repainting.
            If pointArrayList.Count = 0 Then
                boundingRect.Size = Size.Empty
                Return
            End If
            Dim NewPoint As Point = CType(pointArrayList(0), Point)
            boundingRect = New Rectangle(NewPoint.X, NewPoint.Y, 0, 0)

            Dim i As Integer
            For i = 1 To pointArrayList.Count - 1
                ' If the point lies outside of the accumulated bounding
                ' rectangle, then inflate the bounding rect to include it.
                NewPoint = CType(pointArrayList(i), Point)
                boundingRect = Rectangle.FromLTRB(Min(boundingRect.Left, NewPoint.X), Min(boundingRect.Top, NewPoint.Y), Max(boundingRect.Right, NewPoint.X), Max(boundingRect.Bottom, NewPoint.Y))
            Next i

            ' Add the pen width to the bounding rectangle.  This is necessary
            ' to account for the width of the stroke when invalidating
            ' the screen.
            boundingRect.Inflate(New Size(CInt(penWidth), CInt(penWidth)))
            Return
        End Sub 'FinishStroke

        Public Sub DrawStroke(ByVal NewGraphic As Graphics)
            Dim MyPen As New Pen(Color.Black, penWidth)
            Try
                Dim i As Integer
                For i = 1 To pointArrayList.Count - 1
                    NewGraphic.DrawLine(MyPen, CType(pointArrayList((i - 1)), Point), CType(pointArrayList(i), Point))
                Next i
            Catch Ex As Exception
                MsgBox(Ex.Message)
            Finally
                MyPen.Dispose()
            End Try
        End Sub 'DrawStroke

        Public Function Min(ByVal x As Integer, ByVal y As Integer) As Integer
            If x < y Then
                Return x
            Else
                Return y
            End If
        End Function 'Min

        Public Function Max(ByVal x As Integer, ByVal y As Integer) As Integer
            If x > y Then
                Return x
            Else
                Return y
            End If
        End Function 'Max
    End Class 'Stroke

    Public Class ScribbleDoc
        ' The document keeps track of the current pen width on
        ' behalf of all views. We'd like the user interface of
        ' Scribble to be such that if the user chooses the Draw
        ' Thick Line command, it will apply to all views, not just
        ' the view that currently has the focus.
        Public ThickPen As Boolean ' TRUE if current pen is thick
        Protected PenWidth As System.UInt32 ' Current user-selected pen width.
        Public ThinWidth As System.UInt32
        Public ThickWidth As System.UInt32
        Public DocID As Integer ' ID to display it on the view
        Protected CurrentPen As Pen ' Pen created according to user-selected pen style (width).
        Public StrokeList As New ArrayList
        Public ViewList As New ArrayList
        Public IsDirty As Boolean

        Public Sub New(ByVal MainWin As MainWindow)
            IsDirty = False
            ThickPen = False
            ThinWidth = Convert.ToUInt32(2)
            ThickWidth = Convert.ToUInt32(5)
            ReplacePen()

            'Set the ID to be the current count + 1. This is so that the ID starts with 1.
            DocID = MainWindow.GetDocumentCount() + 1
            'Create a view (Form) for this document.
            Dim View As New ScribbleView(Me, MainWin)
            ViewList.Add(View)
            View.Show()
        End Sub 'New

        Public Function NewStroke() As Stroke
            Dim s As New Stroke(Convert.ToSingle(PenWidth))
            StrokeList.Add(s)
            IsDirty = True 'Now that the doc is modified, set the dirty flag.
            Return s
        End Function 'NewStroke

        Public Sub ReplacePen()
            If ThickPen = True Then
                PenWidth = ThickWidth
            Else
                PenWidth = ThinWidth
            End If
            CurrentPen = New Pen(Color.Black, Convert.ToSingle(PenWidth))
        End Sub 'ReplacePen

        'Save the document.
        Public Sub SaveDocument(ByVal FileName As String)
            Dim FileStream As Stream
            Try
                FileStream = File.Open(FileName, FileMode.Create)
                Dim FileFormatter As New BinaryFormatter
                FileFormatter.Serialize(FileStream, StrokeList)
                'Now that the doc is saved, its no more dirty.
                IsDirty = False
            Catch Ex As Exception
                MsgBox(Ex.Message)
            Finally
                If Not FileStream Is Nothing Then
                    FileStream.Close()
                End If
            End Try
        End Sub 'SaveDocument

        'Open the document.
        Public Sub OpenDocument(ByVal FileName As String)
            Dim FileStream As Stream
            Try
                FileStream = File.Open(FileName, FileMode.Open)
                Dim FileFormatter As New BinaryFormatter
                StrokeList = CType(FileFormatter.Deserialize(FileStream), ArrayList)
            Catch Ex As Exception
                MsgBox(Ex.Message)
            Finally
                If Not FileStream Is Nothing Then
                    FileStream.Close()
                End If
            End Try
        End Sub 'OpenDocument

        Public Function GetCurrentPen() As Pen
            Return CurrentPen
        End Function 'GetCurrentPen

        'Updates all the views of the document with the new data.
        Public Sub UpdateAllViews(ByVal Sender As ScribbleView, ByVal NewStroke As Stroke)
            Dim View As ScribbleView

            Dim i As Integer
            For i = 0 To ViewList.Count - 1
                View = CType(ViewList(i), ScribbleView)

                If Not View.Equals(Sender) Then
                    'If this is for a new stroke.
                    If Not (NewStroke Is Nothing) Then
                        View.Invalidate(NewStroke.GetBoundingRectangle())
                    Else
                        'Must be ClearAll,hence invalidate the entire region.
                        View.Invalidate()
                    End If
                    View.Update()
                End If
            Next i
        End Sub 'UpdateAllViews

        ' Deletes the contents of the document.
        Public Sub DeleteContents()

            StrokeList.Clear()
            UpdateAllViews(Nothing, Nothing)

        End Sub 'DeleteContents

    End Class 'ScribbleDoc 

End Namespace 'Scribble