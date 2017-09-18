VERSION 5.00
Begin VB.Form frmBank 
   Caption         =   "Teller"
   ClientHeight    =   7665
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7350
   LinkTopic       =   "Form1"
   ScaleHeight     =   7665
   ScaleWidth      =   7350
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame6 
      Height          =   735
      Left            =   120
      TabIndex        =   45
      Top             =   6720
      Width           =   7095
      Begin VB.CommandButton cmdGetNetWorth 
         Caption         =   "Get Net Worth"
         Height          =   330
         Left            =   210
         TabIndex        =   25
         Top             =   240
         Width           =   1485
      End
      Begin VB.Label txtNetWorth 
         BackColor       =   &H8000000B&
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial Unicode MS"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   1920
         TabIndex        =   50
         Top             =   240
         Width           =   1575
      End
   End
   Begin VB.Frame Frame4 
      Caption         =   "Savings"
      BeginProperty Font 
         Name            =   "Arial Unicode MS"
         Size            =   9.75
         Charset         =   128
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800080&
      Height          =   1935
      Left            =   3720
      TabIndex        =   35
      Top             =   2400
      Width           =   3495
      Begin VB.CommandButton cmdSavDeposit 
         Caption         =   "Deposit"
         Height          =   360
         Left            =   240
         TabIndex        =   14
         Top             =   840
         Width           =   1215
      End
      Begin VB.CommandButton cmdSavWithdraw 
         Caption         =   "Withdraw"
         Height          =   360
         Left            =   240
         TabIndex        =   16
         Top             =   1320
         Width           =   1215
      End
      Begin VB.TextBox txtSavWithdraw 
         Height          =   360
         Left            =   1680
         TabIndex        =   17
         Top             =   1320
         Width           =   1575
      End
      Begin VB.TextBox txtSavDeposit 
         Height          =   360
         Left            =   1680
         TabIndex        =   15
         Top             =   840
         Width           =   1575
      End
      Begin VB.Label txtSavBalance 
         BackColor       =   &H8000000B&
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial Unicode MS"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   1680
         TabIndex        =   47
         Top             =   360
         Width           =   1575
      End
      Begin VB.Label Label7 
         Caption         =   "Balance"
         BeginProperty Font 
            Name            =   "Arial Unicode MS"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   255
         Left            =   240
         TabIndex        =   37
         Top             =   360
         Width           =   1215
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Checking"
      BeginProperty Font 
         Name            =   "Arial Unicode MS"
         Size            =   9.75
         Charset         =   128
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800080&
      Height          =   1935
      Left            =   120
      TabIndex        =   34
      Top             =   2400
      Width           =   3495
      Begin VB.CommandButton cmdChkDeposit 
         Caption         =   "Deposit"
         Height          =   360
         Left            =   240
         TabIndex        =   10
         Top             =   840
         Width           =   1215
      End
      Begin VB.CommandButton cmdChkWithdraw 
         Caption         =   "Withdraw"
         Height          =   360
         Left            =   240
         TabIndex        =   12
         Top             =   1320
         Width           =   1215
      End
      Begin VB.TextBox txtChkWithdraw 
         Height          =   360
         Left            =   1680
         TabIndex        =   13
         Top             =   1320
         Width           =   1575
      End
      Begin VB.TextBox txtChkDeposit 
         Height          =   360
         Left            =   1680
         TabIndex        =   11
         Top             =   840
         Width           =   1575
      End
      Begin VB.Label txtChkBalance 
         BackColor       =   &H8000000B&
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial Unicode MS"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   1680
         TabIndex        =   48
         Top             =   360
         Width           =   1575
      End
      Begin VB.Label Label6 
         Caption         =   "Balance"
         BeginProperty Font 
            Name            =   "Arial Unicode MS"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   255
         Left            =   240
         TabIndex        =   36
         Top             =   360
         Width           =   1215
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "Loan Details"
      BeginProperty Font 
         Name            =   "Arial Unicode MS"
         Size            =   9.75
         Charset         =   128
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800080&
      Height          =   2220
      Left            =   120
      TabIndex        =   30
      Top             =   4440
      Width           =   7065
      Begin VB.TextBox txtRate 
         Height          =   330
         Left            =   1920
         TabIndex        =   20
         Top             =   1200
         Width           =   1005
      End
      Begin VB.Frame Frame5 
         Height          =   1815
         Left            =   3360
         TabIndex        =   38
         Top             =   240
         Width           =   3495
         Begin VB.TextBox txtPmtAmt 
            Height          =   380
            Left            =   1800
            TabIndex        =   24
            Top             =   720
            Width           =   1440
         End
         Begin VB.CommandButton cmdPmtFrmChk 
            Caption         =   "From Checking"
            Height          =   360
            Left            =   240
            TabIndex        =   23
            Top             =   720
            Width           =   1455
         End
         Begin VB.CommandButton cmdOpenAcct 
            Caption         =   "Open Loan"
            Height          =   405
            Left            =   240
            TabIndex        =   22
            Top             =   240
            Width           =   3015
         End
         Begin VB.Label txtLoanbalance 
            BackColor       =   &H8000000B&
            BorderStyle     =   1  'Fixed Single
            BeginProperty Font 
               Name            =   "Arial Unicode MS"
               Size            =   9.75
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   1800
            TabIndex        =   49
            Top             =   1320
            Width           =   1455
         End
         Begin VB.Label Label14 
            Caption         =   "Balance"
            BeginProperty Font 
               Name            =   "Arial Unicode MS"
               Size            =   12
               Charset         =   128
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00C00000&
            Height          =   255
            Left            =   360
            TabIndex        =   46
            Top             =   1320
            Width           =   1215
         End
      End
      Begin VB.TextBox txtTerm 
         Height          =   330
         Left            =   1920
         TabIndex        =   19
         Top             =   810
         Width           =   1005
      End
      Begin VB.TextBox txtPrin 
         Height          =   330
         Left            =   1920
         TabIndex        =   18
         Top             =   420
         Width           =   1005
      End
      Begin VB.CommandButton cmdCalcPmt 
         Caption         =   "Calculate Payment"
         Height          =   330
         Left            =   210
         TabIndex        =   21
         Top             =   1680
         Width           =   1485
      End
      Begin VB.PictureBox UpDown3 
         Height          =   330
         Left            =   3000
         ScaleHeight     =   270
         ScaleWidth      =   135
         TabIndex        =   27
         TabStop         =   0   'False
         Top             =   810
         Width           =   195
      End
      Begin VB.PictureBox UpDown2 
         Height          =   330
         Left            =   3000
         ScaleHeight     =   270
         ScaleWidth      =   135
         TabIndex        =   26
         TabStop         =   0   'False
         Top             =   420
         Width           =   195
      End
      Begin VB.PictureBox UpDown1 
         Height          =   330
         Left            =   3000
         ScaleHeight     =   270
         ScaleWidth      =   135
         TabIndex        =   52
         TabStop         =   0   'False
         Top             =   1200
         Width           =   195
      End
      Begin VB.Label txtPmt 
         BackColor       =   &H8000000B&
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial Unicode MS"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   1890
         TabIndex        =   51
         Top             =   1680
         Width           =   1095
      End
      Begin VB.Label Label5 
         Caption         =   "Term:"
         BeginProperty Font 
            Name            =   "Arial Unicode MS"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   330
         Left            =   210
         TabIndex        =   33
         Top             =   810
         Width           =   1065
      End
      Begin VB.Label Label3 
         Caption         =   "Rate:"
         BeginProperty Font 
            Name            =   "Arial Unicode MS"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   330
         Left            =   210
         TabIndex        =   32
         Top             =   1200
         Width           =   1065
      End
      Begin VB.Label Label2 
         Caption         =   "Principal:"
         BeginProperty Font 
            Name            =   "Arial Unicode MS"
            Size            =   12
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   330
         Left            =   210
         TabIndex        =   31
         Top             =   420
         Width           =   1275
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Customer Account"
      BeginProperty Font 
         Name            =   "Arial Unicode MS"
         Size            =   9.75
         Charset         =   128
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800080&
      Height          =   2160
      Left            =   120
      TabIndex        =   28
      Top             =   120
      Width           =   7095
      Begin VB.CommandButton cmdclear 
         Caption         =   "Clear"
         Height          =   315
         Left            =   5040
         TabIndex        =   3
         Top             =   360
         Width           =   1080
      End
      Begin VB.TextBox txtCustLast 
         Height          =   285
         Left            =   3960
         TabIndex        =   5
         Top             =   960
         Width           =   2055
      End
      Begin VB.TextBox txtCustZip 
         Height          =   285
         Left            =   4560
         TabIndex        =   9
         Top             =   1680
         Width           =   1455
      End
      Begin VB.TextBox txtCustState 
         Height          =   285
         Left            =   3600
         TabIndex        =   8
         Top             =   1680
         Width           =   495
      End
      Begin VB.TextBox txtCustCity 
         Height          =   285
         Left            =   1200
         TabIndex        =   7
         Top             =   1680
         Width           =   1695
      End
      Begin VB.TextBox txtCustAddress 
         Height          =   285
         Left            =   1200
         TabIndex        =   6
         Top             =   1320
         Width           =   4815
      End
      Begin VB.TextBox txtCustFirst 
         Height          =   285
         Left            =   1200
         TabIndex        =   4
         Top             =   960
         Width           =   2055
      End
      Begin VB.CommandButton cmdSave 
         Caption         =   "Save"
         Height          =   315
         Left            =   3840
         TabIndex        =   2
         Top             =   360
         Width           =   1080
      End
      Begin VB.TextBox txtCustId 
         Height          =   315
         Left            =   1200
         TabIndex        =   0
         Text            =   "1234"
         Top             =   360
         Width           =   840
      End
      Begin VB.CommandButton cmdLoad 
         Caption         =   "Load"
         Height          =   315
         Left            =   2640
         TabIndex        =   1
         Top             =   360
         Width           =   1080
      End
      Begin VB.Label Label13 
         Caption         =   "Last"
         BeginProperty Font 
            Name            =   "Arial Unicode MS"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   255
         Left            =   3360
         TabIndex        =   44
         Top             =   960
         Width           =   495
      End
      Begin VB.Label Label12 
         Caption         =   "City"
         BeginProperty Font 
            Name            =   "Arial Unicode MS"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   255
         Left            =   240
         TabIndex        =   43
         Top             =   1680
         Width           =   495
      End
      Begin VB.Label Label11 
         Caption         =   "State"
         BeginProperty Font 
            Name            =   "Arial Unicode MS"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   255
         Left            =   3000
         TabIndex        =   42
         Top             =   1680
         Width           =   735
      End
      Begin VB.Label Label10 
         Caption         =   "Zip"
         BeginProperty Font 
            Name            =   "Arial Unicode MS"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   255
         Left            =   4200
         TabIndex        =   41
         Top             =   1680
         Width           =   615
      End
      Begin VB.Label Label9 
         Caption         =   "Address"
         BeginProperty Font 
            Name            =   "Arial Unicode MS"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   255
         Left            =   240
         TabIndex        =   40
         Top             =   1320
         Width           =   975
      End
      Begin VB.Label Label8 
         Caption         =   "First"
         BeginProperty Font 
            Name            =   "Arial Unicode MS"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   255
         Left            =   240
         TabIndex        =   39
         Top             =   960
         Width           =   975
      End
      Begin VB.Label Label1 
         Caption         =   "Cust ID:"
         BeginProperty Font 
            Name            =   "Arial Unicode MS"
            Size            =   9.75
            Charset         =   128
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   255
         Left            =   240
         TabIndex        =   29
         Top             =   360
         Width           =   975
      End
   End
