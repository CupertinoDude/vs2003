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
Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections
Imports Acme

Namespace Data.Vb

    Public Class DataGrid8
        Inherits System.Web.UI.Page

        Protected MyDataGrid As System.Web.UI.WebControls.DataGrid
        Private components As System.ComponentModel.IContainer
        Protected Message As System.Web.UI.HtmlControls.HtmlGenericControl

        Dim MyConnection As SqlConnection

        Dim StateIndex As Hashtable

#Region " Web Forms Designer Generated Code "

        Dim WithEvents DataGrid8 As System.Web.UI.Page

        Sub New()
            DataGrid8 = Me
            AddHandler DataGrid8.Init, New System.EventHandler(AddressOf Me.DataGrid8_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.

        Protected Sub DataGrid8_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

#End Region

        Protected Sub DataGrid8_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")

            If Not (IsPostBack) Then
                BindGrid()
            End If

            StateIndex = New Hashtable()
            StateIndex("CA") = 0
            StateIndex("IN") = 1
            StateIndex("KS") = 2
            StateIndex("MD") = 3
            StateIndex("MI") = 4
            StateIndex("OR") = 5
            StateIndex("TN") = 6
            StateIndex("UT") = 7
        End Sub


        Protected Sub DataGrid8_UnLoad(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            MyConnection.Close()
        End Sub

        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            AddHandler Load, AddressOf Me.DataGrid8_Load
            AddHandler Me.MyDataGrid.CancelCommand, AddressOf Me.MyDataGrid_Cancel
            AddHandler Me.MyDataGrid.EditCommand, AddressOf Me.MyDataGrid_Edit
            AddHandler Me.MyDataGrid.UpdateCommand, AddressOf Me.MyDataGrid_Update

        End Sub

        Public Function GetStateIndex(ByVal StateName As String) As Integer

            If Not StateIndex(StateName) Is Nothing Then
                Return CInt(StateIndex(StateName))
            Else
                Return 0
            End If
        End Function

        Sub MyDataGrid_Edit(ByVal Sender As Object, ByVal E As DataGridCommandEventArgs)

            MyDataGrid.EditItemIndex = CInt(E.Item.ItemIndex)
            BindGrid()
        End Sub

        Sub MyDataGrid_Cancel(ByVal Sender As Object, ByVal E As DataGridCommandEventArgs)

            MyDataGrid.EditItemIndex = -1
            BindGrid()
        End Sub

        Sub MyDataGrid_Update(ByVal Sender As Object, ByVal E As DataGridCommandEventArgs)

            Dim DS As DataSet
            Dim MyCommand As SqlCommand

            Dim UpdateCmd As String = "UPDATE Authors SET au_id = @Id, au_lname = @LName, au_fname = @FName, phone = " _
                 & " @Phone, address = @Address, city = @City, state = @State, zip = @Zip, contract = @Contract where au_id = @Id"

            MyCommand = New SqlCommand(UpdateCmd, MyConnection)

            MyCommand.Parameters.Add(New SqlParameter("@Id", SqlDbType.NVarChar, 11))
            MyCommand.Parameters.Add(New SqlParameter("@LName", SqlDbType.NVarChar, 40))
            MyCommand.Parameters.Add(New SqlParameter("@FName", SqlDbType.NVarChar, 20))
            MyCommand.Parameters.Add(New SqlParameter("@Phone", SqlDbType.NChar, 12))
            MyCommand.Parameters.Add(New SqlParameter("@Address", SqlDbType.NVarChar, 40))
            MyCommand.Parameters.Add(New SqlParameter("@City", SqlDbType.NVarChar, 20))
            MyCommand.Parameters.Add(New SqlParameter("@State", SqlDbType.NChar, 2))
            MyCommand.Parameters.Add(New SqlParameter("@Zip", SqlDbType.NChar, 5))
            MyCommand.Parameters.Add(New SqlParameter("@Contract", SqlDbType.NVarChar, 1))

            MyCommand.Parameters("@Id").Value = MyDataGrid.DataKeys(CInt(E.Item.ItemIndex))

            Dim Cols As String() = {"LName","FName","Phone","Address","City","Zip"}
            Message.InnerHtml = ""

            Dim I As Integer
            For I = 0 To 5

                Dim CurrentTextBox As System.Web.UI.WebControls.TextBox
                CurrentTextBox = CType(E.Item.FindControl("edit_" & Cols(I)), TextBox)
                Dim ColValue As String = CurrentTextBox.Text

                ' check for invalid values
                Select Case Cols(i)
                    Case "LName"
                        If Not InputValidator.IsValidAnsiName(colvalue)
                            Message.InnerHtml &= "ERROR: Last Name - " & InputValidator.AnsiNameErrorString & "<br>"
                        End If
                    Case "FName"
                        If Not InputValidator.IsValidAnsiName(colvalue)
                            Message.InnerHtml &= "ERROR: First Name - " & InputValidator.AnsiNameErrorString & "<br>"
                        End If
                    Case "Phone"
                        If Not InputValidator.IsValidAnsiPhoneNumber(colvalue)
                            Message.InnerHtml &= "ERROR: Phone - " & InputValidator.AnsiPhoneErrorString & "<br>"
                        End If
                    Case "Address"
                        If Not InputValidator.IsValidAnsiAddress(colvalue)
                            Message.InnerHtml &= "ERROR: Address - " & InputValidator.AnsiAddressErrorString & "<br>"
                        End If
                    Case "City"
                        If Not InputValidator.IsValidAnsiCityOrState(colvalue)
                            Message.InnerHtml &= "ERROR: City - " & InputValidator.AnsiCityStateErrorString & "<br>"
                        End If
                    Case "Zip"
                        If Not InputValidator.IsValidFiveDigitZipCode(colvalue)
                            Message.InnerHtml &= "ERROR: Zip Code - " & InputValidator.AnsiBasicZipCodeErrorString & "<br>"
                        End If
                End Select

                ' Check for null values in required fields
                If ColValue = ""
                    Message.InnerHtml &= "ERROR: Null values not allowed for " & Cols(i-1) & "<br>"
                End If

                MyCommand.Parameters("@" & Cols(I)).Value = ColValue
            Next

            If Message.InnerHtml <> ""
                Message.Style("color") = "red"
                Return
            End If

            Dim StateDropDownList As DropDownList
            StateDropDownList = CType(E.Item.FindControl("edit_State"), DropDownList)
            MyCommand.Parameters("@State").Value = StateDropDownList.SelectedItem.ToString()

            Dim ContractCheckBox As CheckBox
            ContractCheckBox = CType(E.Item.FindControl("edit_Contract"), CheckBox)

            If ContractCheckBox.Checked = True Then
                MyCommand.Parameters("@Contract").Value = "1"
            Else
                MyCommand.Parameters("@Contract").Value = "0"
            End If

            MyCommand.Connection.Open()

            Try
                MyCommand.ExecuteNonQuery()
                Message.InnerHtml = "<b>Record Updated</b><br>" & UpdateCmd
                MyDataGrid.EditItemIndex = -1
            Catch Exp As SqlException
                If Exp.Number = 2627 Then
                    Message.InnerHtml = "ERROR: A record already exists with the same primary key"
                Else
                    Message.InnerHtml = "ERROR: Could not update record, please ensure the fields are correctly filled out"
                End If
                Message.Style("color") = "red"
            End Try

            MyCommand.Connection.Close()

            BindGrid()
        End Sub

        Sub BindGrid()

            Dim DS As DataSet
            Dim MyCommand As SqlDataAdapter
            MyCommand = New SqlDataAdapter("select * from Authors", MyConnection)

            DS = New DataSet()
            MyCommand.Fill(DS, "Authors")

            MyDataGrid.DataSource = DS.Tables("Authors").DefaultView
            MyDataGrid.DataBind()
        End Sub
    End Class

End Namespace