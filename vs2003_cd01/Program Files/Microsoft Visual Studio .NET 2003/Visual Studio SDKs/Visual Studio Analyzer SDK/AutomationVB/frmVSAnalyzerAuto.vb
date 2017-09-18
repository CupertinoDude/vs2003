''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Sample Description:	
'	This sample uses Automation to create a VS Analyzer project in 
'	your temp directory (the one pointed by the environment 
'	variable TEMP). This sample will open a VS Shell in order to
'	create the new project. The project will connect to the local 
'	machine. It will have one filter and one event log. It will start 
'	recording events immediately and will show a message asking the 
'	user to press a key in order to terminate it. Upon termination 
'	the sample will stop recording events, save the project, and
'	exit the VS Shell. 
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Class frmVSAnalyzerAuto
    Inherits System.Windows.Forms.Form

    Private m_objVSAnalyzerAuto As New AutomationVB.clsVSAnalyzerAuto()

#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call

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
    Friend WithEvents cmdStart As System.Windows.Forms.Button
    Friend WithEvents cmdExit As System.Windows.Forms.Button
    Friend WithEvents cmdStop As System.Windows.Forms.Button
    Friend WithEvents label1 As System.Windows.Forms.Label
    Friend WithEvents cmdLaunch As System.Windows.Forms.Button
    Friend WithEvents textSummary As System.Windows.Forms.TextBox

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.Container

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.cmdLaunch = New System.Windows.Forms.Button()
        Me.cmdExit = New System.Windows.Forms.Button()
        Me.textSummary = New System.Windows.Forms.TextBox()
        Me.cmdStop = New System.Windows.Forms.Button()
        Me.label1 = New System.Windows.Forms.Label()
        Me.cmdStart = New System.Windows.Forms.Button()

        Me.SuspendLayout()

        Me.cmdLaunch.Location = New System.Drawing.Point(8, 8)
        Me.cmdLaunch.Size = New System.Drawing.Size(120, 24)
        Me.cmdLaunch.TabIndex = 0
        Me.cmdLaunch.Text = "Launch Analyzer"
	Me.cmdLaunch.Name = "cmdLaunch"

        Me.cmdExit.Enabled = False
        Me.cmdExit.Location = New System.Drawing.Point(8, 104)
        Me.cmdExit.Size = New System.Drawing.Size(120, 24)
        Me.cmdExit.TabIndex = 3
        Me.cmdExit.Text = "Exit Analyzer"
        Me.cmdExit.Name = "cmdExit"

        Me.textSummary.AcceptsReturn = True
        Me.textSummary.Location = New System.Drawing.Point(136, 24)
        Me.textSummary.Multiline = True
        Me.textSummary.ReadOnly = True
        Me.textSummary.Size = New System.Drawing.Size(264, 104)
        Me.textSummary.TabIndex = 4
        Me.textSummary.Text = ""
        Me.textSummary.Name = "textSummary"

        Me.cmdStop.Enabled = False
        Me.cmdStop.Location = New System.Drawing.Point(8, 72)
        Me.cmdStop.Size = New System.Drawing.Size(120, 24)
        Me.cmdStop.TabIndex = 2
        Me.cmdStop.Text = "Stop Recording"
        Me.cmdStop.Name = "cmdStop"

        Me.label1.Location = New System.Drawing.Point(136, 8)
        Me.label1.Size = New System.Drawing.Size(120, 16)
        Me.label1.TabIndex = 5
        Me.label1.Text = "Recording Summary:"
        Me.label1.Name = "label1"

        Me.cmdStart.Enabled = False
        Me.cmdStart.Location = New System.Drawing.Point(8, 40)
        Me.cmdStart.Size = New System.Drawing.Size(120, 24)
        Me.cmdStart.TabIndex = 1
        Me.cmdStart.Text = "Start Recording"
        Me.cmdStart.Name = "cmdStart"

        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(403, 136)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.label1, Me.textSummary, Me.cmdLaunch, Me.cmdExit, Me.cmdStop, Me.cmdStart})
        Me.Text = "Visual Studio Analyzer Automation Sample"
	Me.Name = "frmVSAnalyzerAuto"

        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub cmdLaunch_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdLaunch.Click
        m_objVSAnalyzerAuto.CreateProject()
        m_objVSAnalyzerAuto.CreateProjectItems()
        cmdLaunch().Enabled = False
        cmdStart().Enabled = True
    End Sub

    Private Sub cmdStart_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdStart.Click
        m_objVSAnalyzerAuto.StartRecordingEvents()
        cmdStart().Enabled = False
        cmdStop().Enabled = True
    End Sub

    Private Sub cmdStop_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdStop.Click
        m_objVSAnalyzerAuto.StopRecordingEvents()
        textSummary().Text = m_objVSAnalyzerAuto.GetRecordingSummary()
        cmdStop().Enabled = False
        cmdExit().Enabled = True
    End Sub

    Private Sub cmdExit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdExit.Click
        m_objVSAnalyzerAuto.CloseProject()
        Windows.Forms.Application.Exit()
    End Sub


End Class
