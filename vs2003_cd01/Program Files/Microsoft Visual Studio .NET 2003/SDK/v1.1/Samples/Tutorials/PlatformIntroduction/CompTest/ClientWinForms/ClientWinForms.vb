Option Explicit
Option Strict

Imports System
Imports System.Collections
Imports System.Drawing
Imports System.Threading
Imports System.Windows.Forms

Imports CompCS
Imports CompVB
Imports CompVC

Public Module modmain
	Public Const vbCrLf as String = Microsoft.VisualBasic.ControlChars.CrLf
	Public Class Client

		Inherits Form

		'Required by the Windows Forms Designer
		Private components As System.ComponentModel.Container
		Private Button2 As System.Windows.Forms.Button
		Private Button1 As System.Windows.Forms.Button
		Private Label1 As System.Windows.Forms.Label

		Public Sub New()
			MyBase.New
			InitForm ' Required by Windows Forms Designer.
		End Sub


		'Form overrides Dispose(Boolean) to clean up component list
		'(this Form has no components), then disposes of the base class
		Protected Overloads Overrides Sub Dispose(disposing As Boolean)
			If disposing Then
				If Not (components Is Nothing) Then 
					components.Dispose()
				End If
			End If
			MyBase.Dispose(disposing)
		End Sub 


		'The main entry point for the application
		Shared Sub Main()
			Application.Run(New Client)
		End Sub

		'NOTE: This procedure required by the Windows Forms Designer
		'It can be modified using the Windows Forms Designer.  
		'Do not modify it using the code editor.
		Private Sub InitForm()
			 Me.Button1 = New Button
			 Me.Button2 = New Button
			 Me.Label1 = New Label

			 Button1.Location = new Point(200, 230)
			 Button1.TabIndex = 1
			 Button1.Text = "&Close"
			 Button1.Size = new Size(75, 23)
			 AddHandler Button1.Click, New System.EventHandler(AddressOf Me.Button1_Click)

			 Button2.Location = new Point(120, 230)
			 Button2.TabIndex = 2
			 Button2.Text = "&Execute"
			 Button2.Size = new Size(75, 23)
			 AddHandler Button2.Click, New System.EventHandler(AddressOf Me.Button2_Click)

			 Label1.Location = new Point(8, 8)
			 Label1.TabIndex = 0
			 Label1.TabStop = False
			 Label1.Text = ""
			 Label1.Size = new Size(272, 232)

			 Me.Text = "Client"

			 Me.Controls.Add(Button2)
			 Me.Controls.Add(Button1)
			 Me.Controls.Add(Label1)

		End Sub

		Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) 
			 Me.Close  ' End Application
		End Sub

		Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
			
			 ' Local Variables
			 Dim myCompCS As New CompCS.StringComponent
			 Dim myCompVB As New CompVB.StringComponent
			 Dim myCompVC As New CompVC.StringComponent

			 Dim StringCount As Integer

			 ' Clear Label 
			 Label1.Text = ""

			 ' Display results from C# Component
			 For StringCount = 0 To CInt(myCompCS.Count) - 1
				Label1.Text &= MyCompCS.GetString(StringCount) & vbCrLf
			 Next        
			 Label1.Text &= vbCrLf

			 ' Display results from Visual Basic Component
			 For StringCount = 0 to CInt(MyCompVB.Count) - 1
				  Label1.Text &= myCompVB.GetString(StringCount) & vbCrLf
			 Next
			 Label1.Text &= vbCrLf

			 ' Display results from Visual C++ Component
			 For StringCount = 0 To CInt(myCompVC.Count) - 1
				  Label1.Text &= myCompVC.GetString(StringCount) & vbCrLf
			 Next        
    
		End Sub

	End Class

End Module