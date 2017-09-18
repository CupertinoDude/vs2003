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
Imports System.ComponentModel.Design
Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.Drawing.Design
Imports System.Windows.Forms
Imports System.Diagnostics

Namespace Microsoft.Samples.WinForms.VB.FlashTrackBar

    Public Class FlashTrackBar
        Inherits System.Windows.Forms.Control

        Private LeftRightBorder As Integer = 10
        Private myValue As Integer = 0
        Private myMin As Integer = 0
        Private myMax As Integer = 100
        Private myShowPercentage As Boolean = False
        Private myShowValue As Boolean = False
        Private myAllowUserEdit As Boolean = True
        Private myShowGradient As Boolean = True
        Private dragValue As Integer = 0
        Private dragging As Boolean = False
        Private myStartColor As Color = Color.Red
        Private myEndColor As Color = Color.LimeGreen
        Private baseBackground As Brush
        Private backgroundDim As Brush
        Private myDarkenBy As Byte = 200

        Public Sub New()

            MyBase.New()

            'This call is required by the Windows Forms Designer.
            InitializeComponent()

            SetStyle(ControlStyles.Opaque, True)
            SetStyle(ControlStyles.ResizeRedraw, True)
            Debug.Assert(GetStyle(ControlStyles.ResizeRedraw), "Should be redraw!")
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

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.ForeColor = System.Drawing.Color.White
            Me.BackColor = System.Drawing.Color.Black
            Me.Size = New System.Drawing.Size(100, 23)
            Me.Text = "FlashTrackBar"
        End Sub

