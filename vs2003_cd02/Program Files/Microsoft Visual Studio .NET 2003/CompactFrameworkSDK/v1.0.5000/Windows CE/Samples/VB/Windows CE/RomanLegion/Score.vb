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
'* File: Score.vb
'*
'

Public Class Score
    Inherits BaseObj

    ' Score Font
    Dim m_drawFont As Font
    Dim m_drawBrush As SolidBrush
    Dim m_Score As Integer
    Dim m_Level As Integer

    Public Sub New(ByVal game As GAME)
        MyBase.New(game)

        ' Score Font
        m_drawFont = New Font("Arial", 16, System.Drawing.FontStyle.Bold)

        m_drawBrush = New SolidBrush(Color.BlueViolet)

        ' Create rectangle for drawing.
        m_x = 0
        m_y = 0

        m_xOld = m_x
        m_yOld = m_y
        m_Score = 0
        m_Level = 1
        m_bAlive = True
        m_cx = 240
        m_cy = 50
    End Sub


    Public Sub Process()
    End Sub


    Public Shadows Sub Draw(ByVal gx As Graphics)
        Dim Score As String
        Score = "Score: " + CStr(m_Score) + " Level: " + CStr(m_Level)
        gx.DrawString(Score, m_drawFont, m_drawBrush, 5.0F, 10.0F)
    End Sub


    ' Expose the Score
    Public Property Value() As Integer
        Get
            Return (m_Score)
        End Get
        Set(ByVal Value As Integer)
            m_Score = Value
        End Set
    End Property

    ' Expose the Level
    Public Property Level() As Integer
        Get
            Return (m_Level)
        End Get
        Set(ByVal Value As Integer)
            m_Level = Value
        End Set
    End Property
End Class
