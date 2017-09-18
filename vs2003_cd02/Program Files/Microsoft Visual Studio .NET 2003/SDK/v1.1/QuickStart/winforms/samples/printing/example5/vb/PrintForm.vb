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

Namespace Microsoft.Samples.WinForms.VB.PrintingExample5

    Public Class PrintForm
        Inherits System.Windows.Forms.Form

        Private storedPageSettings As PageSettings

        Public Sub New ()

            MyBase.New

            PrintForm = Me

            'This call is required by the Windows Forms Designer.
            InitializeComponent()

            'Wire up events for print buttons
            AddHandler printButton.Click, AddressOf printButton_Click
            AddHandler pageSetupButton.Click, AddressOf pageSetupButton_Click
            AddHandler printPreviewButton.Click, AddressOf printPreviewButton_Click

        End Sub

        'Event fired when the user presses the page setup button
        Private Sub pageSetupButton_Click(sender As object, e As System.EventArgs)

            Try
                Dim psDlg As New PageSetupDialog

                If (storedPageSettings Is Nothing) Then
                    storedPageSettings = new PageSettings()
                End If

                psDlg.PageSettings = storedPageSettings
                psDlg.ShowDialog
            Catch ex As Exception
                MessageBox.Show("An error occurred - " + ex.Message)
            End Try

        End Sub


        'Event fired when the user presses the print button
        Private Sub printButton_Click(sender As object, e As System.EventArgs)

            Try
                Dim streamToPrint As StreamReader = new StreamReader ("PrintMe.Txt")
                Try
                    'Assumes the default printer
                    Dim pd As TextFilePrintDocument = new TextFilePrintDocument(streamToPrint)

                    If Not (storedPageSettings Is Nothing) Then
                        pd.DefaultPageSettings = storedPageSettings
                    End If


                    Dim dlg As New PrintDialog()
                    dlg.Document = pd
                    Dim result As DialogResult = dlg.ShowDialog()

                    If (result = System.Windows.Forms.DialogResult.OK) Then
                        pd.Print()
                    End If

                Finally
                    streamToPrint.Close()
                End Try

            Catch ex As Exception
                MessageBox.Show("An error occurred printing the file - " + ex.Message)
            End Try

        End Sub


        'Event fired when the user presses the print preview button
        Private Sub printPreviewButton_Click(sender As object, e As System.EventArgs)

            Try
                Dim streamToPrint As StreamReader = new StreamReader ("PrintMe.Txt")
                Try
                    'Assumes the default printer
                    Dim pd As TextFilePrintDocument = new TextFilePrintDocument(streamToPrint)

                    If Not (storedPageSettings Is Nothing) Then
                        pd.DefaultPageSettings = storedPageSettings
                    End If

                    Dim dlg As New PrintPreviewDialog()
                    dlg.Document = pd
                    dlg.ShowDialog()

                Finally
                    streamToPrint.Close()
                End Try

            Catch ex As Exception
                MessageBox.Show("An error occurred - " + ex.Message)
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
        Private WithEvents printButton As System.Windows.Forms.Button
        Private WithEvents pageSetupButton As System.Windows.Forms.Button
        Private WithEvents printPreviewButton As System.Windows.Forms.Button

        Private WithEvents PrintForm As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.printPreviewButton = New System.Windows.Forms.Button()
            Me.pageSetupButton = New System.Windows.Forms.Button()
            Me.printButton = New System.Windows.Forms.Button()
            Me.Text = "Print Example 5"
            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.ClientSize = New System.Drawing.Size(504, 381)

            printPreviewButton.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
            printPreviewButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            printPreviewButton.Size = New System.Drawing.Size(136, 40)
            printPreviewButton.TabIndex = 2
            printPreviewButton.Location = New System.Drawing.Point(32, 210)
            printPreviewButton.Text = "Print Preview"

            pageSetupButton.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
            pageSetupButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            pageSetupButton.Size = New System.Drawing.Size(136, 40)
            pageSetupButton.TabIndex = 1
            pageSetupButton.Location = New System.Drawing.Point(32, 160)
            pageSetupButton.Text = "Page Settings"

            printButton.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
            printButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            printButton.Size = New System.Drawing.Size(136, 40)
            printButton.TabIndex = 0
            printButton.Location = New System.Drawing.Point(32, 112)
            printButton.Text = "Print the file"
            Me.Controls.Add(printButton)
            Me.Controls.Add(pageSetupButton)
            Me.Controls.Add(printPreviewButton)
        End Sub

#End Region

        'The main entry point for the application
        <STAThread()> Shared Sub Main()
            System.Windows.Forms.Application.Run(New PrintForm())
        End Sub

    End Class

End Namespace