End
Attribute VB_Name = "frmBank"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'===========================================================================
'  File:     Bank.cls
'
'  Summary:   This is the form that implements the bank
'
'
'----------------------------------------------------------------------------
'  This file is part of the Microsoft .NET Samples.
'
'  Copyright (C) Microsoft Corporation.  All rights reserved.
'============================================================================

Dim Cust As Customer.Customer
Dim ChkAcct As Account.Account
Dim SavAcct As Account.Account
Dim Loan As Loan.BankLoan

Const NoPermission = "Insufficient Funds"
Const InvalidValue = "Invalid value for Field : "

Private Sub Form_Load()

    Set Cust = New Customer.Customer

    Set ChkAcct = Cust.GetChkAcct
    Set SavAcct = Cust.GetSavAcct
    Set Loan = Cust.GetLoan

    RefreshForm

    txtCustId = "1234"

End Sub

Private Sub cmdLoad_Click()
    If Len(txtCustId) > 0 Then

        If (Cust.Load(txtCustId)) Then
            RefreshForm
        Else
            MsgBox ("could not load customer")
        End If
    Else
        MsgBox "Customer Id required"
    End If
End Sub

Private Sub cmdSave_Click()
    Cust.SetId (txtCustId)
    Cust.SetFirst (txtCustFirst)
    Cust.SetLast (txtCustLast)
    Cust.SetAddress (txtCustAddress)
    Cust.SetCity (txtCustCity)
    Cust.SetState (txtCustState)
    Cust.SetZip (txtCustZip)

    If (Cust.Save) Then

    Else
        MsgBox ("unable to save customer")
    End If

