''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' TODO Add a reference to the following COM component:
' "Microsoft Visual Studio Analyzer 2002 Automation Model Type Library"
Imports Microsoft.VisualStudioAnalyzer.Automation

Namespace AutomationVB
    Public Class clsVSAnalyzerAuto


        'Visual Studio Analyzer Project        
        Private m_objProject As VSAnalyzerProject
        Private m_objMachine As VSAnalyzerMachine
        Private m_objEventLog As VSAnalyzerEventLog
        Private m_objRecordingFilter As VSAnalyzerFilter

        Private DTE As EnvDTE.DTE


        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        'Purpose: Opens a Visual Studio environment and creates an Analyzer project. It 
        '	  uses the default Analyzer template.
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Public Sub CreateProject()
            'Get the path for the Visual Studio Analyzer project template file
            Dim strTemplatePath As String
            Dim strTemplateFullName As String
            Dim strProjectPath As String
            Dim objVSProject As EnvDTE.Project

            DTE = System.Activator.CreateInstance(System.Type.GetTypeFromProgID("VisualStudio.DTE.7.1", True))

            ' Get the Visual Studio Analyzer project template path by using
            ' the GUID that references it in the registry.
            strTemplatePath = DTE.Solution.TemplatePath("{6C736D90-CE40-11D0-8A4D-00A0C91E2ACD}")
            DTE.MainWindow.Visible = True

            ' Name of template file for a Visual Studio Analyzer project
            strTemplateFullName = strTemplatePath + "\Analyzer.vap"

            ' Get the location of the temp directory 
            ' from the environmental variable TEMP.            
            strProjectPath = Trim$(Environment.GetEnvironmentVariable("TEMP")) + "\AutomationVB"

            ' Warning: cleanup working directory (\temp\AutomationVB).           
            CleanupDir(strProjectPath)

            ' Create Visual Studio Analyzer project
            objVSProject = DTE.Solution.AddFromTemplate(strTemplateFullName, strProjectPath, "AutomationVB.vap", Exclusive:=False)

            ' Get the VSAProject object
            m_objProject = CType(objVSProject.Object, VSAnalyzerProject)

        End Sub

        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        'Purpose: Cleanup the working directory.  Use carefully.
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Public Sub CleanupDir(ByVal strDir As String)
            Dim strFiles As Array
            Dim strFile As String

            If (System.IO.Directory.Exists(strDir)) Then
                strFiles = System.IO.Directory.GetFiles(strDir)

                For Each strFile In strFiles
                    System.IO.File.Delete(strFile)
                Next
            End If

        End Sub

        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        'Purpose: Saves and closes the project. It will also close the whole environement.
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Public Sub CloseProject()

            ' Save and close solution
            DTE.Solution.Close(True)

            DTE.Quit()
            DTE = Nothing
        End Sub



        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        'Purpose:   Adds a filter with a given name and expression. It will also try to 
        '	        compile it in order to verify if the expression is correct.
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Public Sub AddFilter(ByVal strFilterName As String, ByVal strFilterExpression As String)
            'Add filter to the project for recording events
            Dim objFilterItem As EnvDTE.ProjectItem

            If (Not IsNothing(m_objProject)) Then

                ' Get the VSAFilter object
                m_objRecordingFilter = m_objProject.AddFilter(strFilterName, True)

                ' Set filter expression
                m_objRecordingFilter.Expression = strFilterExpression

            End If

        End Sub




        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        'Purpose:   Removes a filter with a given name from the project. The function is 
        '	        provided here as an example of how to do it. However, it is not being 
        '	        used by this sample.
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Public Sub RemoveFilter(ByVal strFilterName As String)
            If (Not IsNothing(m_objProject)) Then
                m_objProject.RemoveFilter(strFilterName)
            End If
        End Sub




        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        'Purpose: Adds the local machine to the project, which would connect to the 
        '	      machine at the time of the addition. The function will also check if the 
        '	      connection has been establish and will show an error message if the 
        '	      connection cannot be established.
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Public Sub AddMachine(ByVal strMachineName As String)
            'Add computer to project and connect
            Dim objMachineItem As EnvDTE.ProjectItem
            If (Not IsNothing(m_objProject)) Then

                m_objMachine = m_objProject.AddMachine(strMachineName)

                If Not m_objMachine.Connected Then
                    MsgBox("Could not connect to machine " + strMachineName)
                    Exit Sub
                End If
            End If
        End Sub



        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        'Purpose: Removes a machine with a given name fromm the project. The function is 
        '	  provided here as an example of how to do it. However, it is not being 
        '	  used by this sample.
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Public Sub RemoveMachine(ByVal strMachineName As String)
            If (Not IsNothing(m_objProject)) Then
                m_objProject.RemoveMachine(strMachineName)
            End If
        End Sub




        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        'Purpose: Adds an event log to the project 
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Public Sub AddEventLog(ByVal strEventLogName As String)
            'Create new event log
            Dim objEventLogItem As EnvDTE.ProjectItem

            If (Not IsNothing(m_objProject)) Then
                m_objEventLog = m_objProject.AddEventLog(strEventLogName)
            End If
        End Sub




        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        'Purpose: Removes an eventlog with a given name fromm the project. The function is 
        '	  provided here as an example of how to do it. However, it is not being 
        '	  used by this sample.
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Public Sub RemoveEventLog(ByVal strEventLogName As String)
            If (Not IsNothing(m_objProject)) Then
                m_objProject.RemoveEventLog(strEventLogName)
            End If
        End Sub




        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        'Purpose: Retrieves the local machine and adds it to the Analyzer porject. 
        '	  It adds also a filter to the project.
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Public Sub CreateProjectItems()
            Dim strComputerName As String
            strComputerName = System.Environment.MachineName()

            Me.AddMachine(strComputerName)

            'Add filter to the project for recording events
            Me.AddFilter("AutomationVBFilter", "Machine = 'All Machines' AND Component = 'All Components' AND Category = 'All Regular Events'")

        End Sub



        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        'Purpose: Activates the filter. An active filter is needed every time an event 
        '	  recording is done. Adds an EventLog and starts the recording process.
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Public Sub StartRecordingEvents()

            If (Not IsNothing(m_objRecordingFilter)) Then
                'Activate the filter
                m_objProject.ActivateFilter("AutomationVBFilter")

                m_objEventLog = m_objProject.StartRecording("AutomationVBEventLog")

            End If

        End Sub

        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        'Purpose: Stops the recording and deactivates the recording filter.
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Public Sub StopRecordingEvents()
            If (Not IsNothing(m_objEventLog) And Not IsNothing(m_objRecordingFilter)) Then
                'Stop recording events
                m_objProject.StopRecording()

                'Deactivate filter
                m_objProject.DeactivateFilter()
            End If
        End Sub

        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        'Purpose: Searchs for the event with longest duration and returns a string with
        '         summary information
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Public Function GetRecordingSummary() As String
            Dim strSummary As String

            If (Not IsNothing(m_objEventLog)) Then
                Dim nEvents, nLongestDuration As Integer
                Dim i As Integer
                Dim objEvent, objLongest As VSAnalyzerEvent
                Dim nDurationFieldIndex As Integer

                nLongestDuration = 0
                objLongest = Nothing

                ' The fastest access method for fields is through the field 
                ' index in the event
                nDurationFieldIndex = VSAnalyzerUIEventField.VSAnalyzerUIEventFieldDuration

                ' Get the number of events in the event log
                nEvents = m_objEventLog.Count
                strSummary = "Total Events Collected: " & CStr(nEvents) & vbCrLf

                For Each objEvent In m_objEventLog
                    Dim nDuration As Integer

                    nDuration = CInt(objEvent.Item(nDurationFieldIndex).FieldValue)
                    If nDuration > nLongestDuration Then
                        nLongestDuration = nDuration
                        objLongest = objEvent
                    End If
                Next
                If (nLongestDuration > 0) Then
                    Dim strEventId, strTime, strSourceMachine As String

                    ' This section illustrates three methods for accessing
                    ' fields in an event

                    ' By the field index:
                    strEventId = CStr(objLongest.Item(VSAnalyzerUIEventField.VSAnalyzerUIEventFieldEventId).FieldValue)

                    ' By field name:
                    strTime = CStr(objLongest.Item(VSAnalyzerConstants.VSAnalyzerEventFieldEventTime).FieldValue)

                    ' By the field firing code (only for standard fields allowed at firing time):
                    strSourceMachine = CStr(objLongest.ItemByStandardParameterEnum(VSAStandardParameter.cVSAStandardParameterSourceMachine).FieldValue)
                    If strSourceMachine = "" Then
                        strSourceMachine = "<unspecified>"
                    End If

                    ' Rounding for milliseconds
                    nLongestDuration = nLongestDuration \ 10000

                    strSummary = strSummary & "Longest Event: " & nLongestDuration & " milliseconds" & vbCrLf
                    strSummary = strSummary & "Event ID: " & strEventId & ", fired from machine " & strSourceMachine & " at " & strTime
                End If
            Else
                strSummary = "No Events Were Collected"
            End If

            GetRecordingSummary = strSummary
        End Function


    End Class
End Namespace
