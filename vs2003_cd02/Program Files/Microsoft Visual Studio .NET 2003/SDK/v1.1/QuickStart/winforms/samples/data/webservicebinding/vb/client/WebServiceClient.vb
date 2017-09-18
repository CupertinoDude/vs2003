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

Imports Microsoft.Samples.Windows.Forms.Vb.WebServiceBinding.localhost
Imports Microsoft.Samples.Windows.Forms.Vb.WebServiceBinding.Data

Public Class WebServiceClient
    Inherits System.Windows.Forms.Form

    Public Sub New()
        MyBase.New()

        WebServiceClient = Me

        ' Required by the Windows Forms Designer
        InitializeComponent()

        If dataGrid1.TableStyles.Count = 0 Then
            dataGrid1.TableStyles.Add(New DataGridTableStyle())
        End If
        dataGrid1.TableStyles(0).PreferredRowHeight = 16
        dataGrid1.TableStyles(0).AlternatingBackColor = System.Drawing.Color.WhiteSmoke
    End Sub

    'Handle the Load Button Click
    'Load the Customers, Orders and OrderDetails Tables and display in the Grid
    Protected Sub buttonLoad_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim currentCursor As Cursor = Cursor.Current
        Try
            Cursor.Current = Cursors.WaitCursor

            statusBar1.Text = "Loading Customers..."

            'Execute the XML Web service to return a DataSet
            Dim custList1 As New CustomersList()
            custList1.Credentials = System.Net.CredentialCache.DefaultCredentials
            Dim ds1 As DataSet = custList1.GetCustomers()

            'Merge the new dataset into our customersAndOrdersDataSet
            customersAndOrdersDataSet1.Merge(ds1)

            statusBar1.Text = "Updating Grid..."
        Finally
            statusBar1.Text = "Done"
            Cursor.Current = currentCursor
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
    Private WithEvents buttonLoad As System.Windows.Forms.Button
    Private WithEvents dataGrid1 As System.Windows.Forms.DataGrid
    Private WithEvents customersAndOrdersDataSet1 As Microsoft.Samples.Windows.Forms.Vb.WebServiceBinding.Data.CustomersAndOrdersDataSet

    Private WithEvents WebServiceClient As System.Windows.Forms.Form

    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Me.dataGrid1 = New System.Windows.Forms.DataGrid()
        Me.statusBar1 = New System.Windows.Forms.StatusBar()
        Me.buttonLoad = New System.Windows.Forms.Button()
        Me.customersAndOrdersDataSet1 = New Microsoft.Samples.Windows.Forms.Vb.WebServiceBinding.Data.CustomersAndOrdersDataSet()

        dataGrid1.BeginInit()

        dataGrid1.Text = "dataGrid1"
        dataGrid1.Size = New System.Drawing.Size(584, 336)
        dataGrid1.ForeColor = System.Drawing.Color.Navy
        dataGrid1.TabIndex = 0
        dataGrid1.Anchor = System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left Or System.Windows.Forms.AnchorStyles.Right
        dataGrid1.Location = New System.Drawing.Point(8, 8)
        dataGrid1.BackColor = System.Drawing.Color.Gainsboro
        dataGrid1.DataSource = customersAndOrdersDataSet1
        dataGrid1.DataMember = "Customers"

        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.Text = "Customer Details"
        Me.AcceptButton = buttonLoad
        Me.ClientSize = New System.Drawing.Size(600, 413)

        statusBar1.BackColor = System.Drawing.SystemColors.Control
        statusBar1.Size = New System.Drawing.Size(600, 16)
        statusBar1.TabIndex = 2
        statusBar1.Text = "Click on Load"
        statusBar1.Location = New System.Drawing.Point(0, 397)

        buttonLoad.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        buttonLoad.Size = New System.Drawing.Size(112, 32)
        buttonLoad.TabIndex = 1
        buttonLoad.Anchor = System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Right
        buttonLoad.Text = "&Load"
        buttonLoad.Location = New System.Drawing.Point(480, 352)
        AddHandler buttonLoad.Click, New System.EventHandler(AddressOf buttonLoad_Click)

        Me.Controls.Add(statusBar1)
        Me.Controls.Add(buttonLoad)
        Me.Controls.Add(dataGrid1)

        dataGrid1.EndInit()
    End Sub

#End Region


    'The main entry point for the application
    Shared Sub Main()
        System.Windows.Forms.Application.Run(New WebServiceClient())
    End Sub

End Class