End Sub

Private Sub cmdclear_Click()
    Cust.SetFirst ("")
    Cust.SetLast ("")
    Cust.SetAddress ("")
    Cust.SetCity ("")
    Cust.SetState ("")
    Cust.SetZip ("")

    ChkAcct.SetBalance (0)
    SavAcct.SetBalance (0)
    Loan.SetBalance (0)
    Loan.SetPrincipal (0)
    Loan.SetRate (0)
    Loan.SetTerm (0)
    Loan.SetPayment (0)

    RefreshForm
End Sub


Private Sub cmdChkDeposit_Click()
    If (Val(txtChkDeposit) > 0) Then
        If (ChkAcct.Credit(CDbl(txtChkDeposit)) = 0) Then
            MsgBox (NoPermission)
        End If
        txtChkBalance = Format(ChkAcct.GetBalance, "#,##0.00")
    Else
        MsgBox ("Invalid input")
    End If
End Sub

Private Sub cmdChkWithdraw_Click()
    If (Val(txtChkWithdraw) > 0) Then
        If (ChkAcct.Debit(CDbl(txtChkWithdraw)) = 0) Then
            MsgBox (NoPermission)
        End If
    Else
        MsgBox ("Invalid input")
    End If

       txtChkBalance = Format(ChkAcct.GetBalance, "#,##0.00")


