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
'* File: ControlOrders.vb
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
    '/ Summary description for ControlOrders.
    '/ </summary>
    Public Class ControlOrders
        Inherits System.Windows.Forms.Control

        Private WithEvents listViewOrders As System.Windows.Forms.ListView
        Private columnHeaderID As System.Windows.Forms.ColumnHeader
        Private columnHeaderDate As System.Windows.Forms.ColumnHeader
        Private columnHeaderNeedDate As System.Windows.Forms.ColumnHeader
        Private columnHeaderShipDate As System.Windows.Forms.ColumnHeader
        Private columnHeaderShipVia As System.Windows.Forms.ColumnHeader
        Private listViewProducts As System.Windows.Forms.ListView
        Private columnHeaderProduct As System.Windows.Forms.ColumnHeader
        Private columnHeaderUnitPrice As System.Windows.Forms.ColumnHeader
        Private columnHeaderQuantity As System.Windows.Forms.ColumnHeader
        Private columnHeaderDiscount As System.Windows.Forms.ColumnHeader
        Private WithEvents comboBoxCustomers As System.Windows.Forms.ComboBox
        Private labelCustomer As System.Windows.Forms.Label

        Private selectedCustomerID As String = ""
        Private refresh_Orders As Boolean = False
        Private daCustomers As SqlCeDataAdapter = Nothing

        '/ <summary> 
        '/ Required designer variable.
        '/ </summary>
        Private components As System.ComponentModel.Container = Nothing


        Public Sub New()

            ' This call is required by the Windows.Forms Form Designer.
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
            Me.listViewOrders = New System.Windows.Forms.ListView()
            Me.columnHeaderID = New System.Windows.Forms.ColumnHeader()
            Me.columnHeaderDate = New System.Windows.Forms.ColumnHeader()
            Me.columnHeaderNeedDate = New System.Windows.Forms.ColumnHeader()
            Me.columnHeaderShipDate = New System.Windows.Forms.ColumnHeader()
            Me.columnHeaderShipVia = New System.Windows.Forms.ColumnHeader()
            Me.listViewProducts = New System.Windows.Forms.ListView()
            Me.columnHeaderProduct = New System.Windows.Forms.ColumnHeader()
            Me.columnHeaderUnitPrice = New System.Windows.Forms.ColumnHeader()
            Me.columnHeaderQuantity = New System.Windows.Forms.ColumnHeader()
            Me.columnHeaderDiscount = New System.Windows.Forms.ColumnHeader()
            Me.comboBoxCustomers = New System.Windows.Forms.ComboBox()
            Me.labelCustomer = New System.Windows.Forms.Label()
            ' 
            ' listViewOrders
            ' 
            Me.listViewOrders.Columns.Add(Me.columnHeaderID)
            Me.listViewOrders.Columns.Add(Me.columnHeaderDate)
            Me.listViewOrders.Columns.Add(Me.columnHeaderNeedDate)
            Me.listViewOrders.Columns.Add(Me.columnHeaderShipDate)
            Me.listViewOrders.Columns.Add(Me.columnHeaderShipVia)
            Me.listViewOrders.FullRowSelect = True
            Me.listViewOrders.Location = New System.Drawing.Point(16, 40)
            Me.listViewOrders.Size = New System.Drawing.Size(216, 120)
            Me.listViewOrders.View = System.Windows.Forms.View.Details
            ' 
            ' columnHeaderID
            ' 
            Me.columnHeaderID.Text = "ID"
            Me.columnHeaderID.Width = 50
            ' 
            ' columnHeaderDate
            ' 
            Me.columnHeaderDate.Text = "Date"
            Me.columnHeaderDate.Width = 80
            ' 
            ' columnHeaderNeedDate
            ' 
            Me.columnHeaderNeedDate.Text = "Need Date"
            Me.columnHeaderNeedDate.Width = 80
            ' 
            ' columnHeaderShipDate
            ' 
            Me.columnHeaderShipDate.Text = "Ship Date"
            Me.columnHeaderShipDate.Width = 70
            ' 
            ' columnHeaderShipVia
            ' 
            Me.columnHeaderShipVia.Text = "Shipper"
            Me.columnHeaderShipVia.Width = 120
            ' 
            ' listViewProducts
            ' 
            Me.listViewProducts.Columns.Add(Me.columnHeaderProduct)
            Me.listViewProducts.Columns.Add(Me.columnHeaderUnitPrice)
            Me.listViewProducts.Columns.Add(Me.columnHeaderQuantity)
            Me.listViewProducts.Columns.Add(Me.columnHeaderDiscount)
            Me.listViewProducts.FullRowSelect = True
            Me.listViewProducts.Location = New System.Drawing.Point(16, 160)
            Me.listViewProducts.Size = New System.Drawing.Size(216, 104)
            Me.listViewProducts.View = System.Windows.Forms.View.Details
            ' 
            ' columnHeader6
            ' 
            Me.columnHeaderProduct.Text = "Product"
            Me.columnHeaderProduct.Width = 80
            ' 
            ' columnHeader7
            ' 
            Me.columnHeaderUnitPrice.Text = "Unit Price"
            Me.columnHeaderUnitPrice.Width = 80
            ' 
            ' columnHeader8
            ' 
            Me.columnHeaderQuantity.Text = "Quantity"
            Me.columnHeaderQuantity.Width = 80
            ' 
            ' columnHeader9
            ' 
            Me.columnHeaderDiscount.Text = "Discount"
            Me.columnHeaderDiscount.Width = 80
            ' 
            ' comboBoxCustomers
            ' 
            Me.comboBoxCustomers.Location = New System.Drawing.Point(72, 16)
            Me.comboBoxCustomers.Size = New System.Drawing.Size(160, 21)
            ' 
            ' labelCustomer
            ' 
            Me.labelCustomer.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold)
            Me.labelCustomer.Location = New System.Drawing.Point(8, 16)
            Me.labelCustomer.Size = New System.Drawing.Size(72, 16)
            Me.labelCustomer.Text = "Customer:"
            ' 
            ' UserControl3
            ' 
            Me.Controls.Add(listViewOrders)
            Me.Controls.Add(listViewProducts)
            Me.Controls.Add(comboBoxCustomers)
            Me.Controls.Add(labelCustomer)
            Me.Size = New System.Drawing.Size(246, 302)
        End Sub 'InitializeComponent


        Public Sub InitOrders()

            Dim cnNorthwind As SqlCeConnection = NorthwindData.GetInstance().NorthwindConnection
            Dim dsNorthwind As DataSet = NorthwindData.GetInstance().NorthwindDataSet
            Dim dtCustomers As DataTable = Nothing

            ' Starts the cursor icon since this function may take some time.
            '
            System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.WaitCursor()

            Try

                ' This will execute only the first time the InitOrders method is called.
                '
                If daCustomers Is Nothing Then
                    daCustomers = New SqlCeDataAdapter("SELECT CustomerID, CompanyName FROM Customers ORDER BY CompanyName", _
                                                        cnNorthwind)
                End If

                ' Note, the DataTable has been named "CustomerOrders" as to not be confused with the "Customers" DataTable in the ControlCustomers control.
                '
                dtCustomers = dsNorthwind.Tables("CustomerOrders")

                ' Initialize the Customers DataSet
                '
                If dtCustomers Is Nothing Then
                    daCustomers.Fill(dsNorthwind, "CustomerOrders")
                    dtCustomers = dsNorthwind.Tables("CustomerOrders")

                    ' Binds the database values to the controls
                    '
                    comboBoxCustomers.DataSource = dtCustomers
                    comboBoxCustomers.DisplayMember = "CompanyName"
                    comboBoxCustomers.ValueMember = "CustomerID"

                Else
                    ' Refresh the Customers DataSet
                    '
                    dtCustomers.Clear()
                    daCustomers.Fill(dsNorthwind, "CustomerOrders")
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

            selectedCustomerID = comboBoxCustomers.SelectedValue.ToString()
            RefreshOrders()

            System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.Default()

        End Sub 'InitOrders


        Private Sub ClearOrders()

            listViewOrders.Items.Clear()

        End Sub 'ClearOrders


        Private Sub ClearProducts()

            listViewProducts.Items.Clear()

        End Sub 'ClearProducts


        ' Refreshes the Products ListView
        '
        Private Sub RefreshProducts()

            Dim cmdProducts As SqlCeCommand = Nothing
            Dim drProducts As SqlCeDataReader = Nothing
            Dim cnNorthwind As SqlCeConnection = NorthwindData.GetInstance().NorthwindConnection

            Dim listViewItem As ListViewItem = Nothing
            Dim item As String
            Dim sql As String
            Dim fieldCount As Integer

            If listViewOrders.SelectedIndices.Count = 0 Then Return

            item = listViewOrders.FocusedItem.Text
            If item.Length = 0 Then Return

            sql = "SELECT P.ProductName, O.UnitPrice, O.Quantity, O.Discount " & _
                  "FROM ""Order Details"" AS O " & _
                  "INNER JOIN Products AS P " & _
                  "ON O.ProductID = P.ProductID " & _
                  "WHERE OrderID = " & item & " " & _
                  "ORDER BY P.ProductName"

            Try
                cmdProducts = New SqlCeCommand(sql, cnNorthwind)
                drProducts = cmdProducts.ExecuteReader()
                fieldCount = drProducts.FieldCount

                While drProducts.Read()
                    listViewItem = New ListViewItem("")

                    Dim i As Integer = 0

                    While i < fieldCount
                        If Not drProducts.IsDBNull(i) Then
                            item = drProducts.GetValue(i).ToString()
                        Else
                            item = ""
                        End If

                        If i = 0 Then
                            listViewItem.Text = item
                        Else
                            listViewItem.SubItems.Add(item)
                        End If

                        i = i + 1
                    End While

                    listViewProducts.Items.Add(listViewItem)
                End While
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
            Finally
                drProducts.Close()
            End Try
        End Sub 'RefreshProducts


        ' Refreshes the Orders ListView
        '
        Private Sub RefreshOrders()

            Dim cmdOrders As SqlCeCommand = Nothing
            Dim drOrders As SqlCeDataReader = Nothing
            Dim cnNorthwind As SqlCeConnection = NorthwindData.GetInstance().NorthwindConnection

            Dim listViewItem As ListViewItem = Nothing
            Dim item As String
            Dim sql As String
            Dim fieldCount As Integer

            sql = "SELECT O.OrderID, O.OrderDate, O.RequiredDate, O.ShippedDate, S.CompanyName " & _
                  "FROM Orders AS O " & _
                  "INNER JOIN Shippers AS S " & _
                  "ON O.ShipVia = S.ShipperID " & _
                  "WHERE CustomerID = '" & selectedCustomerID & "' " & _
                  "ORDER BY O.OrderDate DESC"

            Try
                cmdOrders = New SqlCeCommand(sql, cnNorthwind)
                drOrders = cmdOrders.ExecuteReader()
                fieldCount = drOrders.FieldCount

                While drOrders.Read()
                    listViewItem = New ListViewItem("")

                    Dim i As Integer = 0

                    While i < fieldCount
                        If Not drOrders.IsDBNull(i) Then
                            If "DateTime" = drOrders.GetDataTypeName(i) Then
                                item = drOrders.GetDateTime(i).ToShortDateString()
                            Else
                                item = drOrders.GetValue(i).ToString()
                            End If
                        Else
                            item = ""
                        End If

                        If i = 0 Then
                            listViewItem.Text = item
                        Else
                            listViewItem.SubItems.Add(item)
                        End If

                        i = i + 1
                    End While
                    listViewOrders.Items.Add(listViewItem)
                End While
            Catch e As SqlCeException
                ' Error handling mechanism
                NorthwindData.ShowErrors(e)
                Return
            Catch e As Exception
                ' Error handling mechanism
                MessageBox.Show(e.Message, "Northwind")
                Return
            Finally
                drOrders.Close()
            End Try

        End Sub 'RefreshOrders


        ' Sets the selectedCustomerID for the SQL query inside the RefreshOrders method.
        '
        Private Sub comboBoxCustomers_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles comboBoxCustomers.SelectedIndexChanged

            ' Note, the selectedCustomerID cannot be empty, which is by design.
            '
            If Not selectedCustomerID.Equals(comboBoxCustomers.SelectedValue) And selectedCustomerID.Length > 0 Then
                selectedCustomerID = comboBoxCustomers.SelectedValue.ToString()

                refresh_Orders = True

                ClearOrders()
                RefreshOrders()
                ClearProducts()

                refresh_Orders = False
            End If

        End Sub 'comboBoxCustomers_SelectedIndexChanged


        Private Sub listViewOrders_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles listViewOrders.SelectedIndexChanged

            If Not refresh_Orders Then
                ClearProducts()
                RefreshProducts()
            End If

        End Sub 'listViewOrders_SelectedIndexChanged
    End Class 'ControlOrders
End Namespace 'Microsoft.Sql.SqlCe.Samples.Cs.NorthwindCe