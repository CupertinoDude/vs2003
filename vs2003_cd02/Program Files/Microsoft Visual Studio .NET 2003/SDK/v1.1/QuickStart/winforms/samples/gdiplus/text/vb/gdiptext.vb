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
Imports System.Drawing.Text
Imports System.Reflection
Imports Microsoft.VisualBasic

Namespace Microsoft.Samples.WinForms.VB.GDIPlus.GDIPText

    Public Class TextSample
        Inherits System.Windows.Forms.Form

        Private backgroundBrush As System.Drawing.Brush
        Private textTextureBrush As System.Drawing.Brush
        Private titleFont As System.Drawing.Font
        Private textFont As System.Drawing.Font
        Private titleShadowBrush As System.Drawing.Brush
        Private flowedText1 As String = "I went down to the St James Infirmary," & ControlChars.CrLf & "Saw my baby there," & ControlChars.CrLf & "Stretched out on a long white table," & ControlChars.CrLf & "So sweet,so cold,so fair," & ControlChars.CrLf & "Let her go,let her go,God bless her," & ControlChars.CrLf & "Wherever she may be," & ControlChars.CrLf & "She can look this wide world over," & ControlChars.CrLf & "But she'll never find a sweet man like me," & ControlChars.CrLf & "When I die want you to dress me in straight lace shoes," & ControlChars.CrLf & "I wanna a boxback coat and a Stetson hat," & ControlChars.CrLf & "Put a twenty dollar gold piece on my watch chain," & ControlChars.CrLf & "So the boys'll know that I died standing up."
        Private flowedText2 As String = "the sky seems full when you're in the cradle" & ControlChars.CrLf & "the rain will fall and wash your dreams" & ControlChars.CrLf & "stars are stars and they shine so hard..." & ControlChars.CrLf & "now spit out the sky because its empty" & ControlChars.CrLf & "and hollow and all your dreams are hanging out to dry" & ControlChars.CrLf & "stars are stars and they shine so cold..." & ControlChars.CrLf & "once i like crying twice i like laughter" & ControlChars.CrLf & "come tell me what i'm after"
        Private japaneseFont As System.Drawing.Font
        Private japaneseText As New String(New Char() {ChrW(31169), ChrW(12398), ChrW(21517), ChrW(21069), ChrW(12399), ChrW(12463), ChrW(12522), ChrW(12473), ChrW(12391), ChrW(12377), ChrW(12290)})
        Private linearGradBrush As System.Drawing.Brush
        Private doJapaneseSample As Boolean = True

        Private serifFontFamily As FontFamily

        <STAThread()> Shared Sub Main()
            System.Windows.Forms.Application.Run(New TextSample())
        End Sub

        Public Sub New()

            MyBase.New()

            TextSample = Me

            InitializeComponent()

            serifFontFamily = New FontFamily(GenericFontFamilies.Serif)

            Me.SetStyle(ControlStyles.Opaque, True)

            '//Make sure we redraw on resize
            Me.SetStyle(ControlStyles.ResizeRedraw, True)

            Dim backgroundImage As Image

            '//Load the image to be used for the background from the exe's resource fork
            backgroundImage = New Bitmap(System.Reflection.Assembly.GetExecutingAssembly().GetManifestResourceStream("colorbars.jpg"))

            '//Now create the brush we are going to use to paint the background
            backgroundBrush = New TextureBrush(backgroundImage)

            '//Load the image to be used for the textured text from the exe's resource fork
            Dim textImage As Image = New Bitmap(System.Reflection.Assembly.GetExecutingAssembly().GetManifestResourceStream("marble.jpg"))
            textTextureBrush = New TextureBrush(textImage)

            '//Load the fonts we want to use
            Me.Font = New Font(serifFontFamily, 20)
            titleFont = New Font(serifFontFamily, 60)
            textFont = New Font(serifFontFamily, 11)

            '//Set up shadow brush - make it translucent
            titleShadowBrush = New SolidBrush(Color.FromArgb(70, Color.Black))

            '//Set up fonts and brushes for printing japanese text
            Try
                japaneseFont = New Font("MS Mincho", 36)
                linearGradBrush = New LinearGradientBrush(New Point(0, 0), New Point(0, 45), Color.Blue, Color.Red)
            Catch ex As Exception
                MessageBox.Show("The Japanese font MS Mincho needs be present to run the Japanese part of this sample" & ControlChars.CrLf & "" & ControlChars.CrLf & "" + ex.Message)
                doJapaneseSample = False
            End Try

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

        Private WithEvents TextSample As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.Size = New System.Drawing.Size(750, 500)
            Me.Text = "GDI+ Text Samples"
        End Sub

#End Region

        Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
            Dim g As Graphics = e.Graphics

            g.SmoothingMode = SmoothingMode.AntiAlias

            '//Fill the background use the texture brush
            '//and then apply a white wash
            g.FillRectangle(backgroundBrush, ClientRectangle)
            g.FillRectangle(New SolidBrush(Color.FromArgb(180, Color.White)), ClientRectangle)

            '//Simple draw hello world
            g.DrawString("Hello World", Me.Font, New SolidBrush(Color.Black), 10, 10)

            '//Draw a textured string
            Dim titleText As String = "Graphics  Samples"
            g.DrawString(titleText, titleFont, titleShadowBrush, 15, 25)
            g.DrawString(titleText, titleFont, textTextureBrush, 10, 20)

            Dim textToDraw As String = "Hello Symetrical World"

            '//Use Measure string to display a string at the center of the window
            Dim windowCenter As Double = Me.DisplayRectangle.Width / 2
            Dim stringSize As SizeF = g.MeasureString(textToDraw, textFont)
            Dim startPos As Double = windowCenter - (stringSize.Width / 2)
            g.DrawString(textToDraw, textFont, New SolidBrush(Color.Red), CType(startPos, Single), 10)

            '//Now draw a string flowed into a rectangle
            Dim rectangle1 As RectangleF = New RectangleF(20, 150, 250, 300)
            g.FillRectangle(New SolidBrush(Color.Gainsboro), rectangle1)
            g.DrawString(flowedText1, textFont, New SolidBrush(Color.Blue), rectangle1)

            '//Draw more flowed text but this time center it
            Dim rectangle2 As RectangleF = New RectangleF(450, 150, 250, 300)
            g.FillRectangle(New SolidBrush(Color.Gainsboro), rectangle2)
            Dim format As StringFormat = New StringFormat()
            format.Alignment = StringAlignment.Center
            g.DrawString(flowedText2, textFont, New SolidBrush(Color.Blue), rectangle2, Format)

            '//Work out how many lines and characters we printed just now
            Dim characters As Integer = 0
            Dim lines As Integer = 0
            g.MeasureString(flowedText2, textFont, rectangle2.Size, format, characters, lines)
            Dim whatRenderedText As String = String.Format("We printed {0} characters and {1} lines", CType(characters, String), CType(lines, String))
            g.DrawString(whatRenderedText, textFont, New SolidBrush(Color.Black), 400, 440)

            '//If we have the Japanese language pack draw some text in Japanese
            '//Rotate it to make life truly exciting
            If (doJapaneseSample) Then
                g.RotateTransform(-30)
                g.TranslateTransform(-180, 300)
                g.DrawString(japaneseText, japaneseFont, linearGradBrush, 200, 140)
                g.ResetTransform()
            End If

        End Sub

    End Class

End Namespace
