'-----------------------------------------------------------------------
'  This file is part of the Microsoft .NET SDK Code Samples.
' 
'  Copyright (C) Microsoft Corporation.  All rights reserved.
' 
'This source code is intended only as a supplement to Microsoft
'Development Tools and/or on-line documentation.  See these other
'materials for detailed information regarding Microsoft code samples.
' 
'THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
'KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
'IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
'PARTICULAR PURPOSE.
'-----------------------------------------------------------------------

Imports System
Imports System.Web
Imports System.Collections
Imports System.Collections.Specialized
Imports System.Data
Imports System.Data.SqlClient

Namespace Personalization

    Public Class UserStateModule : Implements IHttpModule

        Public Sub Init(ByVal App As System.Web.HttpApplication) Implements IHttpModule.Init
            AddHandler App.EndRequest, AddressOf Me.OnLeave
            AddHandler App.AuthenticateRequest, AddressOf Me.OnEnter
        End Sub

        Public Sub Dispose() Implements IHttpModule.Dispose
        End Sub

        Public Sub OnEnter(ByVal Sender As Object, ByVal E As EventArgs)

            Dim App As HttpApplication
            Dim context As HttpContext

            App = CType(Sender, HttpApplication)
            context = App.Context

            Dim UserId As String = "ANONYMOUS"

      If context.Request.IsAuthenticated Then
               UserId = context.User.Identity.Name
      End If

      'Obtain Appropriate User state and populate HttpContext with it
      Dim hshTable as NameValueCollection = CType(context.GetConfig("system.web/dsnstore"), NameValueCollection)
      Dim dsn as String = CType(hshTable.Item("portaldb"), String)
      context.Items("UserState") = new UserState(UserId, dsn)

        End Sub

        Public Sub OnLeave(ByVal Sender As Object, ByVal E As EventArgs)

            'Save UserState back to data store
            Dim app As HttpApplication = CType(Sender, HttpApplication)
            Dim context As HttpContext = app.Context
      Dim hshTable as NameValueCollection = CType(context.GetConfig("system.web/dsnstore"), NameValueCollection)
      Dim dsn as String = CType(hshTable.Item("portaldb"), String)
            Dim myState As UserState = CType(context.Items("UserState"), UserState)

            If (Not myState Is Nothing) Then
               myState.Save(dsn)
      End If

    End Sub

    End Class

    Public Class UserState

        Dim m_UserPersonalization As System.Collections.Hashtable = New System.Collections.Hashtable()
        Dim m_UserId As String
        Dim m_IsDirty As Boolean

        Public Sub New(ByVal UserId As String, ByVal dsn As String)

            MyBase.New()
            m_UserId = UserId

            Dim Conn As SqlConnection = New SqlConnection(dsn)
            Dim cmdLoad as SqlDataAdapter = new SqlDataAdapter()
	    
	    Try
                Conn.Open()
	    
                cmdLoad.SelectCommand = New SqlCommand()
                cmdLoad.SelectCommand.Connection = Conn
                cmdLoad.SelectCommand.CommandText = "LoadPersonalizationSettings"
                cmdLoad.SelectCommand.CommandType = CommandType.StoredProcedure

                Dim parUser As SqlParameter = new SqlParameter("@UserID", SqlDbType.NVarChar,20)
                parUser.Value = UserId

                cmdLoad.SelectCommand.Parameters.Add(parUser)

                Dim dsResult As DataSet = new DataSet()
    
                cmdLoad.Fill(dsResult,"Results")

      	        'If user doesn't exist -- create new personalization account
      	        If (dsResult.Tables(0).Rows.Count = 0) Then
        	    Dim parNewUser As SqlParameter = new SqlParameter("@UserID", SqlDbType.NVarChar,20)
        	    parNewUser.Value = UserId

               	    Dim cmdCreate As SqlCommand = new SqlCommand()
                    cmdCreate.Connection = Conn
                    cmdCreate.CommandText = "CreatePersonalizationAccount"
                    cmdCreate.CommandType = CommandType.StoredProcedure
                    cmdCreate.Parameters.Add(parNewUser)
                    cmdCreate.ExecuteNonQuery()

                    'Now repopulate user dataset
                    cmdLoad.Fill(dsResult,"Results")
                 End If

                Dim Row As DataRow = dsResult.Tables(0).Rows(0)
                Dim i As Integer

                For i = 0 To dsResult.Tables(0).Columns.Count - 1
                  Dim Value as Object = Row.Item(dsResult.Tables(0).Columns(i))
                   m_UserPersonalization(dsResult.Tables(0).Columns(i).ToString()) = Value.ToString()
                Next i
	    Catch ex as Exception
    		Throw ex
	    Finally
		cmdLoad.SelectCommand.Connection.Close()
		cmdLoad.Dispose()
	    End Try
            
        End Sub

        Public Property UserId As String
            Get
                Return m_UserId
            End Get
            Set
                m_UserId = value
            End Set
        End Property

        Public Default Property Item(key As String) As String
            Get
                Return CType(m_UserPersonalization(key), String)
            End Get
            Set
                m_UserPersonalization(key) = Value
                m_IsDirty = True
            End Set
        End Property

        Public Sub Save(ByVal dsn As String)

            If (m_IsDirty = true) Then
                Dim Conn As SQLConnection= New SQLConnection(dsn)
                Dim cmdSave as SQLCommand = New SQLCommand("SavePersonalizationSettings", Conn)

                cmdSave.CommandType = CommandType.StoredProcedure
		Try
                    Conn.Open()

                    Dim HashKeyEnum As IEnumerator = CType(m_UserPersonalization.Keys, IEnumerable).GetEnumerator()
                    Dim HashValEnum As IEnumerator = CType(m_UserPersonalization.Values, IEnumerable).GetEnumerator()

        	    Do While(HashKeyEnum.MoveNext() And HashValEnum.MoveNext())
                        Dim myParameter as SqlParameter = new SqlParameter("@"+ HashKeyEnum.Current.ToString() , SqlDbType.NVarChar,1000)
                        myParameter.Value = HashValEnum.Current.ToString()
                        cmdSave.Parameters.Add(myParameter)
                    Loop

                    Dim RowsAffected As Long = 0
                    RowsAffected = cmdSave.ExecuteNonQuery()
		Catch ex as Exception
    		    Throw ex
		Finally
    		    Conn.Close()
		End Try
            End If
        End Sub

  End Class

End Namespace
