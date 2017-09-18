'=====================================================================
'  File:      TxForm.vb
'
'  Summary:   Windows.Forms Code for .NET COM+ Transactions Sample
'
'---------------------------------------------------------------------
'  This file is part of the Microsoft .NET Framework SDK Code Samples.
'
'  Copyright (C) Microsoft Corporation.  All rights reserved.
'
'This source code is intended only as a supplement to Microsoft
'Development Tools and/or on-line documentation.  See these other
'materials for detailed information regarding Microsoft code samples.
'
'THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
'KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
'IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
'PARTICULAR PURPOSE.
'=====================================================================
Imports System
Imports System.Drawing
Imports System.Collections
Imports System.ComponentModel
Imports System.Windows.Forms


Namespace TxDemoServerVB
    _
    'This class handles the UI for the Transaction Sample
    Public Class TxForm
        Inherits System.Windows.Forms.Form
        Private WithEvents currentValueLabel As System.Windows.Forms.Label
        Private WithEvents currentValue As System.Windows.Forms.TextBox
        Private WithEvents post As System.Windows.Forms.Button
        Private WithEvents autoCompletePost As System.Windows.Forms.Button
        Private WithEvents newValue As System.Windows.Forms.TextBox
        Private WithEvents newValueLabel As System.Windows.Forms.Label


#Region " Windows Form Designer generated code "

        Public Sub New()
            'This call is required by the Windows Form Designer.
            InitializeComponent()

            'Add any initialization after the InitializeComponent() call

        End Sub 'New


        'Form overrides dispose to clean up the component list.
        Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
            If disposing Then
                If Not (components Is Nothing) Then
                    components.Dispose()
                End If
            End If
            MyBase.Dispose(disposing)
        End Sub

        'Required by the Windows Form Designer
        Private components As System.ComponentModel.Container

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.  
        'Do not modify it using the code editor.
        <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
            '
            'TxForm
            '
            Me.currentValueLabel = New System.Windows.Forms.Label()
            Me.currentValue = New System.Windows.Forms.TextBox()
            Me.post = New System.Windows.Forms.Button()
            Me.AutoCompletePost = New System.Windows.Forms.Button()
            Me.newValue = New System.Windows.Forms.TextBox()
            Me.newValueLabel = New System.Windows.Forms.Label()
            Me.SuspendLayout()
            ' 
            ' currentValueLabel
            ' 
            Me.currentValueLabel.Location = New System.Drawing.Point(8, 8)
            Me.currentValueLabel.Name = "currentValueLabel"
            Me.currentValueLabel.Size = New System.Drawing.Size(80, 16)
            Me.currentValueLabel.TabIndex = 0
            Me.currentValueLabel.Text = "Current Value:"
            ' 
            ' currentValue
            ' 
            Me.currentValue.Location = New System.Drawing.Point(88, 8)
            Me.currentValue.Name = "currentValue"
            Me.currentValue.ReadOnly = True
            Me.currentValue.TabIndex = 1
            Me.currentValue.Text = ""
            ' 
            ' post
            ' 
            Me.post.Location = New System.Drawing.Point(8, 72)
            Me.post.Name = "post"
            Me.post.Size = New System.Drawing.Size(88, 23)
            Me.post.TabIndex = 2
            Me.post.Text = "&Post"
            ' 
            ' autoCompletePost
            ' 
            Me.autoCompletePost.Location = New System.Drawing.Point(104, 72)
            Me.autoCompletePost.Name = "autoCompletePost"
            Me.autoCompletePost.Size = New System.Drawing.Size(88, 23)
            Me.autoCompletePost.TabIndex = 3
            Me.autoCompletePost.Text = "&AutoComplete Post"
            ' 
            ' newValue
            ' 
            Me.newValue.Location = New System.Drawing.Point(88, 40)
            Me.newValue.Name = "newValue"
            Me.newValue.TabIndex = 4
            Me.newValue.Text = "5"
            ' 
            ' newValueLabel
            ' 
            Me.newValueLabel.Location = New System.Drawing.Point(8, 40)
            Me.newValueLabel.Name = "newValueLabel"
            Me.newValueLabel.Size = New System.Drawing.Size(80, 16)
            Me.newValueLabel.TabIndex = 5
            Me.newValueLabel.Text = "New Value:"
            ' 
            ' TxForm
            ' 
            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.ClientSize = New System.Drawing.Size(200, 101)
            Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.newValue, _
            	Me.newValueLabel, Me.autoCompletePost, _
            	Me.post, Me.currentValue, Me.currentValueLabel})
            Me.Name = "TxForm"
            Me.Text = "TxForm"
            Me.ResumeLayout(False)
        End Sub 'InitializeComponent

