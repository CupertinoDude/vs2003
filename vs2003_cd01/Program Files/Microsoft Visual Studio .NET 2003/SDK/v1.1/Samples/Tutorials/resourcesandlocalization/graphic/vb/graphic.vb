Imports System
Imports System.Drawing
Imports System.ComponentModel
Imports System.Windows.Forms
Imports System.IO
Imports System.Reflection
Imports System.Resources
Imports System.Globalization
Imports System.Threading

Namespace Demo.Graphics
    
    
    Public Class Images
        Inherits System.Windows.Forms.Form
        
        Private components As System.ComponentModel.Container
        Private pictureBox1 As System.Windows.Forms.PictureBox
        
        Private rm As ResourceManager
        
        
        Public Sub New(culture As String)
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
        
        <System.STAThreadAttribute()> _
        Public Shared Sub Main()
	    Dim args() as String
	    args = System.Environment.GetCommandLineArgs()
            Dim strCulture As String = ""
            If args.Length = 2 Then
                strCulture = args(1)
            End If
            
            Application.Run(New Images(strCulture))
        End Sub 'Main
        
        
        Private Sub InitializeComponent()
            
            rm = New ResourceManager("Images", Me.GetType().Assembly)
            
            Me.components = New System.ComponentModel.Container()
            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.Size = New System.Drawing.Size(100, 100)
            Me.pictureBox1 = New System.Windows.Forms.PictureBox()
            
            pictureBox1.Location = New System.Drawing.Point(0, 0)
            pictureBox1.Size = New System.Drawing.Size(100, 100)
            pictureBox1.TabIndex = 0
            pictureBox1.TabStop = False
            
            pictureBox1.Image = CType(rm.GetObject("flag"), System.Drawing.Image)
            
            Me.Controls.Add(pictureBox1)
        End Sub 'InitializeComponent 
    End Class 'Images
End Namespace 'Demo.Graphics