End Sub

Private Sub cmdSavDeposit_Click()
    If (Val(txtSavDeposit) > 0) Then
        If (SavAcct.Credit(CDbl(txtSavDeposit)) = 0) Then

           MsgBox (NoPermission)

      End If

        txtSavBalance = Format(SavAcct.GetBalance, "#,##0.00")
    Else
        MsgBox ("Invalid Input")
    End If
End Sub

Private Sub cmdSavWithdraw_Click()
    If (Val(txtSavWithdraw) > 0) Then
        If (SavAcct.Debit(CDbl(txtSavWithdraw)) = 0) Then
            MsgBox (NoPermission)
            End If
        txtSavBalance = Format(SavAcct.GetBalance, "#,##0.00")
    Else
        MsgBox ("Invalid Input")
    End If
End Sub

Private Sub cmdCalcPmt_Click()
    Dim Pmt

    If Val(txtPrin) = 0 Then
        MsgBox ("Please enter a valid value for Principal")
        txtPrin.SetFocus
    ElseIf Val(txtRate) = 0 Then
        MsgBox ("Please enter a valid value for Rate (percent)")
        txtRate.SetFocus
    ElseIf Val(txtTerm) = 0 Then
        MsgBox ("Please enter a valid value for Term (months)")
        txtTerm.SetFocus
    Else
        Pmt = Loan.CalcPmt(txtPrin, txtRate / 1200, txtTerm)
    End If

    txtPmt = Format(Pmt, "#,##0.00")
End Sub


