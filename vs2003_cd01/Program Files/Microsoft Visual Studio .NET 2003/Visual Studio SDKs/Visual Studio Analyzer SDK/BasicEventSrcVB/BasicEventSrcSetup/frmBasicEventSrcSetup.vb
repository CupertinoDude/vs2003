'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Sample Description:	
'	This sample will register the BasicEventSrcVB event source with VS Analyzer. 
'   It will also register a user defined event (MyBasicCustomEventVB1) under a user
'	defined category (MyBasicCustomCategoryVB1).
'
'   You will need to select the following under Projects|References...
'   "Microsoft Visual Studio Analyzer Automatable Event Source Installer 2002 Type Library"
'   This selection allows you to create the ESI (Event Source Installer) objects 
'   so that you can register and unregister an event source.
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Class frmBasicEventSrcSetup
    Inherits System.Windows.Forms.Form

#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call
        SetButtonsProps()

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

    Friend WithEvents cmdRegister As System.Windows.Forms.Button
    Friend WithEvents cmdUnregister As System.Windows.Forms.Button

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.Container

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.cmdUnregister = New System.Windows.Forms.Button()
        Me.cmdRegister = New System.Windows.Forms.Button()
        Me.SuspendLayout()

        Me.cmdUnregister.Location = New System.Drawing.Point(16, 48)
        Me.cmdUnregister.Size = New System.Drawing.Size(176, 23)
        Me.cmdUnregister.TabIndex = 1
        Me.cmdUnregister.Text = "Unregister Event Source"
        Me.cmdUnregister.Name = "cmdUnregister"

        Me.cmdRegister.Location = New System.Drawing.Point(16, 16)
        Me.cmdRegister.Size = New System.Drawing.Size(176, 23)
        Me.cmdRegister.TabIndex = 0
        Me.cmdRegister.Text = "Register Event Source"
        Me.cmdRegister.Name = "cmdRegister"

        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(211, 88)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.cmdUnregister, Me.cmdRegister})
        Me.Text = "frmBasicEventSrcSetup"
	Me.Name = "frmBasicEventSrcSetup"
        Me.ResumeLayout(False)

    End Sub

#End Region

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    'Purpose:   Registers the BasicEventSrcVB and the custom event 
    '           MyBasicCustomEventVB1 under MyBasicCustomCategoryVB1 category.
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Private Sub cmdRegister_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdRegister.Click
        'Reference to the helper CVSAnalyzerInstaller class.                                                                                                
        Dim objCVSA As BasicEventSrcSetup.CVSAnalyzerInstaller

        'Create an instance of the helper CVSAnalyzerInstaller class.
        objCVSA = New BasicEventSrcSetup.CVSAnalyzerInstaller()

        objCVSA.Register()

        'Release the CVSAnalyzerInstaller class instance.
        objCVSA = Nothing

        Me.SetButtonsProps()

    End Sub

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    'Purpose:   Unregisters the BasicEventSrcVB, which automatically unregisters the
    '           the custom event MyBasicCustomEventVB1 and the category 
    '           MyBasicCustomCategoryVB1.
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Private Sub cmdUnregister_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdUnregister.Click
        'Reference to the helper CVSAnalyzerInstaller class                                                                                                 
        Dim objReg As BasicEventSrcSetup.CVSAnalyzerInstaller

        'Create an instance of the helper CVSAnalyzerInstaller class
        objReg = New BasicEventSrcSetup.CVSAnalyzerInstaller()

        objReg.Unregister()

        'Release the CVSAnalyzerInstaller class instance
        objReg = Nothing

        Me.SetButtonsProps()
    End Sub

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    'Purpose:   Checks if the source is registered and sets the buttons on the form accordingly.
    '           If the source is registered the Register button will bi disabled and the Unregister 
    '           button will be enabled. Otherwise, the Register button will be enabled and the 
    '           Unregister one will be disabled.        
    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Protected Sub SetButtonsProps()
        'Reference to the helper CVSAnalyzerInstaller class                                                                                                 
        Dim objReg As BasicEventSrcSetup.CVSAnalyzerInstaller

        'Create an instance of the helper CVSAnalyzerInstaller class
        objReg = New BasicEventSrcSetup.CVSAnalyzerInstaller()

        'check if the component is registered and disable the register button 
        'if true or the unregister button if not
        If (objReg.IsRegistered()) Then
            Me.cmdRegister.Enabled = False
            Me.cmdUnregister.Enabled = True
        Else
            Me.cmdRegister.Enabled = True
            Me.cmdUnregister.Enabled = False
        End If

        'Release the CVSAnalyzerInstaller class instance
        objReg = Nothing

    End Sub

End Class
