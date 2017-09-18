'------------------------------------------------------------------------------
'  <copyright from='1997' to='2002' company='Microsoft Corporation'>
'   Copyright (c) Microsoft Corporation. All Rights Reserved.
'
'   This source code is intended only as a supplement to Microsoft
'   Development Tools and/or on-line documentation.  See these other
'   materials for detailed information regarding Microsoft code samples.
'
'   </copyright>
'-------------------------------------------------------------------------------

' TODO: 1) Open a Visual Studio .NET Command Prompt;
' TODO: 2) Navigate to the folder containing this solution
' TODO: 3) Run "setupGameControl.bat"
' TODO: 4) Open the Toolbox, right click and go to "Add/Remove Items"
' TODO: 5) Browse to [VS2003 Folder]\CompactFrameworkSDK\v1.0.5000\Windows CE\Designer\
' TODO: 6) Add "Designer.GameControl.dll" to your Toolbox
' TODO: 8) Add a GameBoard control named GameBoard1 to the TicTacToe form
' TODO: 9) Open Solution Explorer
' TODO: 10) Right click on the TicTacToe project and click Add Reference
' TODO: 11) Select "GameControl" which will be the first .NET component listed
' TODO: 12) Build and run your solution!

Imports System.Net
Imports System.Net.Sockets
Imports System.Text
Imports System.Runtime.InteropServices

Public Class TicTacToe
    Inherits System.Windows.Forms.Form

    Private ServiceName As String = "IRDA_SOCKET_CONNECTION"
    Private ItsMyMove As Boolean

    Friend WithEvents MainMenu1 As System.Windows.Forms.MainMenu

#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call

    End Sub

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        MyBase.Dispose(disposing)
    End Sub

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Friend WithEvents MenuItem1 As System.Windows.Forms.MenuItem
    Friend WithEvents ReceiveData As System.Windows.Forms.MenuItem
    Friend WithEvents StartGame As System.Windows.Forms.MenuItem

    Private Sub InitializeComponent()
        Me.MainMenu1 = New System.Windows.Forms.MainMenu
        Me.MenuItem1 = New System.Windows.Forms.MenuItem
        Me.StartGame = New System.Windows.Forms.MenuItem
        Me.ReceiveData = New System.Windows.Forms.MenuItem
        '
        'MainMenu1
        '
        Me.MainMenu1.MenuItems.Add(Me.MenuItem1)
        '
        'MenuItem1
        '
        Me.MenuItem1.MenuItems.Add(Me.StartGame)
        Me.MenuItem1.MenuItems.Add(Me.ReceiveData)
        Me.MenuItem1.Text = "Game"
        '
        'StartGame
        '
        Me.StartGame.Text = "New Game"
        '
        'ReceiveData
        '
        Me.ReceiveData.Text = "Receive Next Move"
        '
        'TicTacToe
        '
        Me.Menu = Me.MainMenu1
        Me.Text = "TicTacToe"

    End Sub

    Public Shared Sub Main()
        Application.Run(New TicTacToe)
    End Sub

