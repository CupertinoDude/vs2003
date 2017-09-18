' ==============================================================================
' Filename: Account.vbp
'
' Summary:  Visual Basic implememtation of the GetReceipt component for the bank sample
' Classes:  UpdateReceipt.cls
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
imports AccountComLib
imports System.EnterpriseServices
imports Microsoft.VisualBasic
imports System.Runtime.InteropServices

namespace VB7Bank

	<TransactionAttribute(TransactionOption.Required)> public class UpdateReceipt
			inherits   ServicedComponent
			implements IUpdateReceipt

		Private Const strConnect = "FILEDSN=BankSample"

		' F+F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++
		'
		' Function: Update
		'
		' This function the receipt and returns the next receipt value
		'
		' Args:     None
		' Returns:  Long -  next receipt value
		'            -1 if Error
		'
		' F-F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---
		Public Function Update() as integer implements IUpdateReceipt.Update

			dim success as boolean
			success = false

			try
				' get result  and then update table with new receipt number
				dim adoConn as new ADODB.Connection
				dim adoRsReceipt as ADODB.RecordSet
				dim intNextReceipt as integer
				dim strSQL as String

				adoConn.Open( strConnect)

				' Assume that if there is an ado error then the receipt
				' table does not exist
				dim o as object
				o = new object()
		TryAgain:
				try
					strSQL = "UPDATE Receipt SET NextReceipt = NextReceipt + 100"
					adoConn.Execute( strSQL, o, ExecuteOptionEnum.adExecuteNoRecords )
					strSQL = "Select NextReceipt from Receipt"
					adoRsReceipt = adoConn.Execute(strSQL)
					intNextReceipt = cint(adoRsReceipt.Fields("NextReceipt").Value)
					Update = intNextReceipt
				catch
					dim ct As ICreateTable
					ct = new CreateTable
					ct.CreateReceipt()
					goto TryAgain
				end try
				success = true

			catch e as Exception
				Update = -1						' indicate that an error occured
				throw new Exception ("VB7Bank.UpdateReceipt.Update")

			finally
				if success then
					ContextUtil.SetComplete()
				else
					ContextUtil.SetAbort()
				end if

			end try

		end Function

	end class

end namespace