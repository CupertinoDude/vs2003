Option Strict On
Option Explicit On 

Imports System.ComponentModel
Imports System.Drawing
Imports System.Windows.Forms
Imports Microsoft.VisualBasic
Imports System.Globalization


Public Class Calculator
    Inherits System.Windows.Forms.Form

    'Data variables.
    Private mOp1, mOp2 As Double          'Previously input operand.
    Private mNumOps As Integer             'Number of operands.
    Private mLastInput As Operation        'Indicate type of last keypress event.
    Private mOpFlag As String              'Indicate pending operation.
    Private mOpPrev As String              'Previous operation
    Private mMinus As String               'Minus operator "-"
    Private mDecValue As String            'Local systems decimal value
    Private mAllowBackSpace As Boolean     'Allow backspace


    Private Enum Operation
        None = 0
        Operand
        Operator
        CE
        Cancel
    End Enum

    Public Sub New()
        MyBase.New()

        Calculator = Me

        'This call is required by the Win Form Designer.
        InitializeComponent()

        'TODO: Add any initialization after the InitializeComponent() call.
        Reset()

        'Get decimal separator based upon machine local settings.
        mDecValue = NumberFormatInfo.CurrentInfo.NumberDecimalSeparator
        CalcDec.Text = mDecValue

        mMinus = "-"

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


