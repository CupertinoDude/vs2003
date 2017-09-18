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
Imports System.Collections
Imports System.ComponentModel
Imports System.Drawing
Imports System.Windows.Forms
Imports System.Threading

Namespace Microsoft.Samples.Windows.Forms.Vb.ProgressBarCtl

    ' <doc>
    ' <desc>
    '     This class demonstrates the ProgressBar control.
    '     The ProgressBar is updated periodically via another thread based on the
    '     settings in this control
    ' </desc>
    ' </doc>
    Public Class ProgressBarCtl
        Inherits System.Windows.Forms.Form

        Private iSleepTime As Integer
        Private timedProgress As Thread

        Public Sub New()

            MyBase.New()

            ProgressBarCtl = Me

            'This call is required by the Windows Forms Designer.
            InitializeComponent()

            iSleepTime = 100
            cmbStep.SelectedIndex = 0
            progbar.Step = 1

        End Sub


        Protected Overrides Sub OnLoad(ByVal e As EventArgs)
            ' Spin off a new thread to update the ProgressBar control
            timedProgress = New Thread(New ThreadStart(AddressOf TimedProgressProc))
            timedProgress.IsBackground = True
            timedProgress.Start()
        End Sub


        ' <doc>
        ' <desc>
        '     This code executes on the Windows.Forms thread.
        ' </desc>
        ' </doc>
        Private Sub UpdateProgress()
            Dim min As Integer
            Dim numerator, denominator, completed As Double
            If progbar.Value = progbar.Maximum Then

                'Reset to start if required
                progbar.Value = progbar.Minimum
            Else
                progbar.PerformStep()
            End If

            lblValue.Text = progbar.Value.ToString()

            min = progbar.Minimum
            numerator = progbar.Value - min
            denominator = progbar.Maximum - min
            completed = numerator / denominator * 100

            lblCompleted.Text = Math.Round(completed).ToString() + "%"
        End Sub


        ' <doc>
        ' <desc>
        '     This function runs in the timedProgress thread and updates the
        '     ProgressBar on the form.
        ' </desc>
        ' </doc>
        Private Sub TimedProgressProc()
            Try
                Dim mi As New MethodInvoker(AddressOf UpdateProgress)
                While True
                    Invoke(mi)
                    Dim iSleepTime As Integer = Me.SleepTime
                    Thread.Sleep(iSleepTime)
                End While
                'Thrown when the thread is interupted by the main thread - exiting the loop
            Catch e As ThreadInterruptedException
                If Not (e Is Nothing) Then
                End If
            Catch we As Exception
                If Not (we Is Nothing) Then
                    MessageBox.Show(we.ToString())
                End If
            End Try
        End Sub


        ' <doc>
        ' <desc>
        '     Property controlling the progress of the progress bar - used by the background thread
        ' </desc>
        ' </doc>
        Private Property SleepTime() As Integer
            Get
                SyncLock Me
                    Return iSleepTime
                End SyncLock
            End Get
            Set(ByVal Value As Integer)
                SyncLock Me
                    iSleepTime = Value
                End SyncLock
            End Set
        End Property


        '/ <summary>
        '/    Clean up any resources being used
        '/ </summary>

        ' We have to make sure that our thread doesn't attempt
        ' to access our controls after we dispose them.

        Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
            If Not (timedProgress Is Nothing) Then
                timedProgress.Interrupt()
                timedProgress = Nothing
            End If

            If disposing Then
                If Not (components Is Nothing) Then
                    components.Dispose()
                End If
            End If
            MyBase.Dispose(disposing)
        End Sub


        Protected Sub sldrSpeed_Scroll(ByVal sender As Object, ByVal e As EventArgs)
            Dim tb As TrackBar = CType(sender, TrackBar)
            Dim time As Integer = 110 - tb.Value
            Me.SleepTime = time
        End Sub


        Protected Sub cmbStep_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
            Try
                progbar.Step = Integer.Parse(CStr(cmbStep.SelectedItem))
            Catch ex As Exception
                If Not (ex Is Nothing) Then
                    ' thrown if Int32.Parse can't convert
                End If
            End Try
        End Sub


