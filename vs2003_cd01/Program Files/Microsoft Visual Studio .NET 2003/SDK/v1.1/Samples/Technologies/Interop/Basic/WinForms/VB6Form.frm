VERSION 5.00
Begin VB.Form VB6Form 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "VB6 Form"
   ClientHeight    =   4095
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7320
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4095
   ScaleWidth      =   7320
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      Caption         =   "Modify Button"
      ForeColor       =   &H00C00000&
      Height          =   3375
      Index           =   1
      Left            =   3720
      TabIndex        =   19
      Top             =   600
      Visible         =   0   'False
      Width           =   3495
      Begin VB.OptionButton Option1 
         Caption         =   "System"
         Height          =   255
         Index           =   10
         Left            =   120
         TabIndex        =   22
         Top             =   2160
         Width           =   2535
      End
      Begin VB.TextBox Text1 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Index           =   0
         Left            =   120
         TabIndex        =   14
         Text            =   "Button"
         Top             =   600
         Width           =   2295
      End
      Begin VB.CommandButton UpdateButton 
         Caption         =   "UPDATE"
         Height          =   375
         Index           =   0
         Left            =   2520
         TabIndex        =   15
         Top             =   600
         Width           =   855
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Flat"
         Height          =   255
         Index           =   7
         Left            =   120
         TabIndex        =   16
         Top             =   1440
         Width           =   2535
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Popup"
         Height          =   255
         Index           =   8
         Left            =   120
         TabIndex        =   17
         Top             =   1680
         Width           =   2535
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Standard"
         Height          =   255
         Index           =   9
         Left            =   120
         TabIndex        =   18
         Top             =   1920
         Value           =   -1  'True
         Width           =   2535
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Text"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Index           =   14
         Left            =   120
         TabIndex        =   21
         Top             =   360
         Width           =   390
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Flat Style"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   20
         Top             =   1200
         Width           =   2055
      End
   End
   Begin VB.CommandButton CreateButton 
      Caption         =   "Make the Form's Button Visible"
      Height          =   375
      Index           =   1
      Left            =   3720
      TabIndex        =   13
      Top             =   120
      Visible         =   0   'False
      Width           =   3495
   End
   Begin VB.Frame Frame1 
      Caption         =   "Modify Form"
      ForeColor       =   &H00C00000&
      Height          =   3375
      Index           =   0
      Left            =   120
      TabIndex        =   1
      Top             =   600
      Visible         =   0   'False
      Width           =   3495
      Begin VB.OptionButton Option1 
         Caption         =   "SizableToolWindow"
         Height          =   255
         Index           =   6
         Left            =   120
         TabIndex        =   12
         Top             =   2880
         Width           =   2535
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Sizable"
         Height          =   255
         Index           =   5
         Left            =   120
         TabIndex        =   11
         Top             =   2640
         Value           =   -1  'True
         Width           =   2535
      End
      Begin VB.OptionButton Option1 
         Caption         =   "None"
         Height          =   255
         Index           =   4
         Left            =   120
         TabIndex        =   10
         Top             =   2400
         Width           =   2535
      End
      Begin VB.OptionButton Option1 
         Caption         =   "FixedToolWindow"
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   9
         Top             =   2160
         Width           =   2535
      End
      Begin VB.OptionButton Option1 
         Caption         =   "FixedSingle"
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   8
         Top             =   1920
         Width           =   2535
      End
      Begin VB.OptionButton Option1 
         Caption         =   "FixedDialog"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   7
         Top             =   1680
         Width           =   2535
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Fixed3D"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   6
         Top             =   1440
         Width           =   2535
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Always on Top"
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   4
         Top             =   840
         Width           =   3015
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Disable Minimize Box"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   3
         Top             =   600
         Width           =   3015
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Disable Maximize Box"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   2
         Top             =   360
         Width           =   3015
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Border Style"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   5
         Top             =   1200
         Width           =   2055
      End
   End
   Begin VB.CommandButton CreateButton 
      Caption         =   "Create the Windows Form"
      Height          =   375
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3495
   End
End
Attribute VB_Name = "VB6Form"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim f As Object ' late-binding to get access all of class's members

Private Declare Function GetSystemDefaultLCID Lib "kernel32" () As Long

Private Sub CreateButton_Click(Index As Integer)
    If Index = 0 Then
        Me.MousePointer = 11
        Set f = New MyForm.Form1
        f.Text = "This is a System.Windows.Forms.Form"
        f.Show
        Frame1(0).Visible = True
        CreateButton(1).Visible = True
        CreateButton(0).Enabled = False
        Frame1(0).Caption = Frame1(0).Caption & " (Handle = " & CStr(f.Handle) & ")"
        Me.MousePointer = 0
        Exit Sub
    Else
        f.Button1.Visible = True
        f.Button1.Text = "Button"
        Frame1(1).Visible = True
        CreateButton(1).Enabled = False
        Frame1(1).Caption = Frame1(1).Caption & " (Handle = " & CStr(f.Button1.Handle) & ")"
        Exit Sub
    End If
End Sub

Private Sub Check1_Click(Index As Integer)
    If Index = 0 Then
        f.MaximizeBox = Not f.MaximizeBox
    ElseIf Index = 1 Then
        f.MinimizeBox = Not f.MinimizeBox
    ElseIf Index = 2 Then
        f.TopMost = Not f.TopMost
    End If
End Sub

Private Sub Form_Load()
    Dim lcid As Long
    Debug.Print GetSystemDefaultLCID()
    If lcid = 1041 Then
        Text1(0).Font.Charset = 128
    End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
    If Not f Is Nothing Then f.Close
End Sub

Private Sub Option1_Click(Index As Integer)
    If Index = 0 Then
        f.FormBorderStyle = 2 'FormBorderStyle.Fixed3D
    ElseIf Index = 1 Then
        f.FormBorderStyle = 3 'FormBorderStyle.FixedDialog
    ElseIf Index = 2 Then
        f.FormBorderStyle = 1 'FormBorderStyle.FixedSingle
    ElseIf Index = 3 Then
        f.FormBorderStyle = 5 'FormBorderStyle.FixedToolWindow
    ElseIf Index = 4 Then
        f.FormBorderStyle = 0 'FormBorderStyle.None
    ElseIf Index = 5 Then
        f.FormBorderStyle = 4 'FormBorderStyle.Sizable
    ElseIf Index = 6 Then
        f.FormBorderStyle = 6 'FormBorderStyle.SizableToolWindow
    ElseIf Index = 7 Then
        f.Button1.FlatStyle = 0 'FlatStyle.Flat
    ElseIf Index = 8 Then
        f.Button1.FlatStyle = 1 'FlatStyle.Popup
    ElseIf Index = 9 Then
        f.Button1.FlatStyle = 2 'FlatStyle.Standard
    ElseIf Index = 10 Then
        f.Button1.FlatStyle = 3 'FlatStyle.System
    End If

End Sub

Private Sub UpdateButton_Click(Index As Integer)
    f.Button1.Text = Text1(0).Text
End Sub
