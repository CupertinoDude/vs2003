Imports System.ComponentModel
Imports System.Drawing
Imports System.Windows.Forms
Imports System.Threading
Imports System.Net.Sockets


Public Class Form1
    Inherits System.Windows.Forms.Form
    
    Private Listener As TcpListener
    Private StopListener As Boolean
    Private ActiveThreads As Integer

    Private ThreadIndex As Integer

    Public Sub New()
        MyBase.New()

        Form1 = Me

        'This call is required by the Win Form Designer.
        InitializeComponent()

        Listener = New TcpListener(System.Net.IPAddress.Parse("127.0.0.1"), 9105)

        Listener.Start()

        lstStatus.Items.Insert(lstStatus.Items.Count, "Listener Started")
        Timer1.Enabled = True
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

    Private components As System.ComponentModel.IContainer

#Region " Windows Form Designer generated code "

    'Required by the Windows Form Designer
    Private WithEvents Label1 As System.Windows.Forms.Label
    Private WithEvents txtMaxThreads As System.Windows.Forms.TextBox
    Private WithEvents lstStatus As System.Windows.Forms.ListBox
    Private WithEvents Timer1 As System.Windows.Forms.Timer

    Private WithEvents cmdStopListener As System.Windows.Forms.Button




    Dim WithEvents Form1 As System.Windows.Forms.Form

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Me.lstStatus = New System.Windows.Forms.ListBox
        Me.Label1 = New System.Windows.Forms.Label
        Me.txtMaxThreads = New System.Windows.Forms.TextBox
        Me.cmdStopListener = New System.Windows.Forms.Button
        Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
        Me.SuspendLayout()
        '
        'lstStatus
        '
        Me.lstStatus.Location = New System.Drawing.Point(6, 42)
        Me.lstStatus.Name = "lstStatus"
        Me.lstStatus.Size = New System.Drawing.Size(414, 199)
        Me.lstStatus.TabIndex = 4
        '
        'Label1
        '
        Me.Label1.Location = New System.Drawing.Point(12, 12)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(76, 16)
        Me.Label1.TabIndex = 6
        Me.Label1.Text = "Max Threads:"
        Me.Label1.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.Label1.Visible = False
        '
        'txtMaxThreads
        '
        Me.txtMaxThreads.Location = New System.Drawing.Point(88, 12)
        Me.txtMaxThreads.Name = "txtMaxThreads"
        Me.txtMaxThreads.Size = New System.Drawing.Size(32, 20)
        Me.txtMaxThreads.TabIndex = 5
        Me.txtMaxThreads.Text = "5"
        Me.txtMaxThreads.Visible = False
        '
        'cmdStopListener
        '
        Me.cmdStopListener.Location = New System.Drawing.Point(324, 12)
        Me.cmdStopListener.Name = "cmdStopListener"
        Me.cmdStopListener.Size = New System.Drawing.Size(94, 24)
        Me.cmdStopListener.TabIndex = 3
        Me.cmdStopListener.Text = "Stop Listener"
        '
        'Timer1
        '
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(432, 253)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.Label1, Me.txtMaxThreads, Me.lstStatus, Me.cmdStopListener})
        Me.Name = "Form1"
        Me.Text = "Listener"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Protected Sub ProcessRequest()

        ' Warning: 
        ' For security reason, the listener should be programmed to listen to a specific client.
        ' If it listens to all requests, it may be bombarded by lots of requests.
        '
        Dim CurThread As Thread
        Dim CurSocket As Socket
        Dim Buffer(100) As Byte
        Dim Bytes As Integer
        Dim Temp As String

        CurThread = System.Threading.Thread.CurrentThread()
        CurSocket = Listener.AcceptSocket

        While Not StopListener
            If CurSocket.Available > 0 Then
                Bytes = CurSocket.Receive(Buffer, Buffer.Length, 0)
                SyncLock CurThread
                    lstStatus.Items.Insert(lstStatus.Items.Count, System.Text.Encoding.Default.GetString(Buffer))
                    lstStatus.SelectedIndex = lstStatus.Items.Count - 1
                End SyncLock
                Exit While
            End If
            Application.DoEvents()
            If Not CurSocket.Connected Then
                StopListener = True
            End If
        End While

        'Simulate work being performed by listener by pausing for 2 seconds.
        System.Threading.Thread.CurrentThread().Sleep(2000)

        'Format the return message - this will normally be the results of the
        'server side processing.
        Temp = "Recieved: " & System.DateTime.Now
        Buffer = System.Text.Encoding.Default.GetBytes(Temp.ToCharArray)

        'Send the results back to the client application via the open socket and
        'close the socket.
        CurSocket.Send(Buffer, Buffer.Length, 0)
        CurSocket.Close()
        SyncLock CurThread
            ActiveThreads -= 1
        End SyncLock

    End Sub

    Private Sub Timer1_Tick(ByVal sender As Object, ByVal e As System.EventArgs) Handles Timer1.Tick

        Dim CurThreadStart As ThreadStart
        Dim CurThread As Thread
        Dim ThreadCount As Integer
        Dim i As Integer

        If Not Listener.Pending() Then
            Exit Sub
        End If

        Timer1.Enabled = False

        If ActiveThreads > CInt(txtMaxThreads.Text) Then
            Timer1.Enabled = True
            Exit Sub
        End If

        CurThreadStart = New ThreadStart(AddressOf ProcessRequest)
        CurThread = New Thread(CurThreadStart)

        CurThread.Start()
        SyncLock CurThread
            ActiveThreads += 1
        End SyncLock

        Timer1.Enabled = True

    End Sub

    Private Sub cmdStopListener_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdStopListener.Click
        StopListener = True
        Timer1.Stop()
        Listener.Stop()
    End Sub


    Private Sub Form1_Closing(ByVal sender As System.Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles Form1.Closing, MyBase.Closing
        Timer1.Stop()
        If Not Listener Is Nothing Then
            Listener.Stop()
        End If
    End Sub


End Class
