
Imports System
Imports System.Drawing
Imports System.Collections
Imports System.ComponentModel
Imports System.Windows.Forms
Imports System.Data

Namespace WindowsApplication1

    Public Class MainForm
        Inherits System.Windows.Forms.Form

        ' ServiceControllerManager is in charge of the System Services management using the ServiceController component.
        Private ServiceControlMgr As New ServiceControllerManager
        'DriverControllerManager manage the System drivers via the ServiceController component.
        Private DriverControlMgr As New DriverControllerManager
        'ProcessControllerManager is destined to the control of the system Processes via the Process component.
        Private ProcessControlMgr As New ProcessControllerManager

#Region " Windows Form Designer generated code "
        Private Components As System.ComponentModel.Container
        Private WithEvents OpenFile As System.Windows.Forms.OpenFileDialog

        'Processes info listBox
        Private WithEvents ListPcs As System.Windows.Forms.ListBox
        'Running processes listBox
        Private WithEvents ListPcsRun As System.Windows.Forms.ListBox

        'Paused drivers listBox
        Private WithEvents ListDrvPaused As System.Windows.Forms.ListBox
        Private WithEvents Label7 As System.Windows.Forms.Label
        Private WithEvents Label5 As System.Windows.Forms.Label

        'Stopped drivers list
        Private WithEvents ListDrvStopped As System.Windows.Forms.ListBox
        'Running drivers list
        Private WithEvents ListDrvRun As System.Windows.Forms.ListBox
        'Close app. button

        'Load data button
        Private WithEvents ButtonLoadData As System.Windows.Forms.Button
        Private WithEvents Label4 As System.Windows.Forms.Label

        'Stopped services button
        Private WithEvents ListSrvStopped As System.Windows.Forms.ListBox
        'Paused services List
        Private WithEvents ListSrvPaused As System.Windows.Forms.ListBox
        Private WithEvents Label1 As System.Windows.Forms.Label

        'Running services list
        Private WithEvents ListSrvRun As System.Windows.Forms.ListBox

        'User classes :

        Private WithEvents ButtonClose As System.Windows.Forms.Button
        Private WithEvents ButtonStartProcess As System.Windows.Forms.Button

        Public Sub New()
            InitializeComponent()
        End Sub 'New

        'Form overrides dispose to clean up the component list.
        Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
            If disposing Then
                If Not (Components Is Nothing) Then
                    Components.Dispose()
                End If
            End If
            MyBase.Dispose(disposing)
        End Sub
        Private WithEvents label9 As System.Windows.Forms.Label
        Private WithEvents label8 As System.Windows.Forms.Label
        Private WithEvents label6 As System.Windows.Forms.Label
        Private WithEvents textMachineName As System.Windows.Forms.TextBox
        Private WithEvents label3 As System.Windows.Forms.Label
        Private WithEvents label2 As System.Windows.Forms.Label
        Private WithEvents tabProcess As System.Windows.Forms.TabPage
        Private WithEvents tabDrivers As System.Windows.Forms.TabPage
        Private WithEvents tabServices As System.Windows.Forms.TabPage
        Private WithEvents tabControl1 As System.Windows.Forms.TabControl

        Private Sub InitializeComponent()
            Me.Label4 = New System.Windows.Forms.Label
            Me.Label5 = New System.Windows.Forms.Label
            Me.label6 = New System.Windows.Forms.Label
            Me.Label7 = New System.Windows.Forms.Label
            Me.Label1 = New System.Windows.Forms.Label
            Me.label2 = New System.Windows.Forms.Label
            Me.label3 = New System.Windows.Forms.Label
            Me.tabDrivers = New System.Windows.Forms.TabPage
            Me.ListDrvPaused = New System.Windows.Forms.ListBox
            Me.ListDrvStopped = New System.Windows.Forms.ListBox
            Me.ListDrvRun = New System.Windows.Forms.ListBox
            Me.tabControl1 = New System.Windows.Forms.TabControl
            Me.tabServices = New System.Windows.Forms.TabPage
            Me.ListSrvStopped = New System.Windows.Forms.ListBox
            Me.ListSrvPaused = New System.Windows.Forms.ListBox
            Me.ListSrvRun = New System.Windows.Forms.ListBox
            Me.tabProcess = New System.Windows.Forms.TabPage
            Me.label9 = New System.Windows.Forms.Label
            Me.label8 = New System.Windows.Forms.Label
            Me.ListPcs = New System.Windows.Forms.ListBox
            Me.ListPcsRun = New System.Windows.Forms.ListBox
            Me.ButtonStartProcess = New System.Windows.Forms.Button
            Me.OpenFile = New System.Windows.Forms.OpenFileDialog
            Me.ButtonClose = New System.Windows.Forms.Button
            Me.textMachineName = New System.Windows.Forms.TextBox
            Me.ButtonLoadData = New System.Windows.Forms.Button
            Me.tabDrivers.SuspendLayout()
            Me.tabControl1.SuspendLayout()
            Me.tabServices.SuspendLayout()
            Me.tabProcess.SuspendLayout()
            Me.SuspendLayout()
            '
            'Label4
            '
            Me.Label4.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
            Me.Label4.Location = New System.Drawing.Point(8, 416)
            Me.Label4.Name = "Label4"
            Me.Label4.Size = New System.Drawing.Size(136, 16)
            Me.Label4.TabIndex = 1
            Me.Label4.Text = "Machine Name"
            '
            'Label5
            '
            Me.Label5.BackColor = System.Drawing.Color.Transparent
            Me.Label5.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
            Me.Label5.Location = New System.Drawing.Point(8, 120)
            Me.Label5.Name = "Label5"
            Me.Label5.Size = New System.Drawing.Size(152, 16)
            Me.Label5.TabIndex = 2
            Me.Label5.Text = "Stopped Drivers"
            '
            'label6
            '
            Me.label6.BackColor = System.Drawing.Color.Transparent
            Me.label6.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
            Me.label6.Location = New System.Drawing.Point(8, 0)
            Me.label6.Name = "label6"
            Me.label6.Size = New System.Drawing.Size(144, 16)
            Me.label6.TabIndex = 3
            Me.label6.Text = "Running Drivers"
            '
            'Label7
            '
            Me.Label7.BackColor = System.Drawing.Color.Transparent
            Me.Label7.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
            Me.Label7.Location = New System.Drawing.Point(8, 232)
            Me.Label7.Name = "Label7"
            Me.Label7.Size = New System.Drawing.Size(152, 16)
            Me.Label7.TabIndex = 4
            Me.Label7.Text = "Paused Drivers"
            '
            'Label1
            '
            Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
            Me.Label1.Location = New System.Drawing.Point(8, 0)
            Me.Label1.Name = "Label1"
            Me.Label1.Size = New System.Drawing.Size(224, 16)
            Me.Label1.TabIndex = 1
            Me.Label1.Text = "Running Services"
            '
            'label2
            '
            Me.label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
            Me.label2.Location = New System.Drawing.Point(16, 232)
            Me.label2.Name = "label2"
            Me.label2.Size = New System.Drawing.Size(232, 16)
            Me.label2.TabIndex = 3
            Me.label2.Text = "Paused Services"
            '
            'label3
            '
            Me.label3.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
            Me.label3.Location = New System.Drawing.Point(8, 112)
            Me.label3.Name = "label3"
            Me.label3.Size = New System.Drawing.Size(177, 16)
            Me.label3.TabIndex = 5
            Me.label3.Text = "Stopped Services"
            '
            'tabDrivers
            '
            Me.tabDrivers.Controls.AddRange(New System.Windows.Forms.Control() {Me.ListDrvPaused, Me.Label7, Me.label6, Me.Label5, Me.ListDrvStopped, Me.ListDrvRun})
            Me.tabDrivers.Location = New System.Drawing.Point(4, 22)
            Me.tabDrivers.Name = "tabDrivers"
            Me.tabDrivers.Size = New System.Drawing.Size(512, 373)
            Me.tabDrivers.TabIndex = 1
            Me.tabDrivers.Text = "Drivers"
            '
            'ListDrvPaused
            '
            Me.ListDrvPaused.Anchor = System.Windows.Forms.AnchorStyles.None
            Me.ListDrvPaused.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
            Me.ListDrvPaused.Location = New System.Drawing.Point(8, 247)
            Me.ListDrvPaused.Name = "ListDrvPaused"
            Me.ListDrvPaused.Size = New System.Drawing.Size(488, 95)
            Me.ListDrvPaused.TabIndex = 5
            '
            'ListDrvStopped
            '
            Me.ListDrvStopped.Anchor = System.Windows.Forms.AnchorStyles.None
            Me.ListDrvStopped.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
            Me.ListDrvStopped.Location = New System.Drawing.Point(8, 143)
            Me.ListDrvStopped.Name = "ListDrvStopped"
            Me.ListDrvStopped.Size = New System.Drawing.Size(488, 82)
            Me.ListDrvStopped.TabIndex = 1
            '
            'ListDrvRun
            '
            Me.ListDrvRun.Anchor = System.Windows.Forms.AnchorStyles.None
            Me.ListDrvRun.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
            Me.ListDrvRun.Location = New System.Drawing.Point(8, 23)
            Me.ListDrvRun.Name = "ListDrvRun"
            Me.ListDrvRun.Size = New System.Drawing.Size(488, 82)
            Me.ListDrvRun.TabIndex = 0
            '
            'tabControl1
            '
            Me.tabControl1.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
                        Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
            Me.tabControl1.Controls.AddRange(New System.Windows.Forms.Control() {Me.tabServices, Me.tabDrivers, Me.tabProcess})
            Me.tabControl1.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
            Me.tabControl1.Location = New System.Drawing.Point(0, 9)
            Me.tabControl1.Name = "tabControl1"
            Me.tabControl1.SelectedIndex = 0
            Me.tabControl1.Size = New System.Drawing.Size(520, 399)
            Me.tabControl1.TabIndex = 0
            Me.tabControl1.Text = "tabControl1"
            '
            'tabServices
            '
            Me.tabServices.Controls.AddRange(New System.Windows.Forms.Control() {Me.label3, Me.ListSrvStopped, Me.label2, Me.ListSrvPaused, Me.Label1, Me.ListSrvRun})
            Me.tabServices.Location = New System.Drawing.Point(4, 22)
            Me.tabServices.Name = "tabServices"
            Me.tabServices.Size = New System.Drawing.Size(512, 373)
            Me.tabServices.TabIndex = 0
            Me.tabServices.Text = "Services"
            '
            'ListSrvStopped
            '
            Me.ListSrvStopped.Anchor = System.Windows.Forms.AnchorStyles.None
            Me.ListSrvStopped.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
            Me.ListSrvStopped.Location = New System.Drawing.Point(48, 140)
            Me.ListSrvStopped.Name = "ListSrvStopped"
            Me.ListSrvStopped.Size = New System.Drawing.Size(416, 82)
            Me.ListSrvStopped.TabIndex = 4
            '
            'ListSrvPaused
            '
            Me.ListSrvPaused.Anchor = System.Windows.Forms.AnchorStyles.None
            Me.ListSrvPaused.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
            Me.ListSrvPaused.Location = New System.Drawing.Point(48, 260)
            Me.ListSrvPaused.Name = "ListSrvPaused"
            Me.ListSrvPaused.Size = New System.Drawing.Size(416, 95)
            Me.ListSrvPaused.TabIndex = 2
            '
            'ListSrvRun
            '
            Me.ListSrvRun.Anchor = System.Windows.Forms.AnchorStyles.None
            Me.ListSrvRun.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
            Me.ListSrvRun.Location = New System.Drawing.Point(48, 28)
            Me.ListSrvRun.Name = "ListSrvRun"
            Me.ListSrvRun.Size = New System.Drawing.Size(416, 82)
            Me.ListSrvRun.TabIndex = 0
            '
            'tabProcess
            '
            Me.tabProcess.Controls.AddRange(New System.Windows.Forms.Control() {Me.label9, Me.label8, Me.ListPcs, Me.ListPcsRun})
            Me.tabProcess.Location = New System.Drawing.Point(4, 22)
            Me.tabProcess.Name = "tabProcess"
            Me.tabProcess.Size = New System.Drawing.Size(512, 373)
            Me.tabProcess.TabIndex = 2
            Me.tabProcess.Text = "Process"
            '
            'label9
            '
            Me.label9.Location = New System.Drawing.Point(264, 8)
            Me.label9.Name = "label9"
            Me.label9.Size = New System.Drawing.Size(128, 16)
            Me.label9.TabIndex = 3
            Me.label9.Text = "Process Properties"
            '
            'label8
            '
            Me.label8.Location = New System.Drawing.Point(24, 8)
            Me.label8.Name = "label8"
            Me.label8.Size = New System.Drawing.Size(128, 16)
            Me.label8.TabIndex = 2
            Me.label8.Text = "Running Process"
            '
            'ListPcs
            '
            Me.ListPcs.Anchor = System.Windows.Forms.AnchorStyles.None
            Me.ListPcs.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
            Me.ListPcs.Location = New System.Drawing.Point(264, 31)
            Me.ListPcs.Name = "ListPcs"
            Me.ListPcs.ScrollAlwaysVisible = True
            Me.ListPcs.Size = New System.Drawing.Size(224, 329)
            Me.ListPcs.TabIndex = 1
            '
            'ListPcsRun
            '
            Me.ListPcsRun.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
            Me.ListPcsRun.Location = New System.Drawing.Point(8, 40)
            Me.ListPcsRun.Name = "ListPcsRun"
            Me.ListPcsRun.Size = New System.Drawing.Size(200, 329)
            Me.ListPcsRun.Sorted = True
            Me.ListPcsRun.TabIndex = 0
            '
            'ButtonStartProcess
            '
            Me.ButtonStartProcess.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
            Me.ButtonStartProcess.Location = New System.Drawing.Point(152, 448)
            Me.ButtonStartProcess.Name = "ButtonStartProcess"
            Me.ButtonStartProcess.Size = New System.Drawing.Size(128, 24)
            Me.ButtonStartProcess.TabIndex = 5
            Me.ButtonStartProcess.Text = "&Start a Process"
            '
            'OpenFile
            '
            '
            'ButtonClose
            '
            Me.ButtonClose.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
            Me.ButtonClose.Location = New System.Drawing.Point(296, 448)
            Me.ButtonClose.Name = "ButtonClose"
            Me.ButtonClose.Size = New System.Drawing.Size(136, 24)
            Me.ButtonClose.TabIndex = 4
            Me.ButtonClose.Text = "&Close Application"
            '
            'textMachineName
            '
            Me.textMachineName.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
            Me.textMachineName.Location = New System.Drawing.Point(152, 416)
            Me.textMachineName.Name = "textMachineName"
            Me.textMachineName.Size = New System.Drawing.Size(280, 20)
            Me.textMachineName.TabIndex = 2
            Me.textMachineName.Text = ""
            '
            'ButtonLoadData
            '
            Me.ButtonLoadData.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!)
            Me.ButtonLoadData.Location = New System.Drawing.Point(16, 448)
            Me.ButtonLoadData.Name = "ButtonLoadData"
            Me.ButtonLoadData.Size = New System.Drawing.Size(120, 24)
            Me.ButtonLoadData.TabIndex = 3
            Me.ButtonLoadData.Text = "&Load Data"
            '
            'MainForm
            '
            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.ClientSize = New System.Drawing.Size(568, 485)
            Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.ButtonStartProcess, Me.ButtonClose, Me.ButtonLoadData, Me.textMachineName, Me.Label4, Me.tabControl1})
            Me.Name = "MainForm"
            Me.Text = "Process Controller"
            Me.tabDrivers.ResumeLayout(False)
            Me.tabControl1.ResumeLayout(False)
            Me.tabServices.ResumeLayout(False)
            Me.tabProcess.ResumeLayout(False)
            Me.ResumeLayout(False)

        End Sub 'InitializeComponent

