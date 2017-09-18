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
Imports System.Net
Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.Drawing.Imaging
Imports System.Drawing.Text
Imports System.Reflection
Imports Microsoft.VisualBasic

Namespace Microsoft.Samples.WinForms.VB.GDIPlus.GDIPImages

    Public Class ImagesSample
        Inherits System.Windows.Forms.Form

        Private backgroundBrush As System.Drawing.Brush
        Private sample1 As System.Drawing.Image
        Private webLogo As System.Drawing.Image
        Private createdImage As System.Drawing.Image

        Private serifFontFamily As FontFamily

        <STAThread()> Shared Sub Main()
            System.Windows.Forms.Application.Run(New ImagesSample())
        End Sub

        Public Sub New()
            MyBase.New()

            ImagesSample = Me

            'This call is required by the Windows Forms Designer.
            InitializeComponent()

            serifFontFamily = New FontFamily (GenericFontFamilies.Serif)

            Me.SetStyle(System.Windows.Forms.ControlStyles.Opaque, True)

            '//Load the image to be used for the background from the exe's resource fork
            Dim backgroundImage As Image = New Bitmap(System.Reflection.Assembly.GetExecutingAssembly().GetManifestResourceStream("colorbars.jpg"))

            '//Now create the brush we are going to use to paint the background
            backgroundBrush = New TextureBrush(backgroundImage)

            '//Now load the other images we are going to use
            sample1 = New Bitmap("sample.jpg")

            '//Load an image from the web and display that - if it fails load one from a local resource
            Try
                Dim request As WebRequest = WebRequest.Create("http://www.microsoft.com/net/images/bnrWindowsNgws1.gif")
                request.Credentials = CredentialCache.DefaultCredentials

                Dim source As Stream = request.GetResponse().GetResponseStream()
                Dim ms As MemoryStream = New MemoryStream()

                Dim data(256) As Byte
                Dim c As Integer = source.Read(data, 0, data.Length)

                While c > 0
                    ms.Write(data, 0, c)
                    c = source.Read(data, 0, data.Length)
                End While

                source.Close()
                ms.Position = 0
                webLogo = New Bitmap(ms)

            Catch ex As Exception
                ' MessageBox.Show("Failed to load Image from the Web- using default image" & vbCrLf & ex.Message & vbCrLf & vbCrLf & ex.StackTrace, "Error")
                webLogo = sample1
            End Try

            'Wire up event handler for button that renders bitmap
            AddHandler Button1.Click, AddressOf DrawImage

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
        Private WithEvents Button1 As System.Windows.Forms.Button

        Private WithEvents ImagesSample As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.Button1 = New System.Windows.Forms.Button()
            Me.Size = New System.Drawing.Size(750, 500)
            Me.Text = "GDI+ Images Samples"

            Button1.Size = New System.Drawing.Size(100, 50)
            Button1.TabIndex = 0
            Button1.Location = New System.Drawing.Point(600, 20)
            Button1.Text = "Draw a bitmap to a file"

            Me.Controls.Add(Button1)
        End Sub

#End Region

        'Fired when the button is pressed
        Private Sub DrawImage(ByVal sender As Object, ByVal e As EventArgs)
            Dim newBitmap As Bitmap = Nothing
            Dim g As Graphics = Nothing

            Try
                newBitmap = New Bitmap(800, 600, PixelFormat.Format32bppArgb)
                g = Graphics.FromImage(newBitmap)
                g.FillRectangle(New SolidBrush(Color.White), New Rectangle(0, 0, 800, 600))

                Dim textFont As Font = New Font(serifFontFamily, 12)
                Dim rectangle As RectangleF = New RectangleF(100, 100, 250, 350)
                Dim flowedText As String = "I went down to the St James Infirmary," & vbCrLf & "Saw my baby there," & vbCrLf & "Stretchedon a long white table," & vbCrLf & "So sweet,so cold,so fair," & vbCrLf & "Let her go,let her go,God bless her," & vbCrLf & "Wherever she may be," & vbCrLf & "She can look this wide world over," & vbCrLf & "But she'll never find a sweet man like me," & vbCrLf & "When I die want you to dress me in straight lace shoes," & vbCrLf & "I wanna a boxback coat and a Stetson hat," & vbCrLf & "Put a twenty dollar gold piece on my watch chain," & vbCrLf & "So the boys'll know that I died standing up."

                g.FillRectangle(New SolidBrush(Color.Gainsboro), Rectangle)
                g.DrawString(flowedText, textFont, New SolidBrush(Color.Blue), Rectangle)
                Dim penExample As Pen = New Pen(Color.FromArgb(150, Color.Purple), 20)
                penExample.DashStyle = DashStyle.Dash
                penExample.StartCap = LineCap.Round
                penExample.EndCap = LineCap.Round
                g.DrawCurve(penExample, New Point() {New Point(200, 140), New Point(700, 240), New Point(500, 340), New Point(140, 140), New Point(40, 340)})

                newBitmap.Save("TestImage.png", ImageFormat.Png)

                MessageBox.Show("Done - image written to TestImage.png")

                'Add image to paint and repaint
                createdImage = newBitmap
                Me.Invalidate()

            Finally

                '//Note well: Must dispose of graphics object
                '//before disposing of the bitmap

                '//Dispose of the graphics object we created
                '//as its no longer needed
                If Not (g Is Nothing) Then
                    g.Dispose()
                End If

                '//Typically we'd dispose of the bitmap here
                '//but as we're going to display it on the
                '//form don't dispose of it
                '// If Not (newBitmap Is Nothing)
                '//     newBitmap.Dispose()
                '//
            End Try

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

            '//Simply render an image
            If Not (sample1 Is Nothing) Then
                g.DrawImage(sample1, 29, 20, 283, 212)
            End If

            '//Now rotate and image and display it
            g.RotateTransform(-30)
            If Not (webLogo Is Nothing) Then
                g.DrawImage(webLogo, 175, 420)
            End If
            g.ResetTransform()

            '//Finally draw the image we created if there is one
            If Not (createdImage Is Nothing) Then
                g.DrawImage(createdImage, 50, 200, 200, 200)
            End If

        End Sub

    End Class

End Namespace
