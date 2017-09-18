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
'* File: BaseObj.vb
'*
'

Public Class BaseObj

    ' Image index to draw
    Public m_ActiveImage As Integer = 0

    ' Object's Left
    Public m_x As Integer
    ' Object's Top
    Public m_y As Integer

    ' Object's Left before move
    Public m_xOld As Integer
    ' Object's Top before move
    Public m_yOld As Integer

    ' Object's Speed to right 
    Public m_dx As Integer
    ' Object's Speed to down
    Public m_dy As Integer

    ' Object's Width 
    Public m_cx As Integer
    ' Object's Height
    Public m_cy As Integer

    ' Max x Position
    Public m_cxSpace As Integer
    ' Max y Position
    Public m_cySpace As Integer

    ' Current game
    Public m_game As GAME

    ' is to draw ?
    Public m_bAlive As Boolean

    ' Object Bitmap
    Public m_bmpOff() As Bitmap

    ' Object Attributes (which color range is transparent ?)
    Public m_mattr() As Imaging.ImageAttributes

    Public Sub New(ByVal game As GAME)

        m_game = game

        m_cxSpace = m_game.WorldBounds.Width
        m_cySpace = m_game.WorldBounds.Height

        m_xOld = 0
        m_yOld = 0
    End Sub

    Public Sub Draw(ByVal gx As Graphics)

        ' if is to draw
        If (m_bAlive) Then

            gx.DrawImage( _
                m_bmpOff(m_ActiveImage), _
                New Rectangle(m_x, m_y, m_cx, m_cy), _
                0, _
                0, _
                m_cx, _
                m_cy, _
                GraphicsUnit.Pixel, _
                m_mattr(m_ActiveImage))
        End If
    End Sub

    Public Sub Load(ByVal bmpName As String, ByVal ibmp As Integer)

        Try

            ' Load BMP from file
            m_bmpOff(ibmp) = New Bitmap(m_game.m_strGamePath + bmpName)
            m_cx = m_bmpOff(ibmp).Width
            m_cy = m_bmpOff(ibmp).Height

        Catch

            ' Any error reading the BMP, create a dummy one
            m_bmpOff(ibmp) = New Bitmap(m_cx, m_cy)
            Graphics.FromImage(m_bmpOff(ibmp)).FillEllipse(New SolidBrush(Color.White), New Rectangle(0, 0, m_cx - 1, m_cy - 1))
        End Try

        ' Get the color of a background pixel as the Pixel 0,0 
        Dim TranpColor As Color = m_bmpOff(ibmp).GetPixel(0, 0)

        ' Set the Attributes for the Transparent color
        m_mattr(ibmp) = New Imaging.ImageAttributes()
        m_mattr(ibmp).SetColorKey(TranpColor, TranpColor)
    End Sub

    Public Sub Restore()

        ' Restore the Game Background
        m_game.gxOff.DrawImage( _
            m_game.BackBmp, _
            m_x, _
            m_y, _
            New Rectangle(m_x, m_y, m_cx, m_cy), _
            GraphicsUnit.Pixel)
    End Sub

    Public Property Bounds() As Rectangle
        Get
            Return (New Rectangle(m_x, m_y, m_cx, m_cy))
        End Get
        Set(ByVal Value As Rectangle)
        End Set
    End Property

    Public Property DirtyArea() As Rectangle
        Get
            Return (Rectangle.Union(New Rectangle(m_x, m_y, m_cx, m_cy), New Rectangle(m_xOld, m_yOld, m_cx, m_cy)))
        End Get
        Set(ByVal Value As Rectangle)
        End Set
    End Property

    ' Expose object Draw property
    Public Property Alive() As Boolean
        Get
            Return (m_bAlive)
        End Get
        Set(ByVal Value As Boolean)
            m_bAlive = Value
        End Set
    End Property

End Class