#Region " Windows Form Designer generated code "

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.Container
    Private WithEvents ExitMenu As System.Windows.Forms.MenuItem
    Private WithEvents FileMenu As System.Windows.Forms.MenuItem
    Private WithEvents CalcMenu As System.Windows.Forms.MainMenu
    Private WithEvents CalcRes As System.Windows.Forms.Button
    Private WithEvents CalcPlus As System.Windows.Forms.Button
    Private WithEvents CalcDec As System.Windows.Forms.Button
    Private WithEvents CalcSign As System.Windows.Forms.Button
    Private WithEvents Calc0 As System.Windows.Forms.Button
    Private WithEvents CalcCan As System.Windows.Forms.Button
    Private WithEvents CalcSub As System.Windows.Forms.Button
    Private WithEvents Calc3 As System.Windows.Forms.Button
    Private WithEvents Calc2 As System.Windows.Forms.Button
    Private WithEvents Calc1 As System.Windows.Forms.Button
    Private WithEvents CalcCE As System.Windows.Forms.Button
    Private WithEvents CalcMul As System.Windows.Forms.Button
    Private WithEvents Calc6 As System.Windows.Forms.Button
    Private WithEvents Calc5 As System.Windows.Forms.Button
    Private WithEvents Calc4 As System.Windows.Forms.Button
    Private WithEvents CalcBS As System.Windows.Forms.Button
    Private WithEvents CalcDiv As System.Windows.Forms.Button
    Private WithEvents Calc9 As System.Windows.Forms.Button
    Private WithEvents Calc8 As System.Windows.Forms.Button
    Private WithEvents Calc7 As System.Windows.Forms.Button
    Private WithEvents CalcField As System.Windows.Forms.TextBox

    Dim WithEvents Calculator As System.Windows.Forms.Form

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Private Sub InitializeComponent()
        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(Calculator))
        Me.CalcSub = New System.Windows.Forms.Button
        Me.CalcDiv = New System.Windows.Forms.Button
        Me.CalcPlus = New System.Windows.Forms.Button
        Me.CalcRes = New System.Windows.Forms.Button
        Me.CalcCan = New System.Windows.Forms.Button
        Me.Calc7 = New System.Windows.Forms.Button
        Me.Calc6 = New System.Windows.Forms.Button
        Me.CalcBS = New System.Windows.Forms.Button
        Me.Calc4 = New System.Windows.Forms.Button
        Me.Calc3 = New System.Windows.Forms.Button
        Me.Calc2 = New System.Windows.Forms.Button
        Me.CalcSign = New System.Windows.Forms.Button
        Me.Calc0 = New System.Windows.Forms.Button
        Me.Calc9 = New System.Windows.Forms.Button
        Me.Calc8 = New System.Windows.Forms.Button
        Me.CalcCE = New System.Windows.Forms.Button
        Me.FileMenu = New System.Windows.Forms.MenuItem
        Me.ExitMenu = New System.Windows.Forms.MenuItem
        Me.Calc5 = New System.Windows.Forms.Button
        Me.CalcDec = New System.Windows.Forms.Button
        Me.Calc1 = New System.Windows.Forms.Button
        Me.CalcMul = New System.Windows.Forms.Button
        Me.CalcMenu = New System.Windows.Forms.MainMenu
        Me.CalcField = New System.Windows.Forms.TextBox
        Me.SuspendLayout()
        '
        'CalcSub
        '
        Me.CalcSub.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.CalcSub.Location = New System.Drawing.Point(136, 128)
        Me.CalcSub.Name = "CalcSub"
        Me.CalcSub.Size = New System.Drawing.Size(30, 30)
        Me.CalcSub.TabIndex = 14
        Me.CalcSub.Text = "-"
        '
        'CalcDiv
        '
        Me.CalcDiv.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.CalcDiv.Location = New System.Drawing.Point(136, 48)
        Me.CalcDiv.Name = "CalcDiv"
        Me.CalcDiv.Size = New System.Drawing.Size(30, 30)
        Me.CalcDiv.TabIndex = 4
        Me.CalcDiv.Text = "/"
        '
        'CalcPlus
        '
        Me.CalcPlus.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.CalcPlus.Location = New System.Drawing.Point(136, 168)
        Me.CalcPlus.Name = "CalcPlus"
        Me.CalcPlus.Size = New System.Drawing.Size(30, 30)
        Me.CalcPlus.TabIndex = 19
        Me.CalcPlus.Text = "+"
        '
        'CalcRes
        '
        Me.CalcRes.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.CalcRes.Location = New System.Drawing.Point(176, 168)
        Me.CalcRes.Name = "CalcRes"
        Me.CalcRes.Size = New System.Drawing.Size(30, 30)
        Me.CalcRes.TabIndex = 20
        Me.CalcRes.Text = "="
        '
        'CalcCan
        '
        Me.CalcCan.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.CalcCan.Location = New System.Drawing.Point(176, 128)
        Me.CalcCan.Name = "CalcCan"
        Me.CalcCan.Size = New System.Drawing.Size(30, 30)
        Me.CalcCan.TabIndex = 15
        Me.CalcCan.Text = "C"
        '
        'Calc7
        '
        Me.Calc7.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.Calc7.Location = New System.Drawing.Point(16, 48)
        Me.Calc7.Name = "Calc7"
        Me.Calc7.Size = New System.Drawing.Size(30, 30)
        Me.Calc7.TabIndex = 1
        Me.Calc7.Text = "7"
        '
        'Calc6
        '
        Me.Calc6.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.Calc6.Location = New System.Drawing.Point(96, 88)
        Me.Calc6.Name = "Calc6"
        Me.Calc6.Size = New System.Drawing.Size(30, 30)
        Me.Calc6.TabIndex = 8
        Me.Calc6.Text = "6"
        '
        'CalcBS
        '
        Me.CalcBS.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.CalcBS.Location = New System.Drawing.Point(176, 48)
        Me.CalcBS.Name = "CalcBS"
        Me.CalcBS.Size = New System.Drawing.Size(30, 30)
        Me.CalcBS.TabIndex = 5
        Me.CalcBS.Text = "BS"
        '
        'Calc4
        '
        Me.Calc4.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.Calc4.Location = New System.Drawing.Point(16, 88)
        Me.Calc4.Name = "Calc4"
        Me.Calc4.Size = New System.Drawing.Size(30, 30)
        Me.Calc4.TabIndex = 6
        Me.Calc4.Text = "4"
        '
        'Calc3
        '
        Me.Calc3.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.Calc3.Location = New System.Drawing.Point(96, 128)
        Me.Calc3.Name = "Calc3"
        Me.Calc3.Size = New System.Drawing.Size(30, 30)
        Me.Calc3.TabIndex = 13
        Me.Calc3.Text = "3"
        '
        'Calc2
        '
        Me.Calc2.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.Calc2.Location = New System.Drawing.Point(56, 128)
        Me.Calc2.Name = "Calc2"
        Me.Calc2.Size = New System.Drawing.Size(30, 30)
        Me.Calc2.TabIndex = 12
        Me.Calc2.Text = "2"
        '
        'CalcSign
        '
        Me.CalcSign.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.CalcSign.Location = New System.Drawing.Point(56, 168)
        Me.CalcSign.Name = "CalcSign"
        Me.CalcSign.Size = New System.Drawing.Size(30, 30)
        Me.CalcSign.TabIndex = 17
        Me.CalcSign.Text = "+/-"
        '
        'Calc0
        '
        Me.Calc0.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.Calc0.Location = New System.Drawing.Point(16, 168)
        Me.Calc0.Name = "Calc0"
        Me.Calc0.Size = New System.Drawing.Size(30, 30)
        Me.Calc0.TabIndex = 16
        Me.Calc0.Text = "0"
        '
        'Calc9
        '
        Me.Calc9.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.Calc9.Location = New System.Drawing.Point(96, 48)
        Me.Calc9.Name = "Calc9"
        Me.Calc9.Size = New System.Drawing.Size(30, 30)
        Me.Calc9.TabIndex = 3
        Me.Calc9.Text = "9"
        '
        'Calc8
        '
        Me.Calc8.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.Calc8.Location = New System.Drawing.Point(56, 48)
        Me.Calc8.Name = "Calc8"
        Me.Calc8.Size = New System.Drawing.Size(30, 30)
        Me.Calc8.TabIndex = 2
        Me.Calc8.Text = "8"
        '
        'CalcCE
        '
        Me.CalcCE.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.CalcCE.Location = New System.Drawing.Point(176, 88)
        Me.CalcCE.Name = "CalcCE"
        Me.CalcCE.Size = New System.Drawing.Size(30, 30)
        Me.CalcCE.TabIndex = 10
        Me.CalcCE.Text = "CE"
        '
        'FileMenu
        '
        Me.FileMenu.Index = 0
        Me.FileMenu.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.ExitMenu})
        Me.FileMenu.Text = "&File"
        '
        'ExitMenu
        '
        Me.ExitMenu.Index = 0
        Me.ExitMenu.Text = "E&xit"
        '
        'Calc5
        '
        Me.Calc5.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.Calc5.Location = New System.Drawing.Point(56, 88)
        Me.Calc5.Name = "Calc5"
        Me.Calc5.Size = New System.Drawing.Size(30, 30)
        Me.Calc5.TabIndex = 7
        Me.Calc5.Text = "5"
        '
        'CalcDec
        '
        Me.CalcDec.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.CalcDec.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold)
        Me.CalcDec.Location = New System.Drawing.Point(96, 168)
        Me.CalcDec.Name = "CalcDec"
        Me.CalcDec.Size = New System.Drawing.Size(30, 30)
        Me.CalcDec.TabIndex = 18
        Me.CalcDec.Text = "."
        '
        'Calc1
        '
        Me.Calc1.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.Calc1.Location = New System.Drawing.Point(16, 128)
        Me.Calc1.Name = "Calc1"
        Me.Calc1.Size = New System.Drawing.Size(30, 30)
        Me.Calc1.TabIndex = 11
        Me.Calc1.Text = "1"
        '
        'CalcMul
        '
        Me.CalcMul.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.CalcMul.Location = New System.Drawing.Point(136, 88)
        Me.CalcMul.Name = "CalcMul"
        Me.CalcMul.Size = New System.Drawing.Size(30, 30)
        Me.CalcMul.TabIndex = 9
        Me.CalcMul.Text = "*"
        '
        'CalcMenu
        '
        Me.CalcMenu.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.FileMenu})
        '
        'CalcField
        '
        Me.CalcField.AccessibleRole = System.Windows.Forms.AccessibleRole.StaticText
        Me.CalcField.BackColor = System.Drawing.SystemColors.Window
        Me.CalcField.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.CalcField.Cursor = System.Windows.Forms.Cursors.IBeam
        Me.CalcField.Location = New System.Drawing.Point(16, 8)
        Me.CalcField.Name = "CalcField"
        Me.CalcField.ReadOnly = True
        Me.CalcField.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.CalcField.Size = New System.Drawing.Size(192, 20)
        Me.CalcField.TabIndex = 21
        Me.CalcField.Text = "0"
        Me.CalcField.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'Calculator
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(218, 211)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.CalcField, Me.CalcRes, Me.CalcPlus, Me.CalcDec, Me.CalcSign, Me.Calc0, Me.CalcCan, Me.CalcSub, Me.Calc3, Me.Calc2, Me.Calc1, Me.CalcCE, Me.CalcMul, Me.Calc6, Me.Calc5, Me.Calc4, Me.CalcBS, Me.CalcDiv, Me.Calc9, Me.Calc8, Me.Calc7})
        Me.Font = New System.Drawing.Font("Arial", 8.0!)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MaximizeBox = False
        Me.Menu = Me.CalcMenu
        Me.Name = "Calculator"
        Me.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Hide
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Calculator"
        Me.ResumeLayout(False)

    End Sub

