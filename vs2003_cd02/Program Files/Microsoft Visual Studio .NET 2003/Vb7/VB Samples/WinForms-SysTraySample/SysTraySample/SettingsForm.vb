Imports System.Drawing
Imports System.Windows.Forms
Imports System.ComponentModel

Public Class SettingsForm
    Inherits System.Windows.Forms.Form

    Public Sub New()
        MyBase.New()

        'This call is required by the Win Form Designer.
        InitializeComponent()

        'TODO: Add any initialization after the InitializeComponent() call.
    End Sub

#Region " Windows Form Designer generated code "

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.Container
    Private WithEvents Button1 As System.Windows.Forms.Button
    Private WithEvents Label1 As System.Windows.Forms.Label

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub


    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Private Sub InitializeComponent()
        Me.Button1 = New System.Windows.Forms.Button
        Me.Label1 = New System.Windows.Forms.Label
        Me.SuspendLayout()
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(196, 128)
        Me.Button1.Name = "Button1"
        Me.Button1.TabIndex = 1
        Me.Button1.Text = "Close"
        '
        'Label1
        '
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 16.0!)
        Me.Label1.Location = New System.Drawing.Point(12, 20)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(264, 92)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "This form would contain the settings options."
        '
        'SettingsForm
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(292, 173)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.Button1, Me.Label1})
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "SettingsForm"
        Me.Text = "Settings Form"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        'Hide the form - it will get closed by the parent.
        Me.Visible = False
    End Sub

    Private Sub SettingsForm_Closing(ByVal sender As Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles MyBase.Closing
        'To stop closing the form...
        e.Cancel = True
        'Just hide it - the parent will close it.
        Me.Visible = False
    End Sub
End Class
