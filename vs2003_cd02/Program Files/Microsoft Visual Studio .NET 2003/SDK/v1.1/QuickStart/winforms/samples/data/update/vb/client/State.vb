'-----------------------------------------------------------------------
'  This file is part of the Microsoft .NET SDK Code Samples.
' 
'  Copyright (C) Microsoft Corporation.  All rights reserved.
' 
'This source code is intended only as a supplement to Microsoft
'Development Tools and/or on-line documentation.  See these other
'materials for detailed information regarding Microsoft code samples.
' 
'THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
'KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
'IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
'PARTICULAR PURPOSE.
'-----------------------------------------------------------------------


Namespace Microsoft.Samples.Windows.Forms.Vb.Update

    Public Structure State
        Private m_shortName, m_longName As String

        Public Sub New(ByVal longName As String, ByVal shortName As String)
            Me.m_shortName = shortName
            Me.m_longName = longName
        End Sub

        Public ReadOnly Property ShortName() As String
            Get
                Return m_shortName
            End Get
        End Property

        Public ReadOnly Property LongName() As String
            Get
                Return m_longName
            End Get

        End Property

    End Structure

End Namespace