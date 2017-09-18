
' ==============================================================================
' Filename: Account.vb
'
' Summary:  Visual Basic implememtation of the account class for the bank sample
' Classes:  Account.cls
'
' This file is part of the Microsoft COM+ Samples
'
' Copyright (C) Microsoft Corporation. All rights reserved
'
' This source code is intended only as a supplement to Microsoft
' Development Tools and/or on-line documentation.  See these other
' materials for detailed information reagrding Microsoft code samples.
'
' THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
' KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
' IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
' PARTICULAR PURPOSE.
'


option strict off

imports System
imports System.EnterpriseServices
imports System.Runtime.InteropServices
imports ADODB
imports AccountComLib
imports Microsoft.VisualBasic

<assembly:System.Reflection.AssemblyKeyFileAttribute("../common/testkey.snk")>
<assembly:Description("CLR Com Services ServicedComponent Sample")>
<assembly:ApplicationName("ServicedComponentApp")>
<assembly:ApplicationActivation(ActivationOption.Library)>


namespace VB7Bank


	<TransactionAttribute(TransactionOption.Required)> public class Account
		inherits   ServicedComponent
		implements IAccount

		private const strConnect = "FILEDSN=BankSample"


		' F+F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++
		'
		' Function: Post
		'
		' This function posts a banking transaction to an account
		'
		' Args:     lngAccount -    Account to be posted
		'           lngAmount -     Amount to be posted
		' Returns:  String -        Account Balance
		'
		' F-F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---
		public  function Post(ByVal lngAccountNo As Integer, ByVal lngAmount As Integer) As String Implements IAccount.Post

			dim strResult as String
			dim adoRS as ADODB.RecordSet
			dim adoConn as ADODB.Connection
			dim	bSuccess as boolean
			bSuccess = false

			try

				' check for security
				if (lngAmount > 500 or lngAmount < -500) then
					if not ContextUtil.IsCallerInRole("Managers") then
						throw new Exception("Need 'Managers' role for amounts over $500")
					end if
				end if

				dim varRows As Object
				dim strSQL As String
				varRows = new Object()
				adoConn = new Connection()
				adoConn.Open(strConnect)

		TryAgain:
				try
				    strSQL = "UPDATE Account SET Balance = Balance + " & str$(lngAmount) & _
					         " WHERE AccountNo = " & str$(lngAccountNo)
					adoConn.Execute( strSQL, varRows, 128)

				catch e as exception
					dim ct As ICreateTable
					ct = new CreateTable
					ct.CreateAccount()
					goto TryAgain

				end try

				' get resulting balance which may have been further updated via triggers
				strSQL = "SELECT Balance FROM Account WHERE AccountNo = " & str$(lngAccountNo)
				adoRS = adoConn.Execute( strSQL, varRows, -1)


				dim intBalance as integer
				intBalance = cint(adoRS.Fields("Balance").Value)

				' check if account is overdrawn
				if (intBalance) < 0 then
					throw new Exception("Error. Account " & Str$(lngAccountNo) & " would be overdrawn by " & Str$(intBalance) & ". Balance is still " & Str$(intBalance - lngAmount) & ".")
				else
					if lngAmount < 0 then
						strResult = strResult & "Debit from account " & str$(lngAccountNo) & ", "
					else
						strResult = strResult & "Credit to account " & str$(lngAccountNo) & ", "
					end if
					strResult = strResult & "balance is $" & str$(intBalance) & ". (VB7)"
				end if
				bSuccess = true

			finally

				if bSuccess then
					ContextUtil.SetComplete()
					post = strResult
				else
					ContextUtil.SetAbort()
					post = "Failed"
				end if
			end try

		end function

	end class

end namespace