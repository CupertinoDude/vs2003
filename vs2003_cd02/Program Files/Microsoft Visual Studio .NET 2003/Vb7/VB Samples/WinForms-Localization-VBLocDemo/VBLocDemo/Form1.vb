Imports System.Globalization
Imports System.Resources
Imports System.Threading
Imports Microsoft.Win32

'The .NET Resource Manager loads resources in a hierarchical manner.  This sample
'demonstrates the fallback system in which resources are loaded.  
'The Resource Manager will attempt to load the specific culture, which in 
'this sample is "de-AT" or "de-DE".  If the resources are not found for the 
'specific culture, it will attempt to load the neutral culture, which in this
'case is "de".
'If the requested resources are still not found, the loader "falls back" to 
'the resources include in the main assembly, which are marked as "neutral language"
'In this sample, the neutral resources are in English, but could theoretically
'be in any language.

Public Class Form1
    Inherits System.Windows.Forms.Form
    Private PreferredUICulture As String  'Saves the users' preferred UI language.
    Dim VBLocDemoUILanguageKey As RegistryKey 'Stores the users' preferred UI Language.
    Private MyResMgr As ResourceManager = New ResourceManager("VBLocDemo.LocStrings", GetType(Form1).Module.Assembly) 'Create a resource manager for loading strings for the MessageBox

