VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "RateLookup"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
'===========================================================================
'  File:      RateLookup.cls
'
'  Summary:   This is the file that implements the loan rate method
'
'----------------------------------------------------------------------------
'  This file is part of the Microsoft .NET Samples.
'
'  Copyright (C) Microsoft Corporation.  All rights reserved.
'============================================================================


Dim Rate(20) As Double
Dim Term(20) As Integer


Function GetLoanRate(ByVal LoanAmt As Double, ByVal LoanTerm As Integer) As Double
    InitRates
    
    Dim R As Double
    
    i = 1
    While LoanTerm >= Term(i)
        i = i + 1
    Wend
        
    R = Rate(i - 1)
    
    If LoanAmt > 230000 Then R = R + 0.5
    
    GetLoanRate = R
    
End Function

Private Sub InitRates()
    Term(1) = 6
    Term(2) = 12
    Term(3) = 24
    Term(4) = 30
    Term(5) = 36
    Term(6) = 42
    Term(7) = 48
    Term(8) = 54
    Term(9) = 60
    Term(10) = 66
    Term(11) = 72
    Term(12) = 78
    Term(13) = 84
    Term(14) = 90
    Term(15) = 96
    Term(16) = 180
    Term(17) = 240
    Term(18) = 300
    Term(19) = 360
    Term(20) = 999
    
     
    Rate(1) = 2.4
    Rate(2) = 2.8
    Rate(3) = 3.6
    Rate(4) = 4.25
    Rate(5) = 4.8
    Rate(6) = 6.34
    Rate(7) = 6.9
    Rate(8) = 7.25
    Rate(9) = 7.8
    Rate(10) = 8#
    Rate(11) = 8#
    Rate(12) = 8.5
    Rate(13) = 8.5
    Rate(14) = 9.15
    Rate(15) = 9.5
    Rate(16) = 7.8
    Rate(17) = 8.35
    Rate(18) = 8.45
    Rate(19) = 8.55
    Rate(20) = 999
End Sub