#End Region

    Private Sub SendIRData(ByVal NumRetries As Integer, ByVal Buffer() As Byte, ByVal BufferLen As Integer)

        Dim client As IrDAClient = Nothing
        Dim CurrentTries As Integer = 0

        Do
            Try
                client = New IrDAClient(ServiceName)
            Catch se As SocketException
                If (CurrentTries >= NumRetries) Then
                    Throw se
                End If
            End Try
            CurrentTries = CurrentTries + 1

        Loop While client Is Nothing And CurrentTries < NumRetries

        If (client Is Nothing) Then
            'timeout occurred
            Throw New SocketException
        End If

        Dim stream As System.IO.Stream = Nothing
        Try
            stream = client.GetStream()
            stream.Write(Buffer, 0, BufferLen)
        Finally
            If (Not stream Is Nothing) Then
                stream.Close()
            End If
            client.Close()
        End Try

    End Sub

    Private Function WaitToReadIRData(ByVal Buffer() As Byte, ByVal BufferLen As Integer) As Integer

        Dim BytesRead As Integer = 0
        Dim listener As IrDAListener = New IrDAListener(ServiceName)
        Dim client As IrDAClient = Nothing
        Dim stream As System.IO.Stream = Nothing

        Try
            listener.Start()

            client = listener.AcceptIrDAClient()  ' blocking call
            stream = client.GetStream()

            BytesRead = stream.Read(Buffer, 0, BufferLen)

        Finally

            If (Not stream Is Nothing) Then
                stream.Close()
            End If

            If (Not client Is Nothing) Then
                client.Close()
            End If

            listener.Stop()
        End Try

        Return BytesRead

    End Function

    Private Sub GameBoard1_MouseUp(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles GameBoard1.MouseUp
        ' figure out the coordinate where the mouse was clicked
        Dim XCoordinate As Integer
        Dim YCoordinate As Integer
        Dim RetryTransmission As Integer
        Dim MaximumRetries As Integer
        Dim Retry As Boolean

        'is it my turn to make the move?
        If Not ItsMyMove Then
            MessageBox.Show("It is your opponent's turn to play")
        Else
            RetryTransmission = 0
            MaximumRetries = 3

            XCoordinate = e.X() \ GameBoard1.GridSize()
            YCoordinate = e.Y() \ GameBoard1.GridSize()

            GameBoard1.DrawMyPiece(XCoordinate, YCoordinate)
            MessageBox.Show("Ready to transmit move to opponent. Align the devices and hit OK", "IRDAapp", MessageBoxButtons.OK, MessageBoxIcon.Asterisk, MessageBoxDefaultButton.Button1)
            Dim BytesToSend(2) As Byte
            BytesToSend(1) = XCoordinate
            BytesToSend(2) = YCoordinate

            Do
                Try
                    SendIRData(5, BytesToSend, BytesToSend.Length)
                    Retry = False

                    'get ready to receive the opponent's move
                    ItsMyMove = False
                    ReceiveData.Enabled = True
                Catch se As SocketException
                    MessageBox.Show("Problems sending IR data. Hit OK to retry", "IRAPP")
                    RetryTransmission = RetryTransmission + 1
                    Retry = True
                End Try
            Loop While ((Retry = True) And (RetryTransmission < MaximumRetries))

            If (RetryTransmission = MaximumRetries) Then
                MessageBox.Show("Retries failed to transmit the move to opponent. Hit OK to undo last move")
                GameBoard1.RemoveMyPiece(XCoordinate, YCoordinate)
            End If
        End If

    End Sub

    Private Sub ReceiveData_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ReceiveData.Click
        Dim ReadBuf(128) As Byte

        ' this is a blocking call
        Dim BytesRead As Integer = WaitToReadIRData(ReadBuf, 128)

        ' figure out the coordinate where the mouse was clicked
        Dim XCoordinate As Integer
        Dim YCoordinate As Integer

        XCoordinate = ReadBuf(1)
        YCoordinate = ReadBuf(2)

        'draw the opponent's piece on the board
        GameBoard1.DrawOpponentPiece(XCoordinate, YCoordinate)

        'now, my turn
        ItsMyMove = True
        ReceiveData.Enabled = False
    End Sub

    Private Sub StartGame_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles StartGame.Click
        GameBoard1.InitializeTheBoard()
        If (MessageBox.Show("Are you making the first move?", "IRDAapp", MessageBoxButtons.YesNo, MessageBoxIcon.Asterisk, MessageBoxDefaultButton.Button1) = DialogResult.Yes) Then
            ItsMyMove = True
            ReceiveData.Enabled = False
        Else
            ItsMyMove = False
            ReceiveData.Enabled = True
        End If
    End Sub
End Class