#End Region

		Protected Overrides Sub OnLoad(e as EventArgs)
			Try
                Dim txDemoSvr As txDemoSvr = New txDemoSvr()
                currentValue.Text = txDemoSvr.GetCurrentValue().ToString()
	         'It is important to dispose COM+ objects as soon as possible so that
  	         'COM+ metadata such as context does not remain in memory unnecessarily
	         'and so that COM+ services such as Object Pooling work properly.
                txDemoSvr.Dispose() 
			Catch cv As CurrentValueNotReadException
				MessageBox.Show("Unable to read the current value from " & _
						"the database" , "Error")
				Application.Exit()
			Catch ex As Exception
				MessageBox.Show("An exception was caught : " & ex.Message & _
					" Unable to launch the COM+ Server. Closing the " & _ 
						"application." , "Error")
				Application.Exit()
			End Try
		End Sub

        'Start the Post with a manual transaction if the user clicks on the 
        'Post button
        Private Sub Post_Click(ByVal sender As Object, ByVal e As System.EventArgs) _
        		Handles post.Click
            Dim val As Integer = 0
            Try
                val = Integer.Parse(newValue.Text)
            Catch
				MessageBox.Show("Please enter a value to post!")
            End Try
            Try
                Dim txDemoSvr As txDemoSvr = New txDemoSvr()
                txDemoSvr.Post(val)
	         'It is important to dispose COM+ objects as soon as possible so that
  	         'COM+ metadata such as context does not remain in memory unnecessarily
	         'and so that COM+ services such as Object Pooling work properly.
                txDemoSvr.Dispose() 
            Catch de As DatabaseExecutionException
                MessageBox.Show("Unable to update the database", "Error")
                Exit Sub
            Catch ex As Exception
                MessageBox.Show("An exception was caught : " + ex.Message)
                Exit Sub
            End Try
            Try
                Dim txDemoSvr As TxDemoSvr = New TxDemoSvr()
                currentValue.Text = txDemoSvr.GetCurrentValue().ToString()
	         'It is important to dispose COM+ objects as soon as possible so that
  	         'COM+ metadata such as context does not remain in memory unnecessarily
	         'and so that COM+ services such as Object Pooling work properly.
                txDemoSvr.Dispose()
            Catch cv As CurrentValueNotReadException
                MessageBox.Show("Unable to read the current value from the database", _
                 "Error")
                Exit Sub
            End Try
		End Sub


        'Start the Post with automatic transaction if the user clicks on the 
        'AutoCompletePost button
        Private Sub AutoComplete_PostClick(ByVal sender As Object, ByVal e As _
        		System.EventArgs) Handles autoCompletePost.Click
            Dim val As Integer = 0
            Try
                val = Integer.Parse(newValue.Text)
            Catch
				MessageBox.Show("Please enter a value to post!")
            End Try
            Try
                Dim txDemoSvr As txDemoSvr = New txDemoSvr()
                txDemoSvr.AutoCompletePost(val)
	         'It is important to dispose COM+ objects as soon as possible so that
  	         'COM+ metadata such as context does not remain in memory unnecessarily
	         'and so that COM+ services such as Object Pooling work properly.
                txDemoSvr.Dispose() 
            Catch at As ValueOutOfRangeException
                MessageBox.Show("The transaction has been aborted by " & _
                  "throwing an AbortTransactionException", "No Error")
            Catch db As DatabaseExecutionException
                MessageBox.Show("Unable to update the database", "Error")
                Exit Sub
            Catch ex As Exception
                MessageBox.Show("An exception was caught : " + ex.Message)
                Exit Sub
            End Try
            Try
                Dim txDemoSvr As TxDemoSvr = New TxDemoSvr()
                currentValue.Text = txDemoSvr.GetCurrentValue().ToString()
	         'It is important to dispose COM+ objects as soon as possible so that
  	         'COM+ metadata such as context does not remain in memory unnecessarily
	         'and so that COM+ services such as Object Pooling work properly.
                txDemoSvr.Dispose() 
            Catch cv As CurrentValueNotReadException
                MessageBox.Show("Unable to read the current value from " & _
                 "the database", "Error")
                Exit Sub
            End Try
        End Sub

        Public Shared Sub Main(ByVal args() As String)
            Application.Run(New TxForm())
        End Sub

    End Class
End Namespace
