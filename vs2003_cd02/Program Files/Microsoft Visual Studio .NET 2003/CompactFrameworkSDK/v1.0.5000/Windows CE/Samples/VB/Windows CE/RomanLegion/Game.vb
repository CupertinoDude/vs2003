'
'*------------------------------------------------------------------------------
'*  <copyright from='1997' to='2002' company='Microsoft Corporation'>
'*   Copyright (c) Microsoft Corporation. All Rights Reserved.
'*
'*   This source code is intended only as a supplement to Microsoft
'*   Development Tools and/or on-line documentation.  See these other
'*   materials for detailed information regarding Microsoft code samples.
'*
'*   </copyright>
'*-------------------------------------------------------------------------------
'*
'* File: Game.vb
'*
'

Public Class GAME
    Inherits System.Windows.Forms.Form

    ' State of the game
    Private Enum Display As Integer
        Splash = 0
        Won = 1
        Game = 2
    End Enum

    ' Where we get the images
    Public m_strGamePath As String = ""

    ' Width of Game
    Private m_cxPlay As Integer

    ' Height of Game
    Private m_cyPlay As Integer

    '  Game is running ?
    Private m_bRunning As Boolean

    ' Mouse/Pen Position
    Private m_xMouse, m_yMouse As Integer

    '  Is to Repaint the game
    Private m_bRepaint As Boolean

    Private m_bmpOff As Bitmap
    Private m_gxOff As Graphics
    Private m_gxPhys As Graphics
    Private m_bmpTap() As Bitmap

    ' The Barbarian launching arrows
    Private m_Barbarian As Barbarian

    ' The Arrow
    Private m_Arrow As Arrow

    Private m_RomanArrow As Arrow

    ' Legion Attacking
    Private m_Legion As Legion

    ' Game Score
    Private m_Score As Score

    ' Last update tick
    Private m_tickOld As Integer

    ' Game status
    Private m_Status As Display

    ' Game Paused ?
    Private m_bPaused As Boolean = False

