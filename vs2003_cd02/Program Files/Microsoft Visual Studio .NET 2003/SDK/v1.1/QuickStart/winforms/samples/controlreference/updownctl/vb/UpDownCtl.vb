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
Imports System.Collections
Imports System.ComponentModel
Imports System.Drawing
Imports System.Windows.Forms

Namespace Microsoft.Samples.Windows.Forms.VB.UpDownCtl

    ' <doc>
    ' <desc>
    '     This sample demonstrates how to use NumericUpDown and DomainUpDown controls
    ' </desc>
    ' </doc>
    '
    Public Class UpDownCtl
        Inherits System.Windows.Forms.Form

        Public Sub New()

            MyBase.New()

            UpDownCtl = Me

            'This call is required by the Windows Forms Designer.
            InitializeComponent()

            'Complete intialization of the Form
            Me.updnTextAlign.Items.Add(New StringIntObject("Center", CInt(HorizontalAlignment.Center)))
            Me.updnTextAlign.Items.Add(New StringIntObject("Left", CInt(HorizontalAlignment.Left)))
            Me.updnTextAlign.Items.Add(New StringIntObject("Right", CInt(HorizontalAlignment.Right)))
            Me.updnTextAlign.SelectedIndex = 1

            Me.updnUpDownAlignment.Items.Add(New StringIntObject("Left", CInt(LeftRightAlignment.Left)))
            Me.updnUpDownAlignment.Items.Add(New StringIntObject("Right", CInt(LeftRightAlignment.Right)))
            Me.updnUpDownAlignment.SelectedIndex = 1

            Me.domainUpDown1.Items.Add("King Kong")
            Me.domainUpDown1.Items.Add("The Creature from the Black Lagoon")
            Me.domainUpDown1.Items.Add("Dracula")
            Me.domainUpDown1.Items.Add("Frankenstein's Monster")
            Me.domainUpDown1.Items.Add("Godzilla")
            Me.domainUpDown1.SelectedIndex = 0

            Me.updnDecimalPlaces.DecimalPlaces = 0
        End Sub


        'Form overrides dispose to clean up the component list.
        Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
            If disposing Then
                If Not (components Is Nothing) Then
                    components.Dispose()
                End If
            End If
            MyBase.Dispose(disposing)
        End Sub



        Private Sub updnUpDownAlignment_SelectedItemChanged(ByVal sender As Object, ByVal e As EventArgs)
            If updnUpDownAlignment.SelectedIndex <> -1 Then
                Dim sio As StringIntObject = CType(updnUpDownAlignment.Items(updnUpDownAlignment.SelectedIndex), StringIntObject)
                numericUpDown1.UpDownAlign = CType(sio.i, LeftRightAlignment)
                domainUpDown1.UpDownAlign = CType(sio.i, LeftRightAlignment)
            End If
        End Sub

        Private Sub updnTextAlign_SelectedItemChanged(ByVal sender As Object, ByVal e As EventArgs)
            If updnTextAlign.SelectedIndex <> -1 Then
                Dim sio As StringIntObject = CType(updnTextAlign.Items(updnTextAlign.SelectedIndex), StringIntObject)
                numericUpDown1.TextAlign = CType(sio.i, HorizontalAlignment)
                domainUpDown1.TextAlign = CType(sio.i, HorizontalAlignment)
            End If
        End Sub

        Private Sub chkInterceptArrowKeys_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
            numericUpDown1.InterceptArrowKeys = chkInterceptArrowKeys.Checked
            domainUpDown1.InterceptArrowKeys = chkInterceptArrowKeys.Checked
        End Sub

        Private Sub chkSorted_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
            domainUpDown1.Sorted = chkSorted.Checked
        End Sub

        Private Sub chkWrap_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
            domainUpDown1.Wrap = chkWrap.Checked
        End Sub

        Private Sub updnIncrement_ValueChanged(ByVal sender As Object, ByVal e As EventArgs)
            numericUpDown1.Increment = updnIncrement.Value
        End Sub

        Private Sub updnDecimalPlaces_ValueChanged(ByVal sender As Object, ByVal e As EventArgs)
            numericUpDown1.DecimalPlaces = CInt(updnDecimalPlaces.Value)
            updnIncrement.Value = CInt(updnIncrement.Value) ' Just so we don't increment by amounts we can't see.
            updnIncrement.DecimalPlaces = CInt(updnDecimalPlaces.Value)
        End Sub


