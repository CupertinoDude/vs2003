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
Imports System.IO
Imports System.Data
Imports Microsoft.Samples.Windows.Forms.Vb.MasterDetails.Data
Imports Microsoft.Samples.Windows.Forms.Vb.MasterDetails.localhost

Namespace Microsoft.Samples.Windows.Forms.Vb.MasterDetailsClient

    Public Class CustomersForm
        Inherits System.Windows.Forms.Form

        Public Sub New()
            MyBase.New()

            CustomersForm = Me

            'Required for Windows Forms Designer support
            InitializeComponent()
        End Sub

        Private Sub LoadData()
            Dim currentCursor As Cursor = Cursor.Current
            Try
                Cursor.Current = Cursors.WaitCursor

                statusBar1.Text = "Loading Customers..."

                'Execute the XML Web service to return a DataSet
                Dim custList1 As New CustomersAndOrders()
                custList1.Credentials = _
                    System.Net.CredentialCache.DefaultCredentials
                Dim ds1 As DataSet = custList1.GetCustomersAndOrders()

                'Merge the new dataset into our customersDataSet
                customersAndOrdersDataSet1.Merge(ds1)

                statusBar1.Text = "Updating Grid..."
            Finally
                Cursor.Current = currentCursor
                statusBar1.Text = "Done"
            End Try
        End Sub


        Protected Sub buttonLoad_Click(ByVal sender As Object, _
            ByVal e As System.EventArgs)
            LoadData()
        End Sub


        Protected Sub buttonUpdate_Click(ByVal sender As Object, _
            ByVal e As System.EventArgs)
            Dim currentCursor As Cursor = Cursor.Current
            Try
                Cursor.Current = Cursors.WaitCursor

                Me.BindingContext(customersAndOrdersDataSet1, _
                    "Customers").EndCurrentEdit()

                statusBar1.Text = "Updating Customers..."
                Dim custList1 As New CustomersAndOrders()
                custList1.Credentials = _
                    System.Net.CredentialCache.DefaultCredentials
                Dim changesDS As DataSet = customersAndOrdersDataSet1.GetChanges()

                If Not (changesDS Is Nothing) Then
                    'Execute the XML Web service to update the DataSet
                    Dim ds1 As DataSet = custList1.UpdateCustomersAndOrders(changesDS)
                    statusBar1.Text = "Updating Grid..."

                    customersAndOrdersDataSet1.Merge(ds1, False)

                    'Check for errors - if there are none accept the changes
                    If (customersAndOrdersDataSet1.HasErrors) Then
                        MessageBox.Show("Save Failed - examine the row errors for details", "Save Failed", MessageBoxButtons.OK, MessageBoxIcon.Error)
                    Else
                        'Accept all the changes - this puts all the rows in the dataset
                        'back into unchanged or "Original" state
                        customersAndOrdersDataSet1.AcceptChanges()
                    End If
                End If
            Catch ex As Exception
                Dim sw As StringWriter = New StringWriter()
                sw.WriteLine("Save Failed:")
                sw.WriteLine("")
                sw.WriteLine(ex.ToString())
                MessageBox.Show(sw.ToString(), "Save Failed", _
                    MessageBoxButtons.OK, MessageBoxIcon.Error)
            Finally
                Cursor.Current = currentCursor
                statusBar1.Text = "Done"
            End Try

        End Sub

        'Clean up any resources being used
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
        Private WithEvents customersAndOrdersDataSet1 As Microsoft.Samples.Windows.Forms.Vb.MasterDetails.Data.CustomersAndOrdersDataSet
        Private WithEvents statusBar1 As System.Windows.Forms.StatusBar
        Private WithEvents buttonLoad As System.Windows.Forms.Button
        Private WithEvents buttonUpdate As System.Windows.Forms.Button
        Private WithEvents dataGrid2 As System.Windows.Forms.DataGrid
        Private WithEvents dataGrid1 As System.Windows.Forms.DataGrid
        Private WithEvents dataGridTableStyle1 As System.Windows.Forms.DataGridTableStyle
        Private WithEvents dataGridTableStyle2 As System.Windows.Forms.DataGridTableStyle
        Private WithEvents CustomersForm As System.Windows.Forms.Form

        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            Me.dataGrid2 = New System.Windows.Forms.DataGrid()
            Me.customersAndOrdersDataSet1 = New Microsoft.Samples.Windows. _
                Forms.Vb.MasterDetails.Data.CustomersAndOrdersDataSet()
            Me.dataGrid1 = New System.Windows.Forms.DataGrid()
            Me.buttonLoad = New System.Windows.Forms.Button()
            Me.buttonUpdate = New System.Windows.Forms.Button()
            Me.statusBar1 = New System.Windows.Forms.StatusBar()
            Me.dataGridTableStyle1 = New System.Windows.Forms.DataGridTableStyle
            Me.dataGridTableStyle2 = New System.Windows.Forms.DataGridTableStyle

            dataGrid1.BeginInit()
            dataGrid2.BeginInit()

            Me.dataGrid1.TableStyles.AddRange( _
                New System.Windows.Forms.DataGridTableStyle() {Me.dataGridTableStyle1})
            ' 
            ' dataGridTableStyle1
            ' 
            Me.dataGridTableStyle1.DataGrid = Me.dataGrid1
            Me.dataGridTableStyle1.PreferredColumnWidth = 50
            Me.dataGridTableStyle1.SelectionBackColor = _
                System.Drawing.SystemColors.ActiveCaption

            Me.dataGrid2.TableStyles.AddRange( _
                New System.Windows.Forms.DataGridTableStyle() {Me.dataGridTableStyle2})
            ' 
            ' dataGridTableStyle2
            ' 
            Me.dataGridTableStyle2.DataGrid = Me.dataGrid2
            Me.dataGridTableStyle2.PreferredColumnWidth = 50
            Me.dataGridTableStyle2.SelectionBackColor = _
                System.Drawing.SystemColors.ActiveCaption

            dataGrid2.Location = New System.Drawing.Point(8, 256)
            dataGrid2.Text = "dataGrid2"
            dataGrid2.Size = New System.Drawing.Size(584, 248)
            dataGrid2.DataMember = ""
            dataGrid2.ForeColor = System.Drawing.SystemColors.WindowText
            dataGrid2.TabIndex = 1
            dataGrid2.BackColor = System.Drawing.SystemColors.Window
            dataGrid2.DataSource = customersAndOrdersDataSet1
            dataGrid2.DataMember = "Customers.CustomersOrders"
            dataGrid2.Anchor = AnchorStyles.Top Or AnchorStyles.Bottom Or _
                AnchorStyles.Left Or AnchorStyles.Right

            customersAndOrdersDataSet1.DataSetName = "CustomersAndOrdersDataSet"

            dataGrid1.Location = New System.Drawing.Point(8, 8)
            dataGrid1.Text = "dataGrid1"
            dataGrid1.Size = New System.Drawing.Size(584, 240)
            dataGrid1.DataMember = ""
            dataGrid1.ForeColor = System.Drawing.SystemColors.WindowText
            dataGrid1.TabIndex = 0
            dataGrid1.BackColor = System.Drawing.SystemColors.Window
            dataGrid1.AllowNavigation = False
            dataGrid1.DataSource = customersAndOrdersDataSet1
            dataGrid1.DataMember = "Customers"
            dataGrid1.Anchor = AnchorStyles.Top Or AnchorStyles.Bottom Or _
                AnchorStyles.Left Or AnchorStyles.Right

            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.Text = "Customer Orders"
            Me.ClientSize = New System.Drawing.Size(600, 581)

            buttonLoad.Location = New System.Drawing.Point(376, 512)
            buttonLoad.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            buttonLoad.Size = New System.Drawing.Size(104, 40)
            buttonLoad.TabIndex = 2
            buttonLoad.Text = "&Load"
            buttonLoad.Anchor = AnchorStyles.Bottom Or AnchorStyles.Right
            AddHandler buttonLoad.Click, New System.EventHandler( _
                AddressOf buttonLoad_Click)

            buttonUpdate.Location = New System.Drawing.Point(488, 512)
            buttonUpdate.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            buttonUpdate.Size = New System.Drawing.Size(104, 40)
            buttonUpdate.TabIndex = 2
            buttonUpdate.Text = "&Update"
            buttonUpdate.Anchor = AnchorStyles.Bottom Or AnchorStyles.Right
            AddHandler buttonUpdate.Click, New System.EventHandler( _
                AddressOf buttonUpdate_Click)

            statusBar1.Location = New System.Drawing.Point(0, 561)
            statusBar1.BackColor = System.Drawing.SystemColors.Control
            statusBar1.TabIndex = 3
            statusBar1.Text = "Click on Load"
            statusBar1.Size = New System.Drawing.Size(600, 20)

            Me.Controls.Add(statusBar1)
            Me.Controls.Add(buttonLoad)
            Me.Controls.Add(buttonUpdate)
            Me.Controls.Add(dataGrid1)
            Me.Controls.Add(dataGrid2)

            dataGrid1.EndInit()
            dataGrid2.EndInit()
        End Sub

#End Region

        'The main entry point for the application
        Shared Sub Main()
            System.Windows.Forms.Application.Run(New CustomersForm())
        End Sub
    End Class
End Namespace