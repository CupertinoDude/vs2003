'
'*------------------------------------------------------------------------------
'*  <copyright from='1997' to='2002' company='Microsoft Corporation'>
'*   Copyright (c) Microsoft Corporation. All Rights Reserved.
'*
'*   This source code is intended only as a supplement to Microsoft
'*   Development Tools and/or on-line documentation.  See these other
'*   materials for detailed information regarding Microsoft code samples.
'*
'*   </copyright>
'*-------------------------------------------------------------------------------
'*
'* File: ControlCustomer.vb
'*
'

Imports System
Imports System.Collections
Imports System.ComponentModel
Imports System.Drawing
Imports System.Data
Imports System.Windows.Forms
Imports System.Data.SqlServerCe


Namespace Microsoft.Sql.SqlCe.Samples.Cs.NorthwindCe

   
    '/ <summary>
    '/ Summary description for ControlCustomer.
    '/ </summary>
    Public Class ControlCustomers
        Inherits System.Windows.Forms.Control

        Private labelCustomer As System.Windows.Forms.Label
        Private labelPostalCode As System.Windows.Forms.Label
        Private labelCountry As System.Windows.Forms.Label
        Private labelAddress As System.Windows.Forms.Label
        Private labelCity As System.Windows.Forms.Label
        Private labelContactName As System.Windows.Forms.Label
        Private labelContactTitle As System.Windows.Forms.Label
        Private labelPostalCodeValue As System.Windows.Forms.Label
        Private labelCountryValue As System.Windows.Forms.Label
        Private labelAddressValue As System.Windows.Forms.Label
        Private labelCityValue As System.Windows.Forms.Label
        Private labelContactNameValue As System.Windows.Forms.Label
        Private labelContactTitleValue As System.Windows.Forms.Label
        Private comboBoxCustomers As System.Windows.Forms.ComboBox
        Private daCustomers As SqlCeDataAdapter = Nothing

        '/ <summary> 
        '/ Required designer variable.
        '/ </summary>
        Private components As System.ComponentModel.Container = Nothing


        Public Sub New()

            ' This call is required by the Windows.Forms Form Designer.
            '
            InitializeComponent()
        End Sub 'New


        Protected Overloads Sub Dispose(ByVal disposing As Boolean)
            If disposing Then
                If Not (components Is Nothing) Then
                    components.Dispose()
                End If
            End If
            MyBase.Dispose(disposing)
        End Sub 'Dispose


        Private Sub InitializeComponent()
            Me.labelCustomer = New System.Windows.Forms.Label()
            Me.labelPostalCode = New System.Windows.Forms.Label()
            Me.labelCountry = New System.Windows.Forms.Label()
            Me.labelAddress = New System.Windows.Forms.Label()
            Me.labelCity = New System.Windows.Forms.Label()
            Me.labelContactName = New System.Windows.Forms.Label()
            Me.labelContactTitle = New System.Windows.Forms.Label()
            Me.comboBoxCustomers = New System.Windows.Forms.ComboBox()
            Me.labelAddressValue = New System.Windows.Forms.Label()
            Me.labelCityValue = New System.Windows.Forms.Label()
            Me.labelPostalCodeValue = New System.Windows.Forms.Label()
            Me.labelCountryValue = New System.Windows.Forms.Label()
            Me.labelContactNameValue = New System.Windows.Forms.Label()
            Me.labelContactTitleValue = New System.Windows.Forms.Label()
            ' 
            ' labelCustomer
            ' 
            Me.labelCustomer.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold)
            Me.labelCustomer.Location = New System.Drawing.Point(0, 16)
            Me.labelCustomer.Size = New System.Drawing.Size(64, 16)
            Me.labelCustomer.Text = "Name:"
            Me.labelCustomer.TextAlign = System.Drawing.ContentAlignment.TopRight
            ' 
            ' labelPostalCode
            ' 
            Me.labelPostalCode.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold)
            Me.labelPostalCode.Location = New System.Drawing.Point(8, 136)
            Me.labelPostalCode.Size = New System.Drawing.Size(56, 16)
            Me.labelPostalCode.Text = "Zip:"
            Me.labelPostalCode.TextAlign = System.Drawing.ContentAlignment.TopRight
            ' 
            ' labelCountry
            ' 
            Me.labelCountry.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold)
            Me.labelCountry.Location = New System.Drawing.Point(8, 168)
            Me.labelCountry.Size = New System.Drawing.Size(56, 16)
            Me.labelCountry.Text = "Country:"
            Me.labelCountry.TextAlign = System.Drawing.ContentAlignment.TopRight
            ' 
            ' labelAddress
            ' 
            Me.labelAddress.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold)
            Me.labelAddress.Location = New System.Drawing.Point(8, 56)
            Me.labelAddress.Size = New System.Drawing.Size(56, 16)
            Me.labelAddress.Text = "Address:"
            Me.labelAddress.TextAlign = System.Drawing.ContentAlignment.TopRight
            ' 
            ' labelCity
            ' 
            Me.labelCity.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold)
            Me.labelCity.Location = New System.Drawing.Point(8, 104)
            Me.labelCity.Size = New System.Drawing.Size(56, 16)
            Me.labelCity.Text = "City:"
            Me.labelCity.TextAlign = System.Drawing.ContentAlignment.TopRight
            ' 
            ' labelContactName
            ' 
            Me.labelContactName.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold)
            Me.labelContactName.Location = New System.Drawing.Point(8, 200)
            Me.labelContactName.Size = New System.Drawing.Size(56, 16)
            Me.labelContactName.Text = "Name:"
            Me.labelContactName.TextAlign = System.Drawing.ContentAlignment.TopRight
            ' 
            ' labelContactTitle
            ' 
            Me.labelContactTitle.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold)
            Me.labelContactTitle.Location = New System.Drawing.Point(8, 232)
            Me.labelContactTitle.Size = New System.Drawing.Size(56, 16)
            Me.labelContactTitle.Text = "Title:"
            Me.labelContactTitle.TextAlign = System.Drawing.ContentAlignment.TopRight
            ' 
            ' comboBoxCustomers
            ' 
            Me.comboBoxCustomers.Location = New System.Drawing.Point(72, 16)
            Me.comboBoxCustomers.Size = New System.Drawing.Size(160, 21)
            ' 
            ' labelAddressValue
            ' 
            Me.labelAddressValue.Location = New System.Drawing.Point(80, 56)
            Me.labelAddressValue.Size = New System.Drawing.Size(152, 32)
            ' 
            ' labelCityValue
            ' 
            Me.labelCityValue.Location = New System.Drawing.Point(80, 104)
            Me.labelCityValue.Size = New System.Drawing.Size(152, 16)
            ' 
            ' labelPostalCodeValue
            ' 
            Me.labelPostalCodeValue.Location = New System.Drawing.Point(80, 136)
            Me.labelPostalCodeValue.Size = New System.Drawing.Size(152, 16)
            ' 
            ' labelCountryValue
            ' 
            Me.labelCountryValue.Location = New System.Drawing.Point(80, 168)
            Me.labelCountryValue.Size = New System.Drawing.Size(152, 16)
            ' 
            ' labelContactNameValue
            ' 
            Me.labelContactNameValue.Location = New System.Drawing.Point(80, 200)
            Me.labelContactNameValue.Size = New System.Drawing.Size(152, 16)
            ' 
            ' labelContactTitleValue
            ' 
            Me.labelContactTitleValue.Location = New System.Drawing.Point(80, 232)
            Me.labelContactTitleValue.Size = New System.Drawing.Size(152, 16)
            ' 
            ' ControlCustomer
            ' 
            Me.Controls.Add(labelContactTitleValue)
            Me.Controls.Add(labelContactNameValue)
            Me.Controls.Add(labelCountryValue)
            Me.Controls.Add(labelPostalCodeValue)
            Me.Controls.Add(labelCityValue)
            Me.Controls.Add(labelAddressValue)
            Me.Controls.Add(labelCustomer)
            Me.Controls.Add(labelPostalCode)
            Me.Controls.Add(labelCountry)
            Me.Controls.Add(labelAddress)
            Me.Controls.Add(labelCity)
            Me.Controls.Add(labelContactName)
            Me.Controls.Add(labelContactTitle)
            Me.Controls.Add(comboBoxCustomers)
            Me.Size = New System.Drawing.Size(246, 302)
        End Sub 'InitializeComponent


        Public Sub InitCustomers()

            Dim cnNorthwind As SqlCeConnection = NorthwindData.GetInstance().NorthwindConnection
            Dim dsNorthwind As DataSet = NorthwindData.GetInstance().NorthwindDataSet
            Dim dtCustomers As DataTable = Nothing

            ' Starts the cursor icon since this function may take some time.
            '
            System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.WaitCursor()

            Try

                ' This will execute only the first time the InitCustomers method is called.
                '
                If daCustomers Is Nothing Then
                    daCustomers = New SqlCeDataAdapter("SELECT * FROM Customers ORDER BY CompanyName", cnNorthwind)
                End If

                dtCustomers = dsNorthwind.Tables("Customers")

                ' Initialize the Customer DataSet
                '
                If dtCustomers Is Nothing Then
                    daCustomers.Fill(dsNorthwind, "Customers")
                    dtCustomers = dsNorthwind.Tables("Customers")

                    ' Binds the database values to the controls
                    '
                    comboBoxCustomers.DataSource = dtCustomers
                    comboBoxCustomers.DisplayMember = "CompanyName"
                    comboBoxCustomers.ValueMember = "CustomerID"
                    labelAddressValue.DataBindings.Add("Text", dtCustomers, "Address")
                    labelCityValue.DataBindings.Add("Text", dtCustomers, "City")
                    labelPostalCodeValue.DataBindings.Add("Text", dtCustomers, "PostalCode")
                    labelCountryValue.DataBindings.Add("Text", dtCustomers, "Country")
                    labelContactNameValue.DataBindings.Add("Text", dtCustomers, "ContactName")
                    labelContactTitleValue.DataBindings.Add("Text", dtCustomers, "ContactTitle")
                Else
                    ' Refresh the Customer DataSet
                    '
                    dtCustomers.Clear()
                    daCustomers.Fill(dsNorthwind, "Customers")
                End If

            Catch e As SqlCeException
                ' Error handling mechanism
                '
                System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.Default()
                NorthwindData.ShowErrors(e)
                Return
            Catch e As Exception
                ' Error handling mechanism
                '
                System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.Default()
                MessageBox.Show(e.Message, "Northwind")
                Return
            End Try

            System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.Default()

        End Sub 'InitCustomers
    End Class 'ControlCustomers 
End Namespace 'Microsoft.Sql.SqlCe.Samples.Cs.NorthwindCe