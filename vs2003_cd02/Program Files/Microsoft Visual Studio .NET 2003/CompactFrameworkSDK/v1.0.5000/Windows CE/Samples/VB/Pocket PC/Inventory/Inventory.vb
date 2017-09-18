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
'* File: Inventory.vb
'*
'* Purpose: Single form interface to part of the Northwind database
'*
'* Notes:
'*          This sample demonstrates the use of System.Data.DataSet and 
'*          System.Data.SqlClient.SqlDataAdapter. If you don't have a copy of
'*          the sample Northwind database that comes with SQL Server, you can
'*          use "Inventory.xml" as the datasource.
'*
'*          "Inventory.xml" is deployed to the same directory as the sample.
'*          However, the users will not be able to see this file in any
'*          OpenFileDialog or SaveFileDialog because on Pocket PC they only
'*          display files in "My Documents". The first time the sample is
'*          run, moveInventoryXmlFile() moves the XML file to: 
'*
'*              "\My Documents\.NETCF Sample Data\Inventory.xml"
'*
'*          Clicking the "Load" button with "Local XML" selected will load this
'*          data into a DataSet. Alternatively, click the "Load" button with
'*          "SQL Server" selected to use DataAdapters to fill the current DataSet.
'*          Both will populate the DataSet with the four tables used by the
'*          application.
'*
'*          For each Product in an Order you can alter the required Quantity
'*          and Price. These changes can be saved to a local XML file, or 
'*          used to Update the Order Details table of a Northwind database.
'*
'*          The local XML file can be named anything you like - just enter 
'*          a valid name into File box.
'*
'*          As standard on Pocket PC, the titlebar "X" button will minimize the 
'*          application. To exit the application completely, use the menu
'*          option "File\Exit".

Option Explicit On 

Imports System.IO
Imports System.Xml
Imports System.Text
Imports System.Globalization
Imports Microsoft.WindowsCE.Forms

Public Class frmInventory
    Inherits System.Windows.Forms.Form

    Private Const INVENTORYXML As String = "Inventory.xml"          ' Default filename for storing data as XML
    Private Const TARGETFOLDER As String = "\My Documents\.NETCF Sample Data\"
    Private CurrentFolder As String

    Private sql As Inventory.SQLHelper                              ' Defined in SQLHelper.vb
    Private data As System.Data.DataSet
    Private dvOrders As System.Data.DataView
    Private dvProducts As System.Data.DataView
    Private blnLoading As Boolean = False
    Private blnDisplaying As Boolean = False

    Private strPreviousServer As String
    Private strPreviousUsername As String
    Private strPreviousPassword As String

