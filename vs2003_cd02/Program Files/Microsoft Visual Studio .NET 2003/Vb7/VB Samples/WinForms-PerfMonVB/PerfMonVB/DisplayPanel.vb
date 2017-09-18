Imports System

Namespace PerfMon
    ' Summary description for DisplayPanel.
    ' Used for plotting the graphics for the selected PerformanceCounters.
    ' Initially, each selected PerformanceCounter will have its data drawn on a separate DisplayPanel.
    ' Any DisplayPanel can plot data for more than one PerformanceCounter.

    Public Class DisplayPanel
        Inherits System.Windows.Forms.Panel
        'The DisplayPanel is a Panel control

        '***************************
        '* Public Properties
        '***************************

        'The local PerformanceCounter.
        Private mPC As System.Diagnostics.PerformanceCounter = Nothing
        Public Property PerformanceCounter() As System.Diagnostics.PerformanceCounter
            Get
                Return mPC
            End Get
            Set(ByVal Value As System.Diagnostics.PerformanceCounter)
                mPC = Value
            End Set
        End Property

        'History of the last "NbrOfPoints" PerformanceCounter values.
        Private mPCValues As Double() = Nothing
        Public Property PerformanceCounterValues() As Double()
            Get
                Return mPCValues
            End Get
            Set(ByVal Value As Double())
                mPCValues = Value
            End Set
        End Property

        'Last PCValue drawn. Need circular indexing.
        Private mLastDrawIndex As Integer = 0
        Public Property LastDrawIndex() As Integer
            Get
                Return mLastDrawIndex
            End Get
            Set(ByVal Value As Integer)
                mLastDrawIndex = Value
            End Set
        End Property

        'The maximum value of the PerformanceCounter ever encountered.
        Private mMaxVal As Double = 0
        Public Property MaxValue() As Double
            Get
                Return mMaxVal
            End Get
            Set(ByVal Value As Double)
                mMaxVal = Value
            End Set
        End Property

        'The collection of displays held as guests of this. Their graphics will be drawn on the same display.
        Private mGuestDisplays As System.Collections.SortedList = Nothing
        Public Property GuestDisplays() As System.Collections.SortedList
            Get
                Return mGuestDisplays
            End Get
            Set(ByVal Value As System.Collections.SortedList)
                mGuestDisplays = Value
            End Set
        End Property

        'Only one of the displays will show its data. This is used in case there are Guests to this.
        Private mShowData As Boolean
        Public Property ShowData() As Boolean
            Get
                Return mShowData
            End Get
            Set(ByVal Value As Boolean)
                mShowData = Value
            End Set
        End Property

        '***************************
        '* Private Properties
        '***************************
        'Parent GraphicTab.
        Private ParentTab As GraphicTab = Nothing
        'The number of points to be drawn.
        Private NbrOfPoints As Integer = 0
        'The control labels / panels.
        Private NameLabel As System.Windows.Forms.Label = Nothing
        Private ValueLabel As System.Windows.Forms.Label = Nothing
        Private ScalePanel As System.Windows.Forms.Panel = Nothing
        'Used for display movements.
        Private XPos As Integer = 0
        Private YPos As Integer = 0
        'The initial position - used to bring the display back.
        Private Origin As System.Drawing.Point
        'Used to produce new colors (for new Guests).
        Private Red, Green, Blue As Integer
        'The current working value.
        Private NewPCValue As Double

        'Explicit constructor.
        Public Sub New(ByVal NewPC As System.Diagnostics.PerformanceCounter, ByVal NewParentPage As GraphicTab)

            PerformanceCounter = NewPC
            GuestDisplays = New System.Collections.SortedList   'System.Collections.Hashtable();
            ParentTab = NewParentPage
            NbrOfPoints = ParentTab.Density
            mPCValues = New Double(NbrOfPoints) {}
            AddControls()
            SetPosition()
            BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
            'Add the mouse events.
            AddHandler MouseDown, AddressOf Display_MouseDown
            AddHandler MouseUp, AddressOf Display_MouseUp
            AddHandler MouseMove, AddressOf Display_MouseMove
            XPos = -1
            YPos = -1
            ShowData = True
        End Sub 'New


        'Get the initial origin point.
        Private Sub SetOrigin()
            Origin = New System.Drawing.Point(Left, Top)
        End Sub 'SetOrigin

        'Set the original position.
        'Check the last display position and place itself next to that.
        'Anchor property doesn't really work in this case since we have to keep equal propertions without overlapping displays.
        Public Sub SetPosition()
            Dim LocationX As Integer = 0
            Dim LocationY As Integer = 0
            Dim MyPos As Integer = 0
            Dim RowNo As Integer = 0
            Dim ColNo As Integer = 0
            Dim PosOffset As Integer = 3
            Dim DP As DisplayPanel
            Dim AllDP As New System.Collections.SortedList

            ParentTab.AutoScroll = False
            Size = New System.Drawing.Size(CInt(ParentTab.Size.Width) / ParentTab.Columns - 10, CInt(ParentTab.Size.Height) / ParentTab.Rows - 10)

            For Each DP In ParentTab.Controls
                If DP.Key.Equals(Key) Then
                    Exit For
                Else
                    If AllDP.IndexOfKey(DP.Key) < 0 Then
                        AllDP.Add(DP.Key, DP)
                    End If
                End If
            Next DP
            MyPos = AllDP.Count

            'Find out the row no. and col no. to use.
            RowNo = Int(MyPos / ParentTab.Columns)
            ColNo = MyPos Mod ParentTab.Columns
            'Get the new location.
            LocationX = ColNo * Width + PosOffset
            LocationY = (Height + PosOffset) * RowNo
            Location = New System.Drawing.Point(LocationX, LocationY)
            BackColor = System.Drawing.Color.White
            Visible = True
            SetControlsPosition()
            ParentTab.AutoScroll = True
            RebuildArray()

            For Each DP In GuestDisplays.Values
                DP.RebuildArray()
            Next DP
            SetOrigin()
        End Sub 'SetPosition


        'In case the density changes, the PerformanceCounterValues has to change as well.
        Public Sub RebuildArray()
            If NbrOfPoints <> ParentTab.Density Then
                NbrOfPoints = ParentTab.Density
                PerformanceCounterValues = New Double(NbrOfPoints) {}
            End If
        End Sub 'RebuildArray

        'Set the controls Locations on the display.
        Public Sub SetControlsPosition()
            Dim BorderWidth As Integer = 15
            NameLabel.BackColor = System.Drawing.Color.Black
            ValueLabel.BackColor = System.Drawing.Color.Black
            ScalePanel.BackColor = System.Drawing.Color.Black
            NameLabel.ForeColor = System.Drawing.Color.White
            ValueLabel.ForeColor = System.Drawing.Color.White
            ScalePanel.ForeColor = System.Drawing.Color.White
            NameLabel.Text = PerformanceCounter.CounterName + " **** " + PerformanceCounter.InstanceName
            NameLabel.Size = New System.Drawing.Size(Width, BorderWidth)
            NameLabel.Location = New System.Drawing.Point(0, 0)
            NameLabel.Visible = True
            ValueLabel.Text = "0"
            ValueLabel.Size = New System.Drawing.Size(Width, BorderWidth)
            ValueLabel.Location = New System.Drawing.Point(0, Height - BorderWidth)
            ValueLabel.Visible = True
            ScalePanel.Text = "0"
            ScalePanel.Size = New System.Drawing.Size(2 * BorderWidth, Height)
            ScalePanel.Location = New System.Drawing.Point(Width - BorderWidth, 0)
            ScalePanel.Visible = True
        End Sub 'SetControlsPosition


        'Insert the display controls in the DisplayPanel.
        Private Sub AddControls()

            NameLabel = New System.Windows.Forms.Label
            ValueLabel = New System.Windows.Forms.Label
            ScalePanel = New System.Windows.Forms.Panel
            Controls.Add(NameLabel)
            Controls.Add(ValueLabel)
            Controls.Add(ScalePanel)
            SetControlsPosition()
        End Sub 'AddControls



        'Draw the Graphics on this display.
        'The guests graphics will also be drawn on the same display.
        Public Sub Draw()

            Dim LoopIndex As Integer = 0
            Dim CurrentIndex As Integer = LastDrawIndex
            Dim HeightOffset As Integer = ValueLabel.Height * 2 + 10
            Dim VisibleHeight As Integer = Height - HeightOffset
            Dim VisibleWidth As Integer = ScalePanel.Left
            Dim CorrectedIndex As Integer = 0
            Dim SegmentLength As Double = 0

            Dim Points As System.Drawing.PointF() = Nothing
            Dim TC As System.Windows.Forms.TabControl = Nothing
            Dim Graphic As System.Drawing.Graphics = Nothing
            Dim Pen As System.Drawing.Pen = Nothing

            NewPCValue = PerformanceCounter.NextValue()

            Dim CorrectedValues() As Double = New [Double](NbrOfPoints) {}

            LastDrawIndex = (LastDrawIndex + 1) Mod NbrOfPoints
            Points = New System.Drawing.PointF(NbrOfPoints - 1) {}

            PerformanceCounterValues(CurrentIndex) = NewPCValue

            If MaxValue < NewPCValue Then
                MaxValue = NewPCValue
            End If
            TC = CType(ParentTab.Parent, System.Windows.Forms.TabControl)

            'Draw only if is the active tab.
            If TC.SelectedIndex = ParentTab.TabIndex Then
                For LoopIndex = 0 To NbrOfPoints - 1
                    CorrectedIndex = (LoopIndex + LastDrawIndex) Mod NbrOfPoints
                    If MaxValue > 0 Then
                        CorrectedValues(LoopIndex) = PerformanceCounterValues(CorrectedIndex) / MaxValue * VisibleHeight
                    Else
                        CorrectedValues(LoopIndex) = 0
                    End If
                Next LoopIndex

                SegmentLength = CDbl(VisibleWidth) / NbrOfPoints
                For LoopIndex = 0 To NbrOfPoints - 1
                    Points(LoopIndex) = New System.Drawing.PointF(CSng((LoopIndex + 1) * SegmentLength), CSng(VisibleHeight - (CorrectedValues(LoopIndex) - HeightOffset / 2)))
                Next LoopIndex

                'Draw the entire graphic.
                Graphic = CreateGraphics()
                Pen = New System.Drawing.Pen(System.Drawing.Color.Red, CSng(ParentTab.LineThickness))
                Graphic.Clear(BackColor)
                Graphic.DrawLines(Pen, Points)

                'Draw the last value
                If ShowData Then
                    DrawScale(Me, CorrectedValues, HeightOffset, VisibleHeight, System.Drawing.Color.Red)
                End If
            End If
            'Get the Guests involved.
            'Draw the graphic for each Guest Display.
            Red = 0
            Green = 0
            Blue = 0

            Dim DP As DisplayPanel
            For Each DP In GuestDisplays.Values
                CorrectedValues = DP.Values(VisibleHeight)
                If TC.SelectedIndex = ParentTab.TabIndex Then
                    For LoopIndex = 0 To NbrOfPoints - 1
                        Points(LoopIndex) = New System.Drawing.PointF(CSng((LoopIndex + 1) * SegmentLength), CSng(VisibleHeight - (CorrectedValues(LoopIndex) - HeightOffset / 2)))
                    Next LoopIndex
                    'Draw the entire graphic.
                    Graphic = CreateGraphics()
                    Dim color As System.Drawing.Color = NextColor()
                    Pen = New System.Drawing.Pen(color, CSng(ParentTab.LineThickness))
                    Graphic.DrawLines(Pen, Points)
                    If DP.ShowData Then
                        DrawScale(DP, CorrectedValues, HeightOffset, VisibleHeight, color)
                    End If
                End If
            Next DP
        End Sub 'Draw 

        Public ReadOnly Property NewValue() As Double
            Get
                Return Me.NewPCValue
            End Get
        End Property

        'Called from Draw.
        'Used to show the last drawn value of the selected PerfCounter.
        Private Sub DrawScale(ByVal DP As DisplayPanel, ByVal CorrectedValues() As Double, ByVal HeightOffset As Integer, ByVal VisibleHeight As Integer, ByVal color As System.Drawing.Color)
            'Draw the last value on the scale.
            Dim Graphic As System.Drawing.Graphics = Nothing
            Dim pen As System.Drawing.Pen = Nothing
            Dim X1 As Single = 0.0F
            Dim X2 As Single = 0.0F
            Dim Y1 As Single = CSng(ScalePanel.Height) - HeightOffset / 2
            Dim Y2 As Single = CSng(VisibleHeight - (CorrectedValues((NbrOfPoints - 1)) - HeightOffset / 2))

            NameLabel.Text = DP.PerformanceCounter.CounterName + " *** " + DP.PerformanceCounter.InstanceName

            ValueLabel.Text = DP.NewValue.ToString()

            Graphic = ScalePanel.CreateGraphics()
            Graphic.Clear(System.Drawing.Color.Black)
            pen = New System.Drawing.Pen(color, ScalePanel.Width)
            If Y2 >= Y1 Then
                Y2 = Y1 - ParentTab.LineThickness
            End If
            Graphic.DrawLine(pen, X1, Y1, X2, Y2)
        End Sub 'DrawScale


        'Returns the corrected (to the scale) accumulated  values.
        'Used to draw the guest graphics .
        Public Function Values(ByVal Scale As Integer) As Double()
            Dim LoopIndex As Integer = 0
            Dim CurrentIndex As Integer = 0
            Dim CorrectedIndex As Integer = 0
            Dim CorrectedValues As Double() = Nothing

            Me.NewPCValue = PerformanceCounter.NextValue()
            CurrentIndex = LastDrawIndex
            LastDrawIndex = (LastDrawIndex + 1) Mod NbrOfPoints
            PerformanceCounterValues(CurrentIndex) = NewPCValue

            CorrectedValues = New [Double](NbrOfPoints) {}

            If MaxValue < NewPCValue Then
                MaxValue = NewPCValue
            End If
            For LoopIndex = 0 To NbrOfPoints - 1
                CorrectedIndex = (LoopIndex + LastDrawIndex) Mod NbrOfPoints
                If MaxValue > 0 Then
                    CorrectedValues(LoopIndex) = PerformanceCounterValues(CorrectedIndex) / MaxValue * Scale
                Else
                    CorrectedValues(LoopIndex) = 0
                End If
            Next LoopIndex
            Return CorrectedValues
        End Function 'Values


        'Two possible actions on MouseDown:
        ' 1. Move the display to merge with other (left button).
        ' 2. See the MenuItems list to switch displays (right button).
        Private Sub Display_MouseDown(ByVal sender As Object, ByVal EventArgs As System.Windows.Forms.MouseEventArgs)

            SendToBack()
            'Move the display.
            If EventArgs.Button = System.Windows.Forms.MouseButtons.Left Then
                Cursor = System.Windows.Forms.Cursors.Hand
                XPos = EventArgs.X
                YPos = EventArgs.Y
                'Show the MenuItems.
            Else
                If EventArgs.Button = System.Windows.Forms.MouseButtons.Right Then
                    Dim MIText As String = Nothing
                    Dim MI As System.Windows.Forms.MenuItem

                    ContextMenu = New System.Windows.Forms.ContextMenu
                    MIText = PerformanceCounter.CounterName + " *** " + PerformanceCounter.InstanceName
                    MI = New MenuItem(MIText, New System.EventHandler(AddressOf ChangeDisplay))
                    ContextMenu.MenuItems.Add(MI)
                    'Read all the "guest" displays and add them in the menu list.

                    Dim DP As DisplayPanel
                    For Each DP In GuestDisplays.Values
                        MIText = DP.PerformanceCounter.CounterName + " *** " + DP.PerformanceCounter.InstanceName
                        MI = New MenuItem(MIText, New System.EventHandler(AddressOf ChangeDisplay))
                        ContextMenu.MenuItems.Add(MI)
                    Next DP
                    'Pop up the menu list.
                    ContextMenu.Show(Me, New System.Drawing.Point(EventArgs.X, EventArgs.Y))
                End If
            End If
        End Sub 'Display_MouseDown


        'If the left mouse button is pushed the user wants to move the displays.
        Private Sub Display_MouseMove(ByVal sender As Object, ByVal EventArgs As System.Windows.Forms.MouseEventArgs)
            If EventArgs.Button = System.Windows.Forms.MouseButtons.Left Then
                If XPos <> -1 Or YPos <> -1 Then
                    Left += EventArgs.X - XPos
                    Top += EventArgs.Y - YPos
                    ParentTab.CheckIntersect(Me)
                End If
            End If
        End Sub 'Display_MouseMove

        'If the mouse button was "left" then see if the user wants to merge to diplays.
        Private Sub Display_MouseUp(ByVal sender As Object, ByVal EventArgs As System.Windows.Forms.MouseEventArgs)
            If EventArgs.Button = System.Windows.Forms.MouseButtons.Left Then
                Cursor = System.Windows.Forms.Cursors.Default
                Location = Origin
                XPos = -1
                YPos = -1
                If ParentTab.Controls.Count > 1 Then
                    ParentTab.MergeDisplays(Me)
                End If
            End If
        End Sub 'Display_MouseUp

        'Get the next unused color.
        Private Function NextColor() As System.Drawing.Color
            'Try to get as many different colors as possible.
            If Red = 0 And Green = 0 And Blue = 0 Then
                Green = 255
            Else
                If Green = 0 Then
                    Red /= 4
                    Green = 255
                Else
                    If Blue < 50 Then
                        Red /= 2
                        Blue = 255
                        Green /= 2
                    Else
                        If Blue >= 200 And Blue <= 255 Then
                            Blue /= 2
                            Red /= 2
                            Green /= 2
                        Else
                            Red += 119
                            Red = Red Mod 255
                            Blue += 53
                            Blue = Blue Mod 255
                            Green += 61
                            Green = Green Mod 255
                        End If
                    End If 'Avoid very light colors.
                End If
            End If
            If Red > 240 And Green > 240 And Blue > 240 Then
                Red = (Red + 91) Mod 255
                Green = (Green + 53) Mod 255
                Blue = (Blue + 41) Mod 255
            End If
            Return System.Drawing.Color.FromArgb(Red, Green, Blue)
        End Function 'NextColor


        'Called by the mouse rightClick.
        'Selects the one PerfCounter for which the data is shown.
        Protected Sub ChangeDisplay(ByVal sender As Object, ByVal e As EventArgs)
            Dim MI As System.Windows.Forms.MenuItem = CType(sender, System.Windows.Forms.MenuItem)
            Dim CounterName As String = MI.Text.Substring(0, MI.Text.IndexOf("*") - 1).Trim()
            Dim InstanceName As String = MI.Text.Substring((MI.Text.LastIndexOf("*") + 1)).Trim()
            Dim DP As DisplayPanel

            For Each DP In GuestDisplays.Values
                DP.ShowData = False
            Next DP
            ShowData = False

            For Each DP In GuestDisplays.Values
                If DP.PerformanceCounter.CounterName.Equals(CounterName) Then
                    If Not (DP.PerformanceCounter.InstanceName Is Nothing) Then
                        If DP.PerformanceCounter.InstanceName.Equals(InstanceName) Then
                            DP.ShowData = True
                            Return
                        Else
                            DP.ShowData = True
                            Return
                        End If
                    End If
                End If
            Next DP
            ShowData = True
        End Sub 'ChangeDisplay 


        'Since the key is composite I prefere to use a property-get.

        Public ReadOnly Property Key() As String
            Get
                Return PerformanceCounter.CategoryName + PerformanceCounter.CounterName + PerformanceCounter.InstanceName
            End Get
        End Property

        'Called from the Parent when a Display is replaced by one of the Guests.
        'Used to "split" a Display from a group.
        Public Sub ReplaceMe(ByVal ChildDP As DisplayPanel)
            PerformanceCounterValues = ChildDP.PerformanceCounterValues
            PerformanceCounter = ChildDP.PerformanceCounter
            LastDrawIndex = ChildDP.LastDrawIndex
            MaxValue = ChildDP.MaxValue
            ParentTab.Controls.Remove(Me)
            ParentTab.Controls.Add(Me)
            GuestDisplays.Remove(ChildDP.Key)
        End Sub 'ReplaceMe 

    End Class 'DisplayPanel
End Namespace 'PerfMon