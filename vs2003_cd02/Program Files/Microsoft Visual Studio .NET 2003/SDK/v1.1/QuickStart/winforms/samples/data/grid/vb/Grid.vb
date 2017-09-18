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

Namespace Microsoft.Samples.WinForms.Vb.Grid

    Public Class Grid
        Inherits System.Windows.Forms.Form

        Public Sub New()
            MyBase.New()

            Grid = Me

            ' Required by the Windows Forms Designer
            InitializeComponent()

            If Me.dataGrid1.TableStyles.Count = 0 Then
                Me.dataGrid1.TableStyles.Add(New System.Windows.Forms.DataGridTableStyle())
            End If
            Me.dataGrid1.TableStyles(0).PreferredRowHeight = 16
            Me.dataGrid1.TableStyles(0).AlternatingBackColor = System.Drawing.Color.WhiteSmoke
        End Sub

        'Handle the Load Button Click
        'Load the Customers, Orders and OrderDetails Tables and display in the Grid
        Protected Sub buttonLoad_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles buttonLoad.Click
            Dim currentCursor As Cursor = Cursor.Current
            Dim con As SqlConnection = New SqlConnection("server=(local)\NetSDK;Integrated Security=SSPI;database=northwind")
	    Try
                Cursor.Current = Cursors.WaitCursor

                'Fill the DataSet
                Dim cmdCustomers As SqlDataAdapter = New SqlDataAdapter("Select * from Customers", con)
                Dim cmdOrders As SqlDataAdapter = New SqlDataAdapter("Select * from Orders", con)
                Dim cmdOrderDetails As SqlDataAdapter = New SqlDataAdapter("Select * from [Order Details]", con)

		customersDataSet1.Clear()
                statusBar1.Text = "Loading Customers..."
                cmdCustomers.Fill(customersDataSet1, "Customers")
                statusBar1.Text = "Loading Orders..."
                cmdOrders.Fill(customersDataSet1, "Orders")
                statusBar1.Text = "Loading Order Details..."
                cmdOrderDetails.Fill(customersDataSet1, "Order_Details")

                statusBar1.Text = "Updating Grid..."
            Finally
                statusBar1.Text = "Done"
                Cursor.Current = currentCursor
		con.Close()
            End Try
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



#Region " Windows Form Designer generated code "

        Private components As System.ComponentModel.Container
        Private WithEvents statusBar1 As System.Windows.Forms.StatusBar
        Private WithEvents customersDataSet1 As Microsoft.Samples.WinForms.Vb.Grid.Data.CustomersDataSet
        Private WithEvents buttonLoad As System.Windows.Forms.Button
        Private WithEvents dataGrid1 As System.Windows.Forms.DataGrid

        Private WithEvents Grid As System.Windows.Forms.Form

        Private Sub InitializeComponent()

            Me.components = New System.ComponentModel.Container()
            Me.dataGrid1 = New System.Windows.Forms.DataGrid()
            Me.statusBar1 = New System.Windows.Forms.StatusBar()
            Me.customersDataSet1 = New Microsoft.Samples.WinForms.Vb.Grid.Data.CustomersDataSet()
            Me.buttonLoad = New System.Windows.Forms.Button()

            Me.dataGrid1.BeginInit()

            Me.dataGrid1.Text = "dataGrid1"
            Me.dataGrid1.Size = New System.Drawing.Size(584, 336)
            Me.dataGrid1.DataSource = customersDataSet1
            Me.dataGrid1.DataMember = "Customers"
            Me.dataGrid1.ForeColor = System.Drawing.Color.Navy
            Me.dataGrid1.TabIndex = 0
            Me.dataGrid1.Anchor = AnchorStyles.Top Or AnchorStyles.Bottom Or AnchorStyles.Left Or AnchorStyles.Right
            Me.dataGrid1.Location = New System.Drawing.Point(8, 8)
            Me.dataGrid1.BackColor = System.Drawing.Color.Gainsboro

            Me.AcceptButton = buttonLoad
            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.ClientSize = New System.Drawing.Size(600, 413)
            Me.Text = "Customer Details"

            Me.statusBar1.BackColor = System.Drawing.SystemColors.Control
            Me.statusBar1.Location = New System.Drawing.Point(0, 397)
            Me.statusBar1.Size = New System.Drawing.Size(600, 16)
            Me.statusBar1.TabIndex = 2
            Me.statusBar1.Text = "Click on Load"

            Me.customersDataSet1.DataSetName = "CustomersDataSet"

            Me.buttonLoad.Anchor = AnchorStyles.Bottom Or AnchorStyles.Right
            Me.buttonLoad.FlatStyle = System.Windows.Forms.FlatStyle.Flat
            Me.buttonLoad.Location = New System.Drawing.Point(480, 352)
            Me.buttonLoad.Size = New System.Drawing.Size(112, 32)
            Me.buttonLoad.TabIndex = 1
            Me.buttonLoad.Text = "&Load"

            Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.statusBar1, Me.buttonLoad, Me.dataGrid1})

            Me.dataGrid1.EndInit()
        End Sub

#End Region

        'The main entry point for the application
        Shared Sub Main()
            System.Threading.Thread.CurrentThread.ApartmentState = System.Threading.ApartmentState.STA
            System.Windows.Forms.Application.Run(New Grid())
        End Sub

    End Class

End Namespace
