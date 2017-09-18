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
'* File: FormNorthwindCE.vb
'*
'

Imports System
Imports System.Drawing
Imports System.Collections
Imports System.Windows.Forms
Imports System.Data
Imports System.Data.SqlServerCe
Imports System.IO
Imports System.Runtime.InteropServices
Imports System.Reflection
Imports System.ComponentModel


Namespace Microsoft.Sql.SqlCe.Samples.Cs.NorthwindCe


    '/ <summary>
    '/ Summary description for FormNorthwindCe.
    '/ </summary>
    Public Class FormNorthwindCe
        Inherits System.Windows.Forms.Form

        Private components As System.ComponentModel.Container = Nothing
        Private mainMenuNorthwind As System.Windows.Forms.MainMenu
        Private menuItemFile As System.Windows.Forms.MenuItem
        Private WithEvents menuItemFileExit As System.Windows.Forms.MenuItem
        Private menuItemNorthwind As System.Windows.Forms.MenuItem
        Private WithEvents menuItemEmployees As System.Windows.Forms.MenuItem
        Private WithEvents menuItemCustomers As System.Windows.Forms.MenuItem
        Private WithEvents menuItemOrders As System.Windows.Forms.MenuItem
        Private menuItemSync As System.Windows.Forms.MenuItem
        Private WithEvents menuItemSyncRepl As System.Windows.Forms.MenuItem
        Private controlCustomers As ControlCustomers = Nothing
        Private controlEmployees As ControlEmployees = Nothing
        Private controlReplication As ControlReplication = Nothing
        Private controlOrders As controlOrders = Nothing


        Public Sub New()
            InitializeComponent()
            InitializeMenu()
            ' Uncomment the following lines if you want to include a copy of the sample database on your device.
            ' You also need to change the build action of the NorthwindDemo.sdf file to "content".
            ' This will bring down the database to the \Windows\Start Menu directory on your device.
            ' The following code moves the NorthwindDemo.sdf file to your \My Documents directory on your device.
            '
            'Try
            '    If (File.Exists(NorthwindData.GetInstance().LocalDatabaseFile)) Then
            '        File.Delete(NorthwindData.GetInstance().LocalDatabaseFile)
            '    End If
            '    File.Move("\Program Files\.NETCF Samples\VB\NorthwindCE\NorthwindDemo.sdf", NorthwindData.GetInstance().LocalDatabaseFile)
            'Catch e As Exception
            '    ' Error handling mechanism
            '    '
            '    MessageBox.Show("Moving NorthwindDemo.sdf file: " & e.Message, "Northwind")
            '    Return
            'End Try
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
            '
            'FormNorthwindCe
            '
            Me.ClientSize = New System.Drawing.Size(240, 298)
            Me.ControlBox = False
            Me.Text = "NorthwindCe"
        End Sub 'InitializeComponent



        Private Sub InitializeMenu()
            Me.mainMenuNorthwind = New System.Windows.Forms.MainMenu
            Me.menuItemFile = New System.Windows.Forms.MenuItem
            Me.menuItemFileExit = New System.Windows.Forms.MenuItem
            Me.menuItemSync = New System.Windows.Forms.MenuItem
            Me.menuItemSyncRepl = New System.Windows.Forms.MenuItem
            Me.menuItemNorthwind = New System.Windows.Forms.MenuItem
            Me.menuItemEmployees = New System.Windows.Forms.MenuItem
            Me.menuItemCustomers = New System.Windows.Forms.MenuItem
            Me.menuItemOrders = New System.Windows.Forms.MenuItem
            ' 
            ' mainMenuNorthwind
            ' 
            Me.mainMenuNorthwind.MenuItems.Add(Me.menuItemFile)
            Me.mainMenuNorthwind.MenuItems.Add(Me.menuItemNorthwind)
            Me.mainMenuNorthwind.MenuItems.Add(Me.menuItemSync)
            ' 
            ' menuItemFile
            ' 
            Me.menuItemFile.MenuItems.Add(Me.menuItemFileExit)
            Me.menuItemFile.Text = "File"
            ' 
            ' menuItemFileExit
            ' 
            Me.menuItemFileExit.Text = "Exit"
            ' 
            ' menuItemSync
            ' 
            Me.menuItemSync.MenuItems.Add(Me.menuItemSyncRepl)
            Me.menuItemSync.Text = "Sync"
            ' 
            ' menuItemFileExit
            ' 
            Me.menuItemSyncRepl.Text = "Replication"
            ' 
            ' menuItemNorthwind
            ' 
            Me.menuItemNorthwind.MenuItems.Add(Me.menuItemEmployees)
            Me.menuItemNorthwind.MenuItems.Add(Me.menuItemCustomers)
            Me.menuItemNorthwind.MenuItems.Add(Me.menuItemOrders)
            Me.menuItemNorthwind.Text = "Northwind"
            ' 
            ' menuItemEmployees
            ' 
            Me.menuItemEmployees.Text = "Employees"
            ' 
            ' menuItemCustomers
            ' 
            Me.menuItemCustomers.Text = "Customers"
            ' 
            ' menuItemOrders
            ' 
            Me.menuItemOrders.Text = "Orders"
            Me.Menu = Me.mainMenuNorthwind
        End Sub 'InitializeMenu


        Shared Sub Main()
            Application.Run(New FormNorthwindCe)
        End Sub 'Main

        Private Sub FormNorthwindCe_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
            ActiveSyncReplication()
        End Sub

        Private Sub menuItemSyncRepl_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles menuItemSyncRepl.Click
            ActiveSyncReplication()
        End Sub 'menuItemSyncRepl_Click


        Private Sub menuItemEmployees_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles menuItemEmployees.Click
            ActiveNorthwindEmployees()
        End Sub 'menuItemEmployees_Click


        Private Sub menuItemCustomers_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles menuItemCustomers.Click
            ActiveNorthwindCustomers()
        End Sub 'menuItemCustomers_Click


        Private Sub menuItemOrders_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles menuItemOrders.Click
            ActiveNorthwindOrders()
        End Sub 'menuItemOrders_Click


        Private Sub menuItemFileExit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles menuItemFileExit.Click
            NorthwindData.GetInstance().Close()
            Me.Close()
            Application.Exit()
        End Sub 'menuItemFileExit_Click


        Public Sub ActiveNorthwindEmployees()

            If controlEmployees Is Nothing Then
                controlEmployees = New ControlEmployees
                Me.Controls.Add(Me.controlEmployees)
                controlEmployees.Visible = False
                controlEmployees.InitEmployees()
            End If

            ' Make the ControlEmployees control visible.
            '
            controlEmployees.BringToFront()
            controlEmployees.Visible = True

        End Sub 'ActiveNorthwindEmployees


        Public Sub ActiveNorthwindCustomers()

            If controlCustomers Is Nothing Then
                controlCustomers = New ControlCustomers
                Me.Controls.Add(Me.controlCustomers)
                controlCustomers.Visible = False
                controlCustomers.InitCustomers()
            End If

            ' Make the ControlCustomers control visible.
            '
            controlCustomers.BringToFront()
            controlCustomers.Visible = True

        End Sub 'ActiveNorthwindCustomers


        Public Sub ActiveNorthwindOrders()

            If controlOrders Is Nothing Then
                controlOrders = New ControlOrders
                Me.Controls.Add(Me.controlOrders)
                controlOrders.Visible = False
                controlOrders.InitOrders()
            End If

            ' Make the ControlOrders control visible.
            '
            controlOrders.BringToFront()
            controlOrders.Visible = True

        End Sub 'ActiveNorthwindOrders


        Public Sub ActiveSyncReplication()

            If controlReplication Is Nothing Then
                controlReplication = New ControlReplication
                controlReplication.FormNorthwind = Me
                Me.Controls.Add(Me.controlReplication)
                controlReplication.Visible = False
                UpdateMenu()
            End If
            ' Make the ControlReplication control visible.
            '
            controlReplication.BringToFront()
            controlReplication.Visible = True

        End Sub 'ActiveSyncReplication


        ' This function refreshes the various DataSets.
        '
        Public Overrides Sub Refresh()

            If Not (controlOrders Is Nothing) Then controlOrders.InitOrders()
            If Not (controlCustomers Is Nothing) Then controlCustomers.InitCustomers()
            If Not (controlEmployees Is Nothing) Then controlEmployees.InitEmployees()

        End Sub 'Refresh


        Public Sub UpdateMenu()

            If controlReplication Is Nothing Or controlReplication.Initialize Then
                Me.menuItemNorthwind.Enabled = False
                Me.menuItemEmployees.Enabled = False
                Me.menuItemCustomers.Enabled = False
                Me.menuItemOrders.Enabled = False
            Else
                Me.menuItemNorthwind.Enabled = True
                Me.menuItemEmployees.Enabled = True
                Me.menuItemCustomers.Enabled = True
                Me.menuItemOrders.Enabled = True
            End If

        End Sub 'UpdateMenu

    End Class 'FormNorthwindCe
End Namespace 'Microsoft.Sql.SqlCe.Samples.Cs.NorthwindCe