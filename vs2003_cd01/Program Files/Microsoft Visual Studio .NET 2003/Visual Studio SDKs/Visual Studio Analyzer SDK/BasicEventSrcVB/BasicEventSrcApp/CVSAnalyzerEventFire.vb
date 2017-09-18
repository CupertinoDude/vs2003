''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' TODO Add a reference to the following COM components:
' "Microsoft Visual Studio Analyzer 2002 Automatable In-Process Event Creator Type Library"
' "Microsoft Visual Studio Analyzer 2002 Automatable Event Source Installer Type Library"
Imports Microsoft.VisualStudioAnalyzer.EventInstall
Imports Microsoft.VisualStudioAnalyzer.EventFire

Namespace BasicEventSrcApp

    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    'Class Purpose: A wrapper of VS Analyzer SDK functions to begin session, end session and fire events.
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''                                                    
    Public Class CVSAnalyzerEventFire

        'In-proc Event Creator        
        Private IEC As ISystemDebugEventFireAuto

        'Name for the app that is generating the event
        Private Const strMyEventSource As String = "BasicEventSrcVB"

        'Human-readable event name
        Private Const strMyEventName As String = "MyBasicCustomEventVB1"

        'Description of the event
        Private Const strMyEventDescr As String = "MyBasicCustomEventVB1 event generated by the BasicEventSrcVB source"

        'In-proc event creator GUID
        Private Const MYIEC_GUID As String = "{64A602AE-78E1-4A54-BDA6-0DB6E3DA4DF1}"

        'GUID for the user defined event        
        Private Const MYEVENT_GUID As String = "{148D8C58-0517-45EF-9A38-A4C79F0E61B8}"

        'Number of parameters passed for each event        
        Private Const MAXPARAMS As Integer = 4

        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''                                        
        'Purpose:   Starts a session. A session is needed in order
        '           to fire events. A call to EndSession is needed for each call to StartSession        
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''                                                                                        
        Public Sub BeginSession()
            Dim bIsActive As Boolean
            'First we need the IEC object to create a session and fire events.
            IEC = New MSVSAInprocEventCreator()

            'Now we actually begin the firing session for our event source
            IEC.BeginSession(MYIEC_GUID, "BasicEventSrc")

            'This is to check that the session is active and ready to accept events.
            'You would want to change the IF statement to correctly handle the failure case.
            IEC.IsActive(bIsActive)
            If (Not (bIsActive)) Then
                MsgBox("Session not active! Nobody is subscribing to MyBasicCustomEventVB1 events.")
            End If

        End Sub


        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        'Purpose:   Ends the firing session. A call to this method needs to be made for each call
        '           to StartSession. Visual Studio Analyzer requires each MSVSAInprocEventCreator.BeginSession 
        '           to be paired with MSVSAInprocEventCreator.EndSession
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''                                                           
        Public Sub EndSession()
            'just stop the already started session
            If (Not Information.IsNothing(IEC)) Then
                IEC.EndSession()
                IEC = Nothing
            End If
        End Sub

        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''                                        
        'Purpose:   Fires nNum custom events with 3 custom fields. The custom event is the one 
        '           already registered using BasicEventSrcSetup
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''                                                          
        Public Sub FireCustomEvent(Optional ByVal nNum As Integer = 10)
            Dim bIsActive As Boolean

            'Now we need to initialize the array that we will use to pass the data.            
            'Variant data type of VB6 does not exist in VB7. Use Object instead of variant.
            'All of the user defined keys have to be BSTR. 

            Dim rgKeys(4) As String
            rgKeys(0) = PARAM_Arguments
            rgKeys(1) = "1st custom parameter"
            rgKeys(2) = "2nd custom parameter"
            rgKeys(3) = "3rd custom parameter"

            Dim rgValues(4) As String
            rgValues(0) = "Arg1: 10 Arg2: 20"
            rgValues(1) = "Parameter 1 string"
            rgValues(2) = "Parameter 2 string"
            rgValues(3) = "Parameter 3 string"

            Dim count As Integer

            'This is to check that the session is active and ready to accept events
            'The session will be activated by LEC when there is a subscriber who
            'wants to receive events from this specific source, otherwise it will be inactive
            'You would want to change the IF statement to correctly handle the failure case
            IEC.IsActive(bIsActive)
            If (bIsActive) Then
                'Session is active. Fire events.
                If (Not Information.IsNothing(IEC)) Then

                    For count = 1 To nNum
                        IEC.FireEvent(MYEVENT_GUID, rgKeys, rgValues, MAXPARAMS, VSAEventFlags.cVSAEventDefaultSource)
                    Next
                End If
            Else
                MsgBox("Session not active! Nobody is subscribing to MyBasicCustomEventVB1 events.")
            End If

        End Sub


        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 
        'Purpose:	A simulation used to fire another method. In the whole 
        '			simulation there will be two event pairs fired. Each 
        '			pair has the some CorrelationID. The CorreletionID is 
        '			used by the Analyzer to determine the relationship 
        '			between the events. For example call (CALL) to the 
        '			method FireSimulationCalledMethod and return (RETURN) 
        '			from the same method should have the same CorrelationID, 
        '			so that Analyzer can relate them and plot them the 
        '			correct way. Within the FireSimulationCalledMethod will 
        '			be fired two more events - one upon entering(ENTER) and 
        '			one before leaving (LEAVE). They should have the same 
        '			correlation ID, which must be different from the 
        '			Call/Return's pair Correlation ID.
        '			The CorrelationID is a string.
        'Returns:   Nothing        
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Public Sub FireSimulation()
            Dim bIsActive As Boolean

            'Now we need to initialize the array that we will use to pass the data.            
            'Variant data type of VB6 does not exist in VB7. Use Object instead of variant.
            'All of the user defined keys have to be BSTR. 
            Dim rgKeys(MAXPARAMS) As String
            rgKeys(0) = PARAM_Arguments
            rgKeys(1) = "1st custom parameter"
            rgKeys(2) = "2nd custom parameter"
            rgKeys(3) = PARAM_CorrelationID

            Dim rgValues(MAXPARAMS) As String
            rgValues(0) = "Arg1: 10 Arg2: 20"
            rgValues(1) = "Parameter 1 string"
            rgValues(2) = "Parameter 2 string"
            rgValues(3) = "Correlation_CallingMethod"


            'This is to check that the session is active and ready to accept events
            'The session will be activated by LEC when there is a subscriber who
            'wants to receive events from this specific source, otherwise it will be inactive
            'You would want to change the IF statement to correctly handle the failure case
            IEC.IsActive(bIsActive)
            If (bIsActive) Then
                'Session is active fire events                
                'An event fired before calling the method.
                IEC.FireEvent(DEBUG_EVENT_CALL, rgKeys, rgValues, MAXPARAMS, VSAEventFlags.cVSAEventDefaultSource)

                FireSimulationCalledMethod()

                'An event fired upon return from the method.
                IEC.FireEvent(DEBUG_EVENT_RETURN, rgKeys, rgValues, MAXPARAMS, VSAEventFlags.cVSAEventDefaultSource)

            Else
                MsgBox("Session not active! Nobody is subscribing to MyBasicCustomEventVB1 events.")
            End If

        End Sub


        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''                                        
        'Purpose:   A method, which will be called by the FireSimulation method in order to be able 
        '           to simualte Call/return sequence of events. Notice the CorrelationID here is 
        '           different than the one in FireSimulation()
        ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''                                                          
        Private Sub FireSimulationCalledMethod()
            Dim bIsActive As Boolean

            'Now we need to initialize the array that we will use to pass the data.            
            'Variant data type of VB6 does not exist in VB7. Use Object instead of variant.
            'All of the user defined keys have to be BSTR.             
            Dim rgKeys(MAXPARAMS) As String
            rgKeys(0) = PARAM_Arguments
            rgKeys(1) = "1st custom parameter"
            rgKeys(2) = "2nd custom parameter"
            rgKeys(3) = PARAM_CorrelationID

            Dim rgValues(MAXPARAMS) As String
            rgValues(0) = "Arg1: 10 Arg2: 20"
            rgValues(1) = "Parameter 1 string"
            rgValues(2) = "Parameter 2 string"
            rgValues(3) = "Correlation_CalledMethod"


            'An event fired when the method is entered.
            IEC.FireEvent(DEBUG_EVENT_ENTER, rgKeys, rgValues, MAXPARAMS, VSAEventFlags.cVSAEventDefaultSource)

            'An event fired before leaving the method.
            IEC.FireEvent(DEBUG_EVENT_LEAVE_NORMAL, rgKeys, rgValues, MAXPARAMS, VSAEventFlags.cVSAEventDefaultSource)


        End Sub

        Public Function IsSourceRegistered() As Boolean
            Dim bIsRegistered As Boolean
            Dim ESI As ISystemDebugEventInstallAuto

            'Create an Event Source Installer(ESI) object
            ESI = New MSVSAEventSourceInstaller()

            'Check to see if the event source creator is already registered
            ESI.IsSourceRegistered(MYIEC_GUID, bIsRegistered)
            IsSourceRegistered = bIsRegistered
        End Function


    End Class
End Namespace