#End Region

        ' The event assigned to the openFile control.
        Private Sub openFile_FileOk(ByVal Sender As Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles OpenFile.FileOk
            If Not (ProcessControlMgr Is Nothing) Then
                Try
                    'Try to start a new process using the Process component.
                    ProcessControlMgr.StartProcess(OpenFile.FileName)
                Catch
                End Try
            End If 'Its possible since one might not have the permission to start a process on a certain machine.
        End Sub 'openFile_FileOk

        ' Call the method that fills up the services, drivers and processes.
        Private Sub ButtonLoadData_Click(ByVal Sender As Object, ByVal e As System.EventArgs) Handles ButtonLoadData.Click
            ButtonStartProcess.Enabled = True
            LoadData()
        End Sub 'ButtonLoadData_Click

        '  Loading all services, Drivers and Processes running on the selected machine.
        Private Sub LoadData()

            Dim TempMachineName As String = GetMachineName()
            'Clear up the serviceManager.
            If Not (ServiceControlMgr Is Nothing) Then
                ServiceControlMgr.Clear()
            End If
            ServiceControlMgr = Nothing
            Try
                ServiceControlMgr = New ServiceControllerManager(ListSrvRun, ListSrvStopped, ListSrvPaused, TempMachineName)
            Catch ex As Exception
                MsgBox(ex.Message, MsgBoxStyle.Information, "MainForm.vb")
            End Try

            'Clear up the driver manager.
            If Not (DriverControlMgr Is Nothing) Then
                DriverControlMgr.Clear()
            End If
            DriverControlMgr = Nothing
            Try
                DriverControlMgr = New DriverControllerManager(ListDrvRun, ListDrvStopped, ListDrvPaused, TempMachineName)
            Catch ex As Exception
                MsgBox(ex.Message, MsgBoxStyle.Information, "MainForm.vb")
            End Try

            'Clear the process manager.
            If Not (ProcessControlMgr Is Nothing) Then
                ProcessControlMgr.Clear()
            End If
            ProcessControlMgr = Nothing
            Try
                ProcessControlMgr = New ProcessControllerManager(ListPcsRun, ListPcs, TempMachineName)
            Catch ex As Exception
                MsgBox(ex.Message, MsgBoxStyle.Information, "MainForm.vb")
            End Try
        End Sub 'LoadData

        ' Returns the name of the local machine.
        Private Function GetLocalMachine() As String
            Return System.Environment.MachineName
        End Function 'GetLocalMachine

        ' Check wheter the selected machine exists in the Domain.
        ' You might want to change this to more complex code for machine name check.
        Private Function GetMachineName() As String
            If textMachineName.Text.Equals("") Then
                'machineName field is empty, take the local machine	
                textMachineName.Text = GetLocalMachine()
                textMachineName.Focus()
            End If
            Return textMachineName.Text
        End Function 'GetMachineName

        'Exit the app.
        Private Sub ButtonClose_Click(ByVal Sender As System.Object, ByVal e As System.EventArgs) Handles ButtonClose.Click
            'Make the Window "Fade away".
            Dim d As Double
            For d = 1 To 0 + 0.2 Step -0.2
                System.Threading.Thread.Sleep(50)
                Application.DoEvents()
                Me.Opacity = d
                Me.Refresh()
            Next d
            Environment.Exit(0)
        End Sub

        'Launched Open File Dialouge.
        Private Sub ButtonStartProcess_Click(ByVal Sender As System.Object, ByVal e As System.EventArgs) Handles ButtonStartProcess.Click
            OpenFile.Filter = "exe files (*.exe)|*.exe|bat files (*.bat)|*.bat|com files (*.com)|*.com"
            OpenFile.ShowDialog()
        End Sub

    End Class 'MainForm

End Namespace 'WindowsApplication1