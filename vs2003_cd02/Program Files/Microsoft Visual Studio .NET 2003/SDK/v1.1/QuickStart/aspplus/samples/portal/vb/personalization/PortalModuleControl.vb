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

Imports System
Imports System.Web
Imports System.Web.UI
Imports Personalization

Public Class PortalModuleControl : Inherits UserControl
  
    Public ReadOnly Property UserState As UserState    
        Get
            Dim myState As UserState = CType(Context.Items("UserState"), UserState)
            if (myState Is Nothing) Then
                Throw New Exception("No UserState Loaded!!!")
			Else
				Return myState
            End If
        End Get
    End Property

End Class