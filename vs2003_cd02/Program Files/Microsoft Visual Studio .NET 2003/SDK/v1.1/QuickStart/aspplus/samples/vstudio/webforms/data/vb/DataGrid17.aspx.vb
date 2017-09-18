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

Imports System.Drawing
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports System.Web.UI
Imports System.IO
Imports System.Data


Namespace Data.Vb

    Public Class DataGrid17
        Inherits System.Web.UI.Page

        Protected MyDataGrid As System.Web.UI.WebControls.DataGrid
        Protected MySpan As System.Web.UI.WebControls.PlaceHolder
        Private components As System.ComponentModel.IContainer

#Region " Web Forms Designer Generated Code "

        Dim WithEvents DataGrid17 As System.Web.UI.Page

        Sub New()
            DataGrid17 = Me
            AddHandler DataGrid17.Init, New System.EventHandler(AddressOf Me.DataGrid17_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.

        Protected Sub DataGrid17_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

#End Region

        Protected Sub DataGrid17_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            Dim DS As New DataSet()
            Dim FS As FileStream
            Dim Reader As StreamReader

            FS = New FileStream(Server.MapPath("schemadata.xml"), FileMode.Open, FileAccess.Read)
            Reader = New StreamReader(FS)
            DS.ReadXml(Reader)
            FS.Close()

            Dim Source As DataView
            Source = New DataView(ds.Tables(0))

            MySpan.Controls.Add(New LiteralControl(Source.Table.TableName))
            MyDataGrid.DataSource = Source
            MyDataGrid.DataBind()
        End Sub


        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            AddHandler Load, AddressOf Me.DataGrid17_Load

        End Sub
    End Class

End Namespace