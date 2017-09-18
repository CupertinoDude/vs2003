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
'* File: Legion.vb
'*
'

Public Class Legion

    ' The Game
    Private m_game As GAME

    ' Which Roman's image is to draw
    Private m_Side As Integer = 0

    ' Legion Maximum Top position
    Private m_yTop As Integer

    ' Column number 
    Private m_cols As Integer = 6
    ' Row number 
    Private m_rows As Integer = 6

    ' Left speed
    Private m_dx As Integer = 1
    ' Down speed
    Private m_dy As Integer = 0

    ' Total Romans number in the legion
    Private m_cRomanMax As Integer

    ' Array of Romans
    Private m_rgRoman() As Roman

    ' Bounding Box for the Legion
    Dim m_BoundBox As Rectangle

    Public Sub New(ByVal game As GAME)

        Dim row As Integer
        Dim col As Integer

        '  Roman adding
        Dim RomanNew As Roman

        m_game = game

        ' Set the number of Romans
        m_cRomanMax = (m_cols * m_rows) - 1
        m_yTop = 50

        ' Create Romans
        ReDim m_rgRoman(m_cRomanMax + 1)
        For row = 0 To m_rows - 1

            For col = 0 To m_cols - 1

                RomanNew = New Roman(m_game, m_yTop, row, col)
                m_rgRoman(row * m_cols + col) = RomanNew
            Next
        Next
    End Sub

    Public Sub Process()
        Dim iRoman As Integer
        Dim iLastRoman As Integer

        m_dy = 0

        ' Check walls

        ' If reach the right wall
        If (m_BoundBox.Left + m_dx < 0) Then
            m_dx = Math.Abs(m_dx)
            m_dy = 10
        End If

        ' If reach the left wall
        If (m_BoundBox.Right + m_dx >= m_game.WorldBounds.Width) Then
            m_dx = -Math.Abs(m_dx)
            m_dy = 10
        End If

        ' If the Legion reach the Barbarian
        If (m_BoundBox.Bottom >= m_game.Barbarian.Bounds.Top) Then
            m_game.Lost()
        End If

        ' Process all Romans alive
        iLastRoman = -1
        For iRoman = 0 To m_cRomanMax

            If (True = m_rgRoman(iRoman).Alive) Then
                m_rgRoman(iRoman).Process(m_dx, m_dy)
                iLastRoman = iRoman
            End If

        Next

        ' The last Roman launch the Arrow
        If (Not m_game.RomanArrow.Alive And iLastRoman >= 0) Then
            m_game.RomanArrow.Start( _
                m_rgRoman(iLastRoman).m_x + m_rgRoman(iLastRoman).m_cx / 2, _
                m_rgRoman(iLastRoman).m_y + m_rgRoman(iLastRoman).m_cy, _
                0, _
                5)
        End If
    End Sub

    Public Sub Draw(ByVal gx As Graphics)
        Dim iRoman As Integer

        ' Try to draw all Romans
        For iRoman = 0 To m_cRomanMax
            m_rgRoman(iRoman).m_ActiveImage = m_Side
            m_rgRoman(iRoman).Draw(gx)
        Next

        '  Switch the Romans Bitmap
        If (m_Side = 0) Then
            m_Side = 1
        Else
            m_Side = 0
        End If
    End Sub


    Public Property DirtyArea() As Rectangle
        ' Return the Bounding Box as the Dirty area
        Get
            Dim rc As Rectangle

            rc = m_BoundBox
            If (m_dx > 0) Then

                rc.Width += m_dx

            Else
                rc.Width -= m_dx
                rc.X += m_dx
            End If
            Return (rc)
        End Get
        Set(ByVal Value As Rectangle)

        End Set
    End Property

    Public Sub Restore()

        '  All Romans killed ?
        Dim bwon As Boolean = True
        ' Is the first
        Dim first As Boolean = True

        ' all Romans
        Dim iRoman As Integer
        For iRoman = 0 To m_cRomanMax
            ' If Roman not dead
            If (m_rgRoman(iRoman).Alive) Then
                ' If is the first Roman init the Bound box as him
                If (first) Then
                    m_BoundBox = m_rgRoman(iRoman).DirtyArea
                    first = False
                    '  Add the Roman to the Bound Box
                Else
                    m_BoundBox = Rectangle.Union(m_BoundBox, m_rgRoman(iRoman).DirtyArea)
                End If
                bwon = False
                m_rgRoman(iRoman).Restore()
            End If
        Next
        ' If no Romans alive, the level is finished
        If (bwon) Then
            m_game.Won()
        End If
    End Sub

    Public Sub Reset(ByVal Level As Integer)

        Dim iRoman As Integer
        Dim Col As Integer

        ' increase the Legion speed
        m_dx = Level

        ' Reset All Legion
        m_BoundBox = m_rgRoman(0).DirtyArea
        For iRoman = 0 To m_cRomanMax
            Col = iRoman Mod m_cols
            m_rgRoman(iRoman).Reset(m_yTop, (iRoman - Col) / m_cols, Col)
            m_BoundBox = Rectangle.Union(m_BoundBox, m_rgRoman(iRoman).DirtyArea)
        Next
    End Sub


    Public Function KillRomanFromXY(ByVal x As Integer, ByVal y As Integer) As Boolean
        Dim iRoman As Integer

        KillRomanFromXY = False

        ' check all Romans
        For iRoman = 0 To m_cRomanMax
            '  If the Roman is Alive
            If (True = m_rgRoman(iRoman).Alive) Then
                ' If tha Arrow hit the Roman
                If (m_rgRoman(iRoman).Bounds.Contains(x, y)) Then
                    KillRomanFromXY = True
                    ' Disable the Roman
                    m_rgRoman(iRoman).Alive = False

                    ' Increase the Score
                    m_game.Score.Value += 10 * (6 - (iRoman / m_cols))
                    Exit For
                End If
            End If
        Next
        Return (KillRomanFromXY)
    End Function
End Class
