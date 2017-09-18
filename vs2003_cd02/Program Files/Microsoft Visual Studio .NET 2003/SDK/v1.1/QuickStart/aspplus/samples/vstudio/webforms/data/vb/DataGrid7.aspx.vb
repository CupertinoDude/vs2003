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
Imports System.Globalization
Imports Acme

Namespace Data.Vb

    Public Class DataGrid7
        Inherits System.Web.UI.Page

        Protected MyDataGrid As System.Web.UI.WebControls.DataGrid
        Protected Message As System.Web.UI.HtmlControls.HtmlGenericControl
        Private components As System.ComponentModel.IContainer

        Dim MyConnection As SqlConnection

#Region " Web Forms Designer Generated Code "

        Dim WithEvents DataGrid7 As System.Web.UI.Page

        Sub New()
            DataGrid7 = Me
            AddHandler DataGrid7.Init, New System.EventHandler(AddressOf Me.DataGrid7_Init)
        End Sub

        'CODEGEN: This procedure is required by the Web Form Designer
        'Do not modify it using the code editor.

        Protected Sub DataGrid7_Init(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

#End Region

        Protected Sub DataGrid7_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            MyConnection = New SqlConnection("server=(local)\NetSDK;database=pubs;Integrated Security=SSPI")

            If Not (IsPostBack) Then
                BindGrid()
            End If
        End Sub

        Protected Sub DataGrid7_UnLoad(ByVal Sender As System.Object, ByVal e As System.EventArgs)
            MyConnection.Close()
        End Sub


        Private Sub InitializeComponent()
            Me.components = New System.ComponentModel.Container()
            AddHandler Load, AddressOf Me.DataGrid7_Load
            AddHandler Me.MyDataGrid.CancelCommand, AddressOf Me.MyDataGrid_Cancel
            AddHandler Me.MyDataGrid.EditCommand, AddressOf Me.MyDataGrid_Edit
            AddHandler Me.MyDataGrid.UpdateCommand, AddressOf Me.MyDataGrid_Update

        End Sub

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

            Dim Cols As String() = {"@Id","@LName","@FName","@Phone", _
                "@Address","@City","@State","@Zip","@Contract"}

            Dim NumCols As Integer = E.Item.Cells.Count
            Message.InnerHtml = ""

            Dim I As Integer
            For I=2 To NumCols-2 'skip first, second and last column

                Dim CurrentTextBox As System.Web.UI.WebControls.TextBox
                CurrentTextBox = CType(E.Item.Cells(I).Controls(0), TextBox)
                Dim ColValue As String = CurrentTextBox.Text

                ' check for invalid values
                Select Case Cols(i-1)
                    Case "@LName"
                        If Not InputValidator.IsValidAnsiName(colvalue)
                            Message.InnerHtml &= "ERROR: Last Name - " & InputValidator.AnsiNameErrorString & "<br>"
                        End If
                    Case "@FName"
                        If Not InputValidator.IsValidAnsiName(colvalue)
                            Message.InnerHtml &= "ERROR: First Name - " & InputValidator.AnsiNameErrorString & "<br>"
                        End If
                    Case "@Phone"
                        If Not InputValidator.IsValidAnsiPhoneNumber(colvalue)
                            Message.InnerHtml &= "ERROR: Phone - " & InputValidator.AnsiPhoneErrorString & "<br>"
                        End If
                    Case "@Address"
                        If Not InputValidator.IsValidAnsiAddress(colvalue)
                            Message.InnerHtml &= "ERROR: Address - " & InputValidator.AnsiAddressErrorString & "<br>"
                        End If
                    Case "@City"
                        If Not InputValidator.IsValidAnsiCityOrState(colvalue)
                            Message.InnerHtml &= "ERROR: City - " & InputValidator.AnsiCityStateErrorString & "<br>"
                        End If
                    Case "@State"
                        If Not InputValidator.IsValidAnsiTwoCharacterState(colvalue)
                            Message.InnerHtml &= "ERROR: State - " & InputValidator.AnsiTwoCharacterStateErrorString & "<br>"
                        End If
                    Case "@Zip"
                        If Not InputValidator.IsValidFiveDigitZipCode(colvalue)
                            Message.InnerHtml &= "ERROR: Zip Code - " & InputValidator.AnsiBasicZipCodeErrorString & "<br>"
                        End If
                End Select

                ' Check for null values in required fields
                If I<6 And ColValue = ""
                    Message.InnerHtml &= "ERROR: Null values not allowed for " & Cols(i-1) & "<br>"
                End If

                MyCommand.Parameters(Cols(I-1)).Value = ColValue
            Next

            If Message.InnerHtml <> ""
                Message.Style("color") = "red"
                Return
            End If

            ' Append last row, converting true/false values to 0/1
            Dim ContractTextBox As TextBox
            ContractTextBox = CType(E.Item.Cells(NumCols - 1).Controls(0), TextBox)
            If ContractTextBox.Text.ToLower(CultureInfo.InvariantCulture) = "true" Then
                MyCommand.Parameters("@Contract").Value = "1"
            Else
                MyCommand.Parameters("@Contract").Value = "0"
            End If

            MyCommand.Connection.Open()

            Try
                MyCommand.ExecuteNonQuery()
                Message.InnerHtml = "<b>Record Updated</b><br>" & UpdateCmd.ToString()
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