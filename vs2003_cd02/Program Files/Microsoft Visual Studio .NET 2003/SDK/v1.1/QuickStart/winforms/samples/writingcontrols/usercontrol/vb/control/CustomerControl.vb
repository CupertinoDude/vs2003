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
Imports System.Windows.Forms
Imports System.Drawing


Namespace Microsoft.Samples.WinForms.VB.CustomerControl

    Public Class CustomerControl
        Inherits System.Windows.Forms.UserControl

        Private customer1 As Customer

        Public Sub New()

            MyBase.New()

            '  Required by the Windows Forms Designer
            InitializeComponent()

        End Sub

        Public Property Customer() As Customer
            Get
                Return customer1
            End Get

            Set(ByVal Value As Customer)
                customer1 = Value
                LoadCustomer()
            End Set
        End Property

        Public Sub AcceptChanges()
            customer1.Title = textBoxTitle.Text
            customer1.FirstName = textBoxFirstName.Text
            customer1.LastName = textBoxLastName.Text
            customer1.Address = textBoxAddress.Text
        End Sub

        Public Sub RejectChanges()
            LoadCustomer()
        End Sub

        Private Sub LoadCustomer()
            textBoxID.Text = customer1.ID
            textBoxTitle.Text = customer1.Title
            textBoxFirstName.Text = customer1.FirstName
            textBoxLastName.Text = customer1.LastName
            textBoxAddress.Text = customer1.Address
        End Sub

        Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
            If disposing Then
                If Not (components Is Nothing) Then
                    components.Dispose()
                End If
            End If
            MyBase.Dispose(disposing)
        End Sub

#Region " Windows Form Designer generated code "

        'Required by the Windows Form Designer
        Private components As System.ComponentModel.Container
        Private WithEvents textBoxTitle As System.Windows.Forms.TextBox
        Private WithEvents labelTitle As System.Windows.Forms.Label
        Private WithEvents textBoxAddress As System.Windows.Forms.TextBox
        Private WithEvents textBoxLastName As System.Windows.Forms.TextBox
        Private WithEvents textBoxFirstName As System.Windows.Forms.TextBox
        Private WithEvents textBoxID As System.Windows.Forms.TextBox
        Private WithEvents labelAddress As System.Windows.Forms.Label
        Private WithEvents labelLastName As System.Windows.Forms.Label
        Private WithEvents labelFirstName As System.Windows.Forms.Label
        Private WithEvents labelID As System.Windows.Forms.Label

        'NOTE: The following procedure is required by the Windows Form Designer
        'It can be modified using the Windows Form Designer.
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.labelAddress = New System.Windows.Forms.Label()
            Me.labelLastName = New System.Windows.Forms.Label()
            Me.textBoxFirstName = New System.Windows.Forms.TextBox()
            Me.textBoxLastName = New System.Windows.Forms.TextBox()
            Me.labelFirstName = New System.Windows.Forms.Label()
            Me.labelTitle = New System.Windows.Forms.Label()
            Me.textBoxTitle = New System.Windows.Forms.TextBox()
            Me.textBoxAddress = New System.Windows.Forms.TextBox()
            Me.labelID = New System.Windows.Forms.Label()
            Me.textBoxID = New System.Windows.Forms.TextBox()

            labelAddress.Size = New System.Drawing.Size(64, 16)
            labelAddress.Location = New System.Drawing.Point(8, 194)
            labelAddress.TabIndex = 9
            labelAddress.Text = "Address:"

            labelLastName.Size = New System.Drawing.Size(64, 16)
            labelLastName.Location = New System.Drawing.Point(8, 154)
            labelLastName.TabIndex = 8
            labelLastName.Text = "LastName:"

            textBoxFirstName.Anchor = (System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left Or System.Windows.Forms.AnchorStyles.Right)
            textBoxFirstName.Text = ""
            textBoxFirstName.TabIndex = 2
            textBoxFirstName.Size = New System.Drawing.Size(240, 20)
            textBoxFirstName.Location = New System.Drawing.Point(88, 112)

            Me.Text = "CustomerControl"
            Me.Size = New System.Drawing.Size(384, 304)

            textBoxLastName.Anchor = (System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left Or System.Windows.Forms.AnchorStyles.Right)
            textBoxLastName.Location = New System.Drawing.Point(88, 152)
            textBoxLastName.Text = ""
            textBoxLastName.TabIndex = 3
            textBoxLastName.Size = New System.Drawing.Size(240, 20)

            labelFirstName.Location = New System.Drawing.Point(8, 112)
            labelFirstName.Size = New System.Drawing.Size(64, 16)
            labelFirstName.TabIndex = 7
            labelFirstName.Text = "First Name:"

            labelTitle.Size = New System.Drawing.Size(64, 16)
            labelTitle.Location = New System.Drawing.Point(8, 72)
            labelTitle.TabIndex = 6
            labelTitle.Text = "Title:"

            textBoxTitle.Anchor = (System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left Or System.Windows.Forms.AnchorStyles.Right)
            textBoxTitle.Text = ""
            textBoxTitle.TabIndex = 1
            textBoxTitle.Size = New System.Drawing.Size(88, 20)
            textBoxTitle.Location = New System.Drawing.Point(88, 70)

            textBoxAddress.Anchor = (System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left Or System.Windows.Forms.AnchorStyles.Right)
            textBoxAddress.Text = ""
            textBoxAddress.Multiline = True
            textBoxAddress.TabIndex = 4
            textBoxAddress.Size = New System.Drawing.Size(264, 96)
            textBoxAddress.Location = New System.Drawing.Point(88, 192)
            textBoxAddress.AcceptsReturn = True

            labelID.Size = New System.Drawing.Size(64, 16)
            labelID.Location = New System.Drawing.Point(8, 32)
            labelID.TabIndex = 5
            labelID.Text = "ID:"

            textBoxID.Anchor = (System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left Or System.Windows.Forms.AnchorStyles.Right)
            textBoxID.Text = ""
            textBoxID.ReadOnly = True
            textBoxID.TabIndex = 0
            textBoxID.Size = New System.Drawing.Size(200, 20)
            textBoxID.Location = New System.Drawing.Point(88, 30)
            textBoxID.Enabled = False

            Me.Controls.Add(textBoxTitle)
            Me.Controls.Add(labelTitle)
            Me.Controls.Add(textBoxAddress)
            Me.Controls.Add(textBoxLastName)
            Me.Controls.Add(textBoxFirstName)
            Me.Controls.Add(textBoxID)
            Me.Controls.Add(labelAddress)
            Me.Controls.Add(labelLastName)
            Me.Controls.Add(labelFirstName)
            Me.Controls.Add(labelID)

        End Sub

#End Region

    End Class ' CustomerControl

End Namespace ' Microsoft.Samples.WinForms.VB.CustomerControl
