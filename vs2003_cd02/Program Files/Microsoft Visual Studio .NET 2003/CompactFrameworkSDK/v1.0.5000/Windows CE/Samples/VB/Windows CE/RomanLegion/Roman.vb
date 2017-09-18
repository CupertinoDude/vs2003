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
'* File: Roman.vb
'*
'

Public Class Roman
    Inherits BaseObj

    Public Sub New(ByVal game As GAME, ByVal yTop As Integer, ByVal row As Integer, ByVal col As Integer)
        MyBase.New(game)
        ' Bmp Size
        m_cx = 16
        m_cy = 20

        ' Load Roman Bmps 
        ReDim m_bmpOff(2)
        ReDim m_mattr(2)
        Load("RomanA" + CStr(row) + ".bmp", 0)
        Load("RomanB" + CStr(row) + ".bmp", 1)

        ' Reset Roman Position and turn it alive
        Reset(yTop, row, col)

    End Sub

    Public Sub Process(ByVal dx As Integer, ByVal dy As Integer)

        m_xOld = m_x
        m_yOld = m_y
        ' Move
        m_x += dx
        m_y += dy
    End Sub

    Public Sub Reset(ByVal yTop As Integer, ByVal row As Integer, ByVal col As Integer)

        ' Turn the Roman on
        Me.m_bAlive = True

        ' Reset the position
        m_x = (m_cx * 2) * col
        m_y = yTop + (row * m_cy)
    End Sub
End Class
