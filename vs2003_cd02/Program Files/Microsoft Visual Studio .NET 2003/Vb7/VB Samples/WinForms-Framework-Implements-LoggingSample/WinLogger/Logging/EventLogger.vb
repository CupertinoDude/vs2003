Option Explicit On 
Option Strict On

Imports System.Diagnostics
Imports System


'******************************************************
'* Description: This Class demostrates an Event writer 
'*              utility class that uses the System.diagnostics 
'*              library to write to the Event Log.
'*              It also implements the ILog interface.
'*              Clients can then use either logger class 
'*              interchangeably.
'******************************************************
Public Class EventLogger
    'We use implements statement to implement the iLog interface.
    'Note the use of the fully qualified interface name <namespace>.<interfacename>
    Implements Logging.ILog

    'Constants.
    Const EVENT_LOG As String = "Application"
    Const DEFAULT_SOURCE As String = "Custom Application"
    Const INFO_LENGTH As Integer = 50

    'Class-level variables.
    Private mSource As String = DEFAULT_SOURCE
    Private mLogMinCharacters As Boolean = False

    '********************************************************
    '* Properties
    '********************************************************

    Public Property LogMinCharacters() As Boolean
        Get
            Return mLogMinCharacters
        End Get
        Set(ByVal Value As Boolean)
            mLogMinCharacters = Value
        End Set
    End Property

    '********************************************************
    '* Constructors
    '********************************************************

    'This constructor allows client to specify an event source.
    Public Sub New(ByVal source As String)
        mSource = source
    End Sub

    '********************************************************
    '* Methods
    '********************************************************
    'WriteLog is derived from the ILog interface
    'It must be defined in all classes that implement the ILog Interface
    Public Sub WriteLog(ByVal info As String, ByVal logType As EventLogEntryType) _
        Implements Logging.ILog.WriteLog

        'Verify the string is less than INFO_LENGTH characters.
        'To change size of minimum number of characters, change the value of constant.
        If Microsoft.VisualBasic.Len(Info) > INFO_LENGTH Then
            If mLogMinCharacters Then
                info = Microsoft.VisualBasic.Left(info, 100)
            Else
                Throw New Exception("Cannot add strings greater than " & INFO_LENGTH & " characters to the event log")
            End If
        End If

        ' Should add code to detect event log abuse and throw alert.

        Try
            'If it doesn't already exist create a source for the event to be logged to.
            If Not (EventLog.SourceExists(mSource)) Then
                EventLog.CreateEventSource(mSource, EVENT_LOG)
            End If
            'Create a new event log object.
            Dim Log As EventLog = New EventLog

            'Set the source property.
            Log.Source = mSource

            'Log the entry.
            Log.WriteEntry(info, logType)
        Catch ex As Exception
            'Error handling here.
            Throw New Exception(ex.Message)
        End Try
    End Sub


End Class
