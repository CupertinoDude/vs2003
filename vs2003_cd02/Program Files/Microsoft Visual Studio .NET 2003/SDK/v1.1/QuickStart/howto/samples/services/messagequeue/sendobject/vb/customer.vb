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

Public Class Customer
	protected last As String
	protected first As String
	
	public Property LastName as string
                get
			return me.last
                End get
                set
			Me.last = value
                End set
        end property 
        
	public property FirstName as string 
		get
			return me.first
		end get 
		set
			me.first = value
		end set
        end property

	public readonly property FullName as string
		get
			return (FirstName + LastName)
		end get
	end property
End Class