#End Region

    'BS click event.  
    Private Sub CalcBS_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CalcBS.Click
        Dim Value As String

        'Check if we can backspace before removing items from CalcField.text.
        If mAllowBackSpace Then
            Value = CalcField.Text

            If Len(Value) > 1 Then
                Value = Mid(Value, 1, Len(Value) - 1)
            Else
                Value = "0"
            End If

            ' If all we are left is the minus sign, reset.
            If Value = "-" Then
                Value = "0"
            End If

            CalcField.Text = Value
        End If
    End Sub

    'Cancel click event.
    Private Sub CalcCan_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CalcCan.Click
        Reset()
    End Sub

    'Cancel entry click event.
    Private Sub CalcCE_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CalcCE.Click
        If (mLastInput.Equals(Operation.Operand)) Then
            CalcField.Text = "0"
        ElseIf (mLastInput.Equals(Operation.Operator)) Then
            mOpFlag = mOpPrev
        End If

        mLastInput = Operation.CE
    End Sub

    'Handles +, -, *, /, =
    Private Sub CalcRes_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CalcRes.Click

        'Now do not allow backspace(CalcBS) actions after the result has been
        'calculated and displayed.
        mAllowBackSpace = False

        If (mLastInput.Equals(Operation.Operand)) Then
            mNumOps = mNumOps + 1
        End If

        Select Case mNumOps
            Case 1
                mOp1 = Double.Parse(CalcField.Text)

            Case 2
                mOp2 = Double.Parse(CalcField.Text)

                Select Case mOpFlag
                    Case "+"
                        mOp1 = mOp1 + mOp2

                    Case "-"
                        mOp1 = mOp1 - mOp2

                    Case "*"
                        mOp1 = mOp1 * mOp2

                    Case "/"
                        If (mOp2 = 0) Then
                            MsgBox("Can't divide by zero!", MsgBoxStyle.OKOnly, "Calculator")
                        Else
                            mOp1 = mOp1 / mOp2
                        End If

                    Case "="
                        mOp1 = mOp2
                End Select

                CalcField.Text = mOp1.ToString()
                mNumOps = 1
        End Select

        mLastInput = Operation.Operator
        mOpPrev = mOpFlag

        Dim ButtonPressed As Button
        ButtonPressed = CType(sender, Button)

        mOpFlag = ButtonPressed.Text
    End Sub

    Private Sub CalcPlus_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CalcPlus.Click
        CalcRes_Click(sender, e)
    End Sub

    Private Sub CalcSub_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CalcSub.Click
        CalcRes_Click(sender, e)
    End Sub

    Private Sub CalcMul_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CalcMul.Click
        CalcRes_Click(sender, e)
    End Sub

    Private Sub CalcDiv_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CalcDiv.Click
        CalcRes_Click(sender, e)
    End Sub

    '+/- click event.
    Private Sub CalcSign_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CalcSign.Click
        If (mLastInput <> Operation.Operand) Then
            CalcField.Text = "0"
        Else
            With CalcField
                If (Mid(.Text, 1, 1)) = mMinus Then
                    .Text = Mid(.Text, 2)
                Else
                    If .Text <> "0" Then
                        .Text = mMinus & .Text
                    End If
                End If
            End With
        End If

        mLastInput = Operation.Operand
    End Sub

    Private Sub Calc5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Calc5.Click
        CalcNum_Click(sender, e)
    End Sub

    Private Sub Calc3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Calc3.Click
        CalcNum_Click(sender, e)
    End Sub

    Private Sub Calc1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Calc1.Click
        CalcNum_Click(sender, e)
    End Sub

    Private Sub Calc4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Calc4.Click
        CalcNum_Click(sender, e)
    End Sub

    Private Sub Calc9_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Calc9.Click
        CalcNum_Click(sender, e)
    End Sub

    Private Sub CalcDec_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CalcDec.Click
        CalcNum_Click(sender, e)
    End Sub

    Private Sub Calc8_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Calc8.Click
        CalcNum_Click(sender, e)
    End Sub

    Private Sub Calc2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Calc2.Click
        CalcNum_Click(sender, e)
    End Sub

    Private Sub Calc0_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Calc0.Click
        CalcNum_Click(sender, e)
    End Sub

    Private Sub Calc7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Calc7.Click
        CalcNum_Click(sender, e)
    End Sub

    Private Sub Calc6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Calc6.Click
        CalcNum_Click(sender, e)
    End Sub

    '0 - 9, ., click event.
    Private Sub CalcNum_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        mAllowBackSpace = True 'now allow backspace 

        If (mLastInput <> Operation.Operand) Then
            CalcField.Text = "0"
        End If

        Dim SelButton As Button
        SelButton = CType(sender, Button)
        FormatEditField(SelButton.Text)

        mLastInput = Operation.Operand
    End Sub

    'Exit menu handler.
    Private Sub ExitMenu_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ExitMenu.Click
        Application.Exit()
    End Sub

    'Private helpers.
    'Helper to format the entry in the text box!
    Private Sub FormatEditField(ByVal NewChar As String)
        Dim Value As String
        Value = CalcField.Text

        'Determine if there are more than one .'s
        If (NewChar = mDecValue) Then
            'If it's found.
            If (InStr(Value, mDecValue) > 0) Then
                'Don't do anything.
                Return
            End If
            Value = Value + mDecValue
        Else
            If Value = "0" Then
                Value = NewChar
            Else
                Value = Value + NewChar
            End If

        End If

        CalcField.Text = Value
    End Sub

    ' Helper to initialize the vals.
    Private Sub Reset()
        mOp1 = 0
        mOp2 = 0

        mNumOps = 0
        mLastInput = Operation.None

        mOpFlag = ""
        mOpPrev = ""

        CalcField.Text = "0"

        mAllowBackSpace = True
    End Sub


End Class



