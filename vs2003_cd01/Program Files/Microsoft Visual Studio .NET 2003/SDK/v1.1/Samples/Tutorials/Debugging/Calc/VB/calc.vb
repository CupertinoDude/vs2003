'==========================================================================
'  File:		calc.vb
'
'==========================================================================
'
Imports System
Imports System.Drawing
Imports System.IO
Imports System.Windows.Forms

Imports System.Diagnostics

Imports Demo.Localize.Math
Imports Demo.Localize.ParseUtil

Namespace Demo.Localize
#Const TRACE = 1

Public Class VersioningDemo
    Inherits Form
    Private components As System.ComponentModel.Container
   
    Private txtFormula As TextBox
    Private lblFormula As Label
    Private btnEquals As Button
    Private btnClear As Button
    Private btnNumbers() As Button
    Private btnOps() As Button
    
    
    Public Sub New()
	Try
		Trace.Listeners.Add(new TextWriterTraceListener(File.Create("output.txt")))
	Catch e as System.IO.IOException
		MessageBox.Show("Another instance of this calculator is already running in the current directory. Logging will be disabled.", "Integer Calculator")
	End Try

	Trace.WriteLine("")
	Trace.WriteLine("Starting Tracing...")
	Trace.Indent()

        InitializeComponent()
    End Sub 'New
    
    Private Sub VersioningDemoClosing(sender As object, evArgs As System.ComponentModel.CancelEventArgs)
	Trace.Unindent()
	Trace.WriteLine("Dispose()")
	Trace.Close()
    End Sub

    Protected Overloads Overrides Sub Dispose(disposing as Boolean)
       If disposing Then
           If Not (components is nothing) Then 
              components.Dispose()
           End If
       End If 
       MyBase.Dispose(disposing)
    End Sub 'Dispose
    
    Private Sub InitializeComponent()
        Trace.WriteLine("InitializeComponent()")
	Trace.Indent()
                    
	Trace.WriteLine("Creating controls")

        components = New System.ComponentModel.Container()
        txtFormula = New TextBox()
        lblFormula = New Label()
        btnEquals = New Button()
        btnClear = New Button()
        btnNumbers = New Button(10) {}
        btnOps = New Button(4) {}
        
        AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        
        Me.Text = "Welcome - Integer Calculator"
        
        Me.ClientSize = New System.Drawing.Size(230, 230)
	' += new System.ComponentModel.CancelEventHandler(VersioningDemoClosing);
        AddHandler Me.Closing, AddressOf VersioningDemoClosing
        
	Trace.WriteLine("Setting up Label and TextBox")

        lblFormula.Location = New System.Drawing.Point(8, 10)
        lblFormula.Text = "Formula and Results:"
        lblFormula.Size = New System.Drawing.Size(155, 20)
        
        txtFormula.Location = New System.Drawing.Point(8, 28)
        txtFormula.TabIndex = 0
        txtFormula.Size = New System.Drawing.Size(150, 25)
        txtFormula.ReadOnly = True
        
        Trace.WriteLine("Setting up numeric buttons")
        
        btnNumbers(0) = New Button()
        btnNumbers(0).Location = New Point(8, 180)
        btnNumbers(0).Text = "0"
        
        btnNumbers(1) = New Button()
        btnNumbers(1).Location = New Point(8, 60)
        btnNumbers(1).Text = "1"
        
        btnNumbers(2) = New Button()
        btnNumbers(2).Location = New Point(48, 60)
        btnNumbers(2).Text = "2"
        
        btnNumbers(3) = New Button()
        btnNumbers(3).Location = New Point(88, 60)
        btnNumbers(3).Text = "3"
        
        btnNumbers(4) = New Button()
        btnNumbers(4).Location = New Point(8, 100)
        btnNumbers(4).Text = "4"
        
        btnNumbers(5) = New Button()
        btnNumbers(5).Location = New Point(48, 100)
        btnNumbers(5).Text = "5"
        
        btnNumbers(6) = New Button()
        btnNumbers(6).Location = New Point(88, 100)
        btnNumbers(6).Text = "6"
        
        btnNumbers(7) = New Button()
        btnNumbers(7).Location = New Point(8, 140)
        btnNumbers(7).Text = "7"
        
        btnNumbers(8) = New Button()
        btnNumbers(8).Location = New Point(48, 140)
        btnNumbers(8).Text = "8"
        
        btnNumbers(9) = New Button()
        btnNumbers(9).Location = New Point(88, 140)
        btnNumbers(9).Text = "9"
        
	Dim j As Integer = 10
	Dim k As Integer = 20
	Dim z As Integer = 0
	
        Dim i As Integer
        For i = 0 To 9
            z = j + k
            btnNumbers(i).Size = New Size(30, 30)
            AddHandler btnNumbers(i).Click, AddressOf btnNumbersClicked
        Next i
        
	Trace.WriteLine("Setting up operations buttons")

        btnOps(0) = New Button()
        btnOps(0).Location = New Point(128, 60)
        btnOps(0).Text = "+"c
        
        btnOps(1) = New Button()
        btnOps(1).Location = New Point(128, 100)
        btnOps(1).Text = "-"
        
        btnOps(2) = New Button()
        btnOps(2).Location = New Point(128, 140)
        btnOps(2).Text = "*"
        
        btnOps(3) = New Button()
        btnOps(3).Location = New Point(128, 180)
        btnOps(3).Text = "/"
        
        For i = 0 To 3
            btnOps(i).Size = New Size(30, 30)
            AddHandler btnOps(i).Click, AddressOf btnOpClicked
        Next i
        
        
	Trace.WriteLine("Adding Clear and Calculate")

        btnClear.Location = New Point(165, 28)
        btnClear.Size = New Size(50, 25)
        btnClear.Text = "Clear"
        AddHandler btnClear.Click, AddressOf btnClearClicked
        
	btnEquals.Location = New Point(48, 180)
        btnEquals.Size = New Size(70, 30)
        btnEquals.TabIndex = 1
        btnEquals.Text = "Calculate"
        AddHandler btnEquals.Click, AddressOf btnEqualsClicked
        
	Trace.WriteLine("Adding to Controls collection")

	Controls.Add(txtFormula)
        Controls.Add(lblFormula)
        Controls.Add(btnEquals)
        Controls.Add(btnClear)
        
        For i = 0 To 9
            Controls.Add(btnNumbers(i))
        Next i
        
        For i = 0 To 3
            Controls.Add(btnOps(i))
        Next i

        Trace.Unindent()

    End Sub 'InitializeComponent
    
    
    
    Private Sub btnClearClicked(sender As Object, evArgs As EventArgs)
        txtFormula.Text = ""
    End Sub 'btnClearClicked
    
    
    Private Sub btnNumbersClicked(sender As Object, evArgs As EventArgs)
        Dim btn As Button = CType(sender, Button)
	Trace.WriteLine(btn.Text + " Clicked")
        txtFormula.Text += btn.Text


        Dim test as String
        test = txtFormula.Text
        Trace.Assert(test <> "0", "Oops", "Leading zero")
	Trace.WriteLineIf(test = "0", "Oops: Leading zero")

    End Sub 'btnNumbersClicked
    
    
    Private Sub btnOpClicked(sender As Object, evArgs As EventArgs)
        Dim btn As Button = CType(sender, Button)
	Trace.WriteLine(btn.Text + " Clicked")
        txtFormula.Text = txtFormula.Text + " " + btn.Text + " "
    End Sub 'btnOpClicked
    
    
    Private Sub btnEqualsClicked(sender As Object, evArgs As EventArgs)
        ' parse the formula and get the arguments
	Trace.WriteLine("Calculate Clicked")
        If txtFormula.Text <> "" Then
            Try
                Dim p As New Parser()
                Dim a As Arguments = p.Parse(txtFormula.Text)
                ' do the calc and display the results
                Dim m As New IntegerMath()
                txtFormula.Text = m.GetResult(Convert.ToInt32(a.Arg1), a.Op, Convert.ToInt32(a.Arg2))
            Catch
		MessageBox.Show("Invalid Formula. Please try again.", "Integer Calculator")
            End Try
        End If
    End Sub 'btnEqualsClicked
    
    <System.STAThreadAttribute()> _
    Public Shared Sub Main()
        Dim f as New VersioningDemo()
	f.ShowDialog()
	'throw(new System.Exception())   'causing a runtime error
    End Sub 'Main

End Class 'VersioningDemo 

End Namespace