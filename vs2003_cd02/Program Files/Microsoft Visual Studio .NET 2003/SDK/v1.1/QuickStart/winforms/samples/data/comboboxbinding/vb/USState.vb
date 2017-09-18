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


namespace Microsoft.Samples.WinForms.VB.ComboBoxBinding 
    
    public class USState 
        
        private strShortName As String
	    private strLongName As String

        public Sub New(ByVal strlongName As String , ByVal strShortName As String)  
            MyBase.New
            Me.strShortName = strShortName
	        Me.strLongName = strLongName 
        End Sub

        public ReadOnly Property ShortName() As String
		    Get
			    return strShortName
		    End Get
	    End Property
	
        public ReadOnly Property LongName() As String
		    Get
			    return strLongName
		    End Get
       end property
       
    End Class

End Namespace