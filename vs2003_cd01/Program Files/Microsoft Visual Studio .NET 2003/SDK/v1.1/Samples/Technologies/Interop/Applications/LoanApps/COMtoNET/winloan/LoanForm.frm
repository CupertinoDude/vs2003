VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form frmLoan 
   Caption         =   "Loan Form"
   ClientHeight    =   5835
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5820
   LinkTopic       =   "Form1"
   ScaleHeight     =   5835
   ScaleWidth      =   5820
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command5 
      Caption         =   "Clear"
      Height          =   300
      Left            =   3120
      TabIndex        =   10
      Top             =   600
      Width           =   855
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Clear"
      Height          =   300
      Left            =   3120
      TabIndex        =   11
      Top             =   960
      Width           =   855
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Clear"
      Height          =   300
      Left            =   3120
      TabIndex        =   12
      Top             =   1320
      Width           =   855
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Clear"
      Height          =   300
      Left            =   3120
      TabIndex        =   13
      Top             =   1680
      Width           =   855
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Clear"
      Height          =   300
      Left            =   3120
      TabIndex        =   9
      Top             =   240
      Width           =   855
   End
   Begin VB.TextBox txtRiskRating 
      Alignment       =   1  'Right Justify
      Height          =   285
      Left            =   1920
      TabIndex        =   8
      Text            =   "Medium"
      Top             =   1680
      Width           =   1000
   End
   Begin ComctlLib.ListView lstAmort 
      Height          =   3135
      Left            =   240
      TabIndex        =   18
      Top             =   2400
      Width           =   5295
      _ExtentX        =   9340
      _ExtentY        =   5530
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   327682
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   375
      Left            =   4320
      TabIndex        =   16
      Top             =   1200
      Width           =   1200
   End
   Begin VB.CommandButton cmdAmortize 
      Caption         =   "Amortize"
      Height          =   375
      Left            =   4320
      TabIndex        =   15
      Top             =   720
      Width           =   1200
   End
   Begin VB.CommandButton cmdCompute 
      Caption         =   "Compute"
      Height          =   375
      Left            =   4320
      TabIndex        =   14
      Top             =   240
      Width           =   1200
   End
   Begin VB.TextBox txtPayment 
      Alignment       =   1  'Right Justify
      Height          =   285
      Left            =   1920
      TabIndex        =   7
      Top             =   1320
      Width           =   1000
   End
   Begin VB.TextBox txtTerm 
      Alignment       =   1  'Right Justify
      Height          =   285
      Left            =   1920
      TabIndex        =   6
      Text            =   "60"
      Top             =   960
      Width           =   1000
   End
   Begin VB.TextBox txtRate 
      Alignment       =   1  'Right Justify
      Height          =   285
      Left            =   1920
      TabIndex        =   5
      Text            =   "1"
      Top             =   600
      Width           =   1000
   End
   Begin VB.TextBox txtBalance 
      Alignment       =   1  'Right Justify
      Height          =   285
      Left            =   1920
      TabIndex        =   0
      Text            =   "10000"
      Top             =   240
      Width           =   1000
   End
   Begin VB.Label Label5 
      Caption         =   "Risk:"
      Height          =   255
      Left            =   240
      TabIndex        =   17
      Top             =   1680
      Width           =   1575
   End
   Begin VB.Label Label4 
      Caption         =   "Payment:"
      Height          =   255
      Left            =   240
      TabIndex        =   4
      Top             =   1320
      Width           =   1575
   End
   Begin VB.Label Label3 
      Caption         =   "Term:"
      Height          =   255
      Left            =   240
      TabIndex        =   3
      Top             =   960
      Width           =   1575
   End
   Begin VB.Label Label2 
      Caption         =   "Periodic Rate:"
      Height          =   255
      Left            =   240
      TabIndex        =   2
      Top             =   600
      Width           =   1575
   End
   Begin VB.Label Label1 
      Caption         =   "Opening Balance:"
      Height          =   255
      Left            =   240
      TabIndex        =   1
      Top             =   240
      Width           =   1575
   End
End
Attribute VB_Name = "frmLoan"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim ln As LoanLib.ILoan

Private Sub Form_Load()
    Set ln = New LoanLib.Loan
    lstAmort.ColumnHeaders.Add 1, , "Pmt", 300, lvwColumnLeft
    lstAmort.ColumnHeaders.Add 2, , "Payment", 790, lvwColumnRight
    lstAmort.ColumnHeaders.Add 3, , "Principal", 790, lvwColumnRight
    lstAmort.ColumnHeaders.Add 4, , "Interest", 790, lvwColumnRight
    lstAmort.ColumnHeaders.Add 5, , "Balance", 830, lvwColumnRight
End Sub

Private Sub cmdCompute_Click()
    ln.OpeningBalance = Val(txtBalance)
    ln.Payment = Val(txtPayment)
    ln.Rate = Val(txtRate) / 100#
    ln.Term = Val(txtTerm)
    ln.RiskRating = txtRiskRating
    
    If ln.OpeningBalance > 0 And ln.Term > 0 And ln.Rate > 0 Then
        ln.ComputePayment
    Else
        If ln.OpeningBalance = 0 Then ln.ComputeOpeningBalance
        If ln.Rate = 0 Then ln.ComputeRate
        If ln.Term = 0 Then ln.ComputeTerm
    End If
    
    txtPayment = Format(ln.Payment, "0.00")
    txtBalance = Format(ln.OpeningBalance, "0.00")
    txtRate = Format(ln.Rate * 100, "0.00")
    txtTerm = Format(ln.Term, "0")
    txtRiskRating = ln.RiskRating
End Sub

Private Sub cmdAmortize_Click()
    Dim Payment As Double
    Dim Principal As Double
    Dim Interest As Double
    Dim Balance As Double
    Dim MorePmts As Boolean
    Dim PmtNbr As Integer

    
    PmtNbr = 1
    Payment = ln.Payment
    lstAmort.ListItems.Clear
         
    MorePmts = ln.GetFirstPmtDistribution(Payment, Balance, Principal, Interest)
    
    While (MorePmts)
        Set Item = lstAmort.ListItems.Add(, , PmtNbr)
        Item.SubItems(1) = Format(Payment, "0.00")
        Item.SubItems(2) = Format(Principal, "0.00")
        Item.SubItems(3) = Format(Interest, "0.00")
        Item.SubItems(4) = Format(Balance, "0.00")

        Debug.Print (PmtNbr & " " & Payment & " " & Principal & " " & Interest & " " & Balance)
        PmtNbr = PmtNbr + 1
        MorePmts = ln.GetNextPmtDistribution(Payment, Balance, Principal, Interest)
    Wend
    
End Sub


Private Sub cmdExit_Click()
    End
End Sub

Private Sub Command1_Click()
    txtBalance = ""
End Sub

Private Sub Command2_Click()
    txtRiskRating = ""
End Sub

Private Sub Command3_Click()
    txtPayment = ""
End Sub

Private Sub Command4_Click()
    txtTerm = ""
End Sub

Private Sub Command5_Click()
    txtRate = ""
End Sub