#Region " Windows Form Designer generated code "

        'Required by the Windows Form Designer
        Private components As System.ComponentModel.Container
        Protected WithEvents updnUpDownAlignment As System.Windows.Forms.DomainUpDown
        Protected WithEvents updnTextAlign As System.Windows.Forms.DomainUpDown
        Protected WithEvents lblIncrement As System.Windows.Forms.Label
        Protected WithEvents updnIncrement As System.Windows.Forms.NumericUpDown
        Protected WithEvents lblDecimalPlaces As System.Windows.Forms.Label
        Protected WithEvents updnDecimalPlaces As System.Windows.Forms.NumericUpDown
        Protected WithEvents chkSorted As System.Windows.Forms.CheckBox
        Protected WithEvents lblUpDownAlignment As System.Windows.Forms.Label
        Protected WithEvents lblTextAlign As System.Windows.Forms.Label
        Protected WithEvents chkInterceptArrowKeys As System.Windows.Forms.CheckBox
        Protected WithEvents chkWrap As System.Windows.Forms.CheckBox
        Protected WithEvents grpCommonProperties As System.Windows.Forms.GroupBox
        Protected WithEvents numericUpDown1 As System.Windows.Forms.NumericUpDown
        Protected WithEvents domainUpDown1 As System.Windows.Forms.DomainUpDown
        Protected WithEvents grpDomainUpDown As System.Windows.Forms.GroupBox
        Protected WithEvents grpNumericUpDown As System.Windows.Forms.GroupBox

        Private WithEvents UpDownCtl As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.grpDomainUpDown = New System.Windows.Forms.GroupBox()
            Me.updnDecimalPlaces = New System.Windows.Forms.NumericUpDown()
            Me.chkWrap = New System.Windows.Forms.CheckBox()
            Me.grpNumericUpDown = New System.Windows.Forms.GroupBox()
            Me.chkSorted = New System.Windows.Forms.CheckBox()
            Me.lblUpDownAlignment = New System.Windows.Forms.Label()
            Me.lblIncrement = New System.Windows.Forms.Label()
            Me.chkInterceptArrowKeys = New System.Windows.Forms.CheckBox()
            Me.grpCommonProperties = New System.Windows.Forms.GroupBox()
            Me.lblTextAlign = New System.Windows.Forms.Label()
            Me.domainUpDown1 = New System.Windows.Forms.DomainUpDown()
            Me.updnTextAlign = New System.Windows.Forms.DomainUpDown()
            Me.updnIncrement = New System.Windows.Forms.NumericUpDown()
            Me.lblDecimalPlaces = New System.Windows.Forms.Label()
            Me.updnUpDownAlignment = New System.Windows.Forms.DomainUpDown()
            Me.numericUpDown1 = New System.Windows.Forms.NumericUpDown()

            grpDomainUpDown.Location = New System.Drawing.Point(260, 24)
            grpDomainUpDown.TabIndex = 1
            grpDomainUpDown.TabStop = False
            grpDomainUpDown.Text = "DomainUpDown"
            grpDomainUpDown.Size = New System.Drawing.Size(230, 176)

            updnDecimalPlaces.Location = New System.Drawing.Point(120, 80)
            updnDecimalPlaces.Maximum = New System.Decimal(10)
            updnDecimalPlaces.Minimum = New System.Decimal(0)
            updnDecimalPlaces.DecimalPlaces = 0
            updnDecimalPlaces.TabIndex = 1
            updnDecimalPlaces.Text = "2"
            updnDecimalPlaces.Size = New System.Drawing.Size(105, 23)
            AddHandler updnDecimalPlaces.ValueChanged, New System.EventHandler(AddressOf updnDecimalPlaces_ValueChanged)

            chkWrap.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
            chkWrap.Location = New System.Drawing.Point(10, 80)
            chkWrap.TabIndex = 1
            chkWrap.Text = "Wrap"
            chkWrap.Size = New System.Drawing.Size(104, 24)
            AddHandler chkWrap.CheckedChanged, New System.EventHandler(AddressOf chkWrap_CheckedChanged)

            grpNumericUpDown.Location = New System.Drawing.Point(16, 24)
            grpNumericUpDown.TabIndex = 0
            grpNumericUpDown.TabStop = False
            grpNumericUpDown.Text = "NumericUpDown"
            grpNumericUpDown.Size = New System.Drawing.Size(232, 176)

            chkSorted.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
            chkSorted.Location = New System.Drawing.Point(10, 120)
            chkSorted.TabIndex = 2
            chkSorted.Text = "Sorted"
            chkSorted.Size = New System.Drawing.Size(104, 24)
            AddHandler chkSorted.CheckedChanged, New System.EventHandler(AddressOf chkSorted_CheckedChanged)

            lblUpDownAlignment.Location = New System.Drawing.Point(16, 64)
            lblUpDownAlignment.TabIndex = 2
            lblUpDownAlignment.TabStop = False
            lblUpDownAlignment.Text = "UpDownAlignment"
            lblUpDownAlignment.Size = New System.Drawing.Size(120, 24)

            lblIncrement.Location = New System.Drawing.Point(10, 120)
            lblIncrement.TabIndex = 4
            lblIncrement.TabStop = False
            lblIncrement.Text = "Increment"
            lblIncrement.Size = New System.Drawing.Size(72, 24)

            chkInterceptArrowKeys.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
            chkInterceptArrowKeys.Location = New System.Drawing.Point(304, 32)
            chkInterceptArrowKeys.TabIndex = 0
            chkInterceptArrowKeys.CheckState = System.Windows.Forms.CheckState.Checked
            chkInterceptArrowKeys.Text = "InterceptArrowKeys"
            chkInterceptArrowKeys.Size = New System.Drawing.Size(144, 24)
            chkInterceptArrowKeys.Checked = True
            AddHandler chkInterceptArrowKeys.CheckedChanged, New System.EventHandler(AddressOf chkInterceptArrowKeys_CheckedChanged)

            grpCommonProperties.Location = New System.Drawing.Point(16, 224)
            grpCommonProperties.TabIndex = 2
            grpCommonProperties.TabStop = False
            grpCommonProperties.Text = "CommonProperties"
            grpCommonProperties.Size = New System.Drawing.Size(472, 112)

            lblTextAlign.Location = New System.Drawing.Point(16, 32)
            lblTextAlign.TabIndex = 1
            lblTextAlign.TabStop = False
            lblTextAlign.Text = "TextAlign"
            lblTextAlign.Size = New System.Drawing.Size(120, 24)

            domainUpDown1.Location = New System.Drawing.Point(5, 32)
            domainUpDown1.TabIndex = 0
            domainUpDown1.Size = New System.Drawing.Size(220, 23)
            domainUpDown1.ReadOnly = True

            updnTextAlign.Location = New System.Drawing.Point(152, 32)
            updnTextAlign.TabIndex = 3
            updnTextAlign.Size = New System.Drawing.Size(120, 23)
            AddHandler updnTextAlign.SelectedItemChanged, New System.EventHandler(AddressOf updnTextAlign_SelectedItemChanged)

            updnIncrement.Location = New System.Drawing.Point(120, 120)
            updnIncrement.Maximum = New System.Decimal(100)
            updnIncrement.Minimum = New System.Decimal(1)
            updnIncrement.TabIndex = 2
            updnIncrement.DecimalPlaces = 2
            updnIncrement.Text = "1.00"
            updnIncrement.Size = New System.Drawing.Size(105, 23)
            AddHandler updnIncrement.valuechanged, New System.EventHandler(AddressOf updnIncrement_ValueChanged)

            Me.AutoScaleBaseSize = New System.Drawing.Size(6, 16)
            Me.ClientSize = New System.Drawing.Size(504, 352)
            Me.Text = "UpDownCtlForm"

            lblDecimalPlaces.Location = New System.Drawing.Point(10, 80)
            lblDecimalPlaces.TabIndex = 3
            lblDecimalPlaces.TabStop = False
            lblDecimalPlaces.Text = "DecimalPlaces"
            lblDecimalPlaces.Size = New System.Drawing.Size(96, 24)

            updnUpDownAlignment.Location = New System.Drawing.Point(152, 64)
            updnUpDownAlignment.TabIndex = 4
            updnUpDownAlignment.Size = New System.Drawing.Size(120, 23)
            AddHandler updnUpDownAlignment.SelectedItemChanged, New System.EventHandler(AddressOf updnUpDownAlignment_SelectedItemChanged)

            numericUpDown1.Location = New System.Drawing.Point(10, 32)
            numericUpDown1.Maximum = New System.Decimal(100)
            numericUpDown1.Minimum = New System.Decimal(0)
            numericUpDown1.TabIndex = 0
            numericUpDown1.DecimalPlaces = 2
            numericUpDown1.Text = "0.00"
            numericUpDown1.Size = New System.Drawing.Size(215, 23)

            Me.Controls.Add(grpCommonProperties)
            Me.Controls.Add(grpDomainUpDown)
            Me.Controls.Add(grpNumericUpDown)
            grpCommonProperties.Controls.Add(updnUpDownAlignment)
            grpCommonProperties.Controls.Add(updnTextAlign)
            grpCommonProperties.Controls.Add(lblUpDownAlignment)
            grpCommonProperties.Controls.Add(lblTextAlign)
            grpCommonProperties.Controls.Add(chkInterceptArrowKeys)
            grpNumericUpDown.Controls.Add(lblIncrement)
            grpNumericUpDown.Controls.Add(updnIncrement)
            grpNumericUpDown.Controls.Add(lblDecimalPlaces)
            grpNumericUpDown.Controls.Add(updnDecimalPlaces)
            grpNumericUpDown.Controls.Add(numericUpDown1)
            grpDomainUpDown.Controls.Add(chkSorted)
            grpDomainUpDown.Controls.Add(chkWrap)
            grpDomainUpDown.Controls.Add(domainUpDown1)
        End Sub

#End Region


        ' The main entry point for the application.
        <STAThread()> Public Shared Sub Main()
            Application.Run(New UpDownCtl())
        End Sub

    End Class

End Namespace
