'===========================================================================
'  File:      Loan.vb
'
'  Summary:   This is the one file that implements the loan methods
'
'----------------------------------------------------------------------------
'  This file is part of the Microsoft .NET Samples.
'
'  Copyright (C) Microsoft Corporation.  All rights reserved.
'============================================================================

Imports System.Reflection
Imports System.Runtime.InteropServices

<assembly:System.Reflection.AssemblyKeyFileAttribute("bank.snk")>

Namespace BankSample

	<ClassInterface(ClassInterfaceType.AutoDual)> Public Class BankLoan
				 Inherits Account

		Private OrigPrin As Double
		Private OrigRate As Double
		Private OrigTerm As Integer
		Private pmt As Double

		Public Function GetPrincipal() As Double
				GetPrincipal = OrigPrin
		End Function

		Public Sub SetPrincipal(ByVal p As Double)
				OrigPrin = p
		End Sub

		Public Function GetRate() As Double
				GetRate = OrigRate
		End Function

		Public Sub SetRate(ByVal r As Double)
				OrigRate = r
		End Sub

		Public Function GetTerm() As Integer
				GetTerm = OrigTerm
		End Function

		Public Sub SetTerm(ByVal t As Integer)
				OrigTerm = t
		End Sub

		Public Function GetPayment() As Double
				GetPayment = pmt
		End Function

		Public Sub SetPayment(ByVal p As Double)
				pmt = p
		End Sub

		Public Function CalcPmt(ByVal prin As Double, ByVal rate As Double, ByVal term As Double) As Double

      			CalcPmt = prin * (rate / (1 - Power((1 + rate), -Cint(term))))
   
		End Function

		Public Function OpenAccount(ByVal p As Double, ByVal r As Double, ByVal t As Integer) As Integer
				OrigPrin = p
				OrigRate = r
				OrigTerm = t

				pmt = CalcPmt(p, r, t)

				SetBalance (OrigPrin)

				OpenAccount = 1
		End Function

		Public Function MakePayment(ByVal pmt As Double) As Integer
				Dim interest As Double
				Dim principal As Double

				interest = GetBalance() * OrigRate
				principal = pmt - interest

				MakePayment = Debit(principal)

		End Function


		Private Function Power(ByVal x As Double, ByVal y As Integer) As Double
				Dim invert As Boolean
				Dim p As Double
				Dim i As Integer

				invert = False

				p = 1#

				If (y < 0) Then
						y = -y
						invert = True
				End If

				For i = 1 To y
						p = p * x
				Next

				If (invert) Then p = (1 / p)

				Power = p

		End Function

	End Class

End Namespace