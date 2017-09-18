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
'* File: Arrow.vb
'*
'

Public Class Arrow
    Inherits BaseObj
    '<summary>
    'This Class handdles the Barbarian arrow and the Romans arrows
    '</summary>

    Public m_bStuck As Boolean

    Public Sub New(ByVal game As GAME)
        MyBase.New(game)
        m_cx = 3
        m_cy = 10

        ' Position the arrow
        Start(m_cxSpace / 2, m_cySpace - 30, 0, -5)

        ' Load bitmap
        ReDim m_bmpOff(2)
        ReDim m_mattr(2)
        Load("Arrow.bmp", 0)
        Load("Arrow1.bmp", 1)
    End Sub

    Public Sub Process()

        m_xOld = m_x
        m_yOld = m_y

        ' Arrow ready to be launched
        If (m_bStuck) Then

            m_x = m_game.Barbarian.Bounds.Left + m_game.Barbarian.Bounds.Width / 2 - m_cx / 2
            m_y = m_game.Barbarian.Bounds.Top - m_cy

            ' Arrow moving
        Else

            ' Move it
            m_y += m_dy

            ' check if any Roman were killed
            If (m_game.Legion.KillRomanFromXY(m_x, m_y)) Then

                ' Stop the arrow
                Stop1()
            End If

            ' Arrow reach top of the window
            If (m_y < 50) Then

                ' Stop the arrow
                Stop1()
            End If

            ' Arrow reach the bottom of the window
            If (m_y > m_cySpace) Then

                Me.Alive = False
                Me.Stuck = True
            End If

            ' Check if hit the Barbarian
            If (m_game.Barbarian.bCollide(Me)) Then

                ' If the Arrow hit the Barbarian , game over
                m_game.Lost()
            End If
        End If
    End Sub

    ' Can Launch Arrow ?
    Public Property Stuck() As Boolean

        Get

            Return (m_bStuck)
        End Get
        Set(ByVal Value As Boolean)

            m_bStuck = Value
        End Set
    End Property

    Public Sub Start(ByVal x As Integer, ByVal y As Integer, ByVal dx As Integer, ByVal dy As Integer)

        ' release the arrow
        m_bStuck = False
        m_bAlive = True

        ' Arrow initial position
        m_xOld = m_x
        m_yOld = m_y
        m_x = x - m_cx / 2
        m_y = y

        m_dx = dx

        ' Arrow up
        If (dy < 0) Then

            m_ActiveImage = 0

            ' Arrow down
        Else

            m_ActiveImage = 1
        End If

        ' Arrow direction
        m_dy = dy
    End Sub

    Public Sub Stop1()

        ' Disable the arrow
        m_bStuck = True
        m_dx = 0
        m_dy = 0
    End Sub
End Class
