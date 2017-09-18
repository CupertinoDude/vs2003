'
'*------------------------------------------------------------------------------
'*  <copyright from='1997' to='2002' company='Microsoft Corporation'>
'*   Copyright (c) Microsoft Corporation. All Rights Reserved.
'*
'*   This source code is intended only as a supplement to Microsoft
'*   Development Tools and/or on-line documentation.  See these other
'*   materials for detailed information regarding Microsoft code samples.
'*
'*   </copyright>
'*-------------------------------------------------------------------------------
'*
'* File: NorthwindData.vb
'*
'

Imports System
Imports System.Text
Imports System.Windows.Forms
Imports System.Data
Imports System.Data.SqlServerCe


Namespace Microsoft.Sql.SqlCe.Samples.Cs.NorthwindCe

   
    '/ <summary>
    '/ Summary description for NorthwindData.
    '/ </summary>
    Friend Class NorthwindData
        Private Shared northwind As NorthwindData = Nothing
        Private local_DatabaseFile As String
        Private local_ConnString As String
        Private cnNorthwind As SqlCeConnection
        Private dsNorthwind As DataSet


        Private Sub New()
            local_DatabaseFile = "My Documents\NorthwindDemo.sdf"

            ' Construct the local connecting string.
            '
            local_ConnString = "Data Source= " & local_DatabaseFile
            cnNorthwind = New SqlCeConnection(local_ConnString)
            dsNorthwind = New DataSet("Northwind")
        End Sub 'New


        Overloads Sub Finalize()
            MyBase.Finalize()
        End Sub 'Finalize


        Public Sub Close()
            If cnNorthwind.State = ConnectionState.Open Then
                cnNorthwind.Close()
            End If
        End Sub 'Close


        Public Shared Function GetInstance() As NorthwindData
            If northwind Is Nothing Then
                northwind = New NorthwindData
            End If
            Return northwind
        End Function 'GetInstance


        Public ReadOnly Property NorthwindConnection() As SqlCeConnection
            Get
                Return cnNorthwind
            End Get
        End Property


        Public ReadOnly Property NorthwindDataSet() As DataSet
            Get
                Return dsNorthwind
            End Get
        End Property


        Public ReadOnly Property LocalDatabaseFile() As String
            Get
                Return local_DatabaseFile
            End Get
        End Property


        Public ReadOnly Property LocalConnString() As String
            Get
                Return local_ConnString
            End Get
        End Property


        Friend Shared Sub ShowErrors(ByVal e As SqlCeException)
            ' Show SQL Server CE error information. 
            '
            Dim errorCollection As SqlCeErrorCollection = e.Errors

            Dim bld As New StringBuilder
            Dim inner As Exception = e.InnerException

            If Not (inner Is Nothing) Then
                MessageBox.Show(("Inner Exception: " & inner.ToString()), "Northwind")
            End If

            Dim err As SqlCeError
            For Each err In errorCollection
                bld.Append(ControlChars.Cr & " Error Code: " & err.HResult.ToString("X"))
                bld.Append(ControlChars.Cr & " Message   : " & err.Message)
                bld.Append(ControlChars.Cr & " Minor Err.: " & err.NativeError)
                bld.Append(ControlChars.Cr & " Source    : " & err.Source)

                Dim numPar As Integer
                For Each numPar In err.NumericErrorParameters
                    If numPar <> 0 Then
                        bld.Append(ControlChars.Cr & " Num. Par. : " & numPar.ToString())
                    End If
                Next numPar
                Dim errPar As String
                For Each errPar In err.ErrorParameters
                    If errPar <> [String].Empty Then
                        bld.Append(ControlChars.Cr & " Err. Par. : " & errPar)
                    End If
                Next errPar
                MessageBox.Show(bld.ToString(), "Northwind")
                bld.Remove(0, bld.Length)
            Next err
        End Sub 'ShowErrors
    End Class 'NorthwindData
End Namespace 'Microsoft.Sql.SqlCe.Samples.Cs.NorthwindCe