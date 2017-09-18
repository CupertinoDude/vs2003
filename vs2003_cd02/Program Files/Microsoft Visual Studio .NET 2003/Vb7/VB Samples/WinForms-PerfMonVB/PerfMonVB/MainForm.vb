Option Explicit On 
Option Strict On

Imports System
Imports System.Drawing
Imports System.Collections
Imports System.ComponentModel
Imports System.Windows.Forms
Imports System.Data

Namespace PerfMon

    ' Main application window.
    Public Class Form1
        Inherits System.Windows.Forms.Form

        Private MachineName As String = Nothing

        'Number of counters on the monitored machine.
        Private NbrOfCounters As Integer = 0

#Region " Windows Form Designer generated code "

        'The controls added to the form
        Private groupBox1 As System.Windows.Forms.GroupBox
        'The counters treeview control
        Private WithEvents CountersTree As System.Windows.Forms.TreeView
        Private MachineNameText As System.Windows.Forms.TextBox
        Private WithEvents LoadButton As System.Windows.Forms.Button
        Private WithEvents RefreshButton As System.Windows.Forms.Button
        'The TabControl which will hold all the graphics
        Private WithEvents GraphicTabControl As System.Windows.Forms.TabControl

        'The progressBar control which will show the progress on tree load
        Private TreeProgress As System.Windows.Forms.ProgressBar
        'Controls Labels 
        Private label1 As System.Windows.Forms.Label
        Private label2 As System.Windows.Forms.Label
        Private label3 As System.Windows.Forms.Label
        Private label4 As System.Windows.Forms.Label
        Private label5 As System.Windows.Forms.Label
        Private label6 As System.Windows.Forms.Label
        'Display properties selectors
        Private Rows As System.Windows.Forms.ComboBox
        Private Columns As System.Windows.Forms.ComboBox
        Private Frequency As System.Windows.Forms.ComboBox
        Private Thickness As System.Windows.Forms.ComboBox
        Private Density As System.Windows.Forms.ComboBox
        'Main menu and its items (options)
        Private menuItem1 As System.Windows.Forms.MenuItem
        Private mainMenu1 As System.Windows.Forms.MainMenu
        Private WithEvents MenuExit As System.Windows.Forms.MenuItem
        Private WithEvents MenuStopGraphics As System.Windows.Forms.MenuItem
        Private WithEvents MenuStartGraphics As System.Windows.Forms.MenuItem

        'Required designer variable.
        Private components As System.ComponentModel.Container

        Public Sub New()
            InitializeComponent()
            InitControls()
        End Sub 'New

        'Form overrides dispose to clean up the component list.
        Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
            If disposing Then
                If Not (components Is Nothing) Then
                    components.Dispose()
                End If
            End If
            MyBase.Dispose(disposing)
        End Sub

        Private Sub InitializeComponent()
            Me.Rows = New System.Windows.Forms.ComboBox
            Me.label5 = New System.Windows.Forms.Label
            Me.CountersTree = New System.Windows.Forms.TreeView
            Me.label1 = New System.Windows.Forms.Label
            Me.label4 = New System.Windows.Forms.Label
            Me.label3 = New System.Windows.Forms.Label
            Me.label6 = New System.Windows.Forms.Label
            Me.label2 = New System.Windows.Forms.Label
            Me.MenuStopGraphics = New System.Windows.Forms.MenuItem
            Me.groupBox1 = New System.Windows.Forms.GroupBox
            Me.Density = New System.Windows.Forms.ComboBox
            Me.Frequency = New System.Windows.Forms.ComboBox
            Me.Columns = New System.Windows.Forms.ComboBox
            Me.Thickness = New System.Windows.Forms.ComboBox
            Me.RefreshButton = New System.Windows.Forms.Button
            Me.LoadButton = New System.Windows.Forms.Button
            Me.MachineNameText = New System.Windows.Forms.TextBox
            Me.GraphicTabControl = New System.Windows.Forms.TabControl
            Me.TreeProgress = New System.Windows.Forms.ProgressBar
            Me.menuItem1 = New System.Windows.Forms.MenuItem
            Me.MenuStartGraphics = New System.Windows.Forms.MenuItem
            Me.MenuExit = New System.Windows.Forms.MenuItem
            Me.mainMenu1 = New System.Windows.Forms.MainMenu
            Me.groupBox1.SuspendLayout()
            Me.SuspendLayout()
            '
            'Rows
            '
            Me.Rows.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
            Me.Rows.DropDownWidth = 117
            Me.Rows.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!)
            Me.Rows.Items.AddRange(New Object() {"1", "2", "3", "4", "5", "6"})
            Me.Rows.Location = New System.Drawing.Point(312, 48)
            Me.Rows.Name = "Rows"
            Me.Rows.Size = New System.Drawing.Size(56, 21)
            Me.Rows.TabIndex = 7
            '
            'label5
            '
            Me.label5.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!)
            Me.label5.Location = New System.Drawing.Point(456, 24)
            Me.label5.Name = "label5"
            Me.label5.Size = New System.Drawing.Size(64, 16)
            Me.label5.TabIndex = 11
            Me.label5.Text = "Frequency"
            '
            'CountersTree
            '
            Me.CountersTree.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                        Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
            Me.CountersTree.CheckBoxes = True
            Me.CountersTree.ImageIndex = -1
            Me.CountersTree.Location = New System.Drawing.Point(8, 88)
            Me.CountersTree.Name = "CountersTree"
            Me.CountersTree.SelectedImageIndex = -1
            Me.CountersTree.Size = New System.Drawing.Size(240, 292)
            Me.CountersTree.TabIndex = 0
            '
            'label1
            '
            Me.label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!)
            Me.label1.Location = New System.Drawing.Point(8, 27)
            Me.label1.Name = "label1"
            Me.label1.Size = New System.Drawing.Size(88, 14)
            Me.label1.TabIndex = 1
            Me.label1.Text = "Machine Name"
            '
            'label4
            '
            Me.label4.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!)
            Me.label4.Location = New System.Drawing.Point(384, 24)
            Me.label4.Name = "label4"
            Me.label4.Size = New System.Drawing.Size(48, 16)
            Me.label4.TabIndex = 9
            Me.label4.Text = "Columns"
            '
            'label3
            '
            Me.label3.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!)
            Me.label3.Location = New System.Drawing.Point(320, 24)
            Me.label3.Name = "label3"
            Me.label3.Size = New System.Drawing.Size(40, 16)
            Me.label3.TabIndex = 8
            Me.label3.Text = "Rows"
            '
            'label6
            '
            Me.label6.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!)
            Me.label6.Location = New System.Drawing.Point(528, 24)
            Me.label6.Name = "label6"
            Me.label6.Size = New System.Drawing.Size(48, 16)
            Me.label6.TabIndex = 13
            Me.label6.Text = "Density"
            '
            'label2
            '
            Me.label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!)
            Me.label2.Location = New System.Drawing.Point(232, 24)
            Me.label2.Name = "label2"
            Me.label2.Size = New System.Drawing.Size(80, 14)
            Me.label2.TabIndex = 6
            Me.label2.Text = "Line Thickness"
            '
            'MenuStopGraphics
            '
            Me.MenuStopGraphics.Index = 0
            Me.MenuStopGraphics.Text = "&Stop Graphics"
            '
            'groupBox1
            '
            Me.groupBox1.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
                        Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
            Me.groupBox1.Controls.AddRange(New System.Windows.Forms.Control() {Me.Density, Me.label6, Me.Frequency, Me.label5, Me.Columns, Me.label4, Me.label3, Me.Rows, Me.label2, Me.Thickness, Me.RefreshButton, Me.LoadButton, Me.label1, Me.MachineNameText})
            Me.groupBox1.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!, System.Drawing.FontStyle.Bold)
            Me.groupBox1.Location = New System.Drawing.Point(8, 4)
            Me.groupBox1.Name = "groupBox1"
            Me.groupBox1.Size = New System.Drawing.Size(592, 80)
            Me.groupBox1.TabIndex = 3
            Me.groupBox1.TabStop = False
            Me.groupBox1.Text = "Controls"
            '
            'Density
            '
            Me.Density.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
            Me.Density.DropDownWidth = 64
            Me.Density.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!)
            Me.Density.Items.AddRange(New Object() {"20 pts.", "30 pts.", "40 pts.", "50 pts.", "60 pts.", "70 pts.", "80 pts.", "90 pts.", "100 pts."})
            Me.Density.Location = New System.Drawing.Point(528, 48)
            Me.Density.Name = "Density"
            Me.Density.Size = New System.Drawing.Size(56, 21)
            Me.Density.TabIndex = 14
            '
            'Frequency
            '
            Me.Frequency.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
            Me.Frequency.DropDownWidth = 120
            Me.Frequency.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!)
            Me.Frequency.Items.AddRange(New Object() {"1 sec.", "2 sec.", "3 sec.", "4 sec.", "5 sec."})
            Me.Frequency.Location = New System.Drawing.Point(456, 48)
            Me.Frequency.Name = "Frequency"
            Me.Frequency.Size = New System.Drawing.Size(56, 21)
            Me.Frequency.TabIndex = 12
            '
            'Columns
            '
            Me.Columns.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
            Me.Columns.DropDownWidth = 128
            Me.Columns.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!)
            Me.Columns.Items.AddRange(New Object() {"1", "2", "3", "4", "5"})
            Me.Columns.Location = New System.Drawing.Point(384, 48)
            Me.Columns.Name = "Columns"
            Me.Columns.Size = New System.Drawing.Size(56, 21)
            Me.Columns.TabIndex = 10
            '
            'Thickness
            '
            Me.Thickness.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
            Me.Thickness.DropDownWidth = 120
            Me.Thickness.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!)
            Me.Thickness.Items.AddRange(New Object() {"1", "2", "3", "4", "5"})
            Me.Thickness.Location = New System.Drawing.Point(240, 48)
            Me.Thickness.Name = "Thickness"
            Me.Thickness.Size = New System.Drawing.Size(56, 21)
            Me.Thickness.TabIndex = 5
            '
            'RefreshButton
            '
            Me.RefreshButton.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!)
            Me.RefreshButton.Location = New System.Drawing.Point(120, 50)
            Me.RefreshButton.Name = "RefreshButton"
            Me.RefreshButton.Size = New System.Drawing.Size(104, 24)
            Me.RefreshButton.TabIndex = 4
            Me.RefreshButton.Text = "&Refresh Display"
            '
            'LoadButton
            '
            Me.LoadButton.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!)
            Me.LoadButton.Location = New System.Drawing.Point(8, 50)
            Me.LoadButton.Name = "LoadButton"
            Me.LoadButton.Size = New System.Drawing.Size(96, 24)
            Me.LoadButton.TabIndex = 3
            Me.LoadButton.Text = "&Load Counters"
            '
            'MachineNameText
            '
            Me.MachineNameText.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!)
            Me.MachineNameText.Location = New System.Drawing.Point(104, 24)
            Me.MachineNameText.Name = "MachineNameText"
            Me.MachineNameText.Size = New System.Drawing.Size(120, 20)
            Me.MachineNameText.TabIndex = 1
            Me.MachineNameText.Text = ""
            '
            'GraphicTabControl
            '
            Me.GraphicTabControl.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                        Or System.Windows.Forms.AnchorStyles.Left) _
                        Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
            Me.GraphicTabControl.Location = New System.Drawing.Point(256, 88)
            Me.GraphicTabControl.Name = "GraphicTabControl"
            Me.GraphicTabControl.SelectedIndex = 0
            Me.GraphicTabControl.Size = New System.Drawing.Size(344, 292)
            Me.GraphicTabControl.TabIndex = 4
            '
            'TreeProgress
            '
            Me.TreeProgress.Anchor = CType(((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left) _
                        Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
            Me.TreeProgress.Location = New System.Drawing.Point(8, 383)
            Me.TreeProgress.Name = "TreeProgress"
            Me.TreeProgress.Size = New System.Drawing.Size(592, 13)
            Me.TreeProgress.TabIndex = 5
            Me.TreeProgress.Visible = False
            '
            'menuItem1
            '
            Me.menuItem1.Index = 0
            Me.menuItem1.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuStopGraphics, Me.MenuStartGraphics, Me.MenuExit})
            Me.menuItem1.Text = "&Options"
            '
            'MenuStartGraphics
            '
            Me.MenuStartGraphics.Index = 1
            Me.MenuStartGraphics.Text = "Sta&rt Graphics"
            '
            'MenuExit
            '
            Me.MenuExit.Index = 2
            Me.MenuExit.Text = "&Exit"
            '
            'mainMenu1
            '
            Me.mainMenu1.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.menuItem1})
            '
            'Form1
            '
            Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
            Me.ClientSize = New System.Drawing.Size(603, 396)
            Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.TreeProgress, Me.GraphicTabControl, Me.groupBox1, Me.CountersTree})
            Me.Menu = Me.mainMenu1
            Me.Name = "Form1"
            Me.groupBox1.ResumeLayout(False)
            Me.ResumeLayout(False)

        End Sub 'InitializeComponent

