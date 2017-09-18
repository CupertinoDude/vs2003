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
Imports System.Windows.Forms
Imports System.IO
Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.Reflection

namespace Microsoft.Samples.WinForms.VB.GDIPlus.GDIPPens
    public class PensSample
        Inherits System.Windows.Forms.Form

        Private backgroundBrush As Brush
        Private penTextureBrush As Brush

        <STAThread()> Shared Sub Main()
            System.Windows.Forms.Application.Run(New PensSample())
        End Sub

        Public Sub New()

            MyBase.New()

            PensSample = Me

            'This call is required by the Windows Forms Designer.
            InitializeComponent()

            Me.SetStyle(System.Windows.Forms.ControlStyles.Opaque, True)

            '//Load the image to be used for the background from the exe's resource fork
            Dim backgroundImage As Image = New Bitmap(System.Reflection.Assembly.GetExecutingAssembly().GetManifestResourceStream("colorbars.jpg"))

            '//Now create the brush we are going to use to paint the background
            backgroundBrush = New TextureBrush(backgroundImage)

            '//Load the image to be used for the textured pen from the exe's resource fork
            Dim penImage As Image = New Bitmap(System.Reflection.Assembly.GetExecutingAssembly().GetManifestResourceStream("BoilingPoint.jpg"))
            penTextureBrush = New TextureBrush(penImage)
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

        Private WithEvents PensSample As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.Size = New System.Drawing.Size(750, 500)
            Me.Text = "GDI+ Brush Samples"
        End Sub

#End Region

        Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)

            Dim g As Graphics = e.Graphics

            e.Graphics.SmoothingMode = SmoothingMode.AntiAlias

            '//Fill the background use the texture brush
            '//and then apply a white wash
            g.FillRectangle(backgroundBrush, ClientRectangle)
            g.FillRectangle(New SolidBrush(Color.FromArgb(180, Color.White)), ClientRectangle)

            '//Create a pen 20 pixels wide that is and purple and partially transparent
            Dim penExample1 As Pen = New Pen(Color.FromArgb(150, Color.Purple), 20)

            '//Make it a dashed pen
            penExample1.DashStyle = DashStyle.Dash

            '//Make the ends round
            penExample1.StartCap = LineCap.Round
            penExample1.EndCap = LineCap.Round

            '//Now draw a curve Imports the pen
            g.DrawCurve(penExample1, New Point() {New Point(200, 140), New Point(700, 240), New Point(500, 340), New Point(140, 140), New Point(40, 340)})

            '//Now draw a line Imports a bitmap as the fill
            Dim penExample2 As Pen = New Pen(penTextureBrush, 25)
            penExample2.DashStyle = DashStyle.DashDotDot
            penExample2.StartCap = LineCap.Triangle
            penExample2.EndCap = LineCap.Round
            g.DrawLine(penExample2, 10, 450, 550, 400)

        End Sub

    End Class

End Namespace
