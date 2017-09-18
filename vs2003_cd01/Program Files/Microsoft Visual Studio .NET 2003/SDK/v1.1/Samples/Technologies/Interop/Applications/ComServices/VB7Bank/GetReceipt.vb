
' ==============================================================================
' Filename: Account.vbp
'
' Summary:  Visual Basic implememtation of the GetReceipt component for the bank sample
' Classes:  GetReceipt.cls
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

	<TransactionAttribute(TransactionOption.Supported)> public class GetReceipt		
			inherits   ServicedComponent
			implements IGetReceipt

		Private Const APP_ERROR = -2147467008

		' F+F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++F+++
		'
		' Function: GetNextReceipt
		'
		' This function uses Shared Properties to get the next receipt value
		'
		' Args:     None
		' Returns:  Long -  next receipt value
		'
		' F-F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---F---
		Public Function GetNextReceipt() As Integer Implements IGetReceipt.GetNextReceipt

			dim success as boolean
	
			success = false
			try
				dim spmMgr as new SharedPropertyGroupManager
				dim spmGroup as SharedPropertyGroup
				dim bResult as Boolean
				spmGroup = spmMgr.CreatePropertyGroup("Receipt", PropertyLockMode.Method, PropertyReleaseMode.Process, bResult)

				dim spmPropNextReceipt as SharedProperty
				spmPropNextReceipt = spmGroup.CreateProperty("Next", bResult)

				'  the initial value of the Shared Property to
				' 0 if the Shared Property didn’t already exist.
				' This is not entirely necessary but demonstrates how to initialize a value.
				if bResult = false then
					spmPropNextReceipt.Value = (0)
				end if

				dim spmPropMaxNum as SharedProperty
				spmPropMaxNum = spmGroup.CreateProperty("MaxNum", bResult)

				dim objReceiptUpdate as new VB7Bank.UpdateReceipt
				if spmPropNextReceipt.Value >= spmPropMaxNum.Value then
					spmPropNextReceipt.Value = ( objReceiptUpdate.Update)
					spmPropMaxNum.Value = (spmPropNextReceipt.Value + 100)
				end if

				' Get the next receipt number and update property
				spmPropNextReceipt.Value = (spmPropNextReceipt.Value + 1)

				GetNextReceipt = cint(spmPropNextReceipt.Value)
				success = true

			catch e as Exception
				GetNextReceipt = -1							' indicate that an error occured
				success = false
				throw new Exception("VB7Bank.GetReceipt.GetNextReceipt " & e.ToString())
			
			finally
				if success then
					ContextUtil.SetComplete()
				else
					ContextUtil.SetAbort()
				end if

			end try

		end function


	end class

end namespace
