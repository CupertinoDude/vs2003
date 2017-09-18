 '------------------------------------------------------------------------------
'  <copyright from='1997' to='2002' company='Microsoft Corporation'>
'   Copyright (c) Microsoft Corporation. All Rights Reserved.
'
'   This source code is intended only as a supplement to Microsoft
'   Development Tools and/or on-line documentation.  See these other
'   materials for detailed information regarding Microsoft code samples.
'
'   </copyright>
'-------------------------------------------------------------------------------
'
' File: StockQuoteForm.vb
'
' Purpose: This application uses a web service to retrieve a DataSet
'			containing example quote data. It displays the data with
'			form components using DataBinding.
'
' Notes: 
'          Before building and deploying this sample, you need to have
'			access to a server running the StockQuoteService web service.
'			You will need to add a web reference to your server in this
'			project and you will need to replace the string "YOURSERVER"
'			in this file with the name of your target web server. Please
'			read the Samples documentation for more information.
'
'			To add the correct web reference in this sample: 
'			1.  On the View menu, click Solution Explorer. 
'			2.  In Solution Explorer, right-click References, and click
'			    Add Web Reference. 
'			3.  In Add Web Reference dialog box, do the following: 
'			    Type http://YOURSERVER/StockQuoteService/StockQuoter.asmx
'			    where YOURSERVER is the name of the computer hosting the
'			    Web Service Provider. 
'			4.  Press ENTER to verify that the Web Service is available. 
'			5.  Click the Add Reference button to add the reference to the project. 
'
Option Explicit On 
Option Strict On

Imports System
Imports System.Data
Imports System.IO
Imports System.Reflection
Imports System.Drawing
Imports System.Collections
Imports System.Windows.Forms
Imports StockQuote.YOURSERVER

Namespace StockQuote
    '/ <summary>
    '/ Summary description for Form1.
    '/ </summary>
    Public Class StockQuoteForm
        Inherits System.Windows.Forms.Form
        Private WithEvents btnClear As System.Windows.Forms.Button
        Private WithEvents btnGo As System.Windows.Forms.Button
        Private WithEvents chkAutoRefresh As System.Windows.Forms.CheckBox
        Private WithEvents comboBox1 As System.Windows.Forms.ComboBox
        Private WithEvents listBox1 As System.Windows.Forms.ListBox
        Private pictureBox1 As System.Windows.Forms.PictureBox
        Private WithEvents radioButton1 As System.Windows.Forms.RadioButton
        Private WithEvents radioButton2 As System.Windows.Forms.RadioButton
        Private WithEvents radioButton3 As System.Windows.Forms.RadioButton
        Private WithEvents radioButton4 As System.Windows.Forms.RadioButton
        Private WithEvents tmrTicker As System.Windows.Forms.Timer
        Private txtQuoteData As System.Windows.Forms.TextBox
        Private txtStatus As System.Windows.Forms.TextBox


        ' The app can being in one of three states, specified by 
        ' the following enum and associated currectState value.
        Private Enum States
            UserUpdate = 1
            AutoUpdate = 2
            Stopped = 3
        End Enum 'States

        Private currentState As States = States.UserUpdate

        Private Enum Delays
            Delay1 = 5
            Delay2 = 15
            Delay3 = 30
            Delay4 = 60
        End Enum 'Delays

        Private currentDelay As Delays = Delays.Delay1

        ' Finally, we create a reference to the web service we are
        ' querying, and declare a class-scope DataSet to hold the
        ' result of each query.
        Private sq As StockQuoter
        Private ds As DataSet


        '/ <summary>
        '/ Additional constructor code is provided in StockQuoteForm
        '/ after InitializeComponent() to populate the controls with
        '/ data from the web service.
        '/ </summary>

        Public Sub New()
            '
            ' Required for Windows Form Designer support
            '
            InitializeComponent()

            ' 
            ' Additional contructor code to ensure that the
            ' class starts in a suitable state
            '
            radioButton1.Text = CInt(Delays.Delay1).ToString() + " seconds"
            radioButton2.Text = CInt(Delays.Delay2).ToString() + " seconds"
            radioButton3.Text = CInt(Delays.Delay3).ToString() + " seconds"
            radioButton4.Text = CInt(Delays.Delay4).ToString() + " seconds"

            radioButton1.Checked = True

            changeDelay(Delays.Delay1)
            changeState(States.UserUpdate)

            tmrTicker.Enabled = False

        End Sub 'New


        '/ <summary>
        '/ Clean up any resources being used.
        '/ </summary>
        Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
            MyBase.Dispose(disposing)
        End Sub 'Dispose