#Region " Windows Form Designer generated code "

    Friend WithEvents btnLoad As System.Windows.Forms.Button
    Friend WithEvents btnSave As System.Windows.Forms.Button
    Friend WithEvents rbSQL As System.Windows.Forms.RadioButton
    Friend WithEvents rbXML As System.Windows.Forms.RadioButton
    Friend WithEvents tabCompany As System.Windows.Forms.TabPage
    Friend WithEvents cboCompany As System.Windows.Forms.ComboBox
    Friend WithEvents lblAddress As System.Windows.Forms.Label
    Friend WithEvents lblPhone As System.Windows.Forms.Label
    Friend WithEvents lblContact As System.Windows.Forms.Label
    Friend WithEvents lblCompany As System.Windows.Forms.Label
    Friend WithEvents tabCtrlInventory As System.Windows.Forms.TabControl
    Friend WithEvents tabOrders As System.Windows.Forms.TabPage
    Friend WithEvents lblSubtotal As System.Windows.Forms.Label
    Friend WithEvents cboOrders As System.Windows.Forms.ComboBox
    Friend WithEvents lblProducts As System.Windows.Forms.Label
    Friend WithEvents lblOrderID As System.Windows.Forms.Label
    Friend WithEvents lstProducts As System.Windows.Forms.ListBox
    Friend WithEvents updnQuantity As System.Windows.Forms.NumericUpDown
    Friend WithEvents lblQuantity As System.Windows.Forms.Label
    Friend WithEvents lblPrice As System.Windows.Forms.Label
    Friend WithEvents txtSubTotal As System.Windows.Forms.TextBox
    Friend WithEvents txtContact As System.Windows.Forms.TextBox
    Friend WithEvents txtPhone As System.Windows.Forms.TextBox
    Friend WithEvents txtAddress As System.Windows.Forms.TextBox
    Friend WithEvents prog As System.Windows.Forms.ProgressBar
    Friend WithEvents txtPrice As System.Windows.Forms.TextBox
    Friend WithEvents tabSettings As System.Windows.Forms.TabPage
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents txtUsername As System.Windows.Forms.TextBox
    Friend WithEvents txtServer As System.Windows.Forms.TextBox
    Friend WithEvents txtPassword As System.Windows.Forms.TextBox
    Friend WithEvents MainMenu1 As System.Windows.Forms.MainMenu
    Friend WithEvents sbStatus As System.Windows.Forms.StatusBar
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents OpenFileDialog1 As System.Windows.Forms.OpenFileDialog
    Friend WithEvents txtXMLFileName As System.Windows.Forms.TextBox
    Friend WithEvents btnFileOpen As System.Windows.Forms.Button

    Public Sub New()
        MyBase.New()

        ' This call is required by the Windows Form Designer.
        InitializeComponent()

        ' Update label to use current culture currency symbol
        Me.lblPrice.Text = "Price " + CultureInfo.CurrentCulture.NumberFormat.CurrencySymbol

        ' Show the Data Source tab so that a user can load data
        tabCtrlInventory.SelectedIndex = 2

    End Sub

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        MyBase.Dispose(disposing)
    End Sub
    Friend WithEvents mnuFile As System.Windows.Forms.MenuItem
    Friend WithEvents mnuExit As System.Windows.Forms.MenuItem
    Friend WithEvents tabAbout As System.Windows.Forms.TabPage
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents mnuSave As System.Windows.Forms.MenuItem
    Friend WithEvents mnuLoad As System.Windows.Forms.MenuItem
    Friend WithEvents mnuSeperator As System.Windows.Forms.MenuItem
    Friend WithEvents InputPanel1 As Microsoft.WindowsCE.Forms.InputPanel


    Private Sub InitializeComponent()
        Me.btnLoad = New System.Windows.Forms.Button
        Me.btnSave = New System.Windows.Forms.Button
        Me.rbSQL = New System.Windows.Forms.RadioButton
        Me.rbXML = New System.Windows.Forms.RadioButton
        Me.tabCtrlInventory = New System.Windows.Forms.TabControl
        Me.tabCompany = New System.Windows.Forms.TabPage
        Me.txtAddress = New System.Windows.Forms.TextBox
        Me.txtPhone = New System.Windows.Forms.TextBox
        Me.txtContact = New System.Windows.Forms.TextBox
        Me.cboCompany = New System.Windows.Forms.ComboBox
        Me.lblAddress = New System.Windows.Forms.Label
        Me.lblPhone = New System.Windows.Forms.Label
        Me.lblContact = New System.Windows.Forms.Label
        Me.lblCompany = New System.Windows.Forms.Label
        Me.tabOrders = New System.Windows.Forms.TabPage
        Me.txtSubTotal = New System.Windows.Forms.TextBox
        Me.updnQuantity = New System.Windows.Forms.NumericUpDown
        Me.lblSubtotal = New System.Windows.Forms.Label
        Me.cboOrders = New System.Windows.Forms.ComboBox
        Me.lblQuantity = New System.Windows.Forms.Label
        Me.lblPrice = New System.Windows.Forms.Label
        Me.lblProducts = New System.Windows.Forms.Label
        Me.lblOrderID = New System.Windows.Forms.Label
        Me.lstProducts = New System.Windows.Forms.ListBox
        Me.txtPrice = New System.Windows.Forms.TextBox
        Me.tabSettings = New System.Windows.Forms.TabPage
        Me.btnFileOpen = New System.Windows.Forms.Button
        Me.Label4 = New System.Windows.Forms.Label
        Me.txtXMLFileName = New System.Windows.Forms.TextBox
        Me.txtPassword = New System.Windows.Forms.TextBox
        Me.Label3 = New System.Windows.Forms.Label
        Me.txtUsername = New System.Windows.Forms.TextBox
        Me.txtServer = New System.Windows.Forms.TextBox
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.tabAbout = New System.Windows.Forms.TabPage
        Me.Label5 = New System.Windows.Forms.Label
        Me.prog = New System.Windows.Forms.ProgressBar
        Me.MainMenu1 = New System.Windows.Forms.MainMenu
        Me.mnuFile = New System.Windows.Forms.MenuItem
        Me.mnuSave = New System.Windows.Forms.MenuItem
        Me.mnuLoad = New System.Windows.Forms.MenuItem
        Me.mnuSeperator = New System.Windows.Forms.MenuItem
        Me.mnuExit = New System.Windows.Forms.MenuItem
        Me.sbStatus = New System.Windows.Forms.StatusBar
        Me.OpenFileDialog1 = New System.Windows.Forms.OpenFileDialog
        Me.InputPanel1 = New Microsoft.WindowsCE.Forms.InputPanel
        '
        'btnLoad
        '
        Me.btnLoad.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.btnLoad.Location = New System.Drawing.Point(120, 152)
        Me.btnLoad.Size = New System.Drawing.Size(48, 24)
        Me.btnLoad.Text = "Load"
        '
        'btnSave
        '
        Me.btnSave.Enabled = False
        Me.btnSave.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.btnSave.Location = New System.Drawing.Point(176, 152)
        Me.btnSave.Size = New System.Drawing.Size(48, 24)
        Me.btnSave.Text = "Save"
        '
        'rbSQL
        '
        Me.rbSQL.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.rbSQL.Location = New System.Drawing.Point(8, 0)
        Me.rbSQL.Size = New System.Drawing.Size(104, 24)
        Me.rbSQL.Text = "Remote SQL"
        '
        'rbXML
        '
        Me.rbXML.Checked = True
        Me.rbXML.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.rbXML.Location = New System.Drawing.Point(8, 96)
        Me.rbXML.Size = New System.Drawing.Size(104, 24)
        Me.rbXML.Text = "Local XML File"
        '
        'tabCtrlInventory
        '
        Me.tabCtrlInventory.Controls.Add(Me.tabCompany)
        Me.tabCtrlInventory.Controls.Add(Me.tabOrders)
        Me.tabCtrlInventory.Controls.Add(Me.tabSettings)
        Me.tabCtrlInventory.Controls.Add(Me.tabAbout)
        Me.tabCtrlInventory.SelectedIndex = 0
        Me.tabCtrlInventory.Size = New System.Drawing.Size(240, 232)
        '
        'tabCompany
        '
        Me.tabCompany.Controls.Add(Me.txtAddress)
        Me.tabCompany.Controls.Add(Me.txtPhone)
        Me.tabCompany.Controls.Add(Me.txtContact)
        Me.tabCompany.Controls.Add(Me.cboCompany)
        Me.tabCompany.Controls.Add(Me.lblAddress)
        Me.tabCompany.Controls.Add(Me.lblPhone)
        Me.tabCompany.Controls.Add(Me.lblContact)
        Me.tabCompany.Controls.Add(Me.lblCompany)
        Me.tabCompany.Location = New System.Drawing.Point(4, 4)
        Me.tabCompany.Size = New System.Drawing.Size(232, 206)
        Me.tabCompany.Text = "Company"
        '
        'txtAddress
        '
        Me.txtAddress.AcceptsReturn = True
        Me.txtAddress.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.txtAddress.Location = New System.Drawing.Point(64, 80)
        Me.txtAddress.Multiline = True
        Me.txtAddress.ReadOnly = True
        Me.txtAddress.Size = New System.Drawing.Size(160, 64)
        Me.txtAddress.Text = ""
        '
        'txtPhone
        '
        Me.txtPhone.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.txtPhone.Location = New System.Drawing.Point(64, 56)
        Me.txtPhone.ReadOnly = True
        Me.txtPhone.Size = New System.Drawing.Size(160, 21)
        Me.txtPhone.Text = ""
        '
        'txtContact
        '
        Me.txtContact.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.txtContact.Location = New System.Drawing.Point(64, 32)
        Me.txtContact.ReadOnly = True
        Me.txtContact.Size = New System.Drawing.Size(160, 21)
        Me.txtContact.Text = ""
        '
        'cboCompany
        '
        Me.cboCompany.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.cboCompany.Location = New System.Drawing.Point(64, 8)
        Me.cboCompany.Size = New System.Drawing.Size(160, 21)
        '
        'lblAddress
        '
        Me.lblAddress.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.lblAddress.Location = New System.Drawing.Point(8, 80)
        Me.lblAddress.Size = New System.Drawing.Size(56, 23)
        Me.lblAddress.Text = "Address:"
        Me.lblAddress.TextAlign = System.Drawing.ContentAlignment.TopRight
        '
        'lblPhone
        '
        Me.lblPhone.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.lblPhone.Location = New System.Drawing.Point(8, 56)
        Me.lblPhone.Size = New System.Drawing.Size(56, 23)
        Me.lblPhone.Text = "Phone:"
        Me.lblPhone.TextAlign = System.Drawing.ContentAlignment.TopRight
        '
        'lblContact
        '
        Me.lblContact.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.lblContact.Location = New System.Drawing.Point(8, 32)
        Me.lblContact.Size = New System.Drawing.Size(56, 23)
        Me.lblContact.Text = "Contact:"
        Me.lblContact.TextAlign = System.Drawing.ContentAlignment.TopRight
        '
        'lblCompany
        '
        Me.lblCompany.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.lblCompany.Location = New System.Drawing.Point(8, 8)
        Me.lblCompany.Size = New System.Drawing.Size(56, 23)
        Me.lblCompany.Text = "Company:"
        Me.lblCompany.TextAlign = System.Drawing.ContentAlignment.TopRight
        '
        'tabOrders
        '
        Me.tabOrders.Controls.Add(Me.txtSubTotal)
        Me.tabOrders.Controls.Add(Me.updnQuantity)
        Me.tabOrders.Controls.Add(Me.lblSubtotal)
        Me.tabOrders.Controls.Add(Me.cboOrders)
        Me.tabOrders.Controls.Add(Me.lblQuantity)
        Me.tabOrders.Controls.Add(Me.lblPrice)
        Me.tabOrders.Controls.Add(Me.lblProducts)
        Me.tabOrders.Controls.Add(Me.lblOrderID)
        Me.tabOrders.Controls.Add(Me.lstProducts)
        Me.tabOrders.Controls.Add(Me.txtPrice)
        Me.tabOrders.Location = New System.Drawing.Point(4, 4)
        Me.tabOrders.Size = New System.Drawing.Size(232, 206)
        Me.tabOrders.Text = "Orders"
        '
        'txtSubTotal
        '
        Me.txtSubTotal.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.txtSubTotal.Location = New System.Drawing.Point(64, 120)
        Me.txtSubTotal.ReadOnly = True
        Me.txtSubTotal.Size = New System.Drawing.Size(160, 21)
        Me.txtSubTotal.Text = "0.00"
        '
        'updnQuantity
        '
        Me.updnQuantity.Location = New System.Drawing.Point(64, 96)
        Me.updnQuantity.Maximum = New Decimal(New Integer() {1000, 0, 0, 0})
        Me.updnQuantity.ReadOnly = True
        Me.updnQuantity.Size = New System.Drawing.Size(56, 20)
        Me.updnQuantity.Value = New Decimal(New Integer() {1, 0, 0, 0})
        '
        'lblSubtotal
        '
        Me.lblSubtotal.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.lblSubtotal.Location = New System.Drawing.Point(8, 120)
        Me.lblSubtotal.Size = New System.Drawing.Size(56, 23)
        Me.lblSubtotal.Text = "Subtotal:"
        Me.lblSubtotal.TextAlign = System.Drawing.ContentAlignment.TopRight
        '
        'cboOrders
        '
        Me.cboOrders.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.cboOrders.Location = New System.Drawing.Point(64, 8)
        Me.cboOrders.Size = New System.Drawing.Size(160, 21)
        '
        'lblQuantity
        '
        Me.lblQuantity.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.lblQuantity.Location = New System.Drawing.Point(8, 96)
        Me.lblQuantity.Size = New System.Drawing.Size(56, 23)
        Me.lblQuantity.Text = "Quantity:"
        Me.lblQuantity.TextAlign = System.Drawing.ContentAlignment.TopRight
        '
        'lblPrice
        '
        Me.lblPrice.Location = New System.Drawing.Point(128, 96)
        Me.lblPrice.Size = New System.Drawing.Size(40, 23)
        Me.lblPrice.Text = "Price"
        Me.lblPrice.TextAlign = System.Drawing.ContentAlignment.TopRight
        '
        'lblProducts
        '
        Me.lblProducts.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.lblProducts.Location = New System.Drawing.Point(8, 32)
        Me.lblProducts.Size = New System.Drawing.Size(56, 23)
        Me.lblProducts.Text = "Products:"
        Me.lblProducts.TextAlign = System.Drawing.ContentAlignment.TopRight
        '
        'lblOrderID
        '
        Me.lblOrderID.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.lblOrderID.Location = New System.Drawing.Point(8, 8)
        Me.lblOrderID.Size = New System.Drawing.Size(56, 23)
        Me.lblOrderID.Text = "Order ID:"
        Me.lblOrderID.TextAlign = System.Drawing.ContentAlignment.TopRight
        '
        'lstProducts
        '
        Me.lstProducts.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.lstProducts.Location = New System.Drawing.Point(64, 32)
        Me.lstProducts.Size = New System.Drawing.Size(160, 54)
        '
        'txtPrice
        '
        Me.txtPrice.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.txtPrice.Location = New System.Drawing.Point(176, 96)
        Me.txtPrice.Size = New System.Drawing.Size(48, 21)
        Me.txtPrice.Text = "0"
        '
        'tabSettings
        '
        Me.tabSettings.Controls.Add(Me.btnFileOpen)
        Me.tabSettings.Controls.Add(Me.Label4)
        Me.tabSettings.Controls.Add(Me.txtXMLFileName)
        Me.tabSettings.Controls.Add(Me.txtPassword)
        Me.tabSettings.Controls.Add(Me.Label3)
        Me.tabSettings.Controls.Add(Me.txtUsername)
        Me.tabSettings.Controls.Add(Me.txtServer)
        Me.tabSettings.Controls.Add(Me.Label1)
        Me.tabSettings.Controls.Add(Me.Label2)
        Me.tabSettings.Controls.Add(Me.rbSQL)
        Me.tabSettings.Controls.Add(Me.rbXML)
        Me.tabSettings.Controls.Add(Me.btnLoad)
        Me.tabSettings.Controls.Add(Me.btnSave)
        Me.tabSettings.Location = New System.Drawing.Point(4, 4)
        Me.tabSettings.Size = New System.Drawing.Size(232, 206)
        Me.tabSettings.Text = "Data Source"
        '
        'btnFileOpen
        '
        Me.btnFileOpen.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.btnFileOpen.Location = New System.Drawing.Point(200, 120)
        Me.btnFileOpen.Size = New System.Drawing.Size(24, 20)
        Me.btnFileOpen.Text = "..."
        '
        'Label4
        '
        Me.Label4.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.Label4.Location = New System.Drawing.Point(32, 120)
        Me.Label4.Size = New System.Drawing.Size(32, 23)
        Me.Label4.Text = "File:"
        Me.Label4.TextAlign = System.Drawing.ContentAlignment.TopRight
        '
        'txtXMLFileName
        '
        Me.txtXMLFileName.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.txtXMLFileName.Location = New System.Drawing.Point(64, 120)
        Me.txtXMLFileName.Size = New System.Drawing.Size(128, 21)
        Me.txtXMLFileName.Text = ""
        '
        'txtPassword
        '
        Me.txtPassword.Enabled = False
        Me.txtPassword.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.txtPassword.Location = New System.Drawing.Point(64, 72)
        Me.txtPassword.PasswordChar = Microsoft.VisualBasic.ChrW(42)
        Me.txtPassword.Size = New System.Drawing.Size(160, 21)
        Me.txtPassword.Text = ""
        '
        'Label3
        '
        Me.Label3.Font = New System.Drawing.Font("Tahoma", 8.0!, System.Drawing.FontStyle.Regular)
        Me.Label3.Location = New System.Drawing.Point(0, 72)
        Me.Label3.Size = New System.Drawing.Size(64, 23)
        Me.Label3.Text = "Password:"
        Me.Label3.TextAlign = System.Drawing.ContentAlignment.TopRight
        '
        'txtUsername
        '
        Me.txtUsername.Enabled = False
        Me.txtUsername.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.txtUsername.Location = New System.Drawing.Point(64, 48)
        Me.txtUsername.Size = New System.Drawing.Size(160, 21)
        Me.txtUsername.Text = "username"
        '
        'txtServer
        '
        Me.txtServer.Enabled = False
        Me.txtServer.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.txtServer.Location = New System.Drawing.Point(64, 24)
        Me.txtServer.Size = New System.Drawing.Size(160, 21)
        Me.txtServer.Text = "server"
        '
        'Label1
        '
        Me.Label1.Font = New System.Drawing.Font("Tahoma", 8.0!, System.Drawing.FontStyle.Regular)
        Me.Label1.Location = New System.Drawing.Point(0, 48)
        Me.Label1.Size = New System.Drawing.Size(64, 23)
        Me.Label1.Text = "User name:"
        Me.Label1.TextAlign = System.Drawing.ContentAlignment.TopRight
        '
        'Label2
        '
        Me.Label2.Font = New System.Drawing.Font("Tahoma", 8.0!, System.Drawing.FontStyle.Regular)
        Me.Label2.Location = New System.Drawing.Point(0, 24)
        Me.Label2.Size = New System.Drawing.Size(64, 23)
        Me.Label2.Text = "Data src:"
        Me.Label2.TextAlign = System.Drawing.ContentAlignment.TopRight
        '
        'tabAbout
        '
        Me.tabAbout.Controls.Add(Me.Label5)
        Me.tabAbout.Location = New System.Drawing.Point(4, 4)
        Me.tabAbout.Size = New System.Drawing.Size(232, 206)
        Me.tabAbout.Text = "About"
        '
        'Label5
        '
        Me.Label5.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.Label5.Location = New System.Drawing.Point(8, 8)
        Me.Label5.Size = New System.Drawing.Size(224, 168)
        Me.Label5.Text = "This sample displays Companys and Orders from the Northwind database. The initial" & _
        " dataset can either be loaded from an XML file or a SQL server. You can make cha" & _
        "nges to the data by adjusting the Price and Quantity fields for each order. Thes" & _
        "e changes can be used to update the server or the local XML file. Alternatively," & _
        " enter a new file name to create a new copy your XML data file or enter new SQL " & _
        "connection details to update the Northwind database on a different server."
        '
        'prog
        '
        Me.prog.Location = New System.Drawing.Point(8, 240)
        Me.prog.Maximum = 8
        Me.prog.Size = New System.Drawing.Size(224, 24)
        '
        'MainMenu1
        '
        Me.MainMenu1.MenuItems.Add(Me.mnuFile)
        '
        'mnuFile
        '
        Me.mnuFile.MenuItems.Add(Me.mnuSave)
        Me.mnuFile.MenuItems.Add(Me.mnuLoad)
        Me.mnuFile.MenuItems.Add(Me.mnuSeperator)
        Me.mnuFile.MenuItems.Add(Me.mnuExit)
        Me.mnuFile.Text = "File"
        '
        'mnuSave
        '
        Me.mnuSave.Enabled = False
        Me.mnuSave.Text = "Save"
        '
        'mnuLoad
        '
        Me.mnuLoad.Text = "Load"
        '
        'mnuSeperator
        '
        Me.mnuSeperator.Text = "-"
        '
        'mnuExit
        '
        Me.mnuExit.Text = "Exit"
        '
        'sbStatus
        '
        Me.sbStatus.Font = New System.Drawing.Font("Tahoma", 8.25!, System.Drawing.FontStyle.Regular)
        Me.sbStatus.Location = New System.Drawing.Point(0, 273)
        Me.sbStatus.Size = New System.Drawing.Size(240, 22)
        Me.sbStatus.Text = "Inventory VB.NET: A Smart Device Application!"
        '
        'OpenFileDialog1
        '
        Me.OpenFileDialog1.Filter = "XML Files|*.xml|All files|*.*"
        '
        'frmInventory
        '
        Me.ClientSize = New System.Drawing.Size(240, 295)
        Me.Controls.Add(Me.sbStatus)
        Me.Controls.Add(Me.prog)
        Me.Controls.Add(Me.tabCtrlInventory)
        Me.Menu = Me.MainMenu1
        Me.Text = "Inventory VB.NET"

    End Sub

    Public Shared Sub Main()
        Application.Run(New frmInventory)
    End Sub

