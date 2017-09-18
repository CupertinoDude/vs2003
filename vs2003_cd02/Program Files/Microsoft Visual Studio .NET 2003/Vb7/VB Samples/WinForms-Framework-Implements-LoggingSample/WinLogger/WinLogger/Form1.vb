Option Explicit On 
Option Strict On

Imports System.ComponentModel
Imports System.Drawing
Imports System.Windows.Forms


Public Class Form1
    Inherits System.Windows.Forms.Form

    Public Sub New()
        MyBase.New()
        Form1 = Me
        'This call is required by the Win Form Designer.
        InitializeComponent()

        'TODO: Add any initialization after the InitializeComponent() call.
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

    'Required by the Windows Form Designer.
    Private components As System.ComponentModel.Container

    Private WithEvents Label1 As System.Windows.Forms.Label
    Private WithEvents txtMessage As System.Windows.Forms.TextBox
    Private WithEvents cmdFile As System.Windows.Forms.Button
    Private WithEvents cmdEventLog As System.Windows.Forms.Button

    Dim WithEvents Form1 As System.Windows.Forms.Form

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Private Sub InitializeComponent()
        Me.cmdEventLog = New System.Windows.Forms.Button
        Me.txtMessage = New System.Windows.Forms.TextBox
        Me.cmdFile = New System.Windows.Forms.Button
        Me.Label1 = New System.Windows.Forms.Label
        Me.SuspendLayout()
        '
        'cmdEventLog
        '
        Me.cmdEventLog.Location = New System.Drawing.Point(240, 116)
        Me.cmdEventLog.Name = "cmdEventLog"
        Me.cmdEventLog.Size = New System.Drawing.Size(124, 23)
        Me.cmdEventLog.TabIndex = 0
        Me.cmdEventLog.Text = "Write to Event Log"
        '
        'txtMessage
        '
        Me.txtMessage.Location = New System.Drawing.Point(24, 36)
        Me.txtMessage.Multiline = True
        Me.txtMessage.Name = "txtMessage"
        Me.txtMessage.Size = New System.Drawing.Size(368, 60)
        Me.txtMessage.TabIndex = 2
        Me.txtMessage.Text = "Sample Log Message"
        '
        'cmdFile
        '
        Me.cmdFile.Location = New System.Drawing.Point(56, 116)
        Me.cmdFile.Name = "cmdFile"
        Me.cmdFile.Size = New System.Drawing.Size(124, 23)
        Me.cmdFile.TabIndex = 1
        Me.cmdFile.Text = "Write to File"
        '
        'Label1
        '
        Me.Label1.Location = New System.Drawing.Point(24, 16)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(100, 16)
        Me.Label1.TabIndex = 3
        Me.Label1.Text = "Message to Log:"
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(416, 157)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.Label1, Me.txtMessage, Me.cmdFile, Me.cmdEventLog})
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "Form1"
        Me.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Hide
        Me.Text = "WinLogger"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub cmdEventLog_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdEventLog.Click
        'Use the EventLogger class and place a new entry in the Windows Event Log.
        Try
            Dim Log As New Logging.EventLogger("Logging Sample App")
            Log.LogMinCharacters = False
            Log.WriteLog(Me.txtMessage.Text, Diagnostics.EventLogEntryType.Information)
            MsgBox("Event Log entry written!", , "WinLogger")
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub cmdFile_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdFile.Click
        'Use the FileLogger class and place new entry in a text log file.
        Try
            Dim Log As New Logging.FileLogger("LogFile.txt")
            Log.LogMinCharacters = True
            Log.WriteLog(Me.txtMessage.Text, Diagnostics.EventLogEntryType.Information)
            MsgBox("Log file entry written!", , "WinLogger")
        Catch ex As Exception
            MsgBox(ex.Message, MsgBoxStyle.Critical)
        End Try
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    End Sub
End Class