#Region "Windows Form Designer generated code"
        '/ Required method for Designer support - do not modify
        '/ the contents of this method with the code editor.
        '/ </summary>
        Private Sub InitializeComponent()
            Me.comboBox1 = New System.Windows.Forms.ComboBox
            Me.btnGo = New System.Windows.Forms.Button
            Me.pictureBox1 = New System.Windows.Forms.PictureBox
            Me.btnClear = New System.Windows.Forms.Button
            Me.chkAutoRefresh = New System.Windows.Forms.CheckBox
            Me.radioButton1 = New System.Windows.Forms.RadioButton
            Me.radioButton2 = New System.Windows.Forms.RadioButton
            Me.radioButton3 = New System.Windows.Forms.RadioButton
            Me.radioButton4 = New System.Windows.Forms.RadioButton
            Me.listBox1 = New System.Windows.Forms.ListBox
            Me.txtQuoteData = New System.Windows.Forms.TextBox
            Me.tmrTicker = New System.Windows.Forms.Timer
            Me.txtStatus = New System.Windows.Forms.TextBox
            '
            'comboBox1
            '
            Me.comboBox1.Location = New System.Drawing.Point(8, 8)
            Me.comboBox1.Size = New System.Drawing.Size(80, 22)
            '
            'btnGo
            '
            Me.btnGo.Location = New System.Drawing.Point(8, 168)
            Me.btnGo.Size = New System.Drawing.Size(72, 24)
            '
            'pictureBox1
            '
            Me.pictureBox1.Location = New System.Drawing.Point(184, 168)
            Me.pictureBox1.Size = New System.Drawing.Size(45, 55)
            '
            'btnClear
            '
            Me.btnClear.Location = New System.Drawing.Point(88, 168)
            Me.btnClear.Size = New System.Drawing.Size(72, 24)
            Me.btnClear.Text = "Clear"
            '
            'chkAutoRefresh
            '
            Me.chkAutoRefresh.Location = New System.Drawing.Point(8, 216)
            Me.chkAutoRefresh.Size = New System.Drawing.Size(96, 24)
            Me.chkAutoRefresh.Text = "Auto Refresh"
            '
            'radioButton1
            '
            Me.radioButton1.Checked = True
            Me.radioButton1.Enabled = False
            Me.radioButton1.Location = New System.Drawing.Point(16, 240)
            Me.radioButton1.Size = New System.Drawing.Size(96, 24)
            '
            'radioButton2
            '
            Me.radioButton2.Enabled = False
            Me.radioButton2.Location = New System.Drawing.Point(120, 240)
            Me.radioButton2.Size = New System.Drawing.Size(96, 24)
            '
            'radioButton3
            '
            Me.radioButton3.Enabled = False
            Me.radioButton3.Location = New System.Drawing.Point(16, 264)
            Me.radioButton3.Size = New System.Drawing.Size(96, 24)
            '
            'radioButton4
            '
            Me.radioButton4.Enabled = False
            Me.radioButton4.Location = New System.Drawing.Point(120, 264)
            Me.radioButton4.Size = New System.Drawing.Size(96, 24)
            '
            'listBox1
            '
            Me.listBox1.Items.Add("All")
            Me.listBox1.Items.Add("Symbol")
            Me.listBox1.Items.Add("Name")
            Me.listBox1.Items.Add("Last")
            Me.listBox1.Items.Add("Change")
            Me.listBox1.Items.Add("% Change")
            Me.listBox1.Items.Add("Volume")
            Me.listBox1.Location = New System.Drawing.Point(8, 40)
            Me.listBox1.Size = New System.Drawing.Size(80, 72)
            '
            'txtQuoteData
            '
            Me.txtQuoteData.AcceptsReturn = True
            Me.txtQuoteData.Enabled = False
            Me.txtQuoteData.Location = New System.Drawing.Point(96, 8)
            Me.txtQuoteData.Multiline = True
            Me.txtQuoteData.Size = New System.Drawing.Size(136, 120)
            Me.txtQuoteData.Text = "[quote information will be displayed here]"
            '
            'tmrTicker
            '
            '
            'txtStatus
            '
            Me.txtStatus.Enabled = False
            Me.txtStatus.Location = New System.Drawing.Point(8, 136)
            Me.txtStatus.Size = New System.Drawing.Size(224, 22)
            Me.txtStatus.Text = "Current info goes here"
            '
            'StockQuoteForm
            '
            Me.ClientSize = New System.Drawing.Size(240, 295)
            Me.Controls.Add(Me.txtStatus)
            Me.Controls.Add(Me.txtQuoteData)
            Me.Controls.Add(Me.listBox1)
            Me.Controls.Add(Me.radioButton4)
            Me.Controls.Add(Me.radioButton3)
            Me.Controls.Add(Me.radioButton2)
            Me.Controls.Add(Me.radioButton1)
            Me.Controls.Add(Me.chkAutoRefresh)
            Me.Controls.Add(Me.btnClear)
            Me.Controls.Add(Me.pictureBox1)
            Me.Controls.Add(Me.btnGo)
            Me.Controls.Add(Me.comboBox1)
            Me.Text = "StockQuote VB"

        End Sub 'InitializeComponent
