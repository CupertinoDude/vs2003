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
Imports System.ComponentModel.Design
Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing
Imports System.Web
Imports System.Web.SessionState
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports Microsoft.VisualBasic

Namespace Pagelets.Vb.UserControls
    Public Class pagelet7
        Inherits System.Web.UI.UserControl

        Private _category As String = ""

        Public Property Category() As String
            Get
                Return _category
            End Get
            Set(ByVal Value As String)
                _category = Value

                Dim DS As DataSet
                Dim MyConnection As SqlConnection
                Dim MyCommand As SqlDataAdapter

                MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")
                MyCommand = New SqlDataAdapter("select * from Titles where type='" & _category & "'", MyConnection)

                DS = New DataSet()
                MyCommand.Fill(DS, "Titles")

                MyDataList.DataSource = DS.Tables("Titles").DefaultView
                MyDataList.DataBind()
            End Set
        End Property

#Region " Web Forms Designer Generated Code "

        Protected WithEvents MyDataList As System.Web.UI.WebControls.DataList

        Dim WithEvents pagelet7 As System.Web.UI.UserControl

        Sub New()
            pagelet7 = Me
            AddHandler pagelet7.Init, New System.EventHandler(AddressOf Me.pagelet7_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.
        Private Sub InitializeComponent()

        End Sub

#End Region

        Protected Sub pagelet7_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            If Not IsPostback Then   ' Evals true first time browser hits the page	

            End If
        End Sub

        Protected Sub pagelet7_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

  
    End Class
End Namespace