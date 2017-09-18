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
Imports System.Data
Imports System.Data.SqlClient

Namespace Microsoft.Samples.WinForms.VB.ComboBoxBinding

    Public Class ComboBoxBinding
        Inherits System.Windows.Forms.Form

        ' Define the array of states for the drop-down list
        Public USStates() As USState = New USState() { _
             New USState("Alabama", "AL") _
            , New USState("Alaska", "AK") _
            , New USState("Arizona", "AZ") _
            , New USState("Arkansas", "AR") _
            , New USState("California", "CA") _
            , New USState("Colorado", "CO") _
            , New USState("Connecticut", "CT") _
            , New USState("Delaware", "DE") _
            , New USState("District of Columbia", "DC") _
            , New USState("Florida", "FL") _
            , New USState("Georgia", "GA") _
            , New USState("Hawaii", "HI") _
            , New USState("Idaho", "ID") _
            , New USState("Illinois", "IL") _
            , New USState("Indiana", "IN") _
            , New USState("Iowa", "IA") _
            , New USState("Kansas", "KS") _
            , New USState("Kentucky", "KY") _
            , New USState("Louisiana", "LA") _
            , New USState("Maine", "ME") _
            , New USState("Maryland", "MD") _
            , New USState("Massachusetts", "MA") _
            , New USState("Michigan", "MI") _
            , New USState("Minnesota", "MN") _
            , New USState("Mississippi", "MS") _
            , New USState("Missouri", "MO") _
            , New USState("Montana", "MT") _
            , New USState("Nebraska", "NE") _
            , New USState("Nevada", "NV") _
            , New USState("New Hampshire", "NH") _
            , New USState("New Jersey", "NJ") _
            , New USState("New Mexico", "NM") _
            , New USState("New York", "NY") _
            , New USState("North Carolina", "NC") _
            , New USState("North Dakota", "ND") _
            , New USState("Ohio", "OH") _
            , New USState("Oklahoma", "OK") _
            , New USState("Oregon", "OR") _
            , New USState("Pennsylvania", "PA") _
            , New USState("Rhode Island", "RI") _
            , New USState("South Carolina", "SC") _
            , New USState("South Dakota", "SD") _
            , New USState("Tennessee", "TN") _
            , New USState("Texas", "TX") _
            , New USState("Utah", "UT") _
            , New USState("Vermont", "VT") _
            , New USState("Virginia", "VA") _
            , New USState("Washington", "WA") _
            , New USState("West Virginia", "WV") _
            , New USState("Wisconsin", "WI") _
            , New USState("Wyoming", "WY")}

        Shared Sub Main()
            Application.Run(New ComboBoxBinding())
        End Sub


        Public Sub New()
            MyBase.New()

            ComboBoxBinding = Me

            '  Required by the Windows Forms Designer
            InitializeComponent()

            ' Fill the DataSet
            Dim con As SqlConnection = New SqlConnection("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind")
            Dim cmd As SqlDataAdapter = New SqlDataAdapter("Select * from Customers where country='USA'", con)
		
	    Try
                cmd.Fill(customersDataSet1, "Customers")

                ' Set up the Combobox bindings
                comboBoxUSState.DataSource = USStates            ' Populate the list
                comboBoxUSState.DisplayMember = "LongName"     ' Define the field to be displayed
                comboBoxUSState.ValueMember = "ShortName"      ' Define the field to be used as the value

                ' Bind the selected value of the combobox to the Region field of the current
                ' Customer
                comboBoxUSState.DataBindings.Add("SelectedValue", customersDataSet1, "Customers.Region")

                ' Set up the rest of the form bindings
                textBoxID.DataBindings.Add("Text", customersDataSet1, "Customers.CustomerID")
                textBoxCity.DataBindings.Add("Text", customersDataSet1, "Customers.City")
                textBoxTitle.DataBindings.Add("Text", customersDataSet1, "Customers.ContactTitle")
                textBoxAddress.DataBindings.Add("Text", customersDataSet1, "Customers.Address")
                textBoxCompany.DataBindings.Add("Text", customersDataSet1, "Customers.CompanyName")
                textBoxContact.DataBindings.Add("Text", customersDataSet1, "Customers.ContactName")
                textBoxZip.DataBindings.Add("Text", customersDataSet1, "Customers.PostalCode")

                ' We want to handle position changing events for the DATA VCR Panel
                AddHandler Me.BindingContext(customersDataSet1, "Customers").PositionChanged, AddressOf customers_PositionChanged

                ' Set up the initial text for the DATA VCR Panel
                textBoxPosition.Text = "Record " + (Me.BindingContext(customersDataSet1, "Customers").Position + 1).ToString() + " of " + customersDataSet1.Customers.Count.ToString()

                ' Set the minimum form size
                Me.MinimumSize = New Size(375, 361)
	    Catch ex as Exception
                Throw ex
	    Finally
                con.Close()
	    End Try

        End Sub


        ' When the MoveFirst button is clicked set the position for the Customers table
        ' to the first record
        Protected Sub buttonMoveFirst_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.BindingContext(customersDataSet1, "Customers").Position = 0
        End Sub


        ' When the MoveLast button is clicked set the position for the Customers table
        ' to the last record
        Protected Sub buttonMoveLast_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.BindingContext(customersDataSet1, "Customers").Position = customersDataSet1.Customers.Count - 1
        End Sub


        ' When the MoveNext button is clicked increment the position for the Customers table
        Protected Sub buttonMoveNext_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            If Me.BindingContext(customersDataSet1, "Customers").Position < customersDataSet1.Customers.Count - 1 Then
                Me.BindingContext(customersDataSet1, "Customers").Position += 1
            End If
        End Sub


        ' When the MovePrev button is clicked decrement the position for the Customers table
        Protected Sub buttonMovePrev_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            If Me.BindingContext(customersDataSet1, "Customers").Position > 0 Then
                Me.BindingContext(customersDataSet1, "Customers").Position -= 1
            End If
        End Sub


        ' Position has changed - update the DATA VCR panel
        Protected Sub customers_PositionChanged(ByVal sender As Object, ByVal e As System.EventArgs)
            textBoxPosition.Text = "Record " + (Me.BindingContext(customersDataSet1, "Customers").Position + 1).ToString() + " of " + customersDataSet1.Customers.Count.ToString()
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

        Private components As System.ComponentModel.Container
        Private WithEvents customersDataSet1 As Microsoft.Samples.WinForms.VB.ComboBoxBinding.Data.CustomersDataSet
        Private WithEvents textBoxZip As System.Windows.Forms.TextBox
        Private WithEvents comboBoxUSState As System.Windows.Forms.ComboBox
        Private WithEvents textBoxCity As System.Windows.Forms.TextBox
        Private WithEvents labelUSState As System.Windows.Forms.Label
        Private WithEvents labelZip As System.Windows.Forms.Label
        Private WithEvents labelCity As System.Windows.Forms.Label
        Private WithEvents textBoxPosition As System.Windows.Forms.TextBox
        Private WithEvents buttonMoveFirst As System.Windows.Forms.Button
        Private WithEvents buttonMovePrev As System.Windows.Forms.Button
        Private WithEvents buttonMoveNext As System.Windows.Forms.Button
        Private WithEvents buttonMoveLast As System.Windows.Forms.Button
        Private WithEvents textBoxCompany As System.Windows.Forms.TextBox
        Private WithEvents labelCompanyName As System.Windows.Forms.Label
        Private WithEvents textBoxAddress As System.Windows.Forms.TextBox
        Private WithEvents textBoxTitle As System.Windows.Forms.TextBox
        Private WithEvents textBoxContact As System.Windows.Forms.TextBox
        Private WithEvents textBoxID As System.Windows.Forms.TextBox
        Private WithEvents labelAddress As System.Windows.Forms.Label
        Private WithEvents labelContactTitle As System.Windows.Forms.Label
        Private WithEvents labelContact As System.Windows.Forms.Label
        Private WithEvents labelID As System.Windows.Forms.Label
        Private WithEvents panelVCRControl As System.Windows.Forms.Panel

        Private WithEvents ComboBoxBinding As System.Windows.Forms.Form

        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.labelCity = New System.Windows.Forms.Label()
            Me.buttonMoveNext = New System.Windows.Forms.Button()
            Me.customersDataSet1 = New Microsoft.Samples.WinForms.VB.ComboBoxBinding.Data.CustomersDataSet()
            Me.labelContact = New System.Windows.Forms.Label()
            Me.buttonMoveFirst = New System.Windows.Forms.Button()
            Me.textBoxID = New System.Windows.Forms.TextBox()
            Me.textBoxCity = New System.Windows.Forms.TextBox()
            Me.labelContactTitle = New System.Windows.Forms.Label()
            Me.labelCompanyName = New System.Windows.Forms.Label()
            Me.textBoxTitle = New System.Windows.Forms.TextBox()
            Me.textBoxPosition = New System.Windows.Forms.TextBox()
            Me.labelUSState = New System.Windows.Forms.Label()
            Me.buttonMovePrev = New System.Windows.Forms.Button()
            Me.labelZip = New System.Windows.Forms.Label()
            Me.textBoxAddress = New System.Windows.Forms.TextBox()
            Me.textBoxCompany = New System.Windows.Forms.TextBox()
            Me.panelVCRControl = New System.Windows.Forms.Panel()
            Me.comboBoxUSState = New System.Windows.Forms.ComboBox()
            Me.labelAddress = New System.Windows.Forms.Label()
            Me.labelID = New System.Windows.Forms.Label()
            Me.textBoxContact = New System.Windows.Forms.TextBox()
            Me.buttonMoveLast = New System.Windows.Forms.Button()
            Me.textBoxZip = New System.Windows.Forms.TextBox()

            Me.labelCity.Size = New System.Drawing.Size(64, 16)
            Me.labelCity.Location = New System.Drawing.Point(16, 176)
            Me.labelCity.TabIndex = 11
            Me.labelCity.Text = "City:"

            Me.buttonMoveNext.Location = New System.Drawing.Point(280, 8)
            Me.buttonMoveNext.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            Me.buttonMoveNext.Size = New System.Drawing.Size(32, 32)
            Me.buttonMoveNext.TabIndex = 2
            Me.buttonMoveNext.Anchor = AnchorStyles.Top Or AnchorStyles.Right
            Me.buttonMoveNext.Text = ">"
            AddHandler Me.buttonMoveNext.Click, AddressOf Me.buttonMoveNext_Click

            Me.customersDataSet1.DataSetName = "CustomersDataSet"

            Me.labelContact.Size = New System.Drawing.Size(64, 16)
            Me.labelContact.Location = New System.Drawing.Point(16, 80)
            Me.labelContact.TabIndex = 7
            Me.labelContact.Text = "Contact:"

            Me.buttonMoveFirst.Location = New System.Drawing.Point(8, 8)
            Me.buttonMoveFirst.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            Me.buttonMoveFirst.Size = New System.Drawing.Size(32, 32)
            Me.buttonMoveFirst.TabIndex = 0
            Me.buttonMoveFirst.Text = "|<"
            AddHandler Me.buttonMoveFirst.Click, AddressOf Me.buttonMoveFirst_Click

            Me.textBoxID.Text = ""
            Me.textBoxID.Enabled = False
            Me.textBoxID.ReadOnly = True
            Me.textBoxID.TabIndex = 0
            Me.textBoxID.Anchor = AnchorStyles.Top Or AnchorStyles.Left Or AnchorStyles.Right
            Me.textBoxID.Size = New System.Drawing.Size(299, 20)
            Me.textBoxID.Location = New System.Drawing.Point(88, 16)

            Me.textBoxCity.Text = ""
            Me.textBoxCity.TabIndex = 5
            Me.textBoxCity.Size = New System.Drawing.Size(216, 20)
            Me.textBoxCity.Anchor = AnchorStyles.Top Or AnchorStyles.Left Or AnchorStyles.Right
            Me.textBoxCity.Location = New System.Drawing.Point(88, 176)

            Me.labelContactTitle.Size = New System.Drawing.Size(64, 16)
            Me.labelContactTitle.Location = New System.Drawing.Point(16, 112)
            Me.labelContactTitle.TabIndex = 8
            Me.labelContactTitle.Text = "Title:"

            Me.labelCompanyName.Size = New System.Drawing.Size(64, 16)
            Me.labelCompanyName.Location = New System.Drawing.Point(16, 48)
            Me.labelCompanyName.TabIndex = 6
            Me.labelCompanyName.Text = "Company:"

            Me.textBoxTitle.Text = ""
            Me.textBoxTitle.TabIndex = 3
            Me.textBoxTitle.Anchor = AnchorStyles.Top Or AnchorStyles.Left Or AnchorStyles.Right
            Me.textBoxTitle.Size = New System.Drawing.Size(216, 20)
            Me.textBoxTitle.Location = New System.Drawing.Point(88, 112)

            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.Text = "Customer Details"
            Me.ClientSize = New System.Drawing.Size(464, 357)

            Me.textBoxPosition.Text = ""
            Me.textBoxPosition.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
            Me.textBoxPosition.Enabled = False
            Me.textBoxPosition.ReadOnly = True
            Me.textBoxPosition.TabIndex = 1
            Me.textBoxPosition.Anchor = AnchorStyles.Left Or AnchorStyles.Right
            Me.textBoxPosition.Size = New System.Drawing.Size(184, 20)
            Me.textBoxPosition.Location = New System.Drawing.Point(88, 14)

            Me.labelUSState.Size = New System.Drawing.Size(64, 16)
            Me.labelUSState.Location = New System.Drawing.Point(16, 208)
            Me.labelUSState.TabIndex = 13
            Me.labelUSState.Text = "USState:"

            Me.buttonMovePrev.Location = New System.Drawing.Point(48, 8)
            Me.buttonMovePrev.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            Me.buttonMovePrev.Size = New System.Drawing.Size(32, 32)
            Me.buttonMovePrev.TabIndex = 1
            Me.buttonMovePrev.Text = "<"
            AddHandler Me.buttonMovePrev.click, AddressOf Me.buttonMovePrev_Click

            Me.labelZip.Size = New System.Drawing.Size(64, 16)
            Me.labelZip.Location = New System.Drawing.Point(16, 240)
            Me.labelZip.TabIndex = 12
            Me.labelZip.Text = "Zip:"

            Me.textBoxAddress.Text = ""
            Me.textBoxAddress.AcceptsReturn = True
            Me.textBoxAddress.TabIndex = 4
            Me.textBoxAddress.Anchor = AnchorStyles.Top Or AnchorStyles.Bottom Or AnchorStyles.Left Or AnchorStyles.Right
            Me.textBoxAddress.Size = New System.Drawing.Size(360, 20)
            Me.textBoxAddress.Location = New System.Drawing.Point(88, 144)

            Me.textBoxCompany.Text = ""
            Me.textBoxCompany.TabIndex = 1
            Me.textBoxCompany.Anchor = AnchorStyles.Top Or AnchorStyles.Left Or AnchorStyles.Right
            Me.textBoxCompany.Size = New System.Drawing.Size(296, 20)
            Me.textBoxCompany.Location = New System.Drawing.Point(88, 48)

            Me.panelVCRControl.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
            Me.panelVCRControl.Location = New System.Drawing.Point(88, 288)
            Me.panelVCRControl.AutoScrollMinSize = New System.Drawing.Size(0, 0)
            Me.panelVCRControl.Size = New System.Drawing.Size(360, 48)
            Me.panelVCRControl.TabIndex = 8
            Me.panelVCRControl.Anchor = AnchorStyles.Bottom Or AnchorStyles.Left Or AnchorStyles.Right
            Me.panelVCRControl.Text = "panel1"

            Me.comboBoxUSState.Text = ""
            Me.comboBoxUSState.TabIndex = 6
            Me.comboBoxUSState.Size = New System.Drawing.Size(176, 20)
            Me.comboBoxUSState.Location = New System.Drawing.Point(88, 208)

            Me.labelAddress.Size = New System.Drawing.Size(64, 16)
            Me.labelAddress.Location = New System.Drawing.Point(16, 144)
            Me.labelAddress.TabIndex = 9
            Me.labelAddress.Text = "Address:"

            Me.labelID.Size = New System.Drawing.Size(64, 16)
            Me.labelID.Location = New System.Drawing.Point(16, 16)
            Me.labelID.TabIndex = 5
            Me.labelID.Text = "ID:"

            Me.textBoxContact.Text = ""
            Me.textBoxContact.TabIndex = 2
            Me.textBoxContact.Anchor = AnchorStyles.Top Or AnchorStyles.Left Or AnchorStyles.Right
            Me.textBoxContact.Size = New System.Drawing.Size(339, 20)
            Me.textBoxContact.Location = New System.Drawing.Point(88, 80)

            Me.buttonMoveLast.Location = New System.Drawing.Point(320, 8)
            Me.buttonMoveLast.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            Me.buttonMoveLast.Size = New System.Drawing.Size(32, 32)
            Me.buttonMoveLast.TabIndex = 3
            Me.buttonMoveLast.Anchor = AnchorStyles.Top Or AnchorStyles.Right
            Me.buttonMoveLast.Text = ">|"
            AddHandler Me.buttonMoveLast.click, AddressOf Me.buttonMoveLast_Click

            Me.textBoxZip.Text = ""
            Me.textBoxZip.TabIndex = 7
            Me.textBoxZip.Size = New System.Drawing.Size(112, 20)
            Me.textBoxZip.Location = New System.Drawing.Point(88, 240)

            Me.panelVCRControl.Controls.AddRange(New System.Windows.Forms.Control() {textBoxPosition, buttonMovefirst, buttonmoveprev, buttonmovenext, buttonmovelast})
            Me.Controls.AddRange(New System.Windows.Forms.Control() {textBoxZip, comboboxusstate, textboxcity, labelusstate, labelzip, labelcity, panelvcrcontrol, textBoxCompany, labelCompanyName, textBoxAddress, textBoxTitle, textBoxContact, textBoxID, labelAddress, labelContactTitle, labelContact, labelID})
        End Sub

#End Region

    End Class

End Namespace

















