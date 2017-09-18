VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4800
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7035
   ForeColor       =   &H00000000&
   LinkTopic       =   "Form1"
   ScaleHeight     =   4800
   ScaleWidth      =   7035
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton ClearPictureBox 
      Caption         =   "&Clear"
      Height          =   375
      Left            =   4200
      TabIndex        =   2
      Top             =   4320
      Width           =   1215
   End
   Begin VB.CommandButton ShowImage 
      Caption         =   "&Show Image"
      Height          =   375
      Left            =   5520
      TabIndex        =   1
      Top             =   4320
      Width           =   1455
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   25
      Left            =   960
      Top             =   4320
   End
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      FillStyle       =   0  'Solid
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   4215
      Left            =   0
      ScaleHeight     =   4155
      ScaleWidth      =   6915
      TabIndex        =   0
      Top             =   0
      Width           =   6975
   End
   Begin VB.Image sourceImage 
      Height          =   900
      Left            =   0
      Picture         =   "PicForm.frx":0000
      Stretch         =   -1  'True
      Top             =   4320
      Visible         =   0   'False
      Width           =   885
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private LeftPos As Double

Private Sub ClearPictureBox_Click()
    Picture1.Cls
End Sub

Private Sub ShowImage_Click()
    LeftPos = 1
    Me.Timer1.Enabled = True
End Sub

Private Sub Timer1_Timer()
    
    If LeftPos <= 0 Then
        Me.Timer1.Enabled = False
        
        Picture1.Print "Visual Basic ROCKS!"
    Else
        LeftPos = LeftPos - 0.01
        
        Picture1.Cls
        Picture1.PaintPicture sourceImage, LeftPos * Picture1.Width, 0
    End If
    
End Sub
