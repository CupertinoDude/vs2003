'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Sample Description:	
'	This sample will fire 10 user defined events MyBasicCustomEventVB1 from the 
'   MyBasicCustomCategoryVB1 category. It will also fire a group of 4 events which 
'   comprise a simulation of related events using the CorrelationID parameter. 
'
'   You will need to select the following COM references under Projects|References... 
'
'       "Microsoft Visual Studio Analyzer Automatable In-process Event Creator 2002 Type Library"
'   This selection allows you to create the IEC (In-proc Event Creator) object 
'   so that you can begin a VS Analyzer session and fire VS Analyzer events.   
'       "Microsoft Visual Studio Analyzer Automatable Event Source Installer 2002 Type Library"
'   This selection allows you to create the ESI (Event Source Installer) objects 
'   so that you can check to see if the Event Source is being registered beforehand.
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Class frmBasicEventSrcApp
    Inherits System.Windows.Forms.Form

    'Reference to the helper CVSA class.
    Protected objVSAnalyzerEventFire As BasicEventSrcApp.CVSAnalyzerEventFire

#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()
        'This call is required by the Windows Form Designer.
        InitializeComponent()

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

    Friend WithEvents cmdCallSimulation As System.Windows.Forms.Button
    Friend WithEvents cmdCustomEvents As System.Windows.Forms.Button
    Friend WithEvents label1 As System.Windows.Forms.Label

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.Container

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.cmdCallSimulation = New System.Windows.Forms.Button()
        Me.cmdCustomEvents = New System.Windows.Forms.Button()
        Me.label1 = New System.Windows.Forms.Label()
        Me.SuspendLayout()

        Me.cmdCallSimulation.Location = New System.Drawing.Point(8, 40)
        Me.cmdCallSimulation.Size = New System.Drawing.Size(128, 24)
        Me.cmdCallSimulation.TabIndex = 1
        Me.cmdCallSimulation.Text = "Call Simulation Events"
        Me.cmdCallSimulation.Name = "cmdCallSimulation"

        Me.cmdCustomEvents.Location = New System.Drawing.Point(8, 72)
        Me.cmdCustomEvents.Size = New System.Drawing.Size(128, 24)
        Me.cmdCustomEvents.TabIndex = 2
        Me.cmdCustomEvents.Text = "Custom Data Events"
        Me.cmdCustomEvents.Name = "cmdCustomEvents"

        Me.label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25, System.Drawing.FontStyle.Bold)
        Me.label1.Location = New System.Drawing.Point(8, 8)
        Me.label1.Size = New System.Drawing.Size(104, 24)
        Me.label1.TabIndex = 3
        Me.label1.Text = "Click to fire:"
        Me.label1.Name = "label1"

        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(147, 104)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.label1, Me.cmdCustomEvents, Me.cmdCallSimulation})
        Me.Text = "frmBasicEventSrcApp"
        Me.Name = "frmBasicEventSrcApp"

        Me.ResumeLayout(False)

    End Sub

#End Region

    Protected Overrides Sub OnLoad(ByVal e As System.EventArgs)
        'Add any initialization after the InitializeComponent() call
        objVSAnalyzerEventFire = New BasicEventSrcApp.CVSAnalyzerEventFire()
        If (objVSAnalyzerEventFire.IsSourceRegistered()) Then
            'Start a session.
            objVSAnalyzerEventFire.BeginSession()
        Else
            MsgBox("BasicEventSrcVB is not registered! Use BasicEventSrcSetup to register it!")
            System.Windows.Forms.Application.Exit()
        End If
    End Sub

    Protected Overrides Sub OnClosed(ByVal e As System.EventArgs)
        If (Not IsNothing(objVSAnalyzerEventFire)) Then
            'End the session.
            objVSAnalyzerEventFire.EndSession()
            'Release the reference to the CVSAnalyzerEventFire object
            objVSAnalyzerEventFire = Nothing
        End If
    End Sub

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    'Purpose:   Fires a set of 4 stock events comprising the call simualtion.
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Private Sub cmdCallSimulation_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdCallSimulation.Click
        'Fire the simple simulation of 4 events.
        objVSAnalyzerEventFire.FireSimulation()
    End Sub

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    'Purpose:   Fires the same custom event (MyCustom1) 10 times
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Private Sub cmdCustomEvents_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdCustomEvents.Click
        'Fire 10 custom events.
        objVSAnalyzerEventFire.FireCustomEvent()
    End Sub

End Class
