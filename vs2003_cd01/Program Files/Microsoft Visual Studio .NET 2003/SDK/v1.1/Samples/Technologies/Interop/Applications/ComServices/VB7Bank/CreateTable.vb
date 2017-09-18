
' ==============================================================================
' Filename: Account.vbp
'
' Summary:  Visual Basic implememtation of the create table class for the bank sample
' Classes:  CreateTable.cls
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

'

option strict off

imports System
imports ADODB
imports System.EnterpriseServices
imports Microsoft.VisualBasic
imports System.Runtime.InteropServices

namespace VB7Bank

	public interface ICreateTable
		sub CreateAccount()
		sub CreateReceipt()
	end interface


	<TransactionAttribute(TransactionOption.RequiresNew)> public class CreateTable
			inherits   ServicedComponent
			implements ICreateTable

		private const strConnect = "FILEDSN=BankSample"

		' F+F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++
		'
		' Function: CreateAccount
		'
		' This function creates the Account table
		'
		' Args:     None
		' Returns:  None
		'
		' F-F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---
		public sub CreateAccount()	implements ICreateTable.CreateAccount

			try
				dim adoConn as Connection
				dim strSQL as String
				dim varRows as Object
				varRows = new Object()

				adoConn = new Connection
				adoConn.Open(strConnect)

				' Add Account Table
				strSQL = "If not exists (Select name from sysobjects where name = 'Account')" & _
						 "BEGIN" & " CREATE TABLE dbo.Account (" & "AccountNo int NOT NULL ," & _
						 " Balance int NULL ," & " CONSTRAINT PK___1__10 PRIMARY KEY  CLUSTERED" & _
						 "(" & "AccountNo" & ")" & ")" & _
						 " INSERT INTO Account VALUES (1,1000)" & "INSERT INTO Account VALUES (2,1000)" & _
						 " END"

				adoConn.Execute(strSQL, varRows, 128)
				ContextUtil.SetComplete

			catch e as Exception
				ContextUtil.SetAbort
				throw new Exception ("Bank.CreateTable.CreateAccount" & e.ToString())

			end try

		end sub


		' F+F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++
		'
		' Function: CreateReceipt
		'
		' This function creates the Receipt Table
		'
		' Args:     None
		' Returns:  None
		'
		' F-F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---
		public sub CreateReceipt()	implements ICreateTable.CreateReceipt

			try
				dim adoConn As Connection
				dim strSQL As String
				dim varRows as Object

				varRows = new Object()
				adoConn = New Connection
				adoConn.Open(strConnect)

				' Add Receipt Table
				strSQL = strSQL & "If not exists (Select name from sysobjects where name = 'Receipt')" & _
								  "BEGIN" & " CREATE TABLE Receipt (NextReceipt int)" & _
								  " INSERT INTO Receipt VALUES (1000)" & " END"
				adoConn.Execute(strSQL, varRows, 128)
  				ContextUtil.SetComplete

			catch e as Exception
				throw new Exception ("Bank.CreateTable.CreateAccount" & e.ToString())
  				ContextUtil.SetAbort

			end try
		end sub

	end class

end namespace