#End Region


        '/ <summary>
        '/ The main entry point for the application.
        '/ </summary>
        Public Shared Sub Main()
            Application.Run(New StockQuoteForm)
        End Sub 'Main


        Private Sub comboBox1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles comboBox1.SelectedIndexChanged
            updateDisplayedData()
        End Sub 'comboBox1_SelectedIndexChanged


        '/ <summary>
        '/ Changes the way that the application requests data from continuous to 
        '/ user driven. When in continuous mode, btnGo will toggle between "Go!"
        '/ and "Stop". When in user driver mode, btnGo will be used to "Update".
        '/ </summary>
        '/ <param name="sender"></param>
        '/ <param name="e"></param>
        Private Sub chkAutoRefresh_CheckStateChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkAutoRefresh.CheckStateChanged
            radioButton1.Enabled = chkAutoRefresh.Checked
            radioButton2.Enabled = chkAutoRefresh.Checked
            radioButton3.Enabled = chkAutoRefresh.Checked
            radioButton4.Enabled = chkAutoRefresh.Checked

            If chkAutoRefresh.Checked Then
                changeState(States.AutoUpdate)
            Else
                changeState(States.UserUpdate)
            End If
        End Sub 'chkAutoRefresh_CheckStateChanged


        '/ <summary>
        '/ Requests a new dataset from the web service. In this version, the
        '/ timer is stopped and then restarted to allow for possible delays
        '/ in the web service greater than the timer delay.
        '/ </summary>
        '/ <param name="sender"></param>
        '/ <param name="e"></param>
        Private Sub tmrTicker_Tick(ByVal sender As Object, ByVal e As System.EventArgs) Handles tmrTicker.Tick
            tmrTicker.Enabled = False
            updateQuote()
            tmrTicker.Enabled = True
        End Sub 'tmrTicker_Tick


        Private Sub radioButton1_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles radioButton1.CheckedChanged
            If radioButton1.Checked Then
                changeDelay(Delays.Delay1)
            End If
        End Sub 'radioButton1_CheckedChanged

        Private Sub radioButton2_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles radioButton2.CheckedChanged
            If radioButton2.Checked Then
                changeDelay(Delays.Delay2)
            End If
        End Sub 'radioButton2_CheckedChanged

        Private Sub radioButton3_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles radioButton3.CheckedChanged
            If radioButton3.Checked Then
                changeDelay(Delays.Delay3)
            End If
        End Sub 'radioButton3_CheckedChanged

        Private Sub radioButton4_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles radioButton4.CheckedChanged
            If radioButton4.Checked Then
                changeDelay(Delays.Delay4)
            End If
        End Sub 'radioButton4_CheckedChanged


        Private Sub btnGo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGo.Click
            Select Case currentState
                Case States.AutoUpdate
                    changeState(States.Stopped)

                Case States.Stopped
                    changeState(States.AutoUpdate)

                Case States.UserUpdate
                    updateQuote()
            End Select
        End Sub 'btnGo_Click


        Private Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
            clearQuote()
        End Sub 'btnClear_Click


        '/ <summary>
        '/ Pauses the ticker and then gets new quote data.
        '/ </summary>
        Private Sub updateQuote()
            txtStatus.Text = "Updating quote for " + CStr(comboBox1.Items(comboBox1.SelectedIndex))

            Try
                If (sq Is Nothing) Then
                    sq = New StockQuoter
                End If
                ds = sq.getQuoteDataSet()
                txtStatus.Text = "Retreived dataset from web service"
                updateDisplayedData()
                txtStatus.Text = "Done at " + CStr(System.DateTime.Now)

            Catch e As Exception
                txtStatus.Text = "Error updating quote for " + CStr(comboBox1.Items(comboBox1.SelectedIndex)) + ": " + e.Message
                ds = Nothing
            End Try
        End Sub 'updateQuote


        '/ <summary>
        '/ This method will take any available data that is held in the DataSet ds.
        '/ If the dataset is null, it clears the quote data box and returns. If the
        '/ dataset is valid, it attempts to find the required stock and associated 
        '/ value (or if "All", it formats all the stock's values for display)
        '/ </summary>

        Private Sub updateDisplayedData()

            Dim symbol As String
            Dim item As String
            Dim i As Integer
            Dim change As String

            ' Find out which symbol has been selected
            If comboBox1.SelectedIndex = -1 Then
                symbol = ""
            Else
                symbol = CStr(comboBox1.Items(comboBox1.SelectedIndex))
            End If

            ' Find what data item to display
            If listBox1.SelectedIndex = -1 Then
                item = "All"
            Else
                item = CStr(listBox1.Items(listBox1.SelectedIndex))
            End If


            ' Check that we have some data to show
            If ds Is Nothing Then
                txtStatus.Text = "Dataset is null"
                clearQuote()
            Else
                ' Check that the symbol chosen is OK
                If symbol.Equals("") Then
                    txtStatus.Text = "Symbol is null"
                    clearQuote()
                Else

                    txtStatus.Text = "Finding " + item + " for " + symbol
                    txtQuoteData.Text = ""

                    Try

                        ' Iterate through the records in the dataset
                        ' to find the data for the symbols selected
                        For i = 0 To (ds.Tables(0).Rows.Count) - 1
                            Dim s As String
                            s = CStr(ds.Tables(0).Rows(i)("Symbol"))

                            ' If we have found the symbol, then update the display
                            If s.Equals(symbol) Then

                                change = CStr(ds.Tables(0).Rows(i)("Change")).Substring(0, 1)

                                ' Either show all the quote data...
                                If item.Equals("All") Then
                                    txtQuoteData.Text = _
                                        CStr(ds.Tables(0).Rows(i)("Symbol")) + ControlChars.CrLf + _
                                        CStr(ds.Tables(0).Rows(i)("Name")) + ControlChars.CrLf + _
                                        CStr(ds.Tables(0).Rows(i)("Last")) + ControlChars.CrLf + _
                                        CStr(ds.Tables(0).Rows(i)("Change")) + ControlChars.CrLf + _
                                        CStr(ds.Tables(0).Rows(i)("PercentChange")) + ControlChars.CrLf + _
                                        CStr(ds.Tables(0).Rows(i)("Volume"))

                                    '...or just one item
                                Else
                                    If item.Equals("% Change") Then
                                        txtQuoteData.Text = CStr(ds.Tables(0).Rows(i)("PercentChange"))
                                    Else
                                        txtQuoteData.Text = CStr(ds.Tables(0).Rows(i)(item))
                                    End If
                                End If

                                ' Update the image displayed by pictureBox1 from an embedded 
                                ' resource to reflect the status of the current quote
                                Dim assm As [Assembly]
                                assm = [Assembly].GetExecutingAssembly()
                                Dim str As Stream

                                If change = "-" Then
                                    str = assm.GetManifestResourceStream("StockQuote.down.bmp")
                                Else
                                    If change = "+" Then
                                        str = assm.GetManifestResourceStream("StockQuote.up.bmp")
                                    Else
                                        str = assm.GetManifestResourceStream("StockQuote.even.bmp")
                                    End If
                                End If
                                Dim streamreader As StreamReader
                                streamreader = Nothing
                                streamreader = New StreamReader(str)
                                pictureBox1.Image = New System.Drawing.Bitmap(str)
                            End If
                        Next i

                        txtStatus.Text = "Displaying " + item + " for " + symbol
                    Catch e As Exception
                        txtStatus.Text = "Error updating symbols list"
                        MessageBox.Show(e.Message)
                    End Try
                End If
            End If
        End Sub 'updateDisplayedData


        '/ <summary>
        '/ Updates the text of buttons depending on the current state 
        '/ </summary>
        Private Sub changeState(ByVal newState As States)
            currentState = newState
            Select Case currentState
                Case States.AutoUpdate
                    Me.tmrTicker.Enabled = True
                    btnGo.Text = "Stop"

                Case States.Stopped
                    tmrTicker.Enabled = False
                    btnGo.Text = "Go!"

                Case States.UserUpdate
                    tmrTicker.Enabled = False
                    btnGo.Text = "Update"
            End Select
        End Sub 'changeState


        '/ <summary>
        '/ Changes the Interval for auto-updating quote data
        '/ </summary>
        '/ <param name="newDelay">a valid delay</param>
        Private Sub changeDelay(ByVal newDelay As Delays)
            currentDelay = newDelay
            tmrTicker.Interval = CInt(newDelay) * 1000
        End Sub 'changeDelay



        '/ <summary>
        '/ Abstracts the action of removing all text from the Quote data box.
        '/ </summary>
        '/ 
        Private Sub clearQuote()
            txtQuoteData.Text = ""
        End Sub 'clearQuote


        Private Sub listBox1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles listBox1.SelectedIndexChanged
            updateDisplayedData()
        End Sub 'listBox1_SelectedIndexChanged

        Private Sub StockQuoteForm_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

            ' Ensure that the form is painted before getting busy
            Me.Update()

            ' A call to the web service is made using sq.getQuoteDataSet().
            ' If this succeeds, the dataset is used to fill the list of
            ' available symbols in comboBox1
            Cursor.Current = Cursors.WaitCursor
            Try
                txtStatus.Text = "Updating available symbols list..."
                sq = New StockQuoter
                ds = sq.getQuoteDataSet()
                comboBox1.Items.Clear()
                Dim i As Integer
                For i = 0 To (ds.Tables(0).Rows.Count) - 1
                    comboBox1.Items.Add(ds.Tables(0).Rows(i)("Symbol").ToString())
                Next i
                comboBox1.SelectedIndex = 0
                txtStatus.Text = "Updating available symbols list...done"
            Catch ex As Exception
                txtStatus.Text = "Error updating symbols list. Please check that you are able to access the web from this device."
                MessageBox.Show(ex.Message)
            End Try
            Cursor.Current = Cursors.Default

        End Sub

    End Class 'StockQuoteForm 
End Namespace 'StockQuote