#Region " Windows Form Designer generated code "

        'Required by the Windows Form Designer
        Private components As System.ComponentModel.Container
        Protected WithEvents label3 As System.Windows.Forms.Label
        Protected WithEvents lblCompleted As System.Windows.Forms.Label
        Protected WithEvents sldrSpeed As System.Windows.Forms.TrackBar
        Protected WithEvents progbar As System.Windows.Forms.ProgressBar
        Protected WithEvents label5 As System.Windows.Forms.Label
        Protected WithEvents grpBehavior As System.Windows.Forms.GroupBox
        Protected WithEvents label4 As System.Windows.Forms.Label
        Protected WithEvents label6 As System.Windows.Forms.Label
        Protected WithEvents lblValue As System.Windows.Forms.Label
        Protected WithEvents cmbStep As System.Windows.Forms.ComboBox

        Private WithEvents ProgressBarCtl As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.label4 = New System.Windows.Forms.Label()
            Me.lblCompleted = New System.Windows.Forms.Label()
            Me.label5 = New System.Windows.Forms.Label()
            Me.label3 = New System.Windows.Forms.Label()
            Me.lblValue = New System.Windows.Forms.Label()
            Me.cmbStep = New System.Windows.Forms.ComboBox()
            Me.progbar = New System.Windows.Forms.ProgressBar()
            Me.sldrSpeed = New System.Windows.Forms.TrackBar()
            Me.label6 = New System.Windows.Forms.Label()
            Me.grpBehavior = New System.Windows.Forms.GroupBox()

            sldrSpeed.BeginInit()

            Me.Text = "ProgressBar"
            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog
            Me.ClientSize = New System.Drawing.Size(506, 175)
            Me.MaximizeBox = False
            Me.MinimizeBox = False

            label4.Location = New System.Drawing.Point(16, 80)
            label4.Text = "Completion Speed:"
            label4.Size = New System.Drawing.Size(200, 16)
            label4.TabIndex = 0

            lblCompleted.Location = New System.Drawing.Point(128, 56)
            lblCompleted.Size = New System.Drawing.Size(56, 16)
            lblCompleted.TabIndex = 2

            label5.Location = New System.Drawing.Point(24, 56)
            label5.Text = "Percent Completed:"
            label5.Size = New System.Drawing.Size(112, 24)
            label5.TabIndex = 1

            label3.Location = New System.Drawing.Point(16, 24)
            label3.Text = "Step:"
            label3.Size = New System.Drawing.Size(48, 16)
            label3.TabIndex = 6

            lblValue.Location = New System.Drawing.Point(128, 80)
            lblValue.Size = New System.Drawing.Size(56, 16)
            lblValue.TabIndex = 4

            cmbStep.Location = New System.Drawing.Point(136, 24)
            cmbStep.Size = New System.Drawing.Size(96, 21)
            cmbStep.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
            cmbStep.TabIndex = 7
            AddHandler cmbStep.SelectedIndexChanged, New System.EventHandler(AddressOf cmbStep_SelectedIndexChanged)
            cmbStep.Items.AddRange(New Object() {"1", "5", "10", "20"})

            progbar.BackColor = System.Drawing.SystemColors.Control
            progbar.Location = New System.Drawing.Point(24, 24)
            progbar.TabIndex = 0
            progbar.Size = New System.Drawing.Size(192, 16)
            progbar.Step = 1
            progbar.Text = "progbar"

            sldrSpeed.BackColor = System.Drawing.SystemColors.Control
            sldrSpeed.Location = New System.Drawing.Point(16, 96)
            sldrSpeed.TabIndex = 1
            sldrSpeed.TabStop = False
            sldrSpeed.Value = 10
            sldrSpeed.Maximum = 100
            sldrSpeed.Minimum = 10
            sldrSpeed.TickFrequency = 10
            sldrSpeed.Size = New System.Drawing.Size(216, 42)
            sldrSpeed.Text = "trackBar1"
            AddHandler sldrSpeed.Scroll, New System.EventHandler(AddressOf sldrSpeed_Scroll)

            label6.Location = New System.Drawing.Point(24, 80)
            label6.Text = "Value:"
            label6.Size = New System.Drawing.Size(100, 16)
            label6.TabIndex = 3

            grpBehavior.Location = New System.Drawing.Point(248, 16)
            grpBehavior.TabIndex = 5
            grpBehavior.TabStop = False
            grpBehavior.Text = "ProgressBar"
            grpBehavior.Size = New System.Drawing.Size(248, 152)
            Me.grpBehavior.Controls.AddRange(New Control() {cmbStep, label3, sldrSpeed, label4})

            Me.Controls.AddRange(New Control() {grpBehavior, lblValue, label6, lblCompleted, label5, progbar})

            sldrSpeed.EndInit()
        End Sub

#End Region


        ' The main entry point for the application.
        <STAThread()> Public Shared Sub Main()
            Application.Run(New ProgressBarCtl())
        End Sub

    End Class

End Namespace
