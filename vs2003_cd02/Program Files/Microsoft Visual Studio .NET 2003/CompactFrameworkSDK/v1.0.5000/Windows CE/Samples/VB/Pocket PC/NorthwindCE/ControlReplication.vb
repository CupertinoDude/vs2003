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
'* File: ControlReplication.vb
'*
'

Imports System
Imports System.Collections
Imports System.ComponentModel
Imports System.Drawing
Imports System.Data
Imports System.Windows.Forms
Imports System.Data.SqlServerCe
Imports System.IO


Namespace Microsoft.Sql.SqlCe.Samples.Cs.NorthwindCe


    '/ <summary>
   '/ Summary description for ControlReplication.
   '/ </summary>
    Public Class ControlReplication
        Inherits System.Windows.Forms.Control

        Private labelAuth As System.Windows.Forms.Label
        Private labelSqlServer As System.Windows.Forms.Label
        Private labelUserID As System.Windows.Forms.Label
        Private labelPassword As System.Windows.Forms.Label
        Private labelInternetUrl As System.Windows.Forms.Label
        Private labelInternetLogin As System.Windows.Forms.Label
        Private labelInternetPwd As System.Windows.Forms.Label
        Private labelSubscriber As System.Windows.Forms.Label
        Private textBoxPublisher As System.Windows.Forms.TextBox
        Private textBoxUserID As System.Windows.Forms.TextBox
        Private textBoxPassword As System.Windows.Forms.TextBox
        Private textBoxInternetUrl As System.Windows.Forms.TextBox
        Private textBoxInternetLogin As System.Windows.Forms.TextBox
        Private textBoxInternetPwd As System.Windows.Forms.TextBox
        Private textBoxSubscriber As System.Windows.Forms.TextBox
        Private WithEvents radioButtonSQLAuth As System.Windows.Forms.RadioButton
        Private radioButtonWinAuth As System.Windows.Forms.RadioButton
        Private WithEvents buttonSync As System.Windows.Forms.Button
        Private panelProps As System.Windows.Forms.Panel
        Private WithEvents buttonReset As System.Windows.Forms.Button

        Private dataNorthwind As NorthwindData = Nothing
        Private publisherDatabase As String
        Private publication As String
        Private init As Boolean = True
        Private form_Northwind As FormNorthwindCe = Nothing

        Public Sub New()

            ' Initialize database info
            '
            publisherDatabase = "NWind_SqlCe"
            publication = "SqlCeReplDemoNet"

            ' Get northwind data object
            '
            dataNorthwind = NorthwindData.GetInstance()
            If dataNorthwind Is Nothing Then
                MessageBox.Show("Unable to get northwind data object", "Northwind")
                Return
            End If

            ' Starts the cursor icon since this function may take some time.
            '
            System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.WaitCursor()

            '
            ' Required for Windows Form Designer support
            '
            InitializeComponent()

            InitReplSync()

            System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.Default()

        End Sub 'New

        Public ReadOnly Property Initialize() As Boolean
            Get
                Return init
            End Get
        End Property


        Public WriteOnly Property FormNorthwind() As FormNorthwindCe
            Set(ByVal Value As FormNorthwindCe)
                form_Northwind = Value
            End Set
        End Property

        '/ <summary>
        '/ Clean up any resources being used.
        '/ </summary>
        Protected Overloads Sub Dispose(ByVal disposing As Boolean)
            MyBase.Dispose(disposing)
        End Sub 'Dispose


        Private Sub InitializeComponent()
            Me.Size = New System.Drawing.Size(246, 302)
            Me.labelAuth = New System.Windows.Forms.Label
            Me.labelSqlServer = New System.Windows.Forms.Label
            Me.labelUserID = New System.Windows.Forms.Label
            Me.labelPassword = New System.Windows.Forms.Label
            Me.labelInternetUrl = New System.Windows.Forms.Label
            Me.labelInternetLogin = New System.Windows.Forms.Label
            Me.labelInternetPwd = New System.Windows.Forms.Label
            Me.labelSubscriber = New System.Windows.Forms.Label
            Me.textBoxPublisher = New System.Windows.Forms.TextBox
            Me.textBoxUserID = New System.Windows.Forms.TextBox
            Me.textBoxPassword = New System.Windows.Forms.TextBox
            Me.textBoxInternetUrl = New System.Windows.Forms.TextBox
            Me.textBoxInternetLogin = New System.Windows.Forms.TextBox
            Me.textBoxInternetPwd = New System.Windows.Forms.TextBox
            Me.textBoxSubscriber = New System.Windows.Forms.TextBox
            Me.radioButtonSQLAuth = New System.Windows.Forms.RadioButton
            Me.radioButtonWinAuth = New System.Windows.Forms.RadioButton
            Me.buttonSync = New System.Windows.Forms.Button
            Me.panelProps = New System.Windows.Forms.Panel
            Me.buttonReset = New System.Windows.Forms.Button
            ' 
            ' labelAuth
            ' 
            Me.labelAuth.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold)
            Me.labelAuth.Location = New System.Drawing.Point(-8, 8)
            Me.labelAuth.Size = New System.Drawing.Size(96, 16)
            Me.labelAuth.Text = "Authentication:"
            Me.labelAuth.TextAlign = System.Drawing.ContentAlignment.TopRight
            ' 
            ' labelSqlServer
            ' 
            Me.labelSqlServer.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold)
            Me.labelSqlServer.Location = New System.Drawing.Point(8, 29)
            Me.labelSqlServer.Size = New System.Drawing.Size(80, 16)
            Me.labelSqlServer.Text = "Publisher:"
            Me.labelSqlServer.TextAlign = System.Drawing.ContentAlignment.TopRight
            ' 
            ' labelUserID
            ' 
            Me.labelUserID.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold)
            Me.labelUserID.Location = New System.Drawing.Point(8, 53)
            Me.labelUserID.Size = New System.Drawing.Size(80, 16)
            Me.labelUserID.Text = "User ID:"
            Me.labelUserID.TextAlign = System.Drawing.ContentAlignment.TopRight
            ' 
            ' labelPassword
            ' 
            Me.labelPassword.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold)
            Me.labelPassword.Location = New System.Drawing.Point(16, 77)
            Me.labelPassword.Size = New System.Drawing.Size(72, 16)
            Me.labelPassword.Text = "Password:"
            Me.labelPassword.TextAlign = System.Drawing.ContentAlignment.TopRight
            ' 
            ' labelInternetUrl
            ' 
            Me.labelInternetUrl.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold)
            Me.labelInternetUrl.Location = New System.Drawing.Point(8, 101)
            Me.labelInternetUrl.Size = New System.Drawing.Size(80, 16)
            Me.labelInternetUrl.Text = "Internet URL:"
            Me.labelInternetUrl.TextAlign = System.Drawing.ContentAlignment.TopRight
            ' 
            ' labelInternetLogin
            ' 
            Me.labelInternetLogin.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold)
            Me.labelInternetLogin.Location = New System.Drawing.Point(8, 125)
            Me.labelInternetLogin.Size = New System.Drawing.Size(80, 16)
            Me.labelInternetLogin.Text = "Internet Login:"
            Me.labelInternetLogin.TextAlign = System.Drawing.ContentAlignment.TopRight
            ' 
            ' labelInternetPwd
            ' 
            Me.labelInternetPwd.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold)
            Me.labelInternetPwd.Location = New System.Drawing.Point(8, 149)
            Me.labelInternetPwd.Size = New System.Drawing.Size(80, 16)
            Me.labelInternetPwd.Text = "Internet Pwd:"
            Me.labelInternetPwd.TextAlign = System.Drawing.ContentAlignment.TopRight
            ' 
            ' labelSubscriber
            ' 
            Me.labelSubscriber.Font = New System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold)
            Me.labelSubscriber.Location = New System.Drawing.Point(8, 173)
            Me.labelSubscriber.Size = New System.Drawing.Size(80, 16)
            Me.labelSubscriber.Text = "Subscriber:"
            Me.labelSubscriber.TextAlign = System.Drawing.ContentAlignment.TopRight
            ' 
            ' textBoxPublisher
            ' 
            Me.textBoxPublisher.Location = New System.Drawing.Point(8, 26)
            Me.textBoxPublisher.Size = New System.Drawing.Size(136, 20)
            Me.textBoxPublisher.Text = ""
            ' 
            ' textBoxUserID
            ' 
            Me.textBoxUserID.Location = New System.Drawing.Point(8, 51)
            Me.textBoxUserID.Size = New System.Drawing.Size(136, 20)
            Me.textBoxUserID.Text = "sa"
            ' 
            ' textBoxPassword
            ' 
            Me.textBoxPassword.PasswordChar = "*"
            Me.textBoxPassword.Location = New System.Drawing.Point(8, 75)
            Me.textBoxPassword.Size = New System.Drawing.Size(136, 20)
            Me.textBoxPassword.Text = ""
            ' 
            ' textBoxInternetUrl
            ' 
            Me.textBoxInternetUrl.Location = New System.Drawing.Point(8, 99)
            Me.textBoxInternetUrl.Size = New System.Drawing.Size(136, 20)
            Me.textBoxInternetUrl.Text = ""
            ' 
            ' textBoxInternetLogin
            ' 
            Me.textBoxInternetLogin.Location = New System.Drawing.Point(8, 123)
            Me.textBoxInternetLogin.Size = New System.Drawing.Size(136, 20)
            Me.textBoxInternetLogin.Text = ""
            ' 
            ' textBoxInternetPwd
            ' 
            Me.textBoxInternetPwd.PasswordChar = "*"
            Me.textBoxInternetPwd.Location = New System.Drawing.Point(8, 147)
            Me.textBoxInternetPwd.Size = New System.Drawing.Size(136, 20)
            Me.textBoxInternetPwd.Text = ""
            ' 
            ' textBoxSubscriber
            ' 
            Me.textBoxSubscriber.Location = New System.Drawing.Point(8, 171)
            Me.textBoxSubscriber.Size = New System.Drawing.Size(136, 20)
            Me.textBoxSubscriber.Text = "SQLCESub#1"
            ' 
            ' radioButtonSQLAuth
            ' 
            Me.radioButtonSQLAuth.Checked = True
            Me.radioButtonSQLAuth.Location = New System.Drawing.Point(8, 8)
            Me.radioButtonSQLAuth.Size = New System.Drawing.Size(56, 16)
            Me.radioButtonSQLAuth.Text = "SQL"
            ' 
            ' radioButtonWinAuth
            ' 
            Me.radioButtonWinAuth.Location = New System.Drawing.Point(64, 8)
            Me.radioButtonWinAuth.Size = New System.Drawing.Size(80, 16)
            Me.radioButtonWinAuth.Text = "Windows"
            ' 
            ' buttonSync
            ' 
            Me.buttonSync.Location = New System.Drawing.Point(120, 200)
            Me.buttonSync.Size = New System.Drawing.Size(112, 24)
            Me.buttonSync.Text = "Synchronize"
            ' 
            ' panelProps
            ' 
            Me.panelProps.Controls.Add(Me.radioButtonWinAuth)
            Me.panelProps.Controls.Add(Me.radioButtonSQLAuth)
            Me.panelProps.Controls.Add(Me.textBoxSubscriber)
            Me.panelProps.Controls.Add(Me.textBoxInternetPwd)
            Me.panelProps.Controls.Add(Me.textBoxInternetLogin)
            Me.panelProps.Controls.Add(Me.textBoxInternetUrl)
            Me.panelProps.Controls.Add(Me.textBoxPassword)
            Me.panelProps.Controls.Add(Me.textBoxUserID)
            Me.panelProps.Controls.Add(Me.textBoxPublisher)
            Me.panelProps.Location = New System.Drawing.Point(88, 0)
            Me.panelProps.Size = New System.Drawing.Size(152, 200)
            ' 
            ' buttonReset
            ' 
            Me.buttonReset.Location = New System.Drawing.Point(8, 200)
            Me.buttonReset.Size = New System.Drawing.Size(104, 24)
            Me.buttonReset.Text = "Reset"
            ' 
            ' FormRepl
            ' 
            Me.ClientSize = New System.Drawing.Size(242, 264)
            Me.Controls.Add(buttonReset)
            Me.Controls.Add(buttonSync)
            Me.Controls.Add(labelSubscriber)
            Me.Controls.Add(labelInternetPwd)
            Me.Controls.Add(labelInternetLogin)
            Me.Controls.Add(labelInternetUrl)
            Me.Controls.Add(labelPassword)
            Me.Controls.Add(labelUserID)
            Me.Controls.Add(labelSqlServer)
            Me.Controls.Add(labelAuth)
            Me.Controls.Add(panelProps)
            Me.Text = "Replication"
        End Sub 'InitializeComponent


        Friend Sub InitReplSync()

            init = True

            Try
                ' This will execute only if the database exists.
                '
                If File.Exists(dataNorthwind.LocalDatabaseFile) Then

                    ' Open connection to the Northwind database.
                    '
                    If ConnectionState.Closed = dataNorthwind.NorthwindConnection.State Then
                        dataNorthwind.NorthwindConnection.Open()
                    End If

                    ' Load the connection information.
                    '
                    LoadAppProps()

                    init = False
                End If
            Catch e As SqlCeException
                ' Error handling mechanism
                '
                NorthwindData.ShowErrors(e)
            Catch
            End Try

            ' If we're unable to load the connection information from "ApplicationProperties" table, 
            ' then use the following default setting, enable the controls, and set the sync button text to "Initialize".
            ' Otherwise, disable the connection info controls and set the sync button text to "Synchronize".
            '
            If init Then
                Me.textBoxInternetUrl.Text = "http://<IIS Server>/<virtual directory>/sscesa20.dll"
                Me.textBoxInternetLogin.Text = [String].Empty
                Me.textBoxInternetPwd.Text = [String].Empty
                Me.textBoxPublisher.Text = "<Database Server>"
                Me.textBoxUserID.Text = "sa"
                Me.textBoxPassword.Text = ""
                Me.radioButtonSQLAuth.Checked = True
                Me.panelProps.Enabled = True
                buttonSync.Text = "Initialize"
                Me.textBoxSubscriber.Text = "SQLCESub#1"
                Me.panelProps.Enabled = True
                buttonSync.Text = "Initialize"
            Else
                Me.panelProps.Enabled = False
                buttonSync.Text = "Synchronize"
            End If
        End Sub 'InitReplSync


        ' This function loads the connection information info from the "ApplicationProperties" table.
        '
        Private Sub LoadAppProps()

            Dim drAppProp As SqlCeDataReader = Nothing

            ' Create a SqlCeCommand object associated with the connection to NorthwindDemo database.
            '
            Dim cmd As SqlCeCommand = dataNorthwind.NorthwindConnection.CreateCommand()

            ' Load the connect information from the ApplicationProperties table in the NorthwindDemo database.
            '
            cmd.CommandText = "SELECT InternetURL, InternetLogin, InternetPassword, Publisher, PublisherLogin, PublisherPassword, PublisherSecurityMode, Subscriber " & _
                              "FROM ApplicationProperties;"

            Try
                drAppProp = cmd.ExecuteReader()
                If drAppProp.Read() Then
                    Dim index As Integer

                    ' Get the Internet URL data.
                    '
                    index = drAppProp.GetOrdinal("InternetURL")
                    If Not drAppProp.IsDBNull(index) Then
                        Me.textBoxInternetUrl.Text = drAppProp.GetString(index)
                    Else
                        Me.textBoxInternetUrl.Text = ""
                    End If

                    ' Get the Internet login data.
                    '
                    index = drAppProp.GetOrdinal("InternetLogin")
                    If Not drAppProp.IsDBNull(index) Then
                        Me.textBoxInternetLogin.Text = drAppProp.GetString(index)
                    Else
                        Me.textBoxInternetLogin.Text = ""
                    End If

                    ' Get the Internet password data.
                    '
                    index = drAppProp.GetOrdinal("InternetPassword")
                    If Not drAppProp.IsDBNull(index) Then
                        Me.textBoxInternetPwd.Text = drAppProp.GetString(index)
                    Else
                        Me.textBoxInternetPwd.Text = ""
                    End If

                    ' Get the publisher data.
                    '
                    index = drAppProp.GetOrdinal("Publisher")
                    If Not drAppProp.IsDBNull(index) Then
                        Me.textBoxPublisher.Text = drAppProp.GetString(index)
                    Else
                        Me.textBoxPublisher.Text = ""
                    End If

                    ' Get the publisher login data.
                    '
                    index = drAppProp.GetOrdinal("PublisherLogin")
                    If Not drAppProp.IsDBNull(index) Then
                        Me.textBoxUserID.Text = drAppProp.GetString(index)
                    Else
                        Me.textBoxUserID.Text = ""
                    End If

                    ' Get the publisher password data.
                    '
                    index = drAppProp.GetOrdinal("PublisherPassword")
                    If Not drAppProp.IsDBNull(index) Then
                        Me.textBoxPassword.Text = drAppProp.GetString(index)
                    Else
                        Me.textBoxPassword.Text = ""
                    End If

                    ' Get the publisher security mode data.
                    '
                    index = drAppProp.GetOrdinal("PublisherSecurityMode")
                    If Not drAppProp.IsDBNull(index) Then
                        If (drAppProp.GetByte(index) = 1) Then
                            Me.radioButtonSQLAuth.Checked = True
                        Else
                            Me.radioButtonSQLAuth.Checked = False
                        End If
                    Else
                        Me.radioButtonSQLAuth.Checked = True
                    End If

                    ' Get the subscriber data.
                    '
                    index = drAppProp.GetOrdinal("Subscriber")
                    If Not drAppProp.IsDBNull(index) Then
                        Me.textBoxSubscriber.Text = drAppProp.GetString(index)
                    Else
                        Me.textBoxSubscriber.Text = ""
                    End If
                End If
            Finally
                drAppProp.Close()
            End Try

        End Sub 'LoadAppProps


        ' This function saves the connecting information in the "ApplicationProperties" table.
        '
        Private Sub SaveAppProps()

            ' Create the "ApplicationProperties" table.
            '
            Dim cmd As SqlCeCommand = dataNorthwind.NorthwindConnection.CreateCommand()
            cmd.CommandText = "CREATE TABLE ApplicationProperties (" & _
                                "InternetURL NTEXT, " & _
                                "InternetLogin NVARCHAR(255), " & _
                                "InternetPassword NVARCHAR(255), " & _
                                "Publisher NVARCHAR(255), " & _
                                "PublisherLogin NVARCHAR(255), " & _
                                "PublisherPassword NVARCHAR(255), " & _
                                "PublisherSecurityMode TINYINT, " & _
                                "Subscriber NVARCHAR(255));"
            cmd.ExecuteNonQuery()

            ' Save the connection information
            '
            cmd.CommandText = "INSERT INTO ApplicationProperties " & _
                                "(InternetURL, InternetLogin, InternetPassword, Publisher, PublisherLogin, PublisherPassword, PublisherSecurityMode, Subscriber) " & _
                                "VALUES (?, ?, ?, ?, ?, ?, ?, ?);"
            cmd.Parameters.Add("@p1", Me.textBoxInternetUrl.Text)
            cmd.Parameters.Add("@p2", Me.textBoxInternetLogin.Text)
            cmd.Parameters.Add("@p3", Me.textBoxInternetPwd.Text)
            cmd.Parameters.Add("@p4", Me.textBoxPublisher.Text)
            cmd.Parameters.Add("@p5", Me.textBoxUserID.Text)
            cmd.Parameters.Add("@p6", Me.textBoxPassword.Text)
            If Me.radioButtonSQLAuth.Checked Then
                cmd.Parameters.Add("@p7", 1)
            Else
                cmd.Parameters.Add("@p7", 0)
            End If
            cmd.Parameters.Add("@p8", Me.textBoxSubscriber.Text)
            cmd.ExecuteNonQuery()

        End Sub 'SaveAppProps


        ' This function synchronizes the device database with the server database.
        '
        Private Sub ReplSync()

            Dim replNorthwind As New SqlCeReplication
            Dim changed As Boolean = False

            ' Set the Internet properties.
            '
            replNorthwind.InternetUrl = textBoxInternetUrl.Text
            replNorthwind.InternetLogin = textBoxInternetLogin.Text
            replNorthwind.InternetPassword = textBoxInternetPwd.Text

            ' Set the Publisher properties.
            '
            replNorthwind.Publisher = textBoxPublisher.Text
            replNorthwind.PublisherDatabase = publisherDatabase
            replNorthwind.Publication = publication
            If radioButtonSQLAuth.Checked Then
                replNorthwind.PublisherSecurityMode = SecurityType.DBAuthentication
            Else
                replNorthwind.PublisherSecurityMode = SecurityType.NTAuthentication
            End If
            replNorthwind.PublisherLogin = textBoxUserID.Text
            replNorthwind.PublisherPassword = textBoxPassword.Text

            ' Set the Subscriber properties.
            '
            replNorthwind.SubscriberConnectionString = dataNorthwind.LocalConnString
            replNorthwind.Subscriber = textBoxSubscriber.Text

            ' Starts the cursor icon since this function may take some time.
            '
            System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.WaitCursor()

            Try

                If dataNorthwind.NorthwindConnection.State = ConnectionState.Open Then dataNorthwind.NorthwindConnection.Close()

                If init Then

                    ' Delete the database if the database exists.
                    ' 
                    If File.Exists(dataNorthwind.LocalDatabaseFile) Then
                        File.Delete(dataNorthwind.LocalDatabaseFile)
                    End If

                    ' Clear the dataset if it exists.
                    '
                    If (Not (dataNorthwind.NorthwindDataSet Is Nothing)) Then
                        dataNorthwind.NorthwindDataSet.Clear()
                    End If

                    ' Create the Local SSCE Database subscription.
                    '
                    replNorthwind.AddSubscription(AddOption.CreateDatabase)
                End If

                ' Synchronize to the server database to populate the Subscription.
                '
                replNorthwind.Synchronize()

                System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.Default()

                ' Display the synchronization results.
                '
                MessageBox.Show("Synchronization Complete:" & ControlChars.Cr & _
                                "Publisher changes = " & replNorthwind.PublisherChanges.ToString() & ControlChars.Cr & _
                                "Publisher conflicts = " & replNorthwind.PublisherConflicts.ToString() & ControlChars.Cr & _
                                "Subscriber changes = " & replNorthwind.SubscriberChanges.ToString(), _
                                "Northwind", _
                                MessageBoxButtons.OK, _
                                MessageBoxIcon.Asterisk, _
                                MessageBoxDefaultButton.Button1)

                If replNorthwind.PublisherChanges > 0 Or replNorthwind.PublisherConflicts > 0 Then
                    changed = True
                End If

            Catch e As SqlCeException
                ' Error handling mechanism
                '
                System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.Default()
                NorthwindData.ShowErrors(e)

                If (init) Then
                    form_Northwind.UpdateMenu()
                    Return
                End If
            Catch e As Exception
                ' Error handling mechanism
                '
                System.Windows.Forms.Cursor.Current = System.Windows.Forms.Cursors.Default()
                MessageBox.Show(e.Message, "Northwind")
                If (init) Then
                    form_Northwind.UpdateMenu()
                    Return
                End If
            Finally
                ' Dispose of the Replication Object
                '
                replNorthwind.Dispose()
            End Try

            Try
                ' Open the connection to the Northwind database.
                '
                dataNorthwind.NorthwindConnection.Open()

                If init Then
                    ' Save the connection information
                    '
                    SaveAppProps()

                    ' Set the initialization flag to false and disable the connection information controls.
                    '
                    init = False
                    Me.buttonSync.Text = "Synchronize"
                    Me.panelProps.Enabled = False
                End If

                If changed Then form_Northwind.Refresh()

            Catch e As SqlCeException
                NorthwindData.ShowErrors(e)
            Catch e As Exception
                MessageBox.Show("Save connection information" & e.Message, "Northwind")
            End Try

        End Sub 'ReplSync


        Private Sub radioButtonSQLAuth_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles radioButtonSQLAuth.CheckedChanged

            If Me.radioButtonSQLAuth.Checked Then
                Me.textBoxUserID.Enabled = True
                Me.textBoxPassword.Enabled = True
            Else
                Me.textBoxUserID.Enabled = False
                Me.textBoxPassword.Enabled = False
            End If

        End Sub 'radioButtonSQLAuth_CheckedChanged


        Private Sub buttonReset_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles buttonReset.Click

            If MessageBox.Show("You are about to reset all data. Continuing will discard all changes.", _
                               "Northwind", _
                               MessageBoxButtons.OKCancel, _
                               MessageBoxIcon.Asterisk, _
                               MessageBoxDefaultButton.Button1) _
                = DialogResult.OK Then
                If dataNorthwind.NorthwindConnection.State = ConnectionState.Open Then
                    dataNorthwind.NorthwindConnection.Close()
                End If

                Try
                    If File.Exists(dataNorthwind.LocalDatabaseFile) Then
                        File.Delete(dataNorthwind.LocalDatabaseFile)
                    End If

                    ' Clear the dataset if it exists.
                    '
                    If (Not (dataNorthwind.NorthwindDataSet Is Nothing)) Then
                        dataNorthwind.NorthwindDataSet.Clear()
                    End If
                Catch ex As Exception
                    MessageBox.Show(ex.Message, "Northwind")
                    Return
                End Try

                init = True
                Me.panelProps.Enabled = True
                buttonSync.Text = "Initialize"

                form_Northwind.UpdateMenu()
            End If

        End Sub 'buttonReset_Click


        Private Sub buttonSync_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles buttonSync.Click

            If MessageBox.Show("You are about to synchronize your data. Continue?", _
                               "Northwind", _
                               MessageBoxButtons.OKCancel, _
                               MessageBoxIcon.Asterisk, _
                               MessageBoxDefaultButton.Button1) _
                = DialogResult.OK Then
                ReplSync()

                form_Northwind.UpdateMenu()
            End If

        End Sub 'buttonSync_Click

    End Class 'ControlReplication

End Namespace 'Microsoft.Sql.SqlCe.Samples.Cs.NorthwindCe