Imports System.Drawing
Imports System.Windows.Forms

'
' A simple form with one button.
' We're exposing this Form to COM since the base Form class is marked
' ComVisible(false).
'
Public Class Form1
    Inherits Form

    Public Sub New()
        MyBase.New()
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

    Public WithEvents Button1 As MyButton
    Public WithEvents Label1 As Label

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.Container

    Private Sub InitializeComponent()
        Label1 = New Label()
        Label1.Size = New System.Drawing.Size(292, 60)
        Label1.Location = New System.Drawing.Point(0, 0)

        Button1 = New MyButton()
        Button1.Location = New System.Drawing.Point(64, 72)
        Button1.Size = New System.Drawing.Size(152, 80)
        Button1.TabIndex = 0
        Button1.Text = "button1"
		Button1.Visible = false
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(292, 273)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Button1, Label1})
        Me.Text = "Form1"
    End Sub

    Private Sub Form1_Closing(ByVal sender As Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles MyBase.Closing
    	if Label1.Text <> "Close Selected" then
    		Label1.Text = "Close Selected"
    	else
    		Label1.Text = ""
    	end if
		e.Cancel = True
    End Sub

End Class

'
'	Derived MyButton from System.Windows.Forms.Button
'	This makes the public members on Button visible to COM through
'	its class interface.
'
Public Class MyButton
    Inherits Button

End Class
