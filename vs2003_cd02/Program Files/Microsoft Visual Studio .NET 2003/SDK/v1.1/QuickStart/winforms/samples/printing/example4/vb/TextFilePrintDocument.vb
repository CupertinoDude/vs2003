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

Namespace Microsoft.Samples.WinForms.VB.PrintingExample4

    ' TextFilePrintDocument prints a stream to a printer
    '
    ' Note: In order to avoid problems closing a file
    ' if an exception occurs this class simply takes a
    ' steam and leaves it to the caller to open the file
    ' to print
    Public Class TextFilePrintDocument
        Inherits PrintDocument

        Private printFont As Font
        Private streamToPrint As StreamReader

        Public Sub New(streamToPrint As StreamReader)
            MyBase.New
            Me.streamToPrint = streamToPrint
        End Sub

        'Override OnBeginPrint to set up the font we are going to use
        Overrides Protected Sub OnBeginPrint(ev As PrintEventArgs)
            MyBase.OnBeginPrint(ev)
            printFont = new Font("Arial", 10)
        End Sub

        'Override the OnPrintPage to provide the printing logic for the document
        Overrides Protected Sub OnPrintPage(ev As PrintPageEventArgs)

            MyBase.OnPrintPage(ev)

            Dim lpp As Single = 0
            Dim yPos As Single =  0
            Dim count As Integer = 0
            Dim leftMargin As Single = ev.MarginBounds.Left
            Dim topMargin As Single = ev.MarginBounds.Top
            Dim line as String

            'Work out the number of lines per page
            'Use the MarginBounds on the event to do this
            lpp = ev.MarginBounds.Height  / printFont.GetHeight(ev.Graphics)

            'Now iterate over the file printing out each line
            'NOTE WELL: This assumes that a single line is not wider than the page width
            'Check count first so that we don't read line that we won't print
            line=streamToPrint.ReadLine()
            while (count < lpp AND line <> Nothing)

                yPos = topMargin + (count * printFont.GetHeight(ev.Graphics))

                ev.Graphics.DrawString (line, printFont, Brushes.Black, leftMargin, yPos, new StringFormat())

                count = count + 1

                if (count < lpp) then
                    line=streamToPrint.ReadLine()
                end if

            End While

            'If we have more lines then print another page
            If (line <> Nothing) Then
                ev.HasMorePages = True
            Else
                ev.HasMorePages = False
            End If

        End Sub

    End Class

End Namespace






