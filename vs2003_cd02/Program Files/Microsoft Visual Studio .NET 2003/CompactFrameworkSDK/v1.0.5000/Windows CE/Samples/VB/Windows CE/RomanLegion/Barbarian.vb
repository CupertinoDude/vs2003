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
'* File: Barbarian.vb
'*
'

Public Class Barbarian
    Inherits BaseObj

    Private Const m_kdxKeyboardMax = 5

    Private m_bGoLeft As Boolean
    Private m_bGoRight As Boolean
    Private m_bKeyboard As Boolean

    Public Sub New(ByVal game As GAME)
        MyBase.New(game)

        'Barbarian Always Alive
        m_bAlive = True

        ' Bmp Size
        m_cx = 14
        m_cy = 10

        ' Start Position
        m_x = m_cxSpace / 2
        m_y = m_game.WorldBounds.Height - m_cy - 20
        m_xOld = m_x
        m_yOld = m_y

        ' Load Bmp
        ReDim m_bmpOff(1)
        ReDim m_mattr(1)
        Load("Barbarian.bmp", 0)
    End Sub

    Public Sub Process()

        Dim ptMouse As Point
        m_xOld = m_x

        ' If input is from Keyboard
        If (m_bKeyboard) Then

            If (m_bGoLeft) Then
                m_x -= m_kdxKeyboardMax
            ElseIf (m_bGoRight) Then
                m_x += m_kdxKeyboardMax
            End If
            ' If the mouse move
        Else

            ptMouse = m_game.MouseLoc
            m_x = ptMouse.X - (m_cx / 2)

        End If

        ' Limit the Barbarian position to the window
        If (m_x < 0) Then
            m_x = 0
        ElseIf (m_x + m_cx >= m_cxSpace) Then
            m_x = m_cxSpace - m_cx
        End If
    End Sub

    ' Set the Barbarian to move left
    Public Property GoLeft() As Boolean
        Get
        End Get
        Set(ByVal Value As Boolean)
            m_bKeyboard = True
            m_bGoLeft = Value
        End Set
    End Property

    ' set the Barbarian to move right
    Public Property GoRight() As Boolean
        Get
        End Get
        Set(ByVal Value As Boolean)
            m_bKeyboard = True
            m_bGoRight = Value
        End Set
    End Property



    Public Property Keyboard() As Boolean
        Get
        End Get
        Set(ByVal Value As Boolean)
            m_bKeyboard = False
        End Set
    End Property

    Public Function bCollide(ByVal Arrow As Arrow) As Boolean

        bCollide = False
        If (Me.Bounds.IntersectsWith(Arrow.Bounds)) Then
            bCollide = True
        End If
        Return (bCollide)
    End Function
End Class

