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
Imports System.Windows.Forms
Imports System.Drawing

Namespace Microsoft.Samples.WinForms.VB.SimpleControl

    <DefaultProperty("DrawingMode"), DefaultEvent("DrawingModeChanged")> _
        Public Class SimpleControl

        Inherits System.Windows.Forms.Control

        Private Sub InitializeComponent()

        End Sub

        Private myDrawingMode As DrawingModeStyle
        Private myOnDrawingModeChanged As EventHandler

        '*** Constructors

        Public Sub New()
            MyBase.New()

            'Initialise drawingMode
            myDrawingMode = DrawingModeStyle.Happy

            'Initialise BackColor and ForeColor based on DrawingMode
            SetColors()

            'Make sure the control repaints as it is resized
            SetStyle(ControlStyles.ResizeRedraw, True)

        End Sub


        '*** Properties

        'Remove the BackColor property from the properties window
        <Browsable(False)> Public Overrides Property BackColor() As Color
            Get
                Return MyBase.BackColor
            End Get

            Set(ByVal Value As Color)
                'No Action
            End Set

        End Property


        'DrawingMode - controls how the control paints
        <Category("Appearance"), _
         Description("Controls how the control paints"), _
         DefaultValue(DrawingModeStyle.Happy), _
         Bindable(True)> _
        Public Property _
        DrawingMode() As DrawingModeStyle

            Get
                Return myDrawingMode
            End Get

            Set(ByVal Value As DrawingModeStyle)
                myDrawingMode = Value

                'Set BackColor and ForeColor based on DrawingMode
                SetColors()

                'Raise property changed event for DrawingMode
                OnDrawingModeChanged(EventArgs.Empty)

            End Set

        End Property


        'Remove the ForeColor property from the properties window
        <Browsable(False)> Public Overrides Property ForeColor() As Color
            Get
                Return MyBase.ForeColor
            End Get

            Set(ByVal Value As Color)
                'No Action
            End Set

        End Property



        '*** Events

        'Handle the paint event
        Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)

            e.Graphics.FillRectangle(New SolidBrush(BackColor), ClientRectangle)

            Dim textSize As SizeF = e.Graphics.MeasureString(Me.Text, Font)

            Dim xPos As Single = CSng((ClientRectangle.Width / 2) - (textSize.Width / 2))
            Dim yPos As Single = CSng((ClientRectangle.Height / 2) - (textSize.Height / 2))

            e.Graphics.DrawString(Me.Text, Font, New SolidBrush(ForeColor), xPos, yPos)

        End Sub

        Protected Overrides Sub OnTextChanged(ByVal e As EventArgs)
            MyBase.OnTextChanged(e)
            Invalidate()
        End Sub


        'Catch property changed event for DrawingMode to fire DrawingMoe changed
        'and repaint the control
        Protected Overridable Sub OnDrawingModeChanged(ByVal E As EventArgs)
            'Set BackColor and ForeColor based on DrawingMode
            SetColors()
            Invalidate()
            If Not (myOnDrawingModeChanged Is Nothing) Then myOnDrawingModeChanged.Invoke(Me, E)
        End Sub

        'DrawingModeChanged Event
            <Description("Raised when the DrawingMode changes")> _
            Public Event _
            DrawingModeChanged(ByVal sender As Object, ByVal ev As EventArgs) 'As EventHandler

        'Set the ForeColor and BackColor based on the value of DrawingMode
        Private Sub SetColors()

            Select Case myDrawingMode

                Case DrawingModeStyle.Happy
                    MyBase.BackColor = Color.Yellow
                    MyBase.ForeColor = Color.Green

                Case DrawingModeStyle.Sad
                    MyBase.BackColor = Color.LightSlateGray
                    MyBase.ForeColor = Color.White

                Case DrawingModeStyle.Angry
                    MyBase.BackColor = Color.Red
                    MyBase.ForeColor = Color.Teal

                Case Else
                    MyBase.BackColor = Color.Black
                    MyBase.ForeColor = Color.White

            End Select

        End Sub

    End Class

End Namespace
