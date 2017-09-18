Imports System.ComponentModel
Imports System.Drawing
Imports System.Windows.Forms
Imports VehicleDemoBO.VehicleDemo

Public Class Form1
    
    Inherits System.Windows.Forms.Form
    
    
    Public Sub New()
        MyBase.New()
        
        'This call is required by the Win Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call.

        'Set the default vehicleType to Car.
        Me.cboVehicleType.SelectedIndex = 0

    End Sub

#Region " Windows Form Designer generated code "

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.Container
    Private WithEvents lblComputedRange As System.Windows.Forms.Label
    Private WithEvents chxSailboat As System.Windows.Forms.CheckBox

    Private WithEvents lblVehicleType As System.Windows.Forms.Label
    Private WithEvents cmdComputeRange As System.Windows.Forms.Button


    Private WithEvents lblFuelCapacity As System.Windows.Forms.Label
    Private WithEvents lblMilesPerGallon As System.Windows.Forms.Label
    Private WithEvents txtFuelCapacity As System.Windows.Forms.TextBox
    Private WithEvents txtMilesPerGallon As System.Windows.Forms.TextBox
    Private WithEvents cboVehicleType As System.Windows.Forms.ComboBox




















    Dim WithEvents Form1 As System.Windows.Forms.Form

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.cmdComputeRange = New System.Windows.Forms.Button()
        Me.chxSailboat = New System.Windows.Forms.CheckBox()
        Me.lblMilesPerGallon = New System.Windows.Forms.Label()
        Me.txtFuelCapacity = New System.Windows.Forms.TextBox()
        Me.lblComputedRange = New System.Windows.Forms.Label()
        Me.lblFuelCapacity = New System.Windows.Forms.Label()
        Me.lblVehicleType = New System.Windows.Forms.Label()
        Me.txtMilesPerGallon = New System.Windows.Forms.TextBox()
        Me.cboVehicleType = New System.Windows.Forms.ComboBox()
        Me.SuspendLayout()
        '
        'cmdComputeRange
        '
        Me.cmdComputeRange.Location = New System.Drawing.Point(120, 160)
        Me.cmdComputeRange.Name = "cmdComputeRange"
        Me.cmdComputeRange.Size = New System.Drawing.Size(96, 23)
        Me.cmdComputeRange.TabIndex = 15
        Me.cmdComputeRange.Text = "Compute Range"
        '
        'chxSailboat
        '
        Me.chxSailboat.Enabled = False
        Me.chxSailboat.Location = New System.Drawing.Point(120, 128)
        Me.chxSailboat.Name = "chxSailboat"
        Me.chxSailboat.TabIndex = 18
        Me.chxSailboat.Text = "Sailboat"
        '
        'lblMilesPerGallon
        '
        Me.lblMilesPerGallon.Location = New System.Drawing.Point(16, 64)
        Me.lblMilesPerGallon.Name = "lblMilesPerGallon"
        Me.lblMilesPerGallon.Size = New System.Drawing.Size(100, 16)
        Me.lblMilesPerGallon.TabIndex = 11
        Me.lblMilesPerGallon.Text = "Miles Per Gallon:"
        '
        'txtFuelCapacity
        '
        Me.txtFuelCapacity.Location = New System.Drawing.Point(120, 96)
        Me.txtFuelCapacity.Name = "txtFuelCapacity"
        Me.txtFuelCapacity.TabIndex = 10
        Me.txtFuelCapacity.Text = "13"
        '
        'lblComputedRange
        '
        Me.lblComputedRange.Font = New System.Drawing.Font("Microsoft Sans Serif", 16!, System.Drawing.FontStyle.Bold)
        Me.lblComputedRange.ForeColor = System.Drawing.Color.Red
        Me.lblComputedRange.Location = New System.Drawing.Point(8, 192)
        Me.lblComputedRange.Name = "lblComputedRange"
        Me.lblComputedRange.Size = New System.Drawing.Size(280, 56)
        Me.lblComputedRange.TabIndex = 19
        Me.lblComputedRange.Text = "Click Compute Range To See Your Vehicle's Range"
        '
        'lblFuelCapacity
        '
        Me.lblFuelCapacity.Location = New System.Drawing.Point(16, 96)
        Me.lblFuelCapacity.Name = "lblFuelCapacity"
        Me.lblFuelCapacity.Size = New System.Drawing.Size(100, 16)
        Me.lblFuelCapacity.TabIndex = 12
        Me.lblFuelCapacity.Text = "Fuel Capacity:"
        '
        'lblVehicleType
        '
        Me.lblVehicleType.Location = New System.Drawing.Point(16, 24)
        Me.lblVehicleType.Name = "lblVehicleType"
        Me.lblVehicleType.Size = New System.Drawing.Size(100, 16)
        Me.lblVehicleType.TabIndex = 16
        Me.lblVehicleType.Text = "Vehicle Type:"
        '
        'txtMilesPerGallon
        '
        Me.txtMilesPerGallon.Location = New System.Drawing.Point(120, 64)
        Me.txtMilesPerGallon.Name = "txtMilesPerGallon"
        Me.txtMilesPerGallon.TabIndex = 9
        Me.txtMilesPerGallon.Text = "24"
        '
        'cboVehicleType
        '
        Me.cboVehicleType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.cboVehicleType.DropDownWidth = 104
        Me.cboVehicleType.Items.AddRange(New Object() {"Car", "Boat"})
        Me.cboVehicleType.Location = New System.Drawing.Point(120, 24)
        Me.cboVehicleType.Name = "cboVehicleType"
        Me.cboVehicleType.Size = New System.Drawing.Size(104, 21)
        Me.cboVehicleType.TabIndex = 8
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(290, 255)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.lblComputedRange, Me.chxSailboat, Me.lblVehicleType, Me.cmdComputeRange, Me.lblFuelCapacity, Me.lblMilesPerGallon, Me.txtFuelCapacity, Me.txtMilesPerGallon, Me.cboVehicleType})
        Me.Name = "Form1"
        Me.Text = "VehicleDemo"
        Me.ResumeLayout(False)

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

#End Region

    Private Sub cboVehicleType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboVehicleType.SelectedIndexChanged
        'Enable/Disable the Sailboat checkbox depending on the VehicleType.
        If Me.cboVehicleType.Text = "Boat" Then
            Me.chxSailboat.Enabled = True
        Else
            Me.chxSailboat.Enabled = False
        End If
    End Sub

    Private Sub cmdComputeRange_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdComputeRange.Click
        Dim Vehicle As Object
        Dim Range As Integer

        'Create the object type based on the type of vehicle specified.
        'We are late binding the objVehicle object, so we can create it as either a
        'car or a boat.
        If Me.cboVehicleType.Text = "Boat" Then
            If Me.chxSailboat.Checked Then
                ' This is a sailboat.
                Vehicle = New Sailboat
            Else
                Vehicle = New Boat
            End If
        Else
            Vehicle = New Car
        End If

        'Set the FuelCapacity and MilesPerGallon properties.
        'These calls are the same regardless of the type of vehicle.
        Vehicle.FuelCapacity = CInt(Me.txtFuelCapacity.Text)
        Vehicle.MilesPerGallon = CInt(Me.txtMilesPerGallon.Text)
        'Call the ComputeRange function.  Note that we will execute different implementations
        'of this method depending on the vehicle type.
        Range = Vehicle.ComputeRange()

        'Display the computed range.
        Me.lblComputedRange.Text = "Your Vehicle's Range is: " & Range.ToString()

    End Sub

End Class
