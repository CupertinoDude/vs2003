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
Imports System.Windows.Forms

    ' <doc>
    ' <desc>
    '     This simple control displays the images selected in the ListBox
    ' </desc>                                                            
    ' </doc>
    Public Class SampleImagePanel
        Inherits System.Windows.Forms.Panel

        Friend myImages(4) As System.Drawing.Image
        Private imageCnt As Integer = 0

        Public Sub New()
        End Sub

        Public Overridable Sub AddImage(ByVal img As Image)
            If imageCnt >= myImages.Length Then
                Return
            End If
            myImages(imageCnt) = img
            imageCnt += 1
        End Sub

        Public Overridable Sub ClearImages()
            imageCnt = 0
        End Sub

        Protected Overrides Sub OnPaint(ByVal pe As PaintEventArgs)
            MyBase.OnPaint(pe)
            Dim i As Integer
            For i = 0 To imageCnt - 1
                pe.Graphics.DrawImage(myImages(i), New System.Drawing.Point(0, 30 * i + 5))
            Next i
        End Sub

    End Class


