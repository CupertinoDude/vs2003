Option Explicit On 
Option Strict On

Imports System.Drawing
Imports System.Windows.Forms
Imports System.xml


Imports System.ComponentModel


Public Class Forecast
    Inherits System.Windows.Forms.Form

    Public Sub New()
        MyBase.New()

        Forecast = Me

        'This call is required by the Win Form Designer.
        InitializeComponent()

        'TODO: Add any initialization after the InitializeComponent() call.

        'Populate the valid cities.
        cboCity.Items.Add("Chicago")
        cboCity.Items.Add("Houston")
        cboCity.Items.Add("LA")

    End Sub


    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If Disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(Disposing)
    End Sub

#Region " Windows Form Designer generated code "

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.Container
    Private WithEvents cboCity As System.Windows.Forms.ComboBox
    Private WithEvents Label1 As System.Windows.Forms.Label

    Private WithEvents btnGetWeather As System.Windows.Forms.Button

    Dim WithEvents Forecast As System.Windows.Forms.Form

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Me.btnGetWeather = New System.Windows.Forms.Button
        Me.cboCity = New System.Windows.Forms.ComboBox
        Me.Label1 = New System.Windows.Forms.Label

        '@design Me.TrayHeight = 0
        '@design Me.TrayLargeIcon = False
        '@design Me.TrayAutoArrange = True
        btnGetWeather.Location = New System.Drawing.Point(72, 56)
        btnGetWeather.Size = New System.Drawing.Size(104, 23)
        btnGetWeather.TabIndex = 0
        btnGetWeather.Text = "Get Weather"

        cboCity.Location = New System.Drawing.Point(56, 12)
        cboCity.Size = New System.Drawing.Size(121, 21)
        cboCity.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        cboCity.TabIndex = 3

        Label1.Location = New System.Drawing.Point(16, 16)
        Label1.Text = "City:"
        Label1.Size = New System.Drawing.Size(32, 23)
        Label1.TabIndex = 2
        Me.Text = "Forecast"
        Me.MaximizeBox = False
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(200, 93)

        Me.Controls.Add(cboCity)
        Me.Controls.Add(Label1)
        Me.Controls.Add(btnGetWeather)
    End Sub

#End Region

    Private Sub btnGetWeather_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGetWeather.Click

        'Declarations.
        Dim City As String = Me.cboCity.Text.Trim()
        Dim Weather As String
        Dim Doc As New XmlDocument
        Dim Nav As XPath.XPathNavigator
        Dim Iterator As XPath.XPathNodeIterator

        'Validation.
        If Len(City) = 0 Then
            MsgBox("You must enter a city.", MsgBoxStyle.OKOnly, "Forecast")
            Return
        End If

        'Load document.
        Doc.Load("..\xml\weather.xml")

        'Set nav object.
        Nav = CType(Doc, XPath.IXPathNavigable).CreateNavigator()

        'Set node iterator.
        Iterator = Nav.Select("weather/" & City)

        'Move to the desired node.
        Iterator.MoveNext()

        'Get the value of the current node.
        Weather = Iterator.Current.Value

        'Display weather.
        MsgBox(Weather, MsgBoxStyle.OKOnly, "Today's Weather for: " & City)

    End Sub

End Class
