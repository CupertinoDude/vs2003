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
Imports System.Windows.Forms.ComponentModel
Imports System.Windows.Forms.Design

Namespace Microsoft.Samples.WinForms.VB.FlashTrackBar

    Public Class FlashTrackBarValueEditor
        Inherits UITypeEditor

        Private edSvc As IWindowsFormsEditorService


        Overridable Protected Sub SetEditorProps(editingInstance As FlashTrackBar, editor As FlashTrackBar)
            editor.ShowValue = true
            editor.StartColor = Color.Navy
            editor.EndColor = Color.White
            editor.ForeColor = Color.White
            editor.Min = editingInstance.Min
            editor.Max = editingInstance.Max
        End Sub

        Overrides OverLoads Public Function EditValue(context As ITypeDescriptorContext, provider As IServiceProvider, value As object) As Object

            If (Not (context Is Nothing) And Not (context.Instance Is Nothing) And Not (provider Is Nothing)) Then

                edSvc = CType(provider.GetService(GetType(IWindowsFormsEditorService)), IWindowsFormsEditorService)

                If Not (edSvc Is Nothing) Then

                    Dim trackBar As FlashTrackBar = New FlashTrackBar()
                    AddHandler trackBar.ValueChanged, AddressOf Me.ValueChanged
                    SetEditorProps(CType(context.Instance, FlashTrackBar), TrackBar)

                    Dim asInt As Boolean = True

                    If (TypeOf value Is Integer) Then
                        trackBar.Value = CInt(value)
                    ElseIf (TypeOf value Is System.Byte) Then
                        asInt = False
                        trackBar.Value = CType(value, Byte)
                    End If

                    edSvc.DropDownControl(trackBar)

                    If (asInt) Then
                        value = trackBar.Value
                    Else
                        value = CType(trackBar.Value, Byte)
                    End If

                End If

            End If

            Return value

         End Function

        Overrides OverLoads Public Function GetEditStyle(context As ITypeDescriptorContext) As UITypeEditorEditStyle
            If (Not (context Is Nothing) And Not (context.Instance Is Nothing)) Then
                Return UITypeEditorEditStyle.DropDown
            End If
            Return MyBase.GetEditStyle(context)
        End Function

        private Sub ValueChanged(sender As object, e As EventArgs)
            If Not (edSvc Is Nothing) Then
                edSvc.CloseDropDown()
            End If
        End Sub

    End Class

End Namespace
