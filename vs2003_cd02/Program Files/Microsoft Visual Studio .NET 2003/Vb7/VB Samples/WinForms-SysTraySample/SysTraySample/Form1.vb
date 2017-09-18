Imports System.ComponentModel
Imports System.Drawing
Imports System.Windows.Forms
Imports System.Resources


Public Class Form1
    Inherits System.Windows.Forms.Form

#Region " Windows Form Designer generated code "

    'Required by the Windows Form Designer
    Private WithEvents NotifyIcon As System.Windows.Forms.NotifyIcon

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub
    Private components As System.ComponentModel.IContainer


    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Me.NotifyIcon = New System.Windows.Forms.NotifyIcon(Me.components)
        '
        'NotifyIcon
        '
        Me.NotifyIcon.Text = ""
        Me.NotifyIcon.Visible = True
        '
        'Form1
        '
        Me.AccessibleRole = System.Windows.Forms.AccessibleRole.None
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(320, 248)
        Me.ControlBox = False
        Me.Enabled = False
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "Form1"
        Me.Opacity = 0
        Me.ShowInTaskbar = False
        Me.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Hide
        Me.StartPosition = System.Windows.Forms.FormStartPosition.Manual

    End Sub

#End Region

    'NotifyIcon icons.

    Private mSmileIcon As New Icon(GetType(Form1).Assembly.GetManifestResourceStream("SysTraySample.face02.ico"))
    Private mFrownIcon As New Icon(GetType(Form1).Assembly.GetManifestResourceStream("SysTraySample.face04.ico"))
    Private mSmileDisplayed As Boolean
    Private mSettingsForm As SettingsForm
    Private mMenuItems(3) As MenuItem


    Public Sub New()
        MyBase.New()

        'This call is required by the Win Form Designer.
        InitializeComponent()

        'TODO: Add any initialization after the InitializeComponent() call.

        'This form isn't used directly so hide it immediately.
        Me.Hide()

        'Setup the tray icon.
        Initializenotifyicon()
    End Sub

    Private Sub Initializenotifyicon()
        'Setup the default icon.
        NotifyIcon = New System.Windows.Forms.NotifyIcon
        NotifyIcon.Icon = mSmileIcon
        NotifyIcon.Text = "Right Click for the menu"
        NotifyIcon.Visible = True
        mSmileDisplayed = True

        'Insert all MenuItem objects into an array and add them to
        'the context menu simultaneously.
        mMenuItems(0) = New MenuItem("Show Form...", New EventHandler(AddressOf Me.ShowFormSelect))
        mMenuItems(0).DefaultItem = True
        mMenuItems(1) = New MenuItem("Toggle Image", New EventHandler(AddressOf Me.ToggleImageSelect))
        mMenuItems(2) = New MenuItem("-")
        mMenuItems(3) = New MenuItem("Exit", New EventHandler(AddressOf Me.ExitSelect))
        Dim notifyiconMnu As ContextMenu = New ContextMenu(mMenuItems)
        NotifyIcon.ContextMenu = notifyiconMnu
    End Sub

    Private Sub ShowFormSelect(ByVal sender As Object, ByVal e As System.EventArgs)
        'Display SettingsForm dialog if it is not already displayed.
        If mSettingsForm Is Nothing Then
            mSettingsForm = New SettingsForm
            mSettingsForm.ShowDialog()
        Else
            If mSettingsForm.Visible = False Then
                mSettingsForm.Visible = True
            End If
            mSettingsForm.Activate()
        End If
    End Sub

    Private Sub ToggleImageSelect(ByVal sender As Object, ByVal e As System.EventArgs)
        'Called when the user selects the 'Toggle Image' context menu.

        'Determine which icon is currently visible and switch it.
        If mSmileDisplayed Then
            'Called when the user selects the 'Show Form' context menu.
            NotifyIcon.Icon = mFrownIcon
            NotifyIcon.Text = "Sad"
            mSmileDisplayed = False
        Else
            NotifyIcon.Icon = mSmileIcon
            NotifyIcon.Text = "Happy"
            mSmileDisplayed = True
        End If

    End Sub

    Private Sub ExitSelect(ByVal sender As Object, ByVal e As System.EventArgs)
        'Called when the user selects the 'Exit' context menu.

        'Hide the tray icon.
        NotifyIcon.Visible = False

        'Close up.
        Me.Close()
        Application.Exit()
    End Sub

    Private Sub NotifyIcon_DoubleClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles NotifyIcon.DoubleClick
        'Show the form when tray icon is dbl-clicked.
        ShowFormSelect(sender, e)
    End Sub

    Private Sub NotifyIcon_MouseDown(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles NotifyIcon.MouseDown
        If (e.Button = MouseButtons.Right) And Not mSettingsForm Is Nothing Then
            'If form is visible, then disable the "Show Form" context menu else enable it. 
            mMenuItems(0).Enabled = Not mSettingsForm.Visible
            mSettingsForm.Activate()
        End If
    End Sub

    Public Shared Sub Main()
        Dim initForm As New Form1
        Application.Run()
    End Sub
End Class
