Imports System

Namespace PerfMon
    ' Summary description for GraphicTab.
    ' Used to hold the DisplayPanels of a category.
    ' For each monitored category, a new GraphicTab will be inserted into the TabControl.
    Public Class GraphicTab
        Inherits System.Windows.Forms.TabPage

        'The GraphicTab is a TabPage component.
        'Those will propagate to all Displays on the graphicTab.

        '***************************
        '* Public Properties
        '***************************

        'Drawing line tickness.
        Private mLineThickness As Integer = 0
        Public Property LineThickness() As Integer
            Get
                Return mLineThickness
            End Get
            Set(ByVal Value As Integer)
                mLineThickness = Value
            End Set
        End Property

        'Number of display rows.
        Private mRows As Integer = 0
        Public Property Rows() As Integer
            Get
                Return mRows
            End Get
            Set(ByVal Value As Integer)
                mRows = Value
            End Set
        End Property

        'Number of displays columns.
        Private mColumns As Integer = 0
        Public Property Columns() As Integer
            Get
                Return mColumns
            End Get
            Set(ByVal Value As Integer)
                mColumns = Value
            End Set
        End Property

        'Time interval to redraw graphics.
        Private mFrequency As Integer = 0
        Public Property Frequency() As Integer
            Get
                Return mFrequency
            End Get
            Set(ByVal Value As Integer)
                mFrequency = Value
            End Set
        End Property

        'No of draw points/display.
        Private mDensity As Integer = 0
        Public Property Density() As Integer
            Get
                Return mDensity
            End Get
            Set(ByVal Value As Integer)
                mDensity = Value
            End Set
        End Property

        'The displays will show the graphics on timer.
        Private mTicker As New System.Timers.Timer
        Public ReadOnly Property Ticker() As System.Timers.Timer
            Get
                Return mTicker
            End Get
        End Property

        'GraphicTab key. This should be unique (CategoryName).
        Private mKey As String = Nothing
        Public Property Key() As String
            Get
                Return mKey
            End Get
            Set(ByVal Value As String)
                mKey = Value
            End Set
        End Property

        'Keep a pointer to the DisplayPanel designated as host for other Displays.
        Private mHost As DisplayPanel = Nothing
        Public Property Host() As DisplayPanel
            Get
                Return mHost
            End Get
            Set(ByVal Value As DisplayPanel)
                mHost = Value
            End Set
        End Property

        'Explicit constructor.
        Public Sub New(ByVal TabText As String, ByVal LineThickness As Integer, ByVal Row As Integer, ByVal Column As Integer, ByVal Frequency As Integer, ByVal Density As Integer)
            'Set some of the base class properties.
            [Text] = TabText 'Text is a keyword - use escape sequence "[]" for this - could also use Me.Text = TabText.
            AutoScroll = True
            Key = TabText
            Ticker.Enabled = False
            'Set all displays properties.
            SetDisplayProperties(LineThickness, Row, Column, Frequency, Density)

            'Set the timer's event.
            AddHandler Ticker.Elapsed, AddressOf Ticker_Tick
            Ticker.Enabled = True
        End Sub 'New

        'Browse through all the displays and set their positon relative to this.
        Public Sub ResizeDisplays()
            Dim DP As DisplayPanel
            For Each DP In Controls
                DP.SetPosition()
            Next DP
        End Sub 'ResizeDisplays

        'Call the Draw method on all displays.
        Protected Sub Ticker_Tick(ByVal sender As Object, ByVal e As System.Timers.ElapsedEventArgs)
            Ticker.Enabled = False
            Dim DP As DisplayPanel
            For Each DP In Controls
                DP.Draw()
            Next DP
            Ticker.Enabled = True
        End Sub 'Ticker_Tick

        'Set the displays properties.
        Public Sub SetDisplayProperties(ByVal NewLineThickness As Integer, ByVal RowCount As Integer, ByVal ColumnCount As Integer, ByVal NewFrequency As Integer, ByVal NewDensity As Integer)
            LineThickness = NewLineThickness
            Rows = RowCount
            Columns = ColumnCount
            Frequency = NewFrequency
            Density = NewDensity
            Ticker.Interval = Frequency * 1000
            Dim DP As DisplayPanel
            For Each DP In Controls
                DP.SetPosition()
            Next DP
        End Sub 'SetDisplayProperties

        'Check whether two displays are overlapping or not.
        'If yes then on MouseUp event from the ActivePanel, the ActivePanel will merge with the ovelapped display.
        'Consider two displays overlapping if one overlaps the center of the other. This way you're sure no three displays can overlap.
        Public Sub CheckIntersect(ByVal ActivePanel As DisplayPanel)
            Host = Nothing
            Dim CenterPoint As New System.Drawing.Point(ActivePanel.Right - ActivePanel.Width / 2, ActivePanel.Bottom - ActivePanel.Height / 2)
            Dim DP As DisplayPanel
            For Each DP In Controls
                'Get its center.
                Dim X As Integer = DP.Right - DP.Width / 2
                Dim Y As Integer = DP.Bottom - DP.Height / 2
                Dim center As New System.Drawing.Point(X, Y)
                'Check if they intersect.
                If System.Math.Abs((center.X - CenterPoint.X)) < ActivePanel.Width / 2 And System.Math.Abs((center.Y - CenterPoint.Y)) < ActivePanel.Height / 2 And Not DP.Equals(ActivePanel) Then
                    DP.BackColor = System.Drawing.Color.Black
                    Host = DP
                    Exit For
                Else
                    'Haven't found a host.
                    DP.BackColor = System.Drawing.Color.White
                    Host = Nothing
                End If
            Next DP
        End Sub 'CheckIntersect

        'Merge two displays.
        Public Sub MergeDisplays(ByVal Guest As DisplayPanel)
            If Not (Host Is Nothing) Then
                Dim TempKey As String = Nothing

                If Host.GuestDisplays.IndexOfKey(Guest.Key) < 0 Then
                    Controls.Remove(Guest)
                    Host.GuestDisplays.Add(Guest.Key, Guest)
                    'If the Guest had guests... then put all of them in the Host display.
                    Dim DP As DisplayPanel

                    For Each DP In Guest.GuestDisplays.Values
                        TempKey = DP.PerformanceCounter.CategoryName + DP.PerformanceCounter.CounterName + DP.PerformanceCounter.InstanceName
                        If Host.GuestDisplays.IndexOfKey(TempKey) < 0 Then
                            Host.GuestDisplays.Add(TempKey, DP)
                            DP.ShowData = False 'Only the Guest will show its data.
                        End If
                    Next DP
                    Guest.GuestDisplays.Clear()
                    Guest.Visible = False
                    ResizeDisplays()
                    Host.BackColor = System.Drawing.Color.White
                    Host.ShowData = False
                    'Let the newlly added guest to show its data.
                    Guest.ShowData = True
                End If
            End If
        End Sub 'MergeDisplays


        'Eliminate a display from the GraphicTab.
        'If this is the last display the GraphicTab itself will be removed.
        'If the display contains some guests then the display stays but will be replaced by the first guest.
        Public Sub RemoveDisplay(ByVal DPKey As String)
            Dim DP As DisplayPanel
            Dim TempDP As DisplayPanel

            Dim DpIndex As Integer = 0
            While DpIndex < Controls.Count
                DP = Controls.Item(DpIndex)
                DpIndex = DpIndex + 1
                If Not (DP Is Nothing) Then
                    If DP.Key.Equals(DPKey) Then
                        If DP.GuestDisplays.Count > 0 Then
                            DP.ReplaceMe(CType(DP.GuestDisplays.GetByIndex(0), DisplayPanel))
                            Dim tmpDP As DisplayPanel
                            For Each tmpDP In DP.GuestDisplays.Values
                                tmpDP.ShowData = False
                            Next tmpDP
                            DP.ShowData = True
                            Exit While
                        Else
                            Controls.Remove(DP)
                            DpIndex = DpIndex - 1
                            For Each TempDP In Controls
                                TempDP.SetPosition()
                            Next TempDP
                        End If
                    Else
                        DP.GuestDisplays.Remove(DPKey)
                        For Each TempDP In DP.GuestDisplays.Values
                            TempDP.ShowData = False
                        Next TempDP
                        DP.ShowData = True
                    End If
                End If
            End While

        End Sub 'RemoveDisplay

    End Class 'GraphicTab
End Namespace 'PerfMon