Private Sub cmdOpenAcct_Click()
    If (txtPrin = 0# Or txtRate = 0# Or txtTerm = 0) Then
        MsgBox ("Please enter valid input")
    ElseIf (Loan.OpenAccount(txtPrin, txtRate / 1200, txtTerm)) Then
        balance = Loan.GetBalance
        Payment = Loan.GetPayment

        txtLoanbalance = Format(balance, "#,##0.00")
        txtPmtAmt = Format(Payment, "#,##0.00")
        txtPmt = txtPmtAmt
    Else
        MsgBox (NoPermission)
    End If
End Sub

Private Sub cmdPmtFrmChk_Click()
    PmtAmt = txtPmtAmt

    If (Round(Loan.GetBalance, 2) < Round(PmtAmt, 2)) Then
        MsgBox "Payment more than Loan balance!!!"
        txtPmtAmt = Round(Loan.GetBalance, 2)
        Exit Sub
    End If

    If (ChkAcct.GetBalance() >= PmtAmt) Then
        If (ChkAcct.Debit(PmtAmt) = 0) Then
            MsgBox (NoPermission)
        Else
            Loan.MakePayment (PmtAmt)
            txtLoanbalance = Format(Loan.GetBalance, "#,##0.00")
            txtChkBalance = Format(ChkAcct.GetBalance, "#,##0.00")
        End If
    Else
        MsgBox ("Insufficient funds in checking")
    End If
End Sub

Private Sub cmdGetNetWorth_Click()
    txtNetWorth = Format(Cust.GetNetWorth, "#,###,##0.00")
End Sub

Private Sub RefreshForm()
    txtCustId = Cust.GetId
    txtCustFirst = Cust.GetFirst
    txtCustLast = Cust.GetLast
    txtCustAddress = Cust.GetAddress
    txtCustCity = Cust.GetCity
    txtCustState = Cust.GetState
    txtCustZip = Cust.GetZip

    txtChkBalance = Format(ChkAcct.GetBalance, "#,##0.00")
    txtSavBalance = Format(SavAcct.GetBalance, "#,##0.00")
    txtLoanbalance = Format(Loan.GetBalance, "#,##0.00")

    txtPrin = Format(Loan.GetPrincipal, "#,##0.00")
    txtRate = Format(Loan.GetRate * 1200, "#,##0.00")
    txtTerm = Format(Loan.GetTerm, "##0")
    txtPmt = Format(Loan.GetPayment, "#,##0.00")

    txtNetWorth = Format(Cust.GetNetWorth, "#,##0.00")

    txtChkDeposit = ""
    txtSavDeposit = ""
    txtChkWithdraw = ""
    txtSavWithdraw = ""

    txtPmtAmt = txtPmt
End Sub

Private Sub txtChkDeposit_KeyPress(KeyAscii As Integer)
    Validate_Decimal KeyAscii
End Sub

Private Sub txtChkDeposit_Validate(Cancel As Boolean)
    Cancel = Validate_DecimalField(txtChkDeposit, "Checking Deposit")
End Sub

Private Sub txtChkWithdraw_KeyPress(KeyAscii As Integer)
    Validate_Decimal KeyAscii
End Sub

Private Sub txtChkWithdraw_Validate(Cancel As Boolean)
    Cancel = Validate_DecimalField(txtChkWithdraw, "Checking Withdraw")
End Sub

Private Sub txtPmtAmt_KeyPress(KeyAscii As Integer)
    Validate_Decimal KeyAscii
End Sub

Private Sub txtPmtAmt_Validate(Cancel As Boolean)
    Cancel = Validate_DecimalField(txtPmtAmt, "From Checking")
End Sub

Private Sub txtPrin_Change()
    SetLoanRate
End Sub

Private Sub txtPrin_KeyPress(KeyAscii As Integer)
    Validate_Decimal KeyAscii
End Sub

Private Sub txtPrin_Validate(Cancel As Boolean)
    Cancel = Validate_DecimalField(txtPrin, "Principal")
End Sub

Private Sub txtRate_KeyPress(KeyAscii As Integer)
    Validate_Decimal KeyAscii
End Sub

Private Sub txtRate_Validate(Cancel As Boolean)
    Cancel = Validate_DecimalField(txtRate, "Rate")
End Sub

Private Sub txtSavDeposit_KeyPress(KeyAscii As Integer)
    Validate_Decimal KeyAscii
End Sub

Private Sub txtSavDeposit_Validate(Cancel As Boolean)
    Cancel = Validate_DecimalField(txtSavDeposit, "Savings Deposit")
End Sub

Private Sub txtSavWithdraw_KeyPress(KeyAscii As Integer)
    Validate_Decimal KeyAscii
End Sub

Private Sub txtSavWithdraw_Validate(Cancel As Boolean)
    Cancel = Validate_DecimalField(txtSavWithdraw, "Savings Withdraw")
End Sub

Private Sub txtTerm_Change()
    SetLoanRate
End Sub

Sub SetLoanRate()
    'On Error Resume Next
    If Val(txtPrin) > 0 And Val(txtTerm) > 0 And Val(txtTerm) <= 360 Then
        Dim MinRate

        MinRate = Cust.GetMinLoanRate(CDbl(txtPrin), CDbl(txtTerm))
        If MinRate > 0 Then txtRate = Format(MinRate, "##.00")
    End If
End Sub


Private Sub txtTerm_KeyPress(KeyAscii As Integer)
    Validate_Decimal KeyAscii
End Sub

Private Sub txtTerm_Validate(Cancel As Boolean)
    Cancel = Validate_DecimalField(txtTerm, "Term")
End Sub


Private Function Validate_DecimalField(value As String, fieldname As String)
    On Error GoTo Decimal_Error
    Dim v As Double
    v = CDbl(value)
    Validate_DecimalField = False
    Exit Function
Decimal_Error:
    Beep
    MsgBox (InvalidValue + fieldname)
    Validate_DecimalField = True
End Function

Private Sub Validate_Decimal(ByRef KeyAscii As Integer)
    valid_decimal = "01234567890.,-" + Chr$(8)
    If KeyAscii = 13 Then
        KeyAscii = 0
    ElseIf InStr(valid_decimal, Chr$(KeyAscii)) = 0 Then
        Beep
        KeyAscii = 0
    End If
End Sub

Private Sub Validate_Integer(ByRef KeyAscii As Integer)
    valid_integer = "01234567890-" + Chr$(8)
    If KeyAscii = 13 Then
        KeyAscii = 0
    ElseIf InStr(valid_integer, Chr$(KeyAscii)) = 0 Then
        Beep
        KeyAscii = 0
    End If
End Sub

