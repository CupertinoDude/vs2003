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
Imports System.Threading

Namespace Microsoft.Samples.WinForms.Vb.ThreadMarshal

    Public Class ThreadMarshal
        Inherits System.Windows.Forms.Form

        Private timerThread As Thread

        Public Sub New()
            MyBase.New()

            ThreadMarshal = Me

            ' Required by the Windows Forms Designer
            InitializeComponent()

        End Sub

        Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
            StopThread()	    
            If disposing Then
                If Not (components Is Nothing) Then
                    components.Dispose()
                End If
            End If
            MyBase.Dispose(disposing)
        End Sub


#Region " Windows Form Designer generated code "

        'Required by the Windows Form Designer
        Private components As System.ComponentModel.IContainer
        Private WithEvents button1 As System.Windows.Forms.Button
        Private WithEvents button2 As System.Windows.Forms.Button
        Private WithEvents progressBar1 As System.Windows.Forms.ProgressBar

        Private WithEvents ThreadMarshal As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.  
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.button1 = New System.Windows.Forms.Button()
            Me.button2 = New System.Windows.Forms.Button()
            Me.progressBar1 = New System.Windows.Forms.ProgressBar()
            Me.button1.Font = New System.Drawing.Font("Tahoma", 8, System.Drawing.FontStyle.Bold)
            Me.button1.Location = New System.Drawing.Point(128, 64)
            Me.button1.Size = New System.Drawing.Size(120, 40)
            Me.button1.TabIndex = 1
            Me.button1.Text = "Start!"
            AddHandler Me.button1.Click, New System.EventHandler(AddressOf Me.button1_Click)
            Me.button2.Font = New System.Drawing.Font("Tahoma", 8, System.Drawing.FontStyle.Bold)
            Me.button2.Location = New System.Drawing.Point(256, 64)
            Me.button2.Size = New System.Drawing.Size(120, 40)
            Me.button2.TabIndex = 1
            Me.button2.Text = "Stop!"
            AddHandler Me.button2.Click, New System.EventHandler(AddressOf Me.button2_Click)
            Me.progressBar1.Font = New System.Drawing.Font("Tahoma", 8, System.Drawing.FontStyle.Bold)
            Me.progressBar1.Location = New System.Drawing.Point(10, 10)
            Me.progressBar1.Size = New System.Drawing.Size(350, 40)
            Me.progressBar1.TabIndex = 2
            Me.progressBar1.Text = "Start!"
            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.ClientSize = New System.Drawing.Size(392, 117)
            Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.button1, Me.button2, Me.progressBar1})
            Me.Text = "Built using the Designer"

        End Sub

#End Region

        'This function is executed on a background thread - it marshalls calls to 
        'update the UI back to the foreground thread
        Public Sub ThreadProc()

            Try
                Dim mi As MethodInvoker = New MethodInvoker(AddressOf Me.UpdateProgress)
                While True
                    'Call BeginInvoke on the Form
                    Me.BeginInvoke(mi)
                    Thread.Sleep(500)
                End While
            Catch ex As System.Threading.ThreadInterruptedException
                'Thrown when the thread is interupted by the main thread - exiting the loop
                'Simply exit...
            Catch
                'All other exceptions - Do nothing...
            End Try
        End Sub


        'This function is called from the background thread
        Private Sub UpdateProgress()
            'Reset to start if required
            If progressBar1.Value = progressBar1.Maximum Then
                progressBar1.Value = progressBar1.Minimum
            End If

            progressBar1.PerformStep()
        End Sub


        'Start the background thread to update the progress bar
        Private Sub button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            StopThread()
            timerThread = New Thread(New ThreadStart(AddressOf Me.ThreadProc))
            timerThread.IsBackground = True
            timerThread.Start()
        End Sub


        'Stop the background thread to update the progress bar
        Private Sub button2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            StopThread()
        End Sub

        'Stop the background thread
        Private Sub StopThread()
            If Not (timerThread Is Nothing) Then
                timerThread.Interrupt()
                timerThread = Nothing
            End If
        End Sub

        'Main application entry point.
        Public Shared Sub Main()
            System.Threading.Thread.CurrentThread.ApartmentState = System.Threading.ApartmentState.STA
            Application.Run(New ThreadMarshal())
        End Sub

    End Class

End Namespace
