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
Imports System.Data.OleDb
Imports System.IO
Imports Microsoft.VisualBasic
Imports Microsoft.Samples.Windows.Forms.Vb.Update.Data

'Proxies to XML Web services
Imports Microsoft.Samples.Windows.Forms.Vb.Update.localhost

Namespace Microsoft.Samples.Windows.Forms.Vb.Update

    Public Class UpdateForm
        Inherits System.Windows.Forms.Form

        Private States() As State = {New State("Alabama", "AL"), New State("Alaska", "AK"), New State("Arizona", "AZ"), New State("Arkansas", "AR"), New State("California", "CA"), New State("Colorado", "CO"), New State("Connecticut", "CT"), New State("Delaware", "DE"), New State("District of Columbia", "DC"), New State("Florida", "FL"), New State("Georgia", "GA"), New State("Hawaii", "HI"), New State("Idaho", "ID"), New State("Illinois", "IL"), New State("Indiana", "IN"), New State("Iowa", "IA"), New State("Kansas", "KS"), New State("Kentucky", "KY"), New State("Louisiana", "LA"), New State("Maine", "ME"), New State("Maryland", "MD"), New State("Massachusetts", "MA"), New State("Michigan", "MI"), New State("Minnesota", "MN"), New State("Mississippi", "MS"), New State("Missouri", "MO"), New State("Montana", "MT"), New State("Nebraska", "NE"), New State("Nevada", "NV"), New State("New Hampshire", "NH"), New State("New Jersey", "NJ"), New State("New Mexico", "NM"), New State("New York", "NY"), New State("North Carolina", "NC"), New State("North Dakota", "ND"), New State("Ohio", "OH"), New State("Oklahoma", "OK"), New State("Oregon", "OR"), New State("Pennsylvania", "PA"), New State("Rhode Island", "RI"), New State("South Carolina", "SC"), New State("South Dakota", "SD"), New State("Tennessee", "TN"), New State("Texas", "TX"), New State("Utah", "UT"), New State("Vermont", "VT"), New State("Virginia", "VA"), New State("Washington", "WA"), New State("West Virginia", "WV"), New State("Wisconsin", "WI"), New State("Wyoming", "WY")}

        'Used to determine form state
        Private dataSetHasChanges As Boolean = False
        Private addingNew As Boolean = False

        Public Sub New()
            MyBase.New()

            UpdateForm = Me

            ' Required by the Windows Forms Designer
            InitializeComponent()

            'Set up the Combobox bindings
            comboBoxState.DataSource = States 'Populate the list
            comboBoxState.DisplayMember = "LongName" 'Define the field to be displayed
            comboBoxState.ValueMember = "ShortName" 'Define the field to be used as the value

            'Bind the selected value of the combobox to the Region field of the current
            'Customer
            comboBoxState.DataBindings.Add("SelectedValue", customersDataSet1, "Customers.Region")

            'Set up the rest of the form bindings
            textBoxID.DataBindings.Add("Text", customersDataSet1, "Customers.CustomerID")
            textBoxTitle.DataBindings.Add("Text", customersDataSet1, "Customers.ContactTitle")
            textBoxAddress.DataBindings.Add("Text", customersDataSet1, "Customers.Address")
            textBoxCity.DataBindings.Add("Text", customersDataSet1, "Customers.City")
            textBoxCompany.DataBindings.Add("Text", customersDataSet1, "Customers.CompanyName")
            textBoxContact.DataBindings.Add("Text", customersDataSet1, "Customers.ContactName")
            textBoxZip.DataBindings.Add("Text", customersDataSet1, "Customers.PostalCode")
            textBoxCountry.DataBindings.Add("Text", customersDataSet1, "Customers.Country")

            'We want to handle position changing events for the DATA VCR Panel
            'Position is managed by the Form's BindingContext so hook the position changed
            'event on the BindingContext
            AddHandler Me.BindingContext(customersDataSet1, "Customers").PositionChanged, AddressOf customers_PositionChanged

            'Set the minimum form size
            Me.MinimumSize = New Size(544, 380)
        End Sub


        '*** Methods

        'Load the CustomersDataSet using the ListCustomers XML Web service
        Private Sub LoadData()

            'Make sure that we don't fire column changing events whilst we are loading the data
            RemoveHandler Me.customersDataSet1.Customers.ColumnChanging, AddressOf customers_ColumnChanging

            Try
                'Execute the XML Web service to return a DataSet
                Dim custList1 As New ListCustomers()
                custList1.Credentials = _
                    System.Net.CredentialCache.DefaultCredentials
                Dim ds1 As DataSet = custList1.GetCustomers()

                'Merge the new dataset into our customersDataSet
                customersDataSet1.Merge(ds1)

                'Make sure that the dataset is in "original" state
                customersDataSet1.AcceptChanges()

            Catch ex As System.Exception

                MessageBox.Show("Load Data Failed:" & ControlChars.CrLf & ControlChars.CrLf & ex.ToString(), "Load Data Failed", MessageBoxButtons.OK, MessageBoxIcon.Error)

            End Try

            'We want to know when any data fields have changed so hook the column changing
            'event
            AddHandler Me.customersDataSet1.Customers.ColumnChanging, AddressOf customers_ColumnChanging
        End Sub

        'Save any changes back to the database via the UpdateCustomers XML Web service
        'The XML Web service will return a set of rows that reflect the state of the
        'database on completion of the save operation
        Private Sub SaveData()
            'Clear all old errors in the Customers table before
            'we attempt to save
            Dim row As DataRow
            Dim errorRows As DataRow() = customersDataSet1.Customers.GetErrors()
            For Each row In errorRows
                row.ClearErrors()
            Next row

            'Get a dataset containing just the changes
            Dim changes As DataSet = customersDataSet1.GetChanges()

            'Execute the XML Web service to perform the update
            Dim custUpdate1 As New UpdateCustomers()
            custUpdate1.Credentials = _
                System.Net.CredentialCache.DefaultCredentials

            'Save the changes back to the database
            Dim updatesDS As DataSet = custUpdate1.Save(changes)

            'Merge any changes that came back form the server into our dataset
            customersDataSet1.Merge(updatesDS, False)

        End Sub

        'Update the state of the form based on the current state
        'of the dataset
        Sub UpdateViewState()
            'If we are adding a new record then allow the user to
            'set the Customer ID
            If addingNew Then
                textBoxID.Enabled = True
                textBoxID.ReadOnly = False
            Else
                textBoxID.Enabled = False
                textBoxID.ReadOnly = True
            End If

            'If we have a DataSet with data in it then disable the
            'Load button and enable all the update buttons
            'Also change the default button for the Form to be the
            'Save Button
            If customersDataSet1.Customers.Count <> 0 Then
                buttonLoad.Enabled = False
                buttonNew.Enabled = True
                buttonLoad.Enabled = False
                buttonSave.Enabled = True
                buttonDiscard.Enabled = True
                buttonDiscardAll.Enabled = True
                Me.AcceptButton = buttonSave
            End If

            'If the dataset has changed then update the status bar
            If dataSetHasChanges Then
                statusBar1.Text = "Data has changed"
            Else
                statusBar1.Text = "Customers"
            End If
        End Sub

        '*** Event Handlers

        'Handle the Close Button Click
        Protected Sub buttonClose_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.Close()
        End Sub

        'Handle the Discard Button Click - this discards only changes to the
        'current item
        Protected Sub buttonDiscard_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            'Reset the item currently being edited
            Me.BindingContext(customersDataSet1, "Customers").CancelCurrentEdit()
            addingNew = False

            'Reset the current row
            Dim currentRowView As DataRowView = CType(Me.BindingContext(customersDataSet1, "Customers").Current, DataRowView)
            currentRowView.Row.RejectChanges()

            'Clear errors
            currentRowView.Row.ClearErrors()

            'Update the state of the view
            UpdateViewState()
        End Sub


        'Handle the Discard All Button Click - cancels all changes in the dataset
        Protected Sub buttonDiscardAll_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            'Reset the item currently being edited
            Me.BindingContext(customersDataSet1, "Customers").CancelCurrentEdit()

            'Clear all old errors
            Dim row As DataRow
            Dim errorRows As DataRow() = customersDataSet1.Customers.GetErrors()
            For Each row In errorRows
                row.ClearErrors()
            Next row

            'Reset the dataset
            customersDataSet1.RejectChanges()
            dataSetHasChanges = False
            addingNew = False

            'Update the state of the view
            UpdateViewState()
        End Sub


        'Handle the Load Button Click
        Protected Sub buttonLoad_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Dim currentCursor As Cursor = Cursor.Current
            Try
                Cursor.Current = Cursors.WaitCursor

                statusBar1.Text = "Loading Customers..."

                'Load the customers
                LoadData()

                'Update the state of the view
                UpdateViewState()

                'Set up the initial text for the DATA VCR Panel
                textBoxPosition.Text = String.Format("Record {0} of {1}", (Me.BindingContext(customersDataSet1, "Customers").Position + 1), customersDataSet1.Customers.Count)

            Finally
                Cursor.Current = currentCursor
                statusBar1.Text = "Done"
            End Try
        End Sub


        'When the MoveFirst button is clicked set the position for Customers
        'to the first record
        Protected Sub buttonMoveFirst_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.BindingContext(customersDataSet1, "Customers").Position = 0
        End Sub


        'When the MoveLast button is clicked set the position for Customers
        'to the last record
        Protected Sub buttonMoveLast_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.BindingContext(customersDataSet1, "Customers").Position = customersDataSet1.Customers.Count - 1
        End Sub


        'When the MoveNext button is clicked increment the position for Customers
        Protected Sub buttonMoveNext_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            If Me.BindingContext(customersDataSet1, "Customers").Position < customersDataSet1.Customers.Count - 1 Then
                Me.BindingContext(customersDataSet1, "Customers").Position += 1
            End If
        End Sub


        'When the MovePrev button is clicked decrement the position for Customers
        Protected Sub buttonMovePrev_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            If Me.BindingContext(customersDataSet1, "Customers").Position > 0 Then
                Me.BindingContext(customersDataSet1, "Customers").Position -= 1
            End If
        End Sub


        'Handle the New Button Click
        Protected Sub buttonNew_Click(ByVal sender As Object, ByVal e As System.EventArgs)

            'Ask the BindingContext to create a new record
            Me.BindingContext(customersDataSet1, "Customers").AddNew()

            'Update the state of the view
            addingNew = True
            UpdateViewState()
        End Sub


        'Handle the Save Button Click
        Protected Sub buttonSave_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Dim currentCursor As Cursor = Cursor.Current
            Try
                Cursor.Current = Cursors.WaitCursor
                statusBar1.Text = "Saving Customers..."

                'Make sure we've flushed any changes in the current row back into the
                'dataset
                Me.BindingContext(customersDataSet1, "Customers").EndCurrentEdit()

                'If the dataset has changes then save them
                If dataSetHasChanges Then

                    'Save the changes to the dataset
                    Me.SaveData()

                    'Check for errors - if there are none accept the changes
                    If customersDataSet1.HasErrors Then

                        Dim row As DataRow
                        Dim sw As New StringWriter()
                        Dim errorRows As DataRow() = customersDataSet1.Customers.GetErrors()
                        sw.WriteLine("Your changes were not saved. Examine the individual records for detailed information. Errors occurred in the following records:" & ControlChars.CrLf)

                        For Each row In errorRows
                            sw.Write(row("CompanyName"))
                            sw.Write(" - ")
                            sw.WriteLine(row.RowError)
                        Next row

                        MessageBox.Show(sw.ToString(), "Save Failed", MessageBoxButtons.OK, MessageBoxIcon.Error)
                    Else
                        'Accept all the changes - this puts all the rows in the dataset
                        'back into unchanged or "Original" state
                        customersDataSet1.AcceptChanges()
                        dataSetHasChanges = False
                    End If

                    'Update the view state
                    UpdateViewState()
                End If
            Catch ex As Exception
                MessageBox.Show("Save Failed:" & ControlChars.CrLf & ControlChars.CrLf & ex.ToString(), "Save Failed", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Finally
                Cursor.Current = currentCursor
                statusBar1.Text = "Done"
            End Try
        End Sub


        'Handle the column changing event on the Customers table
        'We use this to determine whether any changes have been made to
        'the dataset
        Protected Sub customers_ColumnChanging(ByVal sender As Object, ByVal e As System.Data.DataColumnChangeEventArgs)
            dataSetHasChanges = True
            UpdateViewState()
        End Sub

        'Position has changed - update the DATA VCR panel
        Protected Sub customers_PositionChanged(ByVal sender As Object, ByVal e As System.EventArgs)
            textBoxPosition.Text = String.Format("Record {0} of {1}", (Me.BindingContext(customersDataSet1, "Customers").Position + 1), customersDataSet1.Customers.Count)
        End Sub

        'The form is closing - if there are unsaved changed then confirm that this is OK
        Protected Sub UpdateForm_Closing(ByVal sender As Object, ByVal e As System.ComponentModel.CancelEventArgs)

            'Make sure we've flushed any changes in the current row back into the
            'dataset
            Me.BindingContext(customersDataSet1, "Customers").EndCurrentEdit()

            If dataSetHasChanges Then
                Dim res As DialogResult = MessageBox.Show("Do you want to save your changes?", "Changes not Saved", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Warning)
                If (res = DialogResult.Yes) Or (res = DialogResult.Cancel) Then
                    'If the user chose Save or Cancel then cancel the form close
                    e.Cancel = True
                End If
            End If
        End Sub

        Protected Overloads Overrides Sub Dispose(ByVal disposing as Boolean)
            If (disposing) Then
                If Not (components Is Nothing) Then
                    components.Dispose()
                End If
            End If
            MyBase.Dispose(disposing)
        End Sub


#Region " Windows Form Designer generated code "

        Private components As System.ComponentModel.Container
        Private WithEvents labelCountry As System.Windows.Forms.Label
        Private WithEvents textBoxCountry As System.Windows.Forms.TextBox
        Private WithEvents errorProvider1 As System.Windows.Forms.ErrorProvider
        Private WithEvents statusBar1 As System.Windows.Forms.StatusBar
        Private WithEvents buttonClose As System.Windows.Forms.Button
        Private WithEvents buttonNew As System.Windows.Forms.Button
        Private WithEvents buttonDiscard As System.Windows.Forms.Button
        Private WithEvents buttonDiscardAll As System.Windows.Forms.Button
        Private WithEvents buttonSave As System.Windows.Forms.Button
        Private WithEvents buttonLoad As System.Windows.Forms.Button
        Private WithEvents customersDataSet1 As Microsoft.Samples.Windows.Forms.Vb.Update.Data.CustomersDataSet
        Private WithEvents textBoxZip As System.Windows.Forms.TextBox
        Private WithEvents comboBoxState As System.Windows.Forms.ComboBox
        Private WithEvents textBoxCity As System.Windows.Forms.TextBox
        Private WithEvents labelState As System.Windows.Forms.Label
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

        Private WithEvents UpdateForm As System.Windows.Forms.Form

        Protected Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.textBoxAddress = New System.Windows.Forms.TextBox()
            Me.labelContactTitle = New System.Windows.Forms.Label()
            Me.comboBoxState = New System.Windows.Forms.ComboBox()
            Me.textBoxCountry = New System.Windows.Forms.TextBox()
            Me.panelVCRControl = New System.Windows.Forms.Panel()
            Me.textBoxID = New System.Windows.Forms.TextBox()
            Me.labelCountry = New System.Windows.Forms.Label()
            Me.statusBar1 = New System.Windows.Forms.StatusBar()
            Me.errorProvider1 = New System.Windows.Forms.ErrorProvider()
            Me.buttonNew = New System.Windows.Forms.Button()
            Me.buttonDiscardAll = New System.Windows.Forms.Button()
            Me.labelCity = New System.Windows.Forms.Label()
            Me.labelState = New System.Windows.Forms.Label()
            Me.buttonSave = New System.Windows.Forms.Button()
            Me.buttonDiscard = New System.Windows.Forms.Button()
            Me.labelID = New System.Windows.Forms.Label()
            Me.labelCompanyName = New System.Windows.Forms.Label()
            Me.textBoxTitle = New System.Windows.Forms.TextBox()
            Me.textBoxCompany = New System.Windows.Forms.TextBox()
            Me.buttonMoveLast = New System.Windows.Forms.Button()
            Me.textBoxCity = New System.Windows.Forms.TextBox()
            Me.buttonMovePrev = New System.Windows.Forms.Button()
            Me.customersDataSet1 = New Microsoft.Samples.Windows.Forms.Vb.Update.Data.CustomersDataSet()
            Me.labelContact = New System.Windows.Forms.Label()
            Me.buttonLoad = New System.Windows.Forms.Button()
            Me.buttonMoveFirst = New System.Windows.Forms.Button()
            Me.labelAddress = New System.Windows.Forms.Label()
            Me.textBoxPosition = New System.Windows.Forms.TextBox()
            Me.buttonMoveNext = New System.Windows.Forms.Button()
            Me.textBoxZip = New System.Windows.Forms.TextBox()
            Me.labelZip = New System.Windows.Forms.Label()
            Me.textBoxContact = New System.Windows.Forms.TextBox()
            Me.buttonClose = New System.Windows.Forms.Button()
            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.Text = "Customer Details"
            Me.AcceptButton = buttonLoad
            Me.ClientSize = New System.Drawing.Size(544, 357)
            AddHandler Me.Closing, AddressOf UpdateForm_Closing
            textBoxAddress.Location = New System.Drawing.Point(88, 144)
            textBoxAddress.Text = ""
            textBoxAddress.Anchor = System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left Or System.Windows.Forms.AnchorStyles.Right
            textBoxAddress.AcceptsReturn = True
            textBoxAddress.TabIndex = 4
            textBoxAddress.Size = New System.Drawing.Size(344, 20)
            textBoxAddress.AcceptsReturn = True
            labelContactTitle.Location = New System.Drawing.Point(16, 112)
            labelContactTitle.Text = "Title:"
            labelContactTitle.Size = New System.Drawing.Size(64, 16)
            labelContactTitle.TabIndex = 8
            labelContactTitle.Text = "Title:"
            comboBoxState.Text = ""
            comboBoxState.Location = New System.Drawing.Point(88, 208)
            comboBoxState.Size = New System.Drawing.Size(176, 21)
            comboBoxState.TabIndex = 6
            comboBoxState.Location = New System.Drawing.Point(88, 208)
            textBoxCountry.Location = New System.Drawing.Point(288, 240)
            textBoxCountry.Text = ""
            textBoxCountry.TabIndex = 20
            textBoxCountry.Size = New System.Drawing.Size(112, 20)
            textBoxCountry.Text = ""
            panelVCRControl.Location = New System.Drawing.Point(32, 280)
            panelVCRControl.Text = "panel1"
            panelVCRControl.Anchor = System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left Or System.Windows.Forms.AnchorStyles.Right
            panelVCRControl.Size = New System.Drawing.Size(488, 48)
            panelVCRControl.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
            panelVCRControl.TabIndex = 8
            panelVCRControl.Size = New System.Drawing.Size(488, 48)
            textBoxID.Location = New System.Drawing.Point(88, 16)
            textBoxID.Text = ""
            textBoxID.Anchor = ((((System.Windows.Forms.AnchorStyles.Top) Or (System.Windows.Forms.AnchorStyles.Left))) _
                        Or (System.Windows.Forms.AnchorStyles.Right))
            textBoxID.Enabled = False
            textBoxID.ReadOnly = True
            textBoxID.TabIndex = 0
            textBoxID.Size = New System.Drawing.Size(168, 20)
            textBoxID.ReadOnly = True
            labelCountry.Location = New System.Drawing.Point(232, 242)
            labelCountry.Text = "Country:"
            labelCountry.Size = New System.Drawing.Size(56, 16)
            labelCountry.TabIndex = 21
            labelCountry.Text = "Country:"
            statusBar1.BackColor = System.Drawing.SystemColors.Control
            statusBar1.Location = New System.Drawing.Point(0, 337)
            statusBar1.Size = New System.Drawing.Size(544, 20)
            statusBar1.TabIndex = 19
            statusBar1.Text = "Click on Load"
            statusBar1.Size = New System.Drawing.Size(544, 20)
            'BUG errorProvider1.DataMember = "Customers"
            'BUG errorProvider1.DataSource = customersDataSet1
            errorProvider1.ContainerControl = Me
            buttonNew.Location = New System.Drawing.Point(448, 88)
            buttonNew.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            buttonNew.Size = New System.Drawing.Size(80, 32)
            buttonNew.TabIndex = 17
            buttonNew.Anchor = System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right
            buttonNew.Enabled = False
            buttonNew.Text = "&New"
            AddHandler buttonNew.Click, AddressOf buttonNew_Click
            buttonNew.Enabled = False
            buttonDiscardAll.Location = New System.Drawing.Point(448, 168)
            buttonDiscardAll.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            buttonDiscardAll.Size = New System.Drawing.Size(80, 32)
            buttonDiscardAll.TabIndex = 17
            buttonDiscardAll.Anchor = System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right
            buttonDiscardAll.Enabled = False
            buttonDiscardAll.Text = "Discard &All"
            AddHandler buttonDiscardAll.Click, AddressOf buttonDiscardAll_Click
            buttonDiscardAll.Enabled = False
            labelCity.Location = New System.Drawing.Point(16, 176)
            labelCity.Text = "City:"
            labelCity.Size = New System.Drawing.Size(64, 16)
            labelCity.TabIndex = 11
            labelCity.Text = "City:"
            labelState.Location = New System.Drawing.Point(16, 208)
            labelState.Text = "State:"
            labelState.Size = New System.Drawing.Size(64, 16)
            labelState.TabIndex = 13
            labelState.Text = "State:"
            buttonSave.Location = New System.Drawing.Point(448, 48)
            buttonSave.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            buttonSave.Size = New System.Drawing.Size(80, 32)
            buttonSave.TabIndex = 15
            buttonSave.Anchor = System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right
            buttonSave.Enabled = False
            buttonSave.Text = "&Save"
            AddHandler buttonSave.Click, AddressOf buttonSave_Click
            buttonSave.Enabled = False
            buttonDiscard.Location = New System.Drawing.Point(448, 128)
            buttonDiscard.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            buttonDiscard.Size = New System.Drawing.Size(80, 32)
            buttonDiscard.TabIndex = 16
            buttonDiscard.Anchor = System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right
            buttonDiscard.Enabled = False
            buttonDiscard.Text = "&Discard"
            AddHandler buttonDiscard.Click, AddressOf buttonDiscard_Click
            buttonDiscard.Enabled = False
            labelID.Location = New System.Drawing.Point(16, 16)
            labelID.Text = "ID:"
            labelID.Size = New System.Drawing.Size(64, 16)
            labelID.TabIndex = 5
            labelID.Text = "ID:"
            labelCompanyName.Location = New System.Drawing.Point(16, 48)
            labelCompanyName.Text = "Company:"
            labelCompanyName.Size = New System.Drawing.Size(64, 16)
            labelCompanyName.TabIndex = 6
            labelCompanyName.Text = "Company:"
            textBoxTitle.Location = New System.Drawing.Point(88, 112)
            textBoxTitle.Text = ""
            textBoxTitle.Anchor = ((((System.Windows.Forms.AnchorStyles.Top) Or (System.Windows.Forms.AnchorStyles.Left))) _
                        Or (System.Windows.Forms.AnchorStyles.Right))
            textBoxTitle.TabIndex = 3
            textBoxTitle.Size = New System.Drawing.Size(264, 20)
            textBoxTitle.Anchor = ((((System.Windows.Forms.AnchorStyles.Top) Or (System.Windows.Forms.AnchorStyles.Left))) _
                        Or (System.Windows.Forms.AnchorStyles.Right))
            textBoxCompany.Location = New System.Drawing.Point(88, 48)
            textBoxCompany.Text = ""
            textBoxCompany.Anchor = ((((System.Windows.Forms.AnchorStyles.Top) Or (System.Windows.Forms.AnchorStyles.Left))) _
                        Or (System.Windows.Forms.AnchorStyles.Right))
            textBoxCompany.TabIndex = 1
            textBoxCompany.Size = New System.Drawing.Size(304, 20)
            textBoxCompany.Anchor = ((((System.Windows.Forms.AnchorStyles.Top) Or (System.Windows.Forms.AnchorStyles.Left))) _
                        Or (System.Windows.Forms.AnchorStyles.Right))
            buttonMoveLast.Location = New System.Drawing.Point(446, 8)
            buttonMoveLast.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            buttonMoveLast.Size = New System.Drawing.Size(32, 32)
            buttonMoveLast.TabIndex = 3
            buttonMoveLast.Anchor = System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right
            buttonMoveLast.Text = ">|"
            AddHandler buttonMoveLast.Click, AddressOf buttonMoveLast_Click
            buttonMoveLast.Anchor = System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right
            textBoxCity.Location = New System.Drawing.Point(88, 176)
            textBoxCity.Text = ""
            textBoxCity.TabIndex = 5
            textBoxCity.Size = New System.Drawing.Size(216, 20)
            textBoxCity.Text = ""
            buttonMovePrev.Location = New System.Drawing.Point(48, 8)
            buttonMovePrev.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            buttonMovePrev.Size = New System.Drawing.Size(32, 32)
            buttonMovePrev.TabIndex = 1
            buttonMovePrev.Text = "<"
            AddHandler buttonMovePrev.Click, AddressOf buttonMovePrev_Click
            customersDataSet1.DataSetName = "CustomersDataSet"

            labelContact.Location = New System.Drawing.Point(16, 80)
            labelContact.Text = "Contact:"
            labelContact.Size = New System.Drawing.Size(64, 16)
            labelContact.TabIndex = 7
            labelContact.Text = "Contact:"
            buttonLoad.Location = New System.Drawing.Point(448, 8)
            buttonLoad.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            buttonLoad.Size = New System.Drawing.Size(80, 32)
            buttonLoad.TabIndex = 14
            buttonLoad.Anchor = System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right
            buttonLoad.Text = "&Load"
            AddHandler buttonLoad.Click, AddressOf buttonLoad_Click
            buttonLoad.Anchor = System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right
            buttonMoveFirst.Location = New System.Drawing.Point(8, 8)
            buttonMoveFirst.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            buttonMoveFirst.Size = New System.Drawing.Size(32, 32)
            buttonMoveFirst.TabIndex = 0
            buttonMoveFirst.Text = "|<"
            AddHandler buttonMoveFirst.Click, AddressOf buttonMoveFirst_Click
            buttonMoveFirst.TabIndex = 0
            labelAddress.Location = New System.Drawing.Point(16, 144)
            labelAddress.Text = "Address:"
            labelAddress.Size = New System.Drawing.Size(64, 16)
            labelAddress.TabIndex = 9
            labelAddress.Text = "Address:"
            textBoxPosition.Location = New System.Drawing.Point(88, 13)
            textBoxPosition.Text = ""
            textBoxPosition.Anchor = System.Windows.Forms.AnchorStyles.Left Or System.Windows.Forms.AnchorStyles.Right
            textBoxPosition.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
            textBoxPosition.Enabled = False
            textBoxPosition.ReadOnly = True
            textBoxPosition.TabIndex = 1
            textBoxPosition.Size = New System.Drawing.Size(310, 20)
            textBoxPosition.ReadOnly = True
            buttonMoveNext.Location = New System.Drawing.Point(406, 8)
            buttonMoveNext.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            buttonMoveNext.Size = New System.Drawing.Size(32, 32)
            buttonMoveNext.TabIndex = 2
            buttonMoveNext.Anchor = System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right
            buttonMoveNext.Text = ">"
            AddHandler buttonMoveNext.Click, AddressOf buttonMoveNext_Click
            buttonMoveNext.Anchor = System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right
            textBoxZip.Location = New System.Drawing.Point(88, 240)
            textBoxZip.Text = ""
            textBoxZip.TabIndex = 7
            textBoxZip.Size = New System.Drawing.Size(112, 20)
            textBoxZip.Text = ""
            labelZip.Location = New System.Drawing.Point(16, 240)
            labelZip.Text = "Zip:"
            labelZip.Size = New System.Drawing.Size(64, 16)
            labelZip.TabIndex = 12
            labelZip.Text = "Zip:"
            textBoxContact.Location = New System.Drawing.Point(88, 80)
            textBoxContact.Text = ""
            textBoxContact.TabIndex = 2
            textBoxContact.Size = New System.Drawing.Size(304, 20)
            textBoxContact.Anchor = ((((System.Windows.Forms.AnchorStyles.Top) Or (System.Windows.Forms.AnchorStyles.Left))) _
                        Or (System.Windows.Forms.AnchorStyles.Right))
            buttonClose.Location = New System.Drawing.Point(448, 204)
            buttonClose.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            buttonClose.Size = New System.Drawing.Size(80, 32)
            buttonClose.TabIndex = 18
            buttonClose.Anchor = System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right
            buttonClose.Text = "Close"
            AddHandler buttonClose.Click, AddressOf buttonClose_Click
            buttonClose.Anchor = System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right

            panelVCRControl.Controls.AddRange(New System.Windows.Forms.Control() {Me.textBoxPosition, Me.buttonMoveFirst, Me.buttonMovePrev, Me.buttonMoveNext, Me.buttonMoveLast})
            Me.Controls.AddRange(New System.Windows.Forms.Control() {labelCountry, textBoxCountry, statusBar1, buttonClose, buttonNew, buttonDiscard, buttonDiscardAll, buttonSave, buttonLoad, textBoxZip, comboBoxState, textBoxCity, labelState, labelZip, labelCity, panelVCRControl, textBoxCompany, labelCompanyName, textBoxAddress, textBoxTitle, textBoxContact, textBoxID, labelAddress, labelContactTitle, labelContact, labelID, labelContactTitle})
        End Sub

#End Region

        'Application entry point
        Public Shared Sub Main()
            System.Threading.Thread.CurrentThread.ApartmentState = System.Threading.ApartmentState.STA
            Application.Run(New UpdateForm())
        End Sub

    End Class

end namespace