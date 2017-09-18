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

Namespace Microsoft.Samples.WinForms.VB.PrintingExample1

    Public Class PrintingExample1
        Inherits System.Windows.Forms.Form

        private printFont As Font
        private streamToPrint As StreamReader

        Public Sub New ()

            MyBase.New()

            PrintingExample1 = Me

            'This call is required by the Windows Forms Designer.
            InitializeComponent()

            'Wire up event handler for print button
            AddHandler printButton.Click, AddressOf printButton_Click

        End Sub


        'Event fired when the user presses the print button
        Private Sub printButton_Click(sender As object, e As System.EventArgs)

            Try
                streamToPrint = new StreamReader ("PrintMe.Txt")
                Try
                    printFont = new Font("Arial", 10)
                    Dim pd as PrintDocument = new PrintDocument() 'Assumes the default printer
                    AddHandler pd.PrintPage, New System.Drawing.Printing.PrintPageEventHandler(AddressOf Me.pd_PrintPage)
                    pd.Print()
                Finally
                    streamToPrint.Close()
                End Try

            Catch ex As Exception
                MessageBox.Show("An error occurred printing the file - " + ex.Message)
            End Try

        End Sub

        'Event fired for each page to print
        Private Sub pd_PrintPage(ByVal sender As Object, ByVal ev As System.Drawing.Printing.PrintPageEventArgs)

            Dim lpp As Single = 0
            Dim yPos As Single = 0
            Dim count As Integer = 0
            Dim leftMargin As Single = ev.MarginBounds.Left
            Dim topMargin As Single = ev.MarginBounds.Top
            Dim line As String

            'Work out the number of lines per page
            'Use the MarginBounds on the event to do this
            lpp = ev.MarginBounds.Height / printFont.GetHeight(ev.Graphics)

            'Now iterate over the file printing out each line
            'NOTE WELL: This assumes that a single line is not wider than the page width
            'Check count first so that we don't read line that we won't print
            line = streamToPrint.ReadLine()
            While (count < lpp And line <> Nothing)

                yPos = topMargin + (count * printFont.GetHeight(ev.Graphics))

                ev.Graphics.DrawString(line, printFont, Brushes.Black, leftMargin, yPos, New StringFormat())

                count = count + 1

                If (count < lpp) Then
                    line = streamToPrint.ReadLine()
                End If

            End While

            'If we have more lines then print another page
            If (line <> Nothing) Then
                ev.HasMorePages = True
            Else
                ev.HasMorePages = False
            End If

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
        Private WithEvents printButton As System.Windows.Forms.Button

        Private WithEvents PrintingExample1 As System.Windows.Forms.Form

        ' NOTE: The following code is required by the Windows Forms Designer
        ' Do not modify it
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.printButton = New System.Windows.Forms.Button()
            Me.Text = "Print Example 1"
            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.ClientSize = New System.Drawing.Size(504, 381)

            printButton.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
            printButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            printButton.Size = New System.Drawing.Size(136, 40)
            printButton.TabIndex = 0
            printButton.Location = New System.Drawing.Point(32, 112)
            printButton.Text = "Print the file"
            Me.Controls.Add(printButton)
        End Sub

#End Region

        'The main entry point for the application
        <STAThread()> Shared Sub Main()
            System.Windows.Forms.Application.Run(New PrintingExample1())
        End Sub

    End Class

End Namespace






