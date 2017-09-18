'==========================================================================
'  File:		worldcalc.vb
'
'==========================================================================
Imports System
Imports System.Reflection
Imports System.ComponentModel
Imports System.Drawing
Imports System.Windows.Forms
Imports System.Resources
Imports System.Globalization
Imports System.Threading

Imports Demo.Localize.Math
Imports Demo.Localize.ParseUtil

<Assembly: System.Reflection.AssemblyVersion("1.0.0.0")>

Namespace Demo.Localize

Public Class VersioningDemo
    Inherits Form
    Private components As System.ComponentModel.Container
    
    Private rm As ResourceManager
    'Private rs As ResourceSet ' Used when working with a ResourceManager (See code below)
    Private txtFormula As TextBox
    Private lblFormula As Label
    Private btnEquals As Button
    Private btnClear As Button
    Private btnNumbers() As Button
    Private btnOps() As Button
    
    
    Public Sub New(culture As String)
        '
        ' If a specific culture is passed in through the command-line, use that -- otherwise
        ' just use the current ui culture
        '
        If culture <> "" Then
			try 
                Thread.CurrentThread.CurrentUICulture = New CultureInfo(culture)
			catch e as ArgumentException
				MessageBox.Show(Me, e.Message, "Bad command-line argument")
			end try
        End If 
        InitializeComponent()
    End Sub 'New
        
    Protected Overloads Overrides Sub Dispose(disposing as Boolean)
       If disposing Then
           If Not (components is nothing) Then 
              components.Dispose()
           End If
       End If 
       MyBase.Dispose(disposing)
    End Sub 'Dispose
    
    Private Sub InitializeComponent()
        
        '  		
        ' Create an instance of the resource manager.  The second parameter identifies
        ' the "main" assembly.  All searching for satellites is done based on the location, etc ..
        ' of the main assembly.
        '
        rm = New ResourceManager("MyStrings", Me.GetType().Assembly)
        
        '
        ' ResourceSet loads all resources at one time. No "Fallback" provided.
        ' To test using ResourceSet, change "rm.GetString()" to "rs.GetString()"
        ' and uncomment the following line.
        '
        'rs = rm.GetResourceSet(Thread.CurrentThread.CurrentUICulture, true, true)
        components = New System.ComponentModel.Container()
        txtFormula = New TextBox()
        lblFormula = New Label()
        btnEquals = New Button()
        btnClear = New Button()
        btnNumbers = New Button(10) {}
        btnOps = New Button(4) {}
        
        AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        
        Me.Text = rm.GetString("Math_Greeting")
        
        Me.ClientSize = New System.Drawing.Size(250, 230)
        
        lblFormula.Location = New System.Drawing.Point(8, 10)
        lblFormula.Text = rm.GetString("Math_Formula_Label")
        lblFormula.Size = New System.Drawing.Size(155, 20)
        
        txtFormula.Location = New System.Drawing.Point(8, 28)
        txtFormula.TabIndex = 0
        txtFormula.Size = New System.Drawing.Size(150, 25)
        txtFormula.ReadOnly = True
        
        
        btnClear.Location = New Point(165, 28)
        btnClear.Size = New Size(80, 25)
        btnClear.Text = rm.GetString("Math_Clear_Button")
        AddHandler btnClear.Click, AddressOf btnClearClicked
        
        
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
        
        Dim i As Integer
        For i = 0 To 9
            btnNumbers(i).Size = New Size(30, 30)
            AddHandler btnNumbers(i).Click, AddressOf btnNumbersClicked
        Next i
        
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
        
        
        btnEquals.Location = New Point(48, 180)
        btnEquals.Size = New Size(70, 30)
        btnEquals.TabIndex = 1
        btnEquals.Text = rm.GetString("Math_Calc_Button")
        AddHandler btnEquals.Click, AddressOf btnEqualsClicked
        
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
    End Sub 'InitializeComponent
    
    
    
    Private Sub btnClearClicked(sender As Object, evArgs As EventArgs)
        txtFormula.Text = ""
    End Sub 'btnClearClicked
    
    
    Private Sub btnNumbersClicked(sender As Object, evArgs As EventArgs)
        Dim btn As Button = CType(sender, Button)
        txtFormula.Text += btn.Text
    End Sub 'btnNumbersClicked
    
    
    Private Sub btnOpClicked(sender As Object, evArgs As EventArgs)
        Dim btn As Button = CType(sender, Button)
        txtFormula.Text = txtFormula.Text + " " + btn.Text + " "
    End Sub 'btnOpClicked
    
    
    Private Sub btnEqualsClicked(sender As Object, evArgs As EventArgs)
        ' parse the formula and get the arguments
        If txtFormula.Text <> "" Then
            Try
                Dim p As New Parser()
                Dim a As Arguments = p.Parse(txtFormula.Text)
                ' do the calc and display the results
                Dim m As New IntegerMath()
                txtFormula.Text = m.GetResult(Convert.ToInt32(a.Arg1), a.Op, Convert.ToInt32(a.Arg2))
            Catch
                MessageBox.Show(rm.GetString("Math_Calc_Error"), rm.GetString("Math_Greeting"))
            End Try
        End If
    End Sub 'btnEqualsClicked
    
    <System.STAThreadAttribute()> _
    Public Shared Sub Main(args As String())
        '
        ' Main takes an optional argument identifying the culture you'd like displayed.
        '
        Dim strCulture As String = ""
        If args.Length = 1 Then
            strCulture = args(0)
        End If
        
        Application.Run(New VersioningDemo(strCulture))
    End Sub 'Main
End Class 'VersioningDemo 

End Namespace