#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()
        ReadRegistryKey() 'Read the registry for user's preferred languages
        Try
            Thread.CurrentThread.CurrentUICulture = New CultureInfo(PreferredUICulture) 'Set the CurrentUICulture to language preference stored in the registry
        Catch
            Thread.CurrentThread.CurrentUICulture = New CultureInfo("", False) 'If no language is set, use the fallback language, which are the resources compiled in the main assembly
        End Try

        'This call is required by the Windows Form Designer.
        InitializeComponent()
        FillUICultureComboBox(cmbUICulture) 'Fill the combobox with the available UI Cultures


        Dim CurrentDate As New DateTime
        stbDateTime.Text = CurrentDate.Now.ToLongDateString
        'ToString uses the locale-specific formatting defined by the system's user locale
        'Here we just use the system settings, since this is the usual case
        'If you want the date setting to display in a specific locale format, you can set Thread.CurrentThread.CurrentCulture to the specific culture of your choice
        'Add any initialization after the InitializeComponent() call

    End Sub

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub
    Private WithEvents lblUICulture As System.Windows.Forms.Label
    Private WithEvents cmbUICulture As System.Windows.Forms.ComboBox
    Private WithEvents stbDateTime As System.Windows.Forms.StatusBar
    Private WithEvents Button1 As System.Windows.Forms.Button
    Private WithEvents MainMenu1 As System.Windows.Forms.MainMenu
    Private WithEvents mnuFile As System.Windows.Forms.MenuItem
    Private WithEvents mnuExit As System.Windows.Forms.MenuItem

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Private WithEvents mnuSaveUILang As System.Windows.Forms.MenuItem
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(Form1))
        Me.lblUICulture = New System.Windows.Forms.Label
        Me.cmbUICulture = New System.Windows.Forms.ComboBox
        Me.stbDateTime = New System.Windows.Forms.StatusBar
        Me.Button1 = New System.Windows.Forms.Button
        Me.MainMenu1 = New System.Windows.Forms.MainMenu
        Me.mnuFile = New System.Windows.Forms.MenuItem
        Me.mnuSaveUILang = New System.Windows.Forms.MenuItem
        Me.mnuExit = New System.Windows.Forms.MenuItem
        Me.SuspendLayout()
        '
        'lblUICulture
        '
        Me.lblUICulture.AccessibleDescription = resources.GetString("lblUICulture.AccessibleDescription")
        Me.lblUICulture.AccessibleName = resources.GetString("lblUICulture.AccessibleName")
        Me.lblUICulture.Anchor = CType(resources.GetObject("lblUICulture.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.lblUICulture.AutoSize = CType(resources.GetObject("lblUICulture.AutoSize"), Boolean)
        Me.lblUICulture.Dock = CType(resources.GetObject("lblUICulture.Dock"), System.Windows.Forms.DockStyle)
        Me.lblUICulture.Enabled = CType(resources.GetObject("lblUICulture.Enabled"), Boolean)
        Me.lblUICulture.Font = CType(resources.GetObject("lblUICulture.Font"), System.Drawing.Font)
        Me.lblUICulture.Image = CType(resources.GetObject("lblUICulture.Image"), System.Drawing.Image)
        Me.lblUICulture.ImageAlign = CType(resources.GetObject("lblUICulture.ImageAlign"), System.Drawing.ContentAlignment)
        Me.lblUICulture.ImageIndex = CType(resources.GetObject("lblUICulture.ImageIndex"), Integer)
        Me.lblUICulture.ImeMode = CType(resources.GetObject("lblUICulture.ImeMode"), System.Windows.Forms.ImeMode)
        Me.lblUICulture.Location = CType(resources.GetObject("lblUICulture.Location"), System.Drawing.Point)
        Me.lblUICulture.Name = "lblUICulture"
        Me.lblUICulture.RightToLeft = CType(resources.GetObject("lblUICulture.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.lblUICulture.Size = CType(resources.GetObject("lblUICulture.Size"), System.Drawing.Size)
        Me.lblUICulture.TabIndex = CType(resources.GetObject("lblUICulture.TabIndex"), Integer)
        Me.lblUICulture.Text = resources.GetString("lblUICulture.Text")
        Me.lblUICulture.TextAlign = CType(resources.GetObject("lblUICulture.TextAlign"), System.Drawing.ContentAlignment)
        Me.lblUICulture.Visible = CType(resources.GetObject("lblUICulture.Visible"), Boolean)
        '
        'cmbUICulture
        '
        Me.cmbUICulture.AccessibleDescription = resources.GetString("cmbUICulture.AccessibleDescription")
        Me.cmbUICulture.AccessibleName = resources.GetString("cmbUICulture.AccessibleName")
        Me.cmbUICulture.Anchor = CType(resources.GetObject("cmbUICulture.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.cmbUICulture.BackgroundImage = CType(resources.GetObject("cmbUICulture.BackgroundImage"), System.Drawing.Image)
        Me.cmbUICulture.Dock = CType(resources.GetObject("cmbUICulture.Dock"), System.Windows.Forms.DockStyle)
        Me.cmbUICulture.Enabled = CType(resources.GetObject("cmbUICulture.Enabled"), Boolean)
        Me.cmbUICulture.Font = CType(resources.GetObject("cmbUICulture.Font"), System.Drawing.Font)
        Me.cmbUICulture.ImeMode = CType(resources.GetObject("cmbUICulture.ImeMode"), System.Windows.Forms.ImeMode)
        Me.cmbUICulture.IntegralHeight = CType(resources.GetObject("cmbUICulture.IntegralHeight"), Boolean)
        Me.cmbUICulture.ItemHeight = CType(resources.GetObject("cmbUICulture.ItemHeight"), Integer)
        Me.cmbUICulture.Location = CType(resources.GetObject("cmbUICulture.Location"), System.Drawing.Point)
        Me.cmbUICulture.MaxDropDownItems = CType(resources.GetObject("cmbUICulture.MaxDropDownItems"), Integer)
        Me.cmbUICulture.MaxLength = CType(resources.GetObject("cmbUICulture.MaxLength"), Integer)
        Me.cmbUICulture.Name = "cmbUICulture"
        Me.cmbUICulture.RightToLeft = CType(resources.GetObject("cmbUICulture.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.cmbUICulture.Size = CType(resources.GetObject("cmbUICulture.Size"), System.Drawing.Size)
        Me.cmbUICulture.TabIndex = CType(resources.GetObject("cmbUICulture.TabIndex"), Integer)
        Me.cmbUICulture.Text = resources.GetString("cmbUICulture.Text")
        Me.cmbUICulture.Visible = CType(resources.GetObject("cmbUICulture.Visible"), Boolean)
        '
        'stbDateTime
        '
        Me.stbDateTime.AccessibleDescription = resources.GetString("stbDateTime.AccessibleDescription")
        Me.stbDateTime.AccessibleName = resources.GetString("stbDateTime.AccessibleName")
        Me.stbDateTime.Anchor = CType(resources.GetObject("stbDateTime.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.stbDateTime.BackgroundImage = CType(resources.GetObject("stbDateTime.BackgroundImage"), System.Drawing.Image)
        Me.stbDateTime.Dock = CType(resources.GetObject("stbDateTime.Dock"), System.Windows.Forms.DockStyle)
        Me.stbDateTime.Enabled = CType(resources.GetObject("stbDateTime.Enabled"), Boolean)
        Me.stbDateTime.Font = CType(resources.GetObject("stbDateTime.Font"), System.Drawing.Font)
        Me.stbDateTime.ImeMode = CType(resources.GetObject("stbDateTime.ImeMode"), System.Windows.Forms.ImeMode)
        Me.stbDateTime.Location = CType(resources.GetObject("stbDateTime.Location"), System.Drawing.Point)
        Me.stbDateTime.Name = "stbDateTime"
        Me.stbDateTime.RightToLeft = CType(resources.GetObject("stbDateTime.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.stbDateTime.Size = CType(resources.GetObject("stbDateTime.Size"), System.Drawing.Size)
        Me.stbDateTime.TabIndex = CType(resources.GetObject("stbDateTime.TabIndex"), Integer)
        Me.stbDateTime.Text = resources.GetString("stbDateTime.Text")
        Me.stbDateTime.Visible = CType(resources.GetObject("stbDateTime.Visible"), Boolean)
        '
        'Button1
        '
        Me.Button1.AccessibleDescription = resources.GetString("Button1.AccessibleDescription")
        Me.Button1.AccessibleName = resources.GetString("Button1.AccessibleName")
        Me.Button1.Anchor = CType(resources.GetObject("Button1.Anchor"), System.Windows.Forms.AnchorStyles)
        Me.Button1.BackgroundImage = CType(resources.GetObject("Button1.BackgroundImage"), System.Drawing.Image)
        Me.Button1.Dock = CType(resources.GetObject("Button1.Dock"), System.Windows.Forms.DockStyle)
        Me.Button1.Enabled = CType(resources.GetObject("Button1.Enabled"), Boolean)
        Me.Button1.FlatStyle = CType(resources.GetObject("Button1.FlatStyle"), System.Windows.Forms.FlatStyle)
        Me.Button1.Font = CType(resources.GetObject("Button1.Font"), System.Drawing.Font)
        Me.Button1.Image = CType(resources.GetObject("Button1.Image"), System.Drawing.Image)
        Me.Button1.ImageAlign = CType(resources.GetObject("Button1.ImageAlign"), System.Drawing.ContentAlignment)
        Me.Button1.ImageIndex = CType(resources.GetObject("Button1.ImageIndex"), Integer)
        Me.Button1.ImeMode = CType(resources.GetObject("Button1.ImeMode"), System.Windows.Forms.ImeMode)
        Me.Button1.Location = CType(resources.GetObject("Button1.Location"), System.Drawing.Point)
        Me.Button1.Name = "Button1"
        Me.Button1.RightToLeft = CType(resources.GetObject("Button1.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.Button1.Size = CType(resources.GetObject("Button1.Size"), System.Drawing.Size)
        Me.Button1.TabIndex = CType(resources.GetObject("Button1.TabIndex"), Integer)
        Me.Button1.Text = resources.GetString("Button1.Text")
        Me.Button1.TextAlign = CType(resources.GetObject("Button1.TextAlign"), System.Drawing.ContentAlignment)
        Me.Button1.Visible = CType(resources.GetObject("Button1.Visible"), Boolean)
        '
        'MainMenu1
        '
        Me.MainMenu1.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.mnuFile})
        Me.MainMenu1.RightToLeft = CType(resources.GetObject("MainMenu1.RightToLeft"), System.Windows.Forms.RightToLeft)
        '
        'mnuFile
        '
        Me.mnuFile.Enabled = CType(resources.GetObject("mnuFile.Enabled"), Boolean)
        Me.mnuFile.Index = 0
        Me.mnuFile.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.mnuSaveUILang, Me.mnuExit})
        Me.mnuFile.Shortcut = CType(resources.GetObject("mnuFile.Shortcut"), System.Windows.Forms.Shortcut)
        Me.mnuFile.ShowShortcut = CType(resources.GetObject("mnuFile.ShowShortcut"), Boolean)
        Me.mnuFile.Text = resources.GetString("mnuFile.Text")
        Me.mnuFile.Visible = CType(resources.GetObject("mnuFile.Visible"), Boolean)
        '
        'mnuSaveUILang
        '
        Me.mnuSaveUILang.Enabled = CType(resources.GetObject("mnuSaveUILang.Enabled"), Boolean)
        Me.mnuSaveUILang.Index = 0
        Me.mnuSaveUILang.Shortcut = CType(resources.GetObject("mnuSaveUILang.Shortcut"), System.Windows.Forms.Shortcut)
        Me.mnuSaveUILang.ShowShortcut = CType(resources.GetObject("mnuSaveUILang.ShowShortcut"), Boolean)
        Me.mnuSaveUILang.Text = resources.GetString("mnuSaveUILang.Text")
        Me.mnuSaveUILang.Visible = CType(resources.GetObject("mnuSaveUILang.Visible"), Boolean)
        '
        'mnuExit
        '
        Me.mnuExit.Enabled = CType(resources.GetObject("mnuExit.Enabled"), Boolean)
        Me.mnuExit.Index = 1
        Me.mnuExit.Shortcut = CType(resources.GetObject("mnuExit.Shortcut"), System.Windows.Forms.Shortcut)
        Me.mnuExit.ShowShortcut = CType(resources.GetObject("mnuExit.ShowShortcut"), Boolean)
        Me.mnuExit.Text = resources.GetString("mnuExit.Text")
        Me.mnuExit.Visible = CType(resources.GetObject("mnuExit.Visible"), Boolean)
        '
        'Form1
        '
        Me.AccessibleDescription = resources.GetString("$this.AccessibleDescription")
        Me.AccessibleName = resources.GetString("$this.AccessibleName")
        Me.AutoScaleBaseSize = CType(resources.GetObject("$this.AutoScaleBaseSize"), System.Drawing.Size)
        Me.AutoScroll = CType(resources.GetObject("$this.AutoScroll"), Boolean)
        Me.AutoScrollMargin = CType(resources.GetObject("$this.AutoScrollMargin"), System.Drawing.Size)
        Me.AutoScrollMinSize = CType(resources.GetObject("$this.AutoScrollMinSize"), System.Drawing.Size)
        Me.BackgroundImage = CType(resources.GetObject("$this.BackgroundImage"), System.Drawing.Image)
        Me.ClientSize = CType(resources.GetObject("$this.ClientSize"), System.Drawing.Size)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.Button1, Me.stbDateTime, Me.cmbUICulture, Me.lblUICulture})
        Me.Enabled = CType(resources.GetObject("$this.Enabled"), Boolean)
        Me.Font = CType(resources.GetObject("$this.Font"), System.Drawing.Font)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.ImeMode = CType(resources.GetObject("$this.ImeMode"), System.Windows.Forms.ImeMode)
        Me.Location = CType(resources.GetObject("$this.Location"), System.Drawing.Point)
        Me.MaximumSize = CType(resources.GetObject("$this.MaximumSize"), System.Drawing.Size)
        Me.Menu = Me.MainMenu1
        Me.MinimumSize = CType(resources.GetObject("$this.MinimumSize"), System.Drawing.Size)
        Me.Name = "Form1"
        Me.RightToLeft = CType(resources.GetObject("$this.RightToLeft"), System.Windows.Forms.RightToLeft)
        Me.StartPosition = CType(resources.GetObject("$this.StartPosition"), System.Windows.Forms.FormStartPosition)
        Me.Text = resources.GetString("$this.Text")
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub mnuExit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles mnuExit.Click
        Me.Close()
    End Sub

    Private Sub FillUICultureComboBox(ByVal cmb As ComboBox)

        Dim UserUICultures() As String = {"en", "de", "de-DE", "de-AT"}
        'Create an array with the available cultures.

        Dim UILanguages As New ArrayList

        Dim o As Object
        Dim c As CultureInfo
        For Each o In UserUICultures
            c = New CultureInfo(o.ToString())
            UILanguages.Add(New LanguageDropdown(c.NativeName, c.Name))
        Next
        'NativeName will be used for display.  It will display the culture name in the native language.
        'For example, "German" will be displayed as "Deutsch".
        'Use Name for storing the RFC 1766 representation which can be easily stored in the registry and passed to CultureInfo.

        cmbUICulture.DataSource = UILanguages
        cmbUICulture.DisplayMember = "LangDisplay"
        cmbUICulture.ValueMember = "LangValue"

        'Set the selected text in the combobox to the CurrentUICulture.
        If PreferredUICulture Is Nothing Then
            Thread.CurrentThread.CurrentUICulture = New CultureInfo("", False) 'If no preference is set, use the default settings.
            cmbUICulture.SelectedValue = Thread.CurrentThread.CurrentUICulture.Name
        Else
            cmbUICulture.SelectedValue = PreferredUICulture 'Otherwise use the user's preferred language.
        End If


    End Sub

    Private Sub cmbUICulture_SelectionChangeCommitted(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmbUICulture.SelectionChangeCommitted
        PreferredUICulture = cmbUICulture.SelectedValue 'Store the user's selection in the variable "PreferredUICulture".
        ChangeUISettings()
    End Sub

    Private Sub WriteRegistryKey()
        'Write the user's preferred UI culture to the registry.
        If Registry.CurrentUser.GetValue("VBLocDemo\UILangauge") = Nothing Then
            VBLocDemoUILanguageKey = Registry.CurrentUser.CreateSubKey("Software\VBLocDemo\UILanguage")
        End If

        VBLocDemoUILanguageKey.SetValue("UILanguage", PreferredUICulture)

    End Sub

    Private Sub ReadRegistryKey()
        'Read the user's preferred UI culture from the registry, and store it in PreferredUICulture.
        Try
            Dim RK As RegistryKey = Registry.CurrentUser
            RK = RK.OpenSubKey("Software\\VBLocDemo\\UILanguage")
            Dim oRegValue As Object = RK.GetValue("UILanguage")
            PreferredUICulture = oRegValue.ToString()
        Catch 'Catch the error if the registry key does not exist.
            PreferredUICulture = Nothing
        End Try


    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        'Use the Resource Manager to load strings based on the CurrentUICulture from "LocStrings.resx".
        MsgBox(MyResMgr.GetString("HelloMessage"), MsgBoxStyle.OKCancel, MyResMgr.GetString("HelloCaption"))

    End Sub

    Private Sub ChangeUISettings()
        Try
            Thread.CurrentThread.CurrentUICulture = New CultureInfo(PreferredUICulture) 'Set the CurrentUICulture to current language preference
        Catch
            Thread.CurrentThread.CurrentUICulture = New CultureInfo("", False) 'If no language is set, use the fallback language, which are the resources compiled in the main assembly.
        End Try

        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(Form1))
        Me.lblUICulture.Text = resources.GetString("lblUICulture.Text")
        Me.Button1.Text = resources.GetString("Button1.Text")
        Me.mnuFile.Text = resources.GetString("mnuFile.Text")
        Me.mnuExit.Text = resources.GetString("mnuExit.Text")
        Me.mnuSaveUILang.Text = resources.GetString("mnuSaveUILang.Text")
        Me.Text = resources.GetString("$this.Text")

    End Sub

    Private Sub mnuSaveUILang_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles mnuSaveUILang.Click
        WriteRegistryKey() 'Save the user's preferred UI language to the registry.
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        cmbUICulture_SelectionChangeCommitted(Nothing, Nothing)
    End Sub
End Class