#End Region


#Region "Event handling methods"

    '* == frmInventory.Load ==
    '*
    '* Creates a new, empty DataSet, and initialises the SQLHelper object, which
    '* encapsulates each of the DataAdapters used by this application
    '*

    Private Sub frmInventory_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        '* The following resizes the ProgressBar so that it has
        '* exactly 2 pixels of clear space around it
        prog.Top = tabCtrlInventory.Bottom + 2
        prog.Height = sbStatus.Top - tabCtrlInventory.Bottom - 4
        prog.Left = 2
        prog.Width = Me.Width - 4


        '* Move the inventory.xml file to My Documents
        moveInventoryXmlFile()

        '* Initialise dataset
        data = New DataSet("Inventory")

    End Sub


    '* == moveInventoryXmlFile ==
    '* If a copy of the file already exists in the destination directory
    '* the the users is prompted, otherwise the file is moved immediately.
    '*

    Private Sub moveInventoryXmlFile()

        ' Find out where we are currectly executing and update the variable storing this
        CurrentFolder = System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase
        CurrentFolder = CurrentFolder.Substring(0, CurrentFolder.LastIndexOf("\") + 1)

        ' Move Inventory.xml to a subfolder of the user's
        ' My Documents folder. This is because the Open
        ' File Dialog on PocketPC will only show files in
        ' My Documents. We can't deploy the file directly
        ' to that folder, so we need to copy it.

        ' Each code path ensures that txtXMLFilename.Text is set.
        ' This value is used whenever the XML datasource is accessed.

        Dim bMove As Boolean = True
        Dim bOK As Boolean = True
        Dim msg, title As String

        ' Prepare our strings
        title = "Overwrite existing file?"
        msg = "Would you like to replace " + _
            """" + TARGETFOLDER + INVENTORYXML + """" + _
            " with the original version which has just" + _
            " been downloaded to your Pocket PC?"


        If File.Exists(CurrentFolder + INVENTORYXML) Then

            If File.Exists(TARGETFOLDER + INVENTORYXML) AndAlso MessageBox.Show(msg, title, MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button1) = DialogResult.No Then

                sbStatus.Text = "New " + INVENTORYXML + " will not been copied"

            Else

                Try
                    If File.Exists(TARGETFOLDER + INVENTORYXML) Then File.Delete(TARGETFOLDER + INVENTORYXML)
                    Directory.CreateDirectory(TARGETFOLDER)
                    File.Move(CurrentFolder + INVENTORYXML, TARGETFOLDER + INVENTORYXML)
                Catch ex As Exception
                    sbStatus.Text = "Error moving file: " + ex.ToString()
                End Try

            End If

        End If

        ' It is possible that we still do not have a file
        If Not (File.Exists(TARGETFOLDER + INVENTORYXML)) Then
            If OpenFileDialog1.ShowDialog() = DialogResult.OK Then
                txtXMLFileName.Text = OpenFileDialog1.FileName
            End If
        Else
            txtXMLFileName.Text = TARGETFOLDER + INVENTORYXML
        End If
    End Sub


    '* == btnLoad.Click ==
    '*
    '* Load will clear the current DataSet (and hence clear any bound
    '* controls). If the "Local XML" option is selected, the DataSet 
    '* is repopulated with data from a local XML file. Otherwise, an 
    '* attempt is made to contact the designated SQL server and use 
    '* DataAdapters to fill each of four tables in the data set
    '*

    Private Sub Load_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLoad.Click, mnuLoad.Click

        sbStatus.Text = "Loading data"

        ' Remove the input panel and allow display to update
        InputPanel1.Enabled = False
        Me.Update()

        ' Prevent the user from initiating more than one Load event
        btnLoad.Enabled = False
        btnSave.Enabled = False
        mnuSave.Enabled = False
        mnuLoad.Enabled = False

        ' Begin Load
        If rbXML.Checked Then
            ' Attempt to load Xml data 
            Try
                resetData()
                loadXMLData()
                displayData()
            Catch
                MessageBox.Show("Unable to read XML file: " + Err.Description)
                sbStatus.Text = "Unable to read XML file: " + Err.Description
            End Try
        Else
            ' Attempt to load data from a SQL server
            Try
                resetData()
                loadSQLData()
                displayData()
            Catch
                MessageBox.Show("Unable to load from SQL server: " + Err.Description)
                sbStatus.Text = "Unable to load from SQL server: " + Err.Description
            End Try
        End If

        prog.Value = prog.Maximum

        btnLoad.Enabled = True
        btnSave.Enabled = True
        mnuSave.Enabled = True
        mnuLoad.Enabled = True

    End Sub


    '* == btnSave.Click ==
    '*
    '* First, any modifications to the currently displayed data are recorded.
    '* To prevent multiple events being generated, the action buttons are
    '* disabled. 
    '*
    '* If Local XML is selected, a file stream is created and used by an 
    '* XmlTextWriter. The data is then written in full using the DataAdaptor's
    '* WriteXml() method. It is important that the XmlTextWriter is closed
    '* upon completion, otherwise subsequenent attempts to read or write from
    '* from the file will generate IOExceptions.
    '*
    '* If SQL Server is being used, the server is synced with the DataSet
    '* using DataAdapter.Update(DataSet). This will sync the data on the 
    '* server with that held locally in the DataSet. Changes will have
    '* only been made to the Order Details table, which is why only one
    '* of the four DataAdaptors is updated.
    '*

    Private Sub Save_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSave.Click, mnuSave.Click

        sbStatus.Text = "Saving data"

        ' Remove input panel and allow display to update
        InputPanel1.Enabled = False
        Me.Update()

        setPrice()
        setQuantity()

        sbStatus.Text = "Saving data"

        prog.Value = 0
        btnSave.Enabled = False

        prog.Value = 1
        btnLoad.Enabled = False

        If Not (data Is Nothing) Then

            If rbXML.Checked Then

                If txtXMLFileName.Text.Chars(0) <> "\" Then txtXMLFileName.Text = "\" + txtXMLFileName.Text

                ' Attempt to create the directory, which fails if directory already exists
                Try
                    Directory.CreateDirectory(txtXMLFileName.Text.Substring(0, txtXMLFileName.Text.LastIndexOf("\")))
                    sbStatus.Text = "Created a new directory for " + txtXMLFileName.Text
                Catch
                    sbStatus.Text = "Did not need to create a new directory"
                End Try

                Try

                    prog.Value = 2
                    Dim fsXML As New FileStream(txtXMLFileName.Text, FileMode.OpenOrCreate)

                    prog.Value = 3
                    Dim wrXML As New XmlTextWriter(fsXML, Encoding.Unicode)

                    prog.Value = 4
                    sbStatus.Text = "Saving data to XML file"

                    prog.Value = 5
                    data.WriteXml(wrXML, XmlWriteMode.WriteSchema)

                    prog.Value = 6
                    wrXML.Close()

                    prog.Value = 7
                    fsXML.Close()

                    sbStatus.Text = "Data has been saved successfully"

                Catch

                    MsgBox("Unable to save to XML: " + Err.Description)
                    sbStatus.Text = "Unable to save to XML: " + Err.Description

                End Try

            Else

                Try

                    sql = New Inventory.SQLHelper(txtServer.Text, txtUsername.Text, txtPassword.Text)

                    prog.Value = 4
                    sbStatus.Text = "Saving data to SQL Server"

                    prog.Value = 5
                    sql.SqlDataAdapter3.Update(data)

                    sbStatus.Text = "Data has been saved successfully"

                Catch

                    MsgBox("Unable to update SQL server: " + Err.Description)

                    prog.Value = 6
                    sbStatus.Text = "Unable to update SQL server: " + Err.Description

                End Try

            End If

        End If

        prog.Value = 7
        btnSave.Enabled = True

        prog.Value = 8
        btnLoad.Enabled = True

    End Sub


    '* == cboCompany.SelectedIndexChanged ==
    '*
    '* When the currently displayed company name changes,
    '* the displayed text fields must change, along with
    '* options in the Orders combo.
    '*
    '* The currently selected row of the ComboBox is retrieved
    '* and cast to a DataRowView. This is because, despite being
    '* databound, it it is returned as an Object. 
    '*

    Private Sub cboCompany_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cboCompany.SelectedIndexChanged

        sbStatus.Text = "Displaying orders for customer"

        prog.Value = 0
        Me.Update()

        If cboCompany.SelectedIndex >= 0 Then

            prog.Value = 1
            Dim strRF As String

            prog.Value = 2
            Dim row As DataRowView = CType(cboCompany.Items(cboCompany.SelectedIndex), DataRowView)

            prog.Value = 3
            txtContact.Text = row("ContactName")

            prog.Value = 4
            txtPhone.Text = row("Phone")

            prog.Value = 5
            txtAddress.Text = row("Address")

            prog.Value = 6
            strRF = "CustomerID = '" & row("CustomerID") & "'"

            ' Apply the dataview filter to the Orders View
            If (dvOrders.RowFilter <> strRF) Then
                Try

                    ' Setting RowFilter causes the filter to be applied,
                    ' which may take some time on large datasets
                    prog.Value = 7
                    dvOrders.RowFilter = strRF

                    ' Update the combobox with the newly filtered values
                    prog.Value = 8
                    cboOrders.DataSource = dvOrders

                Catch

                    MsgBox("Update order combo: " + Err.Description)

                End Try
            End If
        End If

        prog.Value = 8
        sbStatus.Text = "Ready"

    End Sub


    '* == cboOrders.SelectedIndexChanged ==
    '* 
    '* When the currently selected Order is changed, the 
    '* filter applied to the Product list must change also.
    '*

    Private Sub cboOrders_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cboOrders.SelectedIndexChanged

        sbStatus.Text = "Displaying products for order"
        Me.Update()

        If cboOrders.SelectedIndex >= 0 Then

            prog.Value = 1
            Dim strRF As String

            prog.Value = 2
            Dim row As DataRowView = CType(cboOrders.Items(cboOrders.SelectedIndex), DataRowView)

            If Not (row Is Nothing) Then

                prog.Value = 4
                strRF = "OrderID = " & row("OrderID") & ""

                If (dvProducts.RowFilter <> strRF) Then
                    Try

                        prog.Value = 6
                        dvProducts.RowFilter = strRF

                        prog.Value = 8
                        lstProducts.DataSource = dvProducts

                    Catch

                        MsgBox("Update products list: " + Err.Description)

                    End Try
                End If
            End If
        End If

        prog.Value = 8
        sbStatus.Text = "Ready"

    End Sub


    '* == lstProducts.SelectedIndexChanged ==
    '*
    '* The selection of Products are updated depending on
    '* which Order is selected. 
    '* The currently displayed Price and Quantity are set
    '* for the current product.
    '*

    Private Sub lstProducts_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lstProducts.SelectedIndexChanged

        Dim total As Double

        sbStatus.Text = "Displaying product prices"
        Me.Update()

        If lstProducts.SelectedIndex >= 0 Then

            prog.Value = 2
            Dim row As DataRowView = CType(lstProducts.Items(lstProducts.SelectedIndex), DataRowView)

            prog.Value = 4
            txtPrice.Text = row("UnitPrice")

            prog.Value = 6
            updnQuantity.Value = row("Quantity")

            prog.Value = 7
            total = row("UnitPrice") * row("Quantity")

            prog.Value = 8
            txtSubTotal.Text = total.ToString("C") ' Convert to currency

        End If

        prog.Value = 8
        sbStatus.Text = "Ready"

    End Sub


    '* == updnQuantity.ValueChanged ==
    '* When the user changes the value displayed in the Quantity 
    '* NumericUpDown the value should also be updated in the dataset

    Private Sub updnQuantity_ValueChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles updnQuantity.ValueChanged

        setQuantity()

    End Sub


    Private Sub txtPrice_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtPrice.TextChanged

        Try
            Dim d As Double
            d = Double.Parse(Me.txtPrice.Text)
            setPrice()
        Catch ex As Exception
            If lstProducts.SelectedIndex >= 0 Then
                Dim row As DataRowView = CType(lstProducts.Items(lstProducts.SelectedIndex), DataRowView)

                Try
                    txtPrice.Text = row("UnitPrice")
                Catch
                    txtPrice.Text = "0.00"
                End Try
            End If
        End Try

    End Sub


    Private Sub txtServer_GotFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtServer.GotFocus

        InputPanel1.Enabled = True

    End Sub


    Private Sub txtUsername_GotFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtUsername.GotFocus

        InputPanel1.Enabled = True

    End Sub


    Private Sub txtPassword_GotFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtPassword.GotFocus

        InputPanel1.Enabled = True

    End Sub


    Private Sub txtPrice_GotFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtPrice.GotFocus

        InputPanel1.Enabled = True

    End Sub


    Private Sub txtPrice_LostFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtPrice.LostFocus

        InputPanel1.Enabled = False

    End Sub


    Private Sub txtXMLFilename_GotFocus(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtXMLFileName.GotFocus

        InputPanel1.Enabled = True

    End Sub


    Private Sub btnFileOpen_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnFileOpen.Click

        If OpenFileDialog1.ShowDialog() = DialogResult.OK Then
            txtXMLFileName.Text = OpenFileDialog1.FileName()
        End If

    End Sub


    Private Sub mnuExit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles mnuExit.Click

        Me.Close()
        Application.Exit()

    End Sub


    Private Sub mnuFile_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles mnuFile.Click
        Me.Close()
        Application.Exit()
    End Sub


    ' rbXML_CheckedChanged - we only need to handle one radio button's
    ' state change, as there are only two possible states. This means
    ' we don't need anything to handle rbSQL.CheckedChanged event

    Private Sub rbXML_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles rbXML.CheckedChanged

        txtServer.Enabled = Not rbXML.Checked
        txtUsername.Enabled = Not rbXML.Checked
        txtPassword.Enabled = Not rbXML.Checked
        txtXMLFileName.Enabled = rbXML.Checked
        btnFileOpen.Enabled = rbXML.Checked

    End Sub

#End Region


#Region "Helper methods"

    Private Sub setQuantity()

        If lstProducts.SelectedIndex >= 0 Then
            Dim row As DataRowView = CType(lstProducts.Items(lstProducts.SelectedIndex), DataRowView)
            Dim total As Double

            Try

                row.BeginEdit()
                row("Quantity") = updnQuantity.Value
                row.EndEdit()
                total = row("UnitPrice") * row("Quantity")
                txtSubTotal.Text = total.ToString("C") ' Convert to currency

            Catch

                row.CancelEdit()
                MsgBox("Unable to update quantity: " + Err.Description)

            End Try
        End If

    End Sub

    '* == setPrice ==

    Private Sub setPrice()
        If lstProducts.SelectedIndex >= 0 Then
            Dim row As DataRowView = CType(lstProducts.Items(lstProducts.SelectedIndex), DataRowView)
            Dim total As Double

            Try
                row.BeginEdit()
                row("UnitPrice") = Double.Parse(txtPrice.Text)
                row.EndEdit()
                total = row("UnitPrice") * row("Quantity")
                txtSubTotal.Text = total.ToString("C") ' Convert to currency
            Catch
                row.CancelEdit()
                MsgBox("Unable to update price: " + Err.Description)
            End Try
        End If

    End Sub


    Private Sub resetData()

        data = New DataSet("Inventory")
        txtAddress.Text = ""
        txtPhone.Text = ""
        txtContact.Text = ""
        updnQuantity.Value = 0
        txtPrice.Text = "0.00"
        txtSubTotal.Text = "Nothing selected"

    End Sub


    Private Sub loadXMLData()

        Try

            prog.Value = 1
            sbStatus.Text = "Loading XML data..."

            prog.Value = 2
            Dim fs As New FileStream(txtXMLFileName.Text, FileMode.Open)

            prog.Value = 3
            Dim xr As New XmlTextReader(fs)

            prog.Value = 4
            data.ReadXml(xr)

            prog.Value = 8
            sbStatus.Text = "Loaded XML data"
            xr.Close()
            fs.Close()

        Catch e As System.IO.FileNotFoundException

            prog.Value = 8
            MessageBox.Show("The file '" + txtXMLFileName.Text + "' could not be found. Please select a different file name.")

        Catch e As XmlException

            prog.Value = 8
            sbStatus.Text = "Exception occured: " + e.ToString()

        End Try

    End Sub


    Private Sub loadSQLData()

        sbStatus.Text = "Loading data from SQL Server"

        sql = New Inventory.SQLHelper(txtServer.Text, txtUsername.Text, txtPassword.Text)

        If sql Is Nothing Then

            sbStatus.Text = "Please enter connection settings"

        Else

            prog.Value = 2
            sql.SqlDataAdapter1.Fill(data)

            prog.Value = 4
            sql.SqlDataAdapter2.Fill(data)

            prog.Value = 6
            sql.SqlDataAdapter3.Fill(data)

            prog.Value = 8
            sql.SqlDataAdapter4.Fill(data)

            sbStatus.Text = "Loaded data from SQL Server"

        End If

    End Sub


    Private Sub displayData()

        sbStatus.Text = "Displaying data"

        prog.Value = 1
        dvOrders = New DataView(data.Tables("Orders"))

        prog.Value = 2
        dvProducts = New DataView(data.Tables("Order Details"))

        prog.Value = 3
        cboCompany.DisplayMember = "CompanyName"

        prog.Value = 4
        cboOrders.DisplayMember = "OrderID"

        prog.Value = 5
        lstProducts.DisplayMember = "ProductID"

        prog.Value = 6
        cboCompany.DataSource = data.Tables("Customers")

        prog.Value = 7
        cboOrders.DataSource = dvOrders

        prog.Value = 8
        lstProducts.DataSource = dvProducts

        sbStatus.Text = "Completed displaying data"

        tabCtrlInventory.SelectedIndex = 0

        btnSave.Enabled = True

    End Sub

#End Region

End Class
