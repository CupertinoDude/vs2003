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
Imports System.Reflection
Imports System.Windows.Forms

Namespace Microsoft.Samples.WinForms.VB.GDIPlus.GDIPBrushes

    Public Class BrushesSample
        Inherits System.Windows.Forms.Form

        Private backgroundBrush As System.Drawing.Brush

        Public Sub New()

            MyBase.New()

            BrushesSample = Me

            'This call is required by the Windows Forms Designer.
            InitializeComponent()

            Me.SetStyle(System.Windows.Forms.ControlStyles.Opaque, True)

            Dim backgroundImage As Image

            '//Load the image to be used for the background from the exe's resource fork
            backgroundImage = New Bitmap(System.Reflection.Assembly.GetExecutingAssembly().GetManifestResourceStream("colorbars.jpg"))

            '//Now create the brush we are going to use to paint the background
            backgroundBrush = New TextureBrush(backgroundImage)

        End Sub

        Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)

            Dim g As Graphics = e.Graphics

            e.Graphics.SmoothingMode = SmoothingMode.AntiAlias

            '//Fill the background use the texture brush
            '//and then apply a white wash
            If Not (backgroundBrush Is Nothing) Then
                g.FillRectangle(backgroundBrush, ClientRectangle)
            End If
            g.FillRectangle(New SolidBrush(Color.FromArgb(180, Color.White)), ClientRectangle)

            '//Add a Red rectangle and a yellow one that overlaps it
            g.FillRectangle(New SolidBrush(Color.Red), 20, 20, 50, 50)
            g.FillRectangle(New SolidBrush(Color.FromArgb(180, Color.Yellow)), 40, 40, 50, 50)

            '//Add a circle that is filled with a translucent hatch
            Dim hb As HatchBrush = New HatchBrush(HatchStyle.ForwardDiagonal, Color.Green, Color.FromArgb(100, Color.Yellow))
            g.FillEllipse(hb, 250, 10, 100, 100)


            '//Now create a rectangle filled with a gradient brush
            Dim r As Rectangle = New Rectangle(300, 250, 100, 100)
            Dim lb As LinearGradientBrush = New LinearGradientBrush(r, Color.Red, Color.Yellow, LinearGradientMode.BackwardDiagonal)
            g.FillRectangle(lb, r)

            '//Now add a shape drawn with a path gradient brush

            Dim path As GraphicsPath

            path = New GraphicsPath(New Point() {New Point(40, 140), New Point(275, 200), New Point(105, 225), _
            New Point(190, 300), New Point(50, 350), New Point(20, 180)}, _
            New Byte() {CType(PathPointType.Start, Byte), CType(PathPointType.Bezier, Byte), CType(PathPointType.Bezier, Byte), _
            CType(PathPointType.Bezier, Byte), CType(PathPointType.Line, Byte), CType(PathPointType.Line, Byte)})


            Dim pgb As PathGradientBrush = New PathGradientBrush(path)
            pgb.SurroundColors = New Color() {Color.Green, Color.Yellow, Color.Red, Color.Blue, Color.Orange, Color.White}

            g.FillPath(pgb, path)

            '//Now add a simple rectangle that has been rotated
            g.RotateTransform(-30)
            g.FillRectangle(New SolidBrush(Color.SlateBlue), 100, 250, 75, 100)
            g.ResetTransform()

        End Sub


        'Form overrides dispose to clean up the component list.
        Protected Overloads Overrides Sub Dispose(Disposing As Boolean)
            MyBase.Dispose(Disposing)
            components.Dispose()
        End Sub


#Region " Windows Form Designer generated code "

        'Required by the Windows Form Designer
        Private components As System.ComponentModel.Container

        Private WithEvents BrushesSample As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()

            Me.Size = New System.Drawing.Size(450, 400)
            Me.Text = "GDI+ Brush Samples"
        End Sub

#End Region


        'The main entry point for the application
        <STAThread()> Shared Sub Main()
            System.Windows.Forms.Application.Run(New BrushesSample())
        End Sub

    End Class

End Namespace