#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        Dim strAssmPath As String = System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase
        m_strGamePath = strAssmPath.Substring(0, strAssmPath.LastIndexOf("\") + 1)


        Me.BackColor = Color.Black

        Me.Visible = True

        ' Get game client window size
        Me.m_cxPlay = Me.ClientSize.Width
        Me.m_cyPlay = Me.ClientSize.Height

        ' Window caption
        Me.Text = "Roman Legion"

        Init()
        ' Start running
        m_bRunning = True
    End Sub

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        MyBase.Dispose(disposing)
    End Sub

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Private Sub InitializeComponent()
        '
        'GAME
        '
        Me.ClientSize = New System.Drawing.Size(234, 295)
        Me.MaximizeBox = False

    End Sub

    Public Shared Sub Main()
        Application.Run(New GAME())
    End Sub

#End Region


    Private Sub GameMainloop()
        Dim y As Integer
        Dim gx As Graphics

        ' get current tick count
        m_tickOld = Environment.TickCount

        InitGame()

        ' Game Running
        While (m_bRunning)

            ' Do game Step
            DoTick()

            ' Process messages to this window
            Application.DoEvents()
        End While

        ' Game over, paused or won the level
        gx = Me.CreateGraphics()

        ' Draw the bitmap correspondent to game status
        For y = 0 To Me.ClientSize.Height Step 10
            gx.DrawImage(m_bmpTap(m_Status), 0, -m_cyPlay + y)
            System.Threading.Thread.Sleep(10)
        Next

        gx.Dispose()
    End Sub

    Private Sub DoTick()
        Dim tickSleep As Integer

        ' Let the game components move
        ProcessAll()

        ' Redraw the game components
        DrawAll()

        ' Game timming (Wait next step)
        tickSleep = m_tickOld + (1000 / 70) - Environment.TickCount
        If (tickSleep > 0) Then
            System.Threading.Thread.Sleep(tickSleep)
        End If
        m_tickOld = Environment.TickCount

        RefreshAll()
        RestoreAll()
    End Sub

    Private Sub Init()

        ' Init game components
        m_Barbarian = New Barbarian(Me)
        m_Arrow = New Arrow(Me)
        m_RomanArrow = New Arrow(Me)
        m_Legion = New Legion(Me)
        m_Score = New Score(Me)

        ' Init the mouse x position as the middle of the screen
        m_xMouse = m_cxPlay / 2

        ' Load all results bitmaps
        ReDim m_bmpTap(4)

        ' The game uses the Pocket PC form size by default and only deploys
        ' the required images to save space. If you increase the form size 
        ' then the larger images are required, so ensure that the images
        ' named "WCE*.bmp" have their Build Action set to Content.

        Dim Prefix As String = "WCE"
        If (m_cxPlay <= 240) Then
            Prefix = "PPC"
        End If

        LoadBmp(Prefix + "Splash.bmp", Display.Splash)
        LoadBmp(Prefix + "Won.bmp", Display.Won)
        LoadBmp(Prefix + "Pause.bmp", Display.Game)
        LoadBmp(Prefix + "Background.bmp", 3)

        'Create offscreen playscren
        m_bmpOff = New Bitmap(m_strGamePath + Prefix + "Background.bmp")
        m_gxOff = Graphics.FromImage(m_bmpOff)
        m_gxPhys = Me.CreateGraphics()
    End Sub

    Private Sub InitGame()
        ' Game is running
        m_bRunning = True

        ' If the game was not paused
        If (Not m_bPaused) Then
            ' Disable all arrows
            m_Arrow.Stuck = True
            m_RomanArrow.Stuck = True
            m_RomanArrow.Alive = False
            ' Game paused
        Else
            ' Release the game
            m_bPaused = False
        End If

        m_bRepaint = True
    End Sub

    Private Sub ProcessAll()
        ' Get mouse position
        m_xMouse = Me.PointToClient(Control.MousePosition).X

        ' Calculate the components new position
        m_Barbarian.Process()
        m_Arrow.Process()
        m_RomanArrow.Process()
        m_Legion.Process()
    End Sub

    Private Sub DrawAll()

        ' Redraw all game components in the new position
        m_RomanArrow.Draw(m_gxOff)
        m_Arrow.Draw(m_gxOff)
        m_Barbarian.Draw(m_gxOff)
        m_Legion.Draw(m_gxOff)
        m_Score.Draw(m_gxOff)
    End Sub

    Public Sub Refresh1(ByVal rcDirty As Rectangle)
        ' Refresh components last position
        m_gxPhys.DrawImage(m_bmpOff, rcDirty.X, rcDirty.Y, rcDirty, GraphicsUnit.Pixel)
    End Sub

    Private Sub RefreshAll()

        ' Refresh the components
        Refresh1(m_Barbarian.DirtyArea)
        Refresh1(m_Arrow.DirtyArea)
        Refresh1(m_RomanArrow.DirtyArea)
        Refresh1(m_Legion.DirtyArea)
        Refresh1(m_Score.DirtyArea)

        ' Redraw everything
        If (m_bRepaint) Then
            m_gxPhys.DrawImage(m_bmpOff, 0, 0)
            m_bRepaint = False
        End If
    End Sub

    Private Sub RestoreAll()
        ' Clean where the components were
        m_Barbarian.Restore()
        m_Arrow.Restore()
        m_RomanArrow.Restore()
        m_Legion.Restore()
        m_Score.Restore()
    End Sub

    Public Sub Run()
        Application.Run(Me)
    End Sub

    Public Sub Lost()
        ' Game Over 
        ' Reset score and level
        m_Score.Value = 0
        m_Score.Level = 1

        ' Reset the Legion position
        m_Legion.Reset(m_Score.Level)

        ' Not running
        m_bRunning = False

        ' Show splash image
        m_Status = Display.Splash
    End Sub

    Public Sub Won()
        ' Game won

        ' Increase the level
        m_Score.Level = m_Score.Level + 1

        ' Reset platoon position
        m_Legion.Reset(m_Score.Level)

        ' Not running
        m_bRunning = False

        ' Show Won Image
        m_Status = Display.Won
    End Sub

    ' Expose arrow so we can start it from the legion
    Public Property RomanArrow() As Arrow
        Get
            Return m_RomanArrow
        End Get
        Set(ByVal Value As Arrow)

        End Set
    End Property

    ' Expose the Barbarian to chech game over (hit on Barbarian)
    Public Property Barbarian() As Barbarian
        Get
            Return m_Barbarian
        End Get
        Set(ByVal Value As Barbarian)

        End Set
    End Property

    ' Expose the Legion to check which roman where killed
    Public Property Legion() As Legion
        Get
            Return m_Legion
        End Get
        Set(ByVal Value As Legion)

        End Set
    End Property

    ' Expose the Score so we can update it when the Romans where killed
    Public Property Score() As Score
        Get
            Return m_Score
        End Get
        Set(ByVal Value As Score)

        End Set
    End Property


    ' Graphics Offline
    Public Property gxOff() As Graphics
        Get
            Return m_gxOff
        End Get
        Set(ByVal Value As Graphics)

        End Set
    End Property

    ' Background BMP
    Public Property BackBmp() As Bitmap
        Get
            Return m_bmpTap(3)
        End Get
        Set(ByVal Value As Bitmap)
        End Set
    End Property

    Public Property WorldBounds() As Size
        Get
            Return New Size(m_cxPlay, m_cyPlay)
        End Get
        Set(ByVal Value As Size)

        End Set
    End Property

    '  Expose the Mouse position to Barbarian get self updated
    Public Property MouseLoc() As Point
        Get
            Return New Point(m_xMouse, m_yMouse)
        End Get
        Set(ByVal Value As Point)

        End Set
    End Property

    Protected Overrides Sub OnMouseDown(ByVal mouseg As MouseEventArgs)
        Select Case m_Status
            Case Display.Game
                If (m_bRunning) Then
                    m_Barbarian.Keyboard = False

                    'Pause the Game
                    If (mouseg.Y < 15) Then
                        m_bRunning = False
                        m_bPaused = True
                    End If

                    'Release the Game
                Else
                    Me.GameMainloop()
                End If

            Case Display.Splash To Display.Won
                m_Status = Display.Game
                Me.GameMainloop()
        End Select
    End Sub

    Protected Overrides Sub OnMouseUp(ByVal mouseg As MouseEventArgs)
        Select Case m_Status
            Case Display.Game
                If (m_bRunning) Then
                    ' Launch the Arrow
                    If (m_Arrow.Stuck = True) Then
                        m_Arrow.Start(m_Barbarian.m_x + m_Barbarian.m_cx / 2, WorldBounds.Height - 37, 0, -5)
                    End If
                End If
        End Select
    End Sub

    Protected Overrides Sub OnMouseMove(ByVal mouseg As MouseEventArgs)
        ' Update mouse position
        m_xMouse = mouseg.X
        m_yMouse = mouseg.Y
    End Sub

    Protected Overrides Sub OnPaint(ByVal paintg As PaintEventArgs)
        Dim gx As Graphics
        gx = paintg.Graphics

        Select Case m_Status
            Case Display.Game
                gx.DrawImage(m_bmpTap(3), 0, 0)
                m_bRepaint = True
            Case Display.Won
                gx.DrawImage(m_bmpTap(1), 0, 0)
            Case Display.Splash
                gx.DrawImage(m_bmpTap(0), 0, 0)
        End Select
    End Sub

    Public Sub LoadBmp(ByVal bmpName As String, ByVal i As Integer)

        ' Try to Load the Bitmap
        Try
            m_bmpTap(i) = New Bitmap(m_strGamePath + bmpName)
        Catch
            ' Any error ? Create a bitmap
            m_bmpTap(i) = New Bitmap(Me.Width, Height)
            Graphics.FromImage(m_bmpTap(i)).FillRectangle(New SolidBrush(Me.BackColor), New Rectangle(0, 0, Width - 1, Height - 1))
            Graphics.FromImage(m_bmpTap(i)).DrawLine(New Pen(Color.Red), 0, 0, Width - 1, Height - 1)
            Graphics.FromImage(m_bmpTap(i)).DrawLine(New Pen(Color.Red), Width - 1, 0, 0, Height - 1)
        End Try
    End Sub

    Protected Sub RomanLegion_OnClosing(ByVal sender As Object, ByVal cancelg As System.ComponentModel.CancelEventArgs) Handles MyBase.Closing
        If (m_bRunning) Then
            m_bRunning = False
            cancelg.Cancel = True
        End If
    End Sub

    Private Sub RomanLegion_Closed(ByVal sender As Object, ByVal e As System.EventArgs) Handles MyBase.Closed
        Me.m_bRunning = False
    End Sub

    Protected Overrides Sub OnKeyDown(ByVal keyg As KeyEventArgs)
        ' Enable to use keyboard 
        Select Case keyg.KeyData
            Case Keys.Left
                ' Start going left
                m_Barbarian.GoLeft = True
            Case Keys.Right
                ' Start going right
                m_Barbarian.GoRight = True
        End Select
    End Sub

    Protected Overrides Sub OnKeyUp(ByVal keyg As KeyEventArgs)
        Select Case keyg.KeyData
            Case Keys.Left
                ' Stop Going left
                m_Barbarian.GoLeft = False
            Case Keys.Right
                ' Stop going right
                m_Barbarian.GoRight = False
            Case Keys.Space
                ' Launch Arrow
                If (m_Arrow.Alive = False) Then
                    m_Arrow.Start(m_Barbarian.m_x + m_Barbarian.m_cx / 2, WorldBounds.Height - 37, 0, -5)
                End If
            Case Keys.P
                ' Pause game
                m_bRunning = False
                m_bPaused = True

            Case Keys.S
                ' Start game
                m_Arrow.Alive = False
                Me.GameMainloop()

        End Select
    End Sub

End Class








