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
Imports System.ComponentModel
Imports System.ComponentModel.Design
Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.Drawing.Design
Imports System.Windows.Forms
Imports System.Diagnostics

Namespace Microsoft.Samples.WinForms.VB.FlashTrackBar 

   Public Class FlashTrackBarDarkenByEditor 
        Inherits FlashTrackBarValueEditor 
   
       Overrides Protected Sub SetEditorProps(editingInstance As FlashTrackBar, editor As FlashTrackBar) 
           MyBase.SetEditorProps(editingInstance, editor)
           editor.Min = 0
           editor.Max = System.Byte.MaxValue
       End Sub
   
   End Class
   
End Namespace