#End Region


        <Category("Flash"), DefaultValue(True)> Public Property AllowUserEdit() As Boolean
            Get
                Return myAllowUserEdit
            End Get

            Set(ByVal Value As Boolean)
                If (Value <> myAllowUserEdit) Then
                    myAllowUserEdit = Value
                    If Not (myAllowUserEdit) Then
                        Capture = False
                        dragging = False
                    End If
                End If
            End Set

        End Property


        <Category("Flash")> Public Property EndColor() As Color
            Get
                Return myEndColor
            End Get

            Set(ByVal Value As Color)
                myEndColor = Value
                If (Not (baseBackground Is Nothing) And myShowGradient) Then
                    baseBackground.Dispose()
                    baseBackground = Nothing
                End If
                Invalidate()
            End Set
        End Property


        Public Function ShouldPersistEndColor() As Boolean
            Return Not (myEndColor.Equals(Color.LimeGreen))
        End Function


        <Category("Flash"), _
            Editor(GetType(FlashTrackBarDarkenByEditor), GetType(UITypeEditor)), _
            DefaultValue(200)> _
        Public Property DarkenBy() As Byte
            Get
                Return myDarkenBy
            End Get
            Set(ByVal Value As Byte)
                If (Value <> myDarkenBy) Then
                    myDarkenBy = Value
                    If Not (backgroundDim Is Nothing) Then
                        backgroundDim.Dispose()
                        backgroundDim = Nothing
                    End If
                    OptimizedInvalidate(Value, Max)
                End If
            End Set
        End Property

        <Category("Flash"), DefaultValue(100)> _
        Public Property Max() As Integer
            Get
                Return myMax
            End Get
            Set(ByVal Value As Integer)
                If (myMax <> Value) Then
                    myMax = Value
                    Invalidate()
                End If
            End Set
        End Property


        <Category("Flash"), DefaultValue(0)> _
        Public Property Min() As Integer
            Get
                Return myMin
            End Get
            Set(ByVal Value As Integer)
                If (Min <> Value) Then
                    Min = Value
                    Invalidate()
                End If
            End Set
        End Property


        <Category("Flash")> Public Property StartColor() As Color
            Get
                Return myStartColor
            End Get
            Set(ByVal Value As Color)
                myStartColor = Value
                If (Not (baseBackground Is Nothing) And myShowGradient) Then
                    baseBackground.Dispose()
                    baseBackground = Nothing
                End If
                Invalidate()
            End Set
        End Property

        Public Function ShouldPersistStartColor() As Boolean
            Return Not (StartColor.Equals(Color.Red))
        End Function


        <Category("Flash"), _
            RefreshProperties(RefreshProperties.Repaint), _
            DefaultValue(False)> _
        Public Property ShowPercentage() As Boolean
            Get
                Return myShowPercentage
            End Get
            Set(ByVal Value As Boolean)
                If (Value <> myShowPercentage) Then
                    myShowPercentage = Value
                    If (myShowPercentage) Then
                        myShowValue = False
                    End If
                    Invalidate()
                End If
            End Set
        End Property


        <Category("Flash"), _
            RefreshProperties(RefreshProperties.Repaint), _
            DefaultValue(False)> _
        Public Property ShowValue() As Boolean
            Get
                Return myShowValue
            End Get
            Set(ByVal Value As Boolean)
                If (Value <> myShowValue) Then
                    myShowValue = Value
                    If (myShowValue) Then
                        myShowPercentage = False
                    End If
                    Invalidate()
                End If
            End Set
        End Property



        <Category("Flash"), DefaultValue(True)> _
        Public Property ShowGradient() As Boolean
            Get
                Return myShowGradient
            End Get
            Set(ByVal Value As Boolean)
                If (Value <> myShowGradient) Then
                    myShowGradient = Value
                    If Not (baseBackground Is Nothing) Then
                        baseBackground.Dispose()
                        baseBackground = Nothing
                    End If
                    Invalidate()
                End If
            End Set
        End Property

        <Category("Flash"), _
         Editor(GetType(FlashTrackBarValueEditor), GetType(UITypeEditor)), _
         DefaultValue(0)> _
        Public Property Value() As Integer
            Get
                If (dragging) Then
                    Return dragValue
                End If
                Return myValue
            End Get
            Set(ByVal Value As Integer)
                If (Value <> myValue) Then
                    Dim old As Integer = myValue
                    myValue = Value
                    OnValueChanged(EventArgs.Empty)
                    OptimizedInvalidate(old, myValue)
                End If
            End Set
        End Property

        ' ValueChanged Event

        <Description("Raised when the Value displayed changes")> _
        Public Event ValueChanged(ByVal sender As Object, ByVal ev As EventArgs) 'As EventHandler


        Private Sub OptimizedInvalidate(ByVal oldValue As Integer, ByVal newValue As Integer)
            Dim client As Rectangle = ClientRectangle

            Dim oldPercentValue As Single = CSng(oldValue) / (CSng(Max) - CSng(Min))
            Dim oldNonDimLength As Integer = CInt(oldPercentValue * CSng(client.Width))

            Dim newPercentValue As Single = (CSng(newValue) / (CSng(Max) - CSng(Min)))
            Dim newNonDimLength As Integer = CInt(newPercentValue * CSng(client.Width))

            Dim lmin As Integer = Math.Min(oldNonDimLength, newNonDimLength)
            Dim lmax As Integer = Math.Max(oldNonDimLength, newNonDimLength)

            Dim invalid As Rectangle = New Rectangle(client.X + lmin, client.Y, lmax - lmin, client.Height)
            Invalidate(invalid)

            Dim oldToDisplay As String
            Dim newToDisplay As String

            If (ShowPercentage) Then
                oldToDisplay = Convert.ToString(CInt(oldPercentValue * 100F)) + "%"
                newToDisplay = Convert.ToString(CInt(newPercentValue * 100F)) + "%"
            ElseIf (ShowValue) Then
                oldToDisplay = Convert.ToString(oldValue)
                newToDisplay = Convert.ToString(newValue)
            Else
                oldToDisplay = Nothing
                newToDisplay = Nothing
            End If

            If (oldToDisplay <> Nothing And newToDisplay <> Nothing) Then
                Dim g As Graphics = CreateGraphics()
                Dim oldFontSize As SizeF = g.MeasureString(oldToDisplay, Font)
                Dim newFontSize As SizeF = g.MeasureString(newToDisplay, Font)
                Dim oldFontRectF As RectangleF = New RectangleF(New PointF(0, 0), oldFontSize)
                Dim newFontRectF As RectangleF = New RectangleF(New PointF(0, 0), newFontSize)
                oldFontRectF.X = (client.Width - oldFontRectF.Width) / 2
                oldFontRectF.Y = (client.Height - oldFontRectF.Height) / 2
                newFontRectF.X = (client.Width - newFontRectF.Width) / 2
                newFontRectF.Y = (client.Height - newFontRectF.Height) / 2

                Dim oldFontRect As Rectangle = New Rectangle(CInt(oldFontRectF.X), CInt(oldFontRectF.Y), CInt(oldFontRectF.Width), CInt(oldFontRectF.Height))
                Dim newFontRect As Rectangle = New Rectangle(CInt(newFontRectF.X), CInt(newFontRectF.Y), CInt(newFontRectF.Width), CInt(newFontRectF.Height))

                Invalidate(oldFontRect)
                Invalidate(newFontRect)
            End If
        End Sub



        Protected Overrides Sub OnMouseDown(ByVal e As MouseEventArgs)
            MyBase.OnMouseDown(e)
            If Not (myAllowUserEdit) Then
                Return
            End If
            Capture = True
            dragging = True
            SetDragValue(New Point(e.X, e.Y))
        End Sub

        Protected Overrides Sub OnMouseMove(ByVal e As MouseEventArgs)
            MyBase.OnMouseMove(e)
            If (Not myAllowUserEdit Or Not dragging) Then
                Return
            End If
            SetDragValue(New Point(e.X, e.Y))
        End Sub

        Protected Overrides Sub OnMouseUp(ByVal e As MouseEventArgs)
            MyBase.OnMouseUp(e)
            If (Not myAllowUserEdit Or Not dragging) Then
                Return
            End If
            Capture = False
            dragging = False
            Value = dragValue
            OnValueChanged(EventArgs.Empty)
        End Sub

        Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
            MyBase.OnPaint(e)

            If (baseBackground Is Nothing) Then

                If (myShowGradient) Then
                    baseBackground = New LinearGradientBrush(New Point(0, 0), _
                                                             New Point(ClientSize.Width, 0), _
                                                             StartColor, _
                                                             EndColor)
                ElseIf Not (BackgroundImage Is Nothing) Then
                    baseBackground = New TextureBrush(BackgroundImage)
                Else
                    baseBackground = New SolidBrush(BackColor)
                End If

            End If

            If (backgroundDim Is Nothing) Then
                backgroundDim = New SolidBrush(Color.FromArgb(DarkenBy, Color.Black))
            End If

            Dim toDim As Rectangle = ClientRectangle
            Dim percentValue As Single = (CSng(Value) / (CSng(Max) - CSng(Min)))
            Dim nonDimLength As Integer = CInt(percentValue * CSng(toDim.Width))
            toDim.X = toDim.X + nonDimLength
            toDim.Width = toDim.Width - nonDimLength

            Dim ltext As String = Me.Text
            Dim toDisplay As String
            Dim textRect As RectangleF = New RectangleF(0, 0, 0, 0)

            If (ShowPercentage Or ShowValue Or ltext.Length > 0) Then

                If (ShowPercentage) Then
                    toDisplay = Convert.ToString(CInt(percentValue * 100F)) + "%"
                ElseIf (ShowValue) Then
                    toDisplay = Convert.ToString(Value)
                Else
                    toDisplay = ltext
                End If

                Dim textSize As SizeF = e.Graphics.MeasureString(toDisplay, Font)
                textRect.Width = textSize.Width
                textRect.Height = textSize.Height
                textRect.X = (ClientRectangle.Width - textRect.Width) / 2
                textRect.Y = (ClientRectangle.Height - textRect.Height) / 2
            End If

            e.Graphics.FillRectangle(baseBackground, ClientRectangle)
            e.Graphics.FillRectangle(backgroundDim, toDim)
            e.Graphics.Flush()
            If (toDisplay <> Nothing And toDisplay.Length > 0) Then
                e.Graphics.DrawString(toDisplay, Font, New SolidBrush(ForeColor), textRect)
            End If
        End Sub

        Protected Overrides Sub OnTextChanged(ByVal E As EventArgs)
            MyBase.OnTextChanged(E)
            Invalidate()
        End Sub

        Protected Overrides Sub OnBackColorChanged(ByVal E As EventArgs)
            MyBase.OnTextChanged(E)
            If Not (baseBackground Is Nothing) And Not ShowGradient Then
                baseBackground.Dispose()
                baseBackground = Nothing
            End If
        End Sub

        Protected Overrides Sub OnBackgroundImageChanged(ByVal E As EventArgs)
            MyBase.OnTextChanged(E)
            If Not (baseBackground Is Nothing) And Not ShowGradient Then
                baseBackground.Dispose()
                baseBackground = Nothing
            End If
        End Sub

        Protected Overrides Sub OnResize(ByVal e As EventArgs)
            MyBase.OnResize(e)
            If Not (baseBackground Is Nothing) Then
                baseBackground.Dispose()
                baseBackground = Nothing
            End If
        End Sub

        Protected Overridable Sub OnValueChanged(ByVal e As EventArgs)
            RaiseEvent ValueChanged(Me, e)
        End Sub

        Private Sub SetDragValue(ByVal mouseLocation As Point)

            Dim client As Rectangle = ClientRectangle

            If (client.Contains(mouseLocation)) Then

                Dim percentage As Single = CSng(mouseLocation.X) / CSng(ClientRectangle.Width)
                Dim newDragValue As Integer = CInt(percentage * CSng(Max - Min))

                If (newDragValue <> dragValue) Then
                    Dim old As Integer = dragValue
                    dragValue = newDragValue
                    OptimizedInvalidate(old, dragValue)
                End If

            Else

                If (client.Y <= mouseLocation.Y And mouseLocation.Y <= client.Y + client.Height) Then
                    If (mouseLocation.X <= client.X And mouseLocation.X > client.X - LeftRightBorder) Then
                        Dim newDragValue As Integer = Min
                        If (newDragValue <> dragValue) Then
                            Dim old As Integer = dragValue
                            dragValue = newDragValue
                            OptimizedInvalidate(old, dragValue)
                        End If

                    ElseIf (mouseLocation.X >= client.X + client.Width And mouseLocation.X < client.X + client.Width + LeftRightBorder) Then
                        Dim newDragValue As Integer = Max
                        If (newDragValue <> dragValue) Then
                            Dim old As Integer = dragValue
                            dragValue = newDragValue
                            OptimizedInvalidate(old, dragValue)
                        End If
                    End If

                Else
                    If (dragValue <> Value) Then
                        Dim old As Integer = dragValue
                        dragValue = Value
                        OptimizedInvalidate(old, dragValue)
                    End If

                End If

            End If

        End Sub

    End Class

End Namespace
