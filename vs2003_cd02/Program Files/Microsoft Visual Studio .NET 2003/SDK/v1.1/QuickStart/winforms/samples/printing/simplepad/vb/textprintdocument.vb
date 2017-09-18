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
Imports System.Drawing.Printing
Imports System.IO

Namespace Microsoft.Samples.WinForms.Vb.SimplePad
    _

    ' <doc>
    ' <desc>
    '     TextFilePrintDocument prints a stream to a printer
    '
    '     Note: In order to avoid problems closing a file
    '     if an exception occurs this class simply takes a
    '     steam and leaves it to the caller to open the file
    '     to print
    '
    ' </desc>
    ' </doc>
    Public Class TextPrintDocument
        Inherits PrintDocument

        Private printFont As Font = Nothing
        Private streamToPrint As StringReader = Nothing
        Private overflowText As String = Nothing


        Public Sub New(ByVal streamToPrint As StringReader, ByVal printFont As Font)
            Me.streamToPrint = streamToPrint
            Me.printFont = printFont
        End Sub 'New


        'Override OnBeginPrint to set up the font we are going to use
        Protected Overrides Sub OnBeginPrint(ByVal ev As PrintEventArgs)
            MyBase.OnBeginPrint(ev)
            overflowText = Nothing
        End Sub 'OnBeginPrint


        'Override the OnPrintPage to provide the printing logic for the document
        Protected Overrides Sub OnPrintPage(ByVal ev As PrintPageEventArgs)

            MyBase.OnPrintPage(ev)

            Dim lpp As Single = 0
            Dim yPos As Single = 0
            Dim count As Integer = 0
            Dim leftMargin As Single = ev.MarginBounds.Left
            Dim topMargin As Single = ev.MarginBounds.Top
            Dim line As String = Nothing

            'Work out the number of lines per page
            'Use the MarginBounds on the event to do this
            lpp = ev.MarginBounds.Height / printFont.GetHeight(ev.Graphics)

            'If we have overflow text from the last page deal with that first
            While count < lpp And Not (overflowText Is Nothing)
                yPos = topMargin + (count * printFont.GetHeight(ev.Graphics))
                Dim linesPrinted As Integer = PrintLine(ev, overflowText, yPos)
                count += linesPrinted
            End While

            'Now iterate over the file printing out each line
            'Check count first so that we don't read line that we won't print
            line = streamToPrint.ReadLine()
            While (count < lpp) And Not ((line) Is Nothing)
                yPos = topMargin + (count * printFont.GetHeight(ev.Graphics))
                Dim linesPrinted As Integer = PrintLine(ev, line, yPos)
                count += linesPrinted
                line = streamToPrint.ReadLine()
            End While

            'If we have more lines then print another page
            If Not (line Is Nothing) Then
                ev.HasMorePages = True
            Else
                ev.HasMorePages = False
            End If
        End Sub 'OnPrintPage


        Private Function PrintLine(ByVal e As PrintPageEventArgs, ByVal text As String, ByVal yStartPos As Single) As Integer
            Dim graphics As Graphics = e.Graphics
            Dim margins As Margins = e.PageSettings.Margins
            Dim format As New StringFormat()
            Dim lines As Integer
            Dim characters As Integer
            Dim rectangle As New RectangleF(margins.Left, yStartPos, e.MarginBounds.Width, e.MarginBounds.Height)

            graphics.MeasureString(text, printFont, rectangle.Size, format, characters, lines)

            'If characters is less than string.length then we can't fit the whole
            'paragraph on the page so print what we can and store the rest for the
            'next page
            If characters < text.Length Then
                overflowText = text.Substring(characters)
            Else
                overflowText = Nothing
            End If

            graphics.DrawString(text, printFont, Brushes.Black, rectangle, format)


            'Cope with empty lines
            If lines = 0 Then
                lines = 1
            End If
            Return lines
        End Function 'PrintLine
    End Class 'TextPrintDocument 
End Namespace 'Microsoft.Samples.WinForms.Vb.SimplePad