#End Region

        'Set the initial values for the controls.
        Private Sub InitControls()
            Rows.SelectedIndex = 1
            Columns.SelectedIndex = 1
            Thickness.SelectedIndex = 0
            Frequency.SelectedIndex = 0
            Density.SelectedIndex = 0
            'Default to the local machine.
            MachineNameText.Text = Environment.MachineName
        End Sub 'InitControls

        'The load button is in charge of filling up the treeview.
        Private Sub LoadButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles LoadButton.Click
            ClearDisplay()
            LoadTreeView()
        End Sub

        'Eliminate the old data.
        Private Sub ClearDisplay()
            Dim GT As GraphicTab
            For Each GT In GraphicTabControl.TabPages
                GT.Controls.Clear()
            Next GT
            GraphicTabControl.TabPages.Clear()
        End Sub 'ClearDisplay


        'Load the treeView nodes.
        Private Sub LoadTreeView()
            Dim NoOfNodes As Integer = 0
            Dim Root As System.Windows.Forms.TreeNode = Nothing

            LoadButton.Enabled = False

            If MachineNameText.Text.Equals("") Then
                MachineNameText.Text = Environment.MachineName
            End If
            MachineName = MachineNameText.Text

            'Get the progressBar max val.
            NoOfNodes = CountNodes()
            If NoOfNodes = -1 Then
                'The machine is not accessible.
                Root = New System.Windows.Forms.TreeNode(MachineName + " cannot be accessed !")
                CountersTree.Nodes.Clear()
                CountersTree.Nodes.Add(Root)
                LoadButton.Enabled = True
                Return
            End If
            TreeProgress.Maximum = NoOfNodes
            TreeProgress.Value = 0
            TreeProgress.Visible = True

            Dim PCCategories As System.Diagnostics.PerformanceCounterCategory() = Nothing
            'Read all categories.
            Try
                PCCategories = System.Diagnostics.PerformanceCounterCategory.GetCategories(MachineName)
            Catch ex As Exception
                MsgBox(ex.Message, , "MainForm")
            End Try

            'Sort the categories alphabetically.

            Dim TmpCategNames() As String = New [String](PCCategories.Length) {}
            Dim Index As Integer = 0
            Dim PCC As System.Diagnostics.PerformanceCounterCategory
            For Each PCC In PCCategories
                TmpCategNames(Index) = PCC.CategoryName
                Index += 1
            Next PCC
            System.Array.Sort(TmpCategNames, PCCategories, 0, PCCategories.Length)
            'Create the tree root.
            Root = New System.Windows.Forms.TreeNode(MachineName + " *** No. of Counters = " + NbrOfCounters.ToString())
            Me.Text = MachineName
            'Wipe out of the old nodes.
            CountersTree.Nodes.Clear()
            'Start filling out the new data.
            CountersTree.Nodes.Add(Root)

            For Each PCC In PCCategories
                Dim InstanceNames As String()
                Dim InstancesExist As Boolean = True

                'Determine if instances of this counter exist.
                Try
                    InstanceNames = PCC.GetInstanceNames()
                Catch ex As System.InvalidOperationException
                    InstancesExist = False
                End Try

                UpdateProgressBar(TreeProgress)

                'If no instances exist then don't bother adding it to the tree.
                If InstancesExist Then
                    'Create a node in the tree.
                    Dim CategoryNode As New System.Windows.Forms.TreeNode(PCC.CategoryName)
                    Root.Nodes.Add(CategoryNode)

                    If InstanceNames.Length > 0 Then 'Need the instance nodes.
                        Dim InstanceName As String
                        For Each InstanceName In InstanceNames
                            'Create another node in the tree.
                            Dim InstanceNode As New System.Windows.Forms.TreeNode(InstanceName)
                            'Don't block the system by loading data.
                            'Some machines have a huge number of counters.
                            System.Windows.Forms.Application.DoEvents()
                            CategoryNode.Nodes.Add(InstanceNode)
                            UpdateProgressBar(TreeProgress)
                            Try
                                Dim PerformanceCounter As System.Diagnostics.PerformanceCounter
                                For Each PerformanceCounter In PCC.GetCounters(InstanceName)
                                    InstanceNode.Nodes.Add(PerformanceCounter.CounterName)
                                    UpdateProgressBar(TreeProgress)
                                Next PerformanceCounter
                            Catch
                            End Try
                        Next InstanceName 'Some Category didn't have this InstanceName.
                    Else
                        Dim PerformanceCounter As System.Diagnostics.PerformanceCounter
                        For Each PerformanceCounter In PCC.GetCounters()
                            'Insert a leaf in the tree.
                            CategoryNode.Nodes.Add(PerformanceCounter.CounterName)
                            UpdateProgressBar(TreeProgress)
                        Next PerformanceCounter
                    End If
                End If
            Next PCC
            TreeProgress.Visible = False
            Root.Expand()
            LoadButton.Enabled = True
        End Sub 'LoadTreeView

        'Check or uncheck a node in the tree.
        'If the node is a leaf then it represents a counter so:
        'Either Insert a display for the counter or remove a display .
        Private Sub CountersTree_AfterCheck(ByVal sender As Object, ByVal e As System.Windows.Forms.TreeViewEventArgs) Handles CountersTree.AfterCheck

            Dim PerformanceCounter As System.Diagnostics.PerformanceCounter = Nothing
            'See if this is a leaf node in the tree.
            If e.Node.Nodes.Count = 0 Then
                'Check whether there is an InstanceName or not (CounterName is always the leaf).
                Dim Parents As Integer = 0
                Dim TempNode As System.Windows.Forms.TreeNode = e.Node

                While Not (TempNode Is Nothing)
                    TempNode = TempNode.Parent
                    Parents += 1
                End While
                TempNode = e.Node

                If Parents = 3 Then 'There is no InstanceName.
                    PerformanceCounter = New System.Diagnostics.PerformanceCounter(TempNode.Parent.Text, TempNode.Text)
                Else
                    PerformanceCounter = New System.Diagnostics.PerformanceCounter(TempNode.Parent.Parent.Text, TempNode.Text, TempNode.Parent.Text, MachineName)
                End If

                If e.Node.Checked Then
                    'Insert the Display.
                    InsertCounter(PerformanceCounter)
                Else
                    'Remove display.
                    RemoveCounter(PerformanceCounter, TempNode)
                End If
            End If
        End Sub 'CountersTree_AfterCheck

        'Create a GraphicTab if needed.
        'Insert a new counter on the TabControl.
        Private Sub InsertCounter(ByVal PerformanceCounter As System.Diagnostics.PerformanceCounter)
            Dim CategoryExists As Boolean = False
            Dim GT As GraphicTab = Nothing
            Dim DP As DisplayPanel = Nothing

            'Check whether there is a tab for the category.
            Dim TempGT As GraphicTab
            For Each TempGT In GraphicTabControl.TabPages
                If TempGT.Text.Equals(PerformanceCounter.CategoryName) Then
                    CategoryExists = True
                    GT = TempGT
                    Exit For
                End If
            Next TempGT

            If Not CategoryExists Then 'Create a TabPage for the category.
                Dim Row As Integer = Rows.SelectedIndex + 1
                Dim Col As Integer = Columns.SelectedIndex + 1
                Dim ThickVal As Integer = Thickness.SelectedIndex + 1
                Dim TempVal As String = Frequency.SelectedItem.ToString().Substring(0, Frequency.SelectedItem.ToString().IndexOf(" "))
                Dim FreqVal As Integer = Integer.Parse(TempVal)
                TempVal = Density.SelectedItem.ToString().Substring(0, Density.SelectedItem.ToString().IndexOf(" "))
                Dim DensityVal As Integer = Integer.Parse(TempVal)

                'Create a GraphicTab and set its initial members values.
                GT = New GraphicTab(PerformanceCounter.CategoryName, ThickVal, Row, Col, FreqVal, DensityVal)
                GraphicTabControl.TabPages.Add(GT)
                GT.Anchor = System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left
            End If

            DP = New DisplayPanel(PerformanceCounter, GT)
            GT.Controls.Add(DP)
            GraphicTabControl.SelectedIndex = GT.TabIndex
        End Sub 'InsertCounter


        'Remove a PerfCounter display from a tab.
        Private Sub RemoveCounter(ByVal PerformanceCounter As System.Diagnostics.PerformanceCounter, ByVal Node As System.Windows.Forms.TreeNode)
            Dim GT As GraphicTab = Nothing
            Dim Key As String = PerformanceCounter.CategoryName + PerformanceCounter.CounterName + PerformanceCounter.InstanceName

            Dim TempGT As GraphicTab
            For Each TempGT In GraphicTabControl.TabPages
                If TempGT.Text.Equals(PerformanceCounter.CategoryName) Then
                    GT = TempGT
                    Exit For
                End If
            Next TempGT

            Try
                GT.RemoveDisplay(Key)
                'No need to keep the tab anymore.
                If GT.Controls.Count = 0 Then
                    GraphicTabControl.TabPages.Remove(GT)
                End If
            Catch ex As Exception
                MsgBox(ex.Message, , "MainForm.vb")
            End Try

        End Sub 'RemoveCounter

        'Count the number of nodes that will populate the treeView.
        'Used to get the ProgressBar maxcount value.
        Private Function CountNodes() As Integer
            Dim result As Integer = -1 'Number of counters available on the system.

            NbrOfCounters = 0

            Try
                'To get the number of nodes to be loaded in the tree.
                Dim PCCs As System.Diagnostics.PerformanceCounterCategory() = System.Diagnostics.PerformanceCounterCategory.GetCategories(MachineName)
                Dim PCC As System.Diagnostics.PerformanceCounterCategory

                For Each PCC In PCCs
                    Dim InstanceNames As String() = Nothing
                    Try
                        InstanceNames = PCC.GetInstanceNames()
                        result += InstanceNames.Length

                        Dim counters As PerformanceCounter() = Nothing
                        If Not (InstanceNames Is Nothing) Then
                            counters = PCC.GetCounters(InstanceNames(0))
                        Else
                            counters = PCC.GetCounters()
                        End If

                        result += InstanceNames.Length * counters.Length
                        NbrOfCounters += InstanceNames.Length * counters.Length

                        ' This is a valid category, this node will be added, so add 1.
                        result += 1
                    Catch
                    End Try

                Next PCC
            Catch ex As Exception
                'For this sample only, ignore some exceptions.
                'Possible exception: Cannot access the machine due to permissions - Ignore it.

                'To catch specific errors, add custom error handling here.
            End Try
            Return result
        End Function 'CountNodes


        'Get the new values selected by the user and redraw the displays.
        Private Sub RefreshButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles RefreshButton.Click
            RedrawDisplay()
        End Sub 'RefreshButton_Click


        'Clear all the controls and exit.
        Private Sub MenuExit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles MenuExit.Click
            CountersTree.Nodes.Clear()
            GraphicTabControl.TabPages.Clear()
            Me.Close()
            Application.Exit()
        End Sub 'MenuExit_Click


        'Stop the Clocks in each GraphicTab.
        Private Sub MenuStopGraphics_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles MenuStopGraphics.Click
            Dim GT As GraphicTab
            For Each GT In Me.GraphicTabControl.TabPages
                GT.Ticker.Enabled = False
            Next GT
        End Sub 'MenuStopGraphics_Click

        'Start the Clocks in each GraphicTab.
        Private Sub MenuStartGraphics_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles MenuStartGraphics.Click
            Dim GT As GraphicTab
            For Each GT In Me.GraphicTabControl.TabPages
                GT.Ticker.Enabled = True
            Next GT
        End Sub 'MenuStartGraphics_Click

        'Get the new values selected by the user and redraw the displays.
        Private Sub GraphicTabControl_Resize(ByVal sender As Object, ByVal e As System.EventArgs) Handles GraphicTabControl.Resize
            RedrawDisplay()
        End Sub 'GraphicTabControl_Resize


        'Read the selected display values and reset all the displays.
        Private Sub RedrawDisplay()

            If GraphicTabControl.TabPages.Count > 0 Then
                Dim Row As Integer = Rows.SelectedIndex + 1
                Dim Col As Integer = Columns.SelectedIndex + 1
                Dim ThickVal As Integer = Thickness.SelectedIndex + 1
                Dim TempVal As String = Frequency.SelectedItem.ToString().Substring(0, Frequency.SelectedItem.ToString().IndexOf(" "))
                Dim FreqVal As Integer = Integer.Parse(TempVal)
                TempVal = Density.SelectedItem.ToString().Substring(0, Density.SelectedItem.ToString().IndexOf(" "))
                Dim DensVal As Integer = Integer.Parse(TempVal)
                Dim GT As GraphicTab
                For Each GT In GraphicTabControl.TabPages
                    GT.SetDisplayProperties(ThickVal, Row, Col, FreqVal, DensVal)
                    GT.ResizeDisplays()
                Next GT
            End If

        End Sub 'RedrawDisplay

        Shared Sub Main()
            Application.Run(New Form1)
        End Sub

        Private Sub Form1_Resize(ByVal sender As Object, ByVal e As System.EventArgs) Handles MyBase.Resize
            RedrawDisplay()
        End Sub

        Private Sub UpdateProgressBar(ByVal TreeProgress As ProgressBar)
            'At the beginning we do not know the maximum number of nodes in the tree - so we
            'cannot set a correct maximum value of the progress bar. However, we need to 
            'simulate the progress of the tree being loaded.

            'If the progress bar reaches the end (ProgressBar.Value = ProgressBar.Maximum),
            'and there are still nodes to add, we need to increase the Maximum limit of 
            'the progress bar, and reduce the status of the progress bar

            If TreeProgress.Value >= TreeProgress.Maximum Then
                'Increase the maximum by 10% intervals.
                TreeProgress.Maximum += CInt(TreeProgress.Maximum / 10)
            End If
            TreeProgress.Value += 1
        End Sub

    End Class 'Form1

End Namespace 'PerfMon