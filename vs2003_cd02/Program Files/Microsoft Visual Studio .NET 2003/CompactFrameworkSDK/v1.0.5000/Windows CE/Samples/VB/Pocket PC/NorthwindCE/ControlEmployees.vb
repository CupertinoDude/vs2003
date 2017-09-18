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
'* File: ControlEmployees.vb
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
    '/ Summary description for ControlEmployees.
    '/ </summary>
    Public Class ControlEmployees
        Inherits System.Windows.Forms.Control

        Private WithEvents buttonSave As System.Windows.Forms.Button
        Private labelAddress As System.Windows.Forms.Label
        Private labelEmployee As System.Windows.Forms.Label
        Private textBoxEmployeeID As System.Windows.Forms.TextBox
        Private labelEmployeeID As System.Windows.Forms.Label
        Private textBoxHireDate As System.Windows.Forms.TextBox
        Private textBoxTitle As System.Windows.Forms.TextBox
        Private textBoxHomePhone As System.Windows.Forms.TextBox
        Private labelHomePhone As System.Windows.Forms.Label
        Private textBoxPostalCode As System.Windows.Forms.TextBox
        Private textBoxRegion As System.Windows.Forms.TextBox
        Private textBoxCity As System.Windows.Forms.TextBox
        Private textBoxAddress As System.Windows.Forms.TextBox
        Private labelHireDate As System.Windows.Forms.Label
        Private labelTitle As System.Windows.Forms.Label
        Private comboBoxEmployees As System.Windows.Forms.ComboBox
        Private daEmployees As SqlCeDataAdapter = Nothing

        '/ <summary> 
        '/ Required designer variable.
        '/ </summary>
        Private components As System.ComponentModel.Container = Nothing


        Public Sub New()

            ' This call is required by the Windows.Forms Form Designer.
            '
            InitializeComponent()
        End Sub 'New


        '/ <summary> 
        '/ Clean up any resources being used.
        '/ </summary>
        Protected Overloads Sub Dispose(ByVal disposing As Boolean)
            If disposing Then
                If Not (components Is Nothing) Then
                    components.Dispose()
                End If
            End If
            MyBase.Dispose(disposing)
        End Sub 'Dispose


        Private Sub InitializeComponent()
            Me.buttonSave = New System.Windows.Forms.Button()
            Me.labelAddress = New System.Windows.Forms.Label()
            Me.labelEmployee = New System.Windows.Forms.Label()
            Me.textBoxEmployeeID = New System.Windows.Forms.TextBox()
            Me.labelEmployeeID = New System.Windows.Forms.Label()
            Me.textBoxHireDate = New System.Windows.Forms.TextBox()
            Me.textBoxTitle = New System.Windows.Forms.TextBox()
            Me.textBoxHomePhone = New System.Windows.Forms.TextBox()
            Me.labelHomePhone = New System.Windows.Forms.Label()
            Me.textBoxPostalCode = New System.Windows.Forms.TextBox()
            Me.textBoxRegion = New System.Windows.Forms.TextBox()
            Me.textBoxCity = New System.Windows.Forms.TextBox()
            Me.textBoxAddress = New System.Windows.Forms.TextBox()
            Me.labelHireDate = New System.Windows.Forms.Label()
            Me.labelTitle = New System.Windows.Forms.Label()
            Me.comboBoxEmployees = New System.Windows.Forms.ComboBox()
            ' 
            ' buttonSave
            ' 
            Me.buttonSave.Location = New System.Drawing.Point(152, 216)
            Me.buttonSave.Size = New System.Drawing.Size(72, 24)
            Me.buttonSave.Text = "Save"
            ' 
            ' labelAddress
            ' 
            Me.labelAddress.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold)
            Me.labelAddress.Location = New System.Drawing.Point(0, 80)
            Me.labelAddress.Size = New System.Drawing.Size(56, 16)
            Me.labelAddress.Text = "Address:"
            Me.labelAddress.TextAlign = System.Drawing.ContentAlignment.TopRight
            ' 
            ' labelEmployee
            ' 
            Me.labelEmployee.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold)
            Me.labelEmployee.Location = New System.Drawing.Point(0, 16)
            Me.labelEmployee.Size = New System.Drawing.Size(56, 16)
            Me.labelEmployee.Text = "Name:"
            Me.labelEmployee.TextAlign = System.Drawing.ContentAlignment.TopRight
            ' 
            ' textBoxEmployeeID
            ' 
            Me.textBoxEmployeeID.Enabled = False
            Me.textBoxEmployeeID.Location = New System.Drawing.Point(168, 184)
            Me.textBoxEmployeeID.Size = New System.Drawing.Size(56, 20)
            Me.textBoxEmployeeID.Text = ""
            ' 
            ' labelEmployeeID
            ' 
            Me.labelEmployeeID.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold)
            Me.labelEmployeeID.Location = New System.Drawing.Point(128, 184)
            Me.labelEmployeeID.Size = New System.Drawing.Size(32, 16)
            Me.labelEmployeeID.Text = "ID:"
            Me.labelEmployeeID.TextAlign = System.Drawing.ContentAlignment.TopRight
            ' 
            ' textBoxHireDate
            ' 
            Me.textBoxHireDate.Location = New System.Drawing.Point(64, 184)
            Me.textBoxHireDate.Size = New System.Drawing.Size(56, 20)
            Me.textBoxHireDate.Text = ""
            Me.textBoxHireDate.Enabled = False
            ' 
            ' textBoxTitle
            ' 
            Me.textBoxTitle.BackColor = System.Drawing.SystemColors.Window
            Me.textBoxTitle.Location = New System.Drawing.Point(64, 48)
            Me.textBoxTitle.Size = New System.Drawing.Size(160, 20)
            Me.textBoxTitle.Text = ""
            ' 
            ' textBoxHomePhone
            ' 
            Me.textBoxHomePhone.Location = New System.Drawing.Point(64, 152)
            Me.textBoxHomePhone.Size = New System.Drawing.Size(160, 20)
            Me.textBoxHomePhone.Text = ""
            ' 
            ' labelHomePhone
            ' 
            Me.labelHomePhone.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold)
            Me.labelHomePhone.Location = New System.Drawing.Point(32, 152)
            Me.labelHomePhone.Size = New System.Drawing.Size(24, 16)
            Me.labelHomePhone.Text = "Tel:"
            Me.labelHomePhone.TextAlign = System.Drawing.ContentAlignment.TopRight
            ' 
            ' textBoxPostalCode
            ' 
            Me.textBoxPostalCode.Location = New System.Drawing.Point(176, 120)
            Me.textBoxPostalCode.Size = New System.Drawing.Size(48, 20)
            Me.textBoxPostalCode.Text = ""
            ' 
            ' textBoxRegion
            ' 
            Me.textBoxRegion.Location = New System.Drawing.Point(136, 120)
            Me.textBoxRegion.Size = New System.Drawing.Size(32, 20)
            Me.textBoxRegion.Text = ""
            ' 
            ' textBoxCity
            ' 
            Me.textBoxCity.Location = New System.Drawing.Point(64, 120)
            Me.textBoxCity.Size = New System.Drawing.Size(68, 20)
            Me.textBoxCity.Text = ""
            ' 
            ' textBoxAddress
            ' 
            Me.textBoxAddress.Location = New System.Drawing.Point(64, 80)
            Me.textBoxAddress.Multiline = True
            Me.textBoxAddress.Size = New System.Drawing.Size(160, 35)
            Me.textBoxAddress.AcceptsReturn = True
            Me.textBoxAddress.Text = ""
            Me.textBoxAddress.WordWrap = True
            ' 
            ' labelHireDate
            ' 
            Me.labelHireDate.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold)
            Me.labelHireDate.Location = New System.Drawing.Point(24, 184)
            Me.labelHireDate.Size = New System.Drawing.Size(32, 16)
            Me.labelHireDate.Text = "Hire:"
            Me.labelHireDate.TextAlign = System.Drawing.ContentAlignment.TopRight
            ' 
            ' labelTitle
            ' 
            Me.labelTitle.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold)
            Me.labelTitle.Location = New System.Drawing.Point(8, 48)
            Me.labelTitle.Size = New System.Drawing.Size(44, 16)
            Me.labelTitle.Text = "Title:"
            Me.labelTitle.TextAlign = System.Drawing.ContentAlignment.TopRight
            ' 
            ' comboBoxEmployees
            ' 
            Me.comboBoxEmployees.Enabled = True
            Me.comboBoxEmployees.Location = New System.Drawing.Point(64, 16)
            Me.comboBoxEmployees.Size = New System.Drawing.Size(160, 21)
            ' 
            ' ControlEmployees
            ' 
            Me.Controls.Add(buttonSave)
            Me.Controls.Add(labelAddress)
            Me.Controls.Add(labelEmployee)
            Me.Controls.Add(textBoxEmployeeID)
            Me.Controls.Add(labelEmployeeID)
            Me.Controls.Add(textBoxHireDate)
            Me.Controls.Add(textBoxTitle)
            Me.Controls.Add(textBoxHomePhone)
            Me.Controls.Add(labelHomePhone)
            Me.Controls.Add(textBoxPostalCode)
            Me.Controls.Add(textBoxRegion)
            Me.Controls.Add(textBoxCity)
            Me.Controls.Add(textBoxAddress)
            Me.Controls.Add(labelHireDate)
            Me.Controls.Add(labelTitle)
            Me.Controls.Add(comboBoxEmployees)
            Me.Size = New System.Drawing.Size(246, 302)
        End Sub 'InitializeComponent


        Public Sub InitEmployees()

            Dim cnNorthwind As SqlCeConnection = NorthwindData.GetInstance().NorthwindConnection
            Dim dsNorthwind As DataSet = NorthwindData.GetInstance().NorthwindDataSet
            Dim dtEmployees As DataTable = Nothing

            ' Starts the cursor icon since this function may take some time.
            '
            System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.WaitCursor()

            Try
                ' This will execute only the first time the InitEmployees method is called.
                '
                If daEmployees Is Nothing Then
                    daEmployees = New SqlCeDataAdapter("SELECT EmployeeID, LastName + ', ' + firstName AS Name, Title, HireDate, Address, City, Region, PostalCode, HomePhone " & _
                                                       "FROM Employees " & _
                                                        "ORDER BY Name", _
                                                        cnNorthwind)
                    daEmployees.UpdateCommand = New SqlCeCommand
                    daEmployees.UpdateCommand.Connection = cnNorthwind

                    ' The Address, City, PostalCode, Title, HomePhone, and Region fields can be updated.
                    '
                    daEmployees.UpdateCommand.CommandText = "UPDATE Employees " & _
                                                            "SET Address = ?, City = ?, PostalCode = ?, Title = ?, HomePhone = ?, Region = ? " & _
                                                            "WHERE (EmployeeID = ?)"
                    daEmployees.UpdateCommand.Parameters.Add(New SqlCeParameter("@Address", System.Data.SqlDbType.NVarChar, 60, "Address"))
                    daEmployees.UpdateCommand.Parameters.Add(New SqlCeParameter("@City", System.Data.SqlDbType.NVarChar, 15, "City"))
                    daEmployees.UpdateCommand.Parameters.Add(New SqlCeParameter("@PostalCode", System.Data.SqlDbType.NVarChar, 10, "PostalCode"))
                    daEmployees.UpdateCommand.Parameters.Add(New SqlCeParameter("@Title", System.Data.SqlDbType.NVarChar, 30, "Title"))
                    daEmployees.UpdateCommand.Parameters.Add(New SqlCeParameter("@HomePhone", System.Data.SqlDbType.NVarChar, 24, "HomePhone"))
                    daEmployees.UpdateCommand.Parameters.Add(New SqlCeParameter("@Region", System.Data.SqlDbType.NVarChar, 15, "Region"))
                    daEmployees.UpdateCommand.Parameters.Add(New SqlCeParameter("@Original_EmployeeID", System.Data.SqlDbType.Int, 4, False, CType(0, System.Byte), CType(0, System.Byte), "EmployeeID", System.Data.DataRowVersion.Original, Nothing))
                End If

                dtEmployees = dsNorthwind.Tables("Employees")

                ' Initialize the Employees DataSet
                '
                If dtEmployees Is Nothing Then
                    daEmployees.Fill(dsNorthwind, "Employees")
                    dtEmployees = dsNorthwind.Tables("Employees")

                    ' Binds the database values to the controls
                    '
                    comboBoxEmployees.DataSource = dtEmployees
                    comboBoxEmployees.DisplayMember = "Name"
                    comboBoxEmployees.ValueMember = "EmployeeID"
                    textBoxEmployeeID.DataBindings.Add("Text", dtEmployees, "EmployeeID")
                    textBoxAddress.DataBindings.Add("Text", dtEmployees, "Address")
                    textBoxCity.DataBindings.Add("Text", dtEmployees, "City")
                    textBoxRegion.DataBindings.Add("Text", dtEmployees, "Region")
                    textBoxPostalCode.DataBindings.Add("Text", dtEmployees, "PostalCode")
                    textBoxHomePhone.DataBindings.Add("Text", dtEmployees, "HomePhone")
                    textBoxTitle.DataBindings.Add("Text", dtEmployees, "Title")
                    textBoxHireDate.DataBindings.Add("Text", dtEmployees, "HireDate")
                Else
                    ' Refresh the Employees DataSet
                    '
                    dtEmployees.Clear()
                    daEmployees.Fill(dsNorthwind, "Employees")
                End If
            Catch e As SqlCeException
                ' Error handling mechanism
                '
                System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.Default()
                NorthwindData.ShowErrors(e)
                Me.buttonSave.Enabled = False
                Return
            Catch e As Exception
                ' Error handling mechanism
                '
                System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.Default()
                MessageBox.Show(e.Message, "Northwind")
                Me.buttonSave.Enabled = False
                Return
            End Try

            Me.buttonSave.Enabled = True

            System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.Default()
        End Sub 'InitEmployees

        ' Save changes made to Employee records
        '
        Private Sub buttonSave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles buttonSave.Click

            Dim dsNorthwind As DataSet = NorthwindData.GetInstance().NorthwindDataSet
            Dim position As Integer = BindingContext(dsNorthwind.Tables("Employees")).Position
            dsNorthwind.Tables("Employees").Rows(position).EndEdit()

            If MessageBox.Show("Are you sure you want to save? Pressing No will discard all changes.", _
                               "Northwind", _
                               System.Windows.Forms.MessageBoxButtons.YesNo, _
                               System.Windows.Forms.MessageBoxIcon.Asterisk, _
                               System.Windows.Forms.MessageBoxDefaultButton.Button1) _
                = System.Windows.Forms.DialogResult.Yes Then
                Try
                    daEmployees.Update(dsNorthwind, "Employees")
                    dsNorthwind.AcceptChanges()
                Catch err As SqlCeException
                    ' Error handling mechanism
                    '
                    NorthwindData.ShowErrors(err)
                Catch err As Exception
                    ' Error handling mechanism
                    '
                    MessageBox.Show(err.Message, "Northwind")
                End Try
            Else
                Try
                    dsNorthwind.RejectChanges()
                Catch err As SqlCeException
                    ' Error handling mechanism
                    '
                    NorthwindData.ShowErrors(err)
                Catch err As Exception
                    ' Error handling mechanism
                    '
                    MessageBox.Show(err.Message, "Northwind")
                End Try
            End If

        End Sub 'buttonSave_Click
    End Class 'ControlEmployees 
End Namespace 'Microsoft.Sql.SqlCe.Samples.Cs.NorthwindCe