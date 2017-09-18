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
Imports System.Drawing
Imports System.Windows.Forms

Imports Microsoft.Samples.WinForms.VB.SimpleBinding.Data

Namespace Microsoft.Samples.WinForms.VB.SimpleBinding

    Public Class SimpleBinding
        Inherits System.Windows.Forms.Form

        Private custList As CustomerList

        Public Sub New()
            MyBase.New()

            SimpleBinding = Me

            'This call is required by the Windows Forms Designer.
            InitializeComponent()

            ' Get the list of customers as an array
            custList = CustomerList.GetCustomers()

            ' Set up the bindings so that each field on the form is
            ' bound to a property of Customer
            textBoxID.DataBindings.Add("Text", custList, "ID")
            textBoxTitle.DataBindings.Add("Text", custList, "Title")
            textBoxLastName.DataBindings.Add("Text", custList, "LastName")
            textBoxFirstName.DataBindings.Add("Text", custList, "FirstName")

            'We want to format the date so handle the format and parse events for the
            'DOB text box
            Dim dobBinding As Binding = New Binding("Text", custList, "DateOfBirth")
            AddHandler dobBinding.Format, AddressOf Me.textBoxDOB_FormatDate
            AddHandler dobBinding.Parse, AddressOf Me.textBoxDOB_ParseDate
            textBoxDOB.DataBindings.Add(dobBinding)

            textBoxAddress.DataBindings.Add("Text", custList, "Address")


            ' We want to handle position changing events for the DATA VCR Panel
            ' Position is managed by the Form's BindingContext so hook the position changed
            ' event on the BindingContext
            AddHandler Me.BindingContext(custList).PositionChanged, AddressOf customers_PositionChanged

            ' Set up the initial text for the DATA VCR Panel
            textBoxPosition.Text = String.Format("Record {0} of {1}", (Me.BindingContext(custList).Position + 1), custList.Count)

            ' Set the minimum form size to the client size + the height of the title bar
            Me.MinimumSize = New Size(368, (413 + SystemInformation.CaptionHeight))

        End Sub


        'Format the Date Field in long date form for display in the TextBox
        Private Sub textBoxDOB_FormatDate(sender As object, e As ConvertEventArgs)

            'We only deal with converting to strings from dates
            if Not (e.DesiredType.Equals(GetType(string))) Then Return
            if Not (e.Value.GetType().Equals(GetType(DateTime))) Then Return

            Dim dt As DateTime = CType(e.Value,DateTime)
            e.Value = dt.ToLongDateString()

        End Sub

        'Parse the textbox contents and turn them back into a date
        Private Sub textBoxDOB_ParseDate(sender As object, e As ConvertEventArgs)
            'We only deal with converting to dates and strings
            if Not (e.DesiredType.Equals(GetType(DateTime))) Then Return
            if Not (e.Value.GetType().Equals(GetType(string))) Then Return

            Dim value As String = CType(e.Value, string)

            Try
                e.Value = DateTime.Parse(value)
            Catch ex As Exception
                MessageBox.Show(ex.Message)
            End Try
        End Sub

        ' When the MoveFirst button is clicked set the position for the CustomersList
        ' to the first record
        Private Sub buttonMoveFirst_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.BindingContext(custList).Position = 0
        End Sub


        ' When the MoveLast button is clicked set the position for the CustomersList
        ' to the last record
        Private Sub buttonMoveLast_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.BindingContext(custList).Position = custList.Count - 1
        End Sub


        ' When the MoveNext button is clicked increment the position for the CustomersList
        Private Sub buttonMoveNext_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            If Me.BindingContext(custList).Position < custList.Count - 1 Then
                Me.BindingContext(custList).Position += 1
            End If
        End Sub


        ' When the MovePrev button is clicked decrement the position for the CustomersList
        Private Sub buttonMovePrev_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            If Me.BindingContext(custList).Position > 0 Then
                Me.BindingContext(custList).Position -= 1
            End If
        End Sub


        ' Position has changed - update the DATA VCR panel
        Private Sub customers_PositionChanged(ByVal sender As Object, ByVal e As System.EventArgs)
            textBoxPosition.Text = String.Format("Record {0} of {1}", (Me.BindingContext(custList).Position + 1), custList.Count)
        End Sub


        'Clean up any resources being used
        Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
            If disposing Then
                If Not (components Is Nothing) Then
                    components.Dispose()
                End If
            End If
            MyBase.Dispose(disposing)
        End Sub


        'The main entry point for the application
        Shared Sub Main()
            System.Windows.Forms.Application.Run(New SimpleBinding())
        End Sub


#Region " Windows Form Designer generated code "

        'Required by the Windows Forms Designer
        Private components As System.ComponentModel.Container
        Private WithEvents labelTitle As System.Windows.Forms.Label
        Private WithEvents buttonMovePrev As System.Windows.Forms.Button
        Private WithEvents textBoxLastName As System.Windows.Forms.TextBox
        Private WithEvents textBoxPosition As System.Windows.Forms.TextBox
        Private WithEvents labelDOB As System.Windows.Forms.Label
        Private WithEvents labelFirstName As System.Windows.Forms.Label
        Private WithEvents textBoxTitle As System.Windows.Forms.TextBox
        Private WithEvents buttonMoveNext As System.Windows.Forms.Button
        Private WithEvents textBoxID As System.Windows.Forms.TextBox
        Private WithEvents buttonMoveFirst As System.Windows.Forms.Button
        Private WithEvents labelID As System.Windows.Forms.Label
        Private WithEvents labelAddress As System.Windows.Forms.Label
        Private WithEvents buttonMoveLast As System.Windows.Forms.Button
        Private WithEvents textBoxFirstName As System.Windows.Forms.TextBox
        Private WithEvents textBoxDOB As System.Windows.Forms.TextBox
        Private WithEvents panelVCRControl As System.Windows.Forms.Panel
        Private WithEvents labelLastName As System.Windows.Forms.Label
        Private WithEvents textBoxAddress As System.Windows.Forms.TextBox

        Private WithEvents SimpleBinding As System.Windows.Forms.Form

        'NOTE: The following procedure is required by the Windows Forms Designer
        'Do not modify it.
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.textBoxTitle = New System.Windows.Forms.TextBox()
            Me.labelFirstName = New System.Windows.Forms.Label()
            Me.buttonMoveNext = New System.Windows.Forms.Button()
            Me.buttonMovePrev = New System.Windows.Forms.Button()
            Me.labelTitle = New System.Windows.Forms.Label()
            Me.textBoxLastName = New System.Windows.Forms.TextBox()
            Me.labelDOB = New System.Windows.Forms.Label()
            Me.textBoxPosition = New System.Windows.Forms.TextBox()
            Me.textBoxID = New System.Windows.Forms.TextBox()
            Me.textBoxFirstName = New System.Windows.Forms.TextBox()
            Me.textBoxDOB = New System.Windows.Forms.TextBox()
            Me.textBoxAddress = New System.Windows.Forms.TextBox()
            Me.panelVCRControl = New System.Windows.Forms.Panel()
            Me.buttonMoveFirst = New System.Windows.Forms.Button()
            Me.labelLastName = New System.Windows.Forms.Label()
            Me.labelID = New System.Windows.Forms.Label()
            Me.buttonMoveLast = New System.Windows.Forms.Button()
            Me.labelAddress = New System.Windows.Forms.Label()

            textBoxTitle.Location = New System.Drawing.Point(88, 70)
            textBoxTitle.Text = ""
            textBoxTitle.TabIndex = 2
            textBoxTitle.Size = New System.Drawing.Size(70, 20)

            labelFirstName.Location = New System.Drawing.Point(8, 112)
            labelFirstName.Text = "&First Name:"
            labelFirstName.Size = New System.Drawing.Size(64, 16)
            labelFirstName.TabIndex = 3

            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.Text = "Customer Details"
            Me.ClientSize = New System.Drawing.Size(368, 413)

            buttonMoveNext.Location = New System.Drawing.Point(184, 8)
            buttonMoveNext.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            buttonMoveNext.Size = New System.Drawing.Size(32, 32)
            buttonMoveNext.TabIndex = 33
            buttonMoveNext.Anchor = AnchorStyles.Top
            buttonMoveNext.Text = ">"
            AddHandler Me.buttonMoveNext.Click, AddressOf Me.buttonMoveNext_Click

            buttonMovePrev.Location = New System.Drawing.Point(48, 8)
            buttonMovePrev.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            buttonMovePrev.Size = New System.Drawing.Size(32, 32)
            buttonMovePrev.TabIndex = 31
            buttonMovePrev.Text = "<"
            AddHandler Me.buttonMovePrev.Click, AddressOf Me.buttonMovePrev_Click

            labelTitle.Location = New System.Drawing.Point(8, 72)
            labelTitle.Text = "&Title:"
            labelTitle.Size = New System.Drawing.Size(64, 16)
            labelTitle.TabIndex = 1

            textBoxLastName.Location = New System.Drawing.Point(88, 152)
            textBoxLastName.Text = ""
            textBoxLastName.Anchor = AnchorStyles.Top Or AnchorStyles.Left Or AnchorStyles.Right
            textBoxLastName.TabIndex = 6
            textBoxLastName.Size = New System.Drawing.Size(243, 20)

            labelDOB.Location = New System.Drawing.Point(8, 194)
            labelDOB.Text = "&Date of Birth:"
            labelDOB.Size = New System.Drawing.Size(72, 16)
            labelDOB.TabIndex = 9

            textBoxPosition.Location = New System.Drawing.Point(88, 14)
            textBoxPosition.Text = ""
            textBoxPosition.Anchor = AnchorStyles.Left
            textBoxPosition.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
            textBoxPosition.ReadOnly = True
            textBoxPosition.TabStop = False
            textBoxPosition.Size = New System.Drawing.Size(88, 20)

            textBoxID.Location = New System.Drawing.Point(88, 30)
            textBoxID.Text = ""
            textBoxID.ReadOnly = True
            textBoxID.TabStop = False
            textBoxID.Size = New System.Drawing.Size(203, 20)

            textBoxFirstName.Location = New System.Drawing.Point(88, 112)
            textBoxFirstName.Text = ""
            textBoxFirstName.Anchor = AnchorStyles.Top Or AnchorStyles.Left Or AnchorStyles.Right
            textBoxFirstName.TabIndex = 4
            textBoxFirstName.Size = New System.Drawing.Size(243, 20)

            textBoxDOB.Location = New System.Drawing.Point(88, 192)
            textBoxDOB.Anchor = AnchorStyles.Top Or AnchorStyles.Left Or AnchorStyles.Right
            textBoxDOB.TabIndex = 10
            textBoxDOB.Size = New System.Drawing.Size(243, 20)

            textBoxAddress.Location = New System.Drawing.Point(88, 232)
            textBoxAddress.Text = ""
            textBoxAddress.Anchor = AnchorStyles.Top Or AnchorStyles.Bottom Or AnchorStyles.Left Or AnchorStyles.Right
            textBoxAddress.Multiline = True
            textBoxAddress.AcceptsReturn = True
            textBoxAddress.TabIndex = 12
            textBoxAddress.Size = New System.Drawing.Size(264, 88)

            panelVCRControl.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
            panelVCRControl.Location = New System.Drawing.Point(88, 344)
            panelVCRControl.Size = New System.Drawing.Size(264, 48)
            panelVCRControl.TabIndex = 32
            panelVCRControl.Anchor = AnchorStyles.Bottom
            panelVCRControl.Text = "panel1"

            buttonMoveFirst.Location = New System.Drawing.Point(8, 8)
            buttonMoveFirst.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            buttonMoveFirst.Size = New System.Drawing.Size(32, 32)
            buttonMoveFirst.TabIndex = 30
            buttonMoveFirst.Text = "|<"
            AddHandler Me.buttonMoveFirst.Click, AddressOf Me.buttonMoveFirst_Click

            labelLastName.Location = New System.Drawing.Point(8, 154)
            labelLastName.Text = "&Last Name:"
            labelLastName.Size = New System.Drawing.Size(64, 16)
            labelLastName.TabIndex = 5

            labelID.Location = New System.Drawing.Point(8, 32)
            labelID.Text = "ID:"
            labelID.Size = New System.Drawing.Size(64, 16)
            labelID.TabStop = False

            buttonMoveLast.Location = New System.Drawing.Point(224, 8)
            buttonMoveLast.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            buttonMoveLast.Size = New System.Drawing.Size(32, 32)
            buttonMoveLast.TabIndex = 34
            buttonMoveLast.Anchor = AnchorStyles.Top
            buttonMoveLast.Text = ">|"
            AddHandler Me.buttonMoveLast.Click, AddressOf Me.buttonMoveLast_Click

            labelAddress.Location = New System.Drawing.Point(8, 232)
            labelAddress.Text = "&Address:"
            labelAddress.Size = New System.Drawing.Size(64, 16)
            labelAddress.TabIndex = 11

            panelVCRControl.Controls.Add(textBoxPosition)
            panelVCRControl.Controls.Add(buttonMoveFirst)
            panelVCRControl.Controls.Add(buttonMovePrev)
            panelVCRControl.Controls.Add(buttonMoveNext)
            panelVCRControl.Controls.Add(buttonMoveLast)

            Me.Controls.Add(textBoxAddress)
            Me.Controls.Add(labelLastName)
            Me.Controls.Add(panelVCRControl)
            Me.Controls.Add(textBoxDOB)
            Me.Controls.Add(textBoxFirstName)
            Me.Controls.Add(labelAddress)
            Me.Controls.Add(labelID)
            Me.Controls.Add(textBoxID)
            Me.Controls.Add(textBoxTitle)
            Me.Controls.Add(labelFirstName)
            Me.Controls.Add(labelDOB)
            Me.Controls.Add(textBoxLastName)
            Me.Controls.Add(labelTitle)

        End Sub

#End Region

    End Class

End Namespace

