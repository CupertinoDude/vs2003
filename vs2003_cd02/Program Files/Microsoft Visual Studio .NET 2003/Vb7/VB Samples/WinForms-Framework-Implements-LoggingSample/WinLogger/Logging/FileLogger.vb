Option Explicit On 
Option Strict On

Imports System.Diagnostics
Imports System.IO
Imports System
'******************************************************
'* Description: This Class demostrates a file writer 
'*              utility class that uses the System.IO 
'*              library to write to the filesystem.
'*              It also implements the ILog interface.
'*              Clients can then use either logger class 
'*              interchangeably.
'******************************************************
Public Class FileLogger
    'We use implements statement to implement the iLog interface.
    'Note the use of the fully qualified interface name <namespace>.<interfacename>
    Implements Logging.ILog

    'Constants.
    Const DEFAULT_FILE_NAME As String = "Debug.txt"
    Const SEVERITY_HEADER As String = " SEVERITY: "
    Const MESSAGE_HEADER As String = " MESSAGE: "
    Const MESSAGE_LENGTH As Integer = 50
    Const MAX_FILE_SIZE As Long = 2000000

    'Class level variables.
    Private mFileName As String = DEFAULT_FILE_NAME
    Private mPath As String = Environment.CurrentDirectory
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

    'Constructor to specify filename.
    Public Sub New(ByVal fileName As String)
        'Check file name
        If IsFileNameValid(fileName) Then
            mFileName = fileName
        Else
            Throw New Exception("File name must have 1 to 32 alphanumeric characters and a .txt extension")
        End If
    End Sub

    'Constructor to specify filename and path.
    Public Sub New(ByVal fileName As String, ByVal path As String)
        'Check file name.
        If IsFileNameValid(fileName) Then
            mFileName = fileName
        Else
            Throw New Exception("File name must have 1 to 32 alphanumeric characters and a .txt extension")
        End If
        'Verify Path.
        If System.IO.Directory.Exists(Path) Then
            mPath = path
        Else
            Throw New Exception("Invalid log file path")
        End If

        'Add code for extra checking for specific filenames and paths.
    End Sub

    '********************************************************
    '* Methods
    '********************************************************

    'Verify filename
    'File name must have 1 to 32 alphanumeric characters and a .txt extension.
    'To allow a different extension, modify this as required.
    Private Function IsFileNameValid(ByVal filename As String) As Boolean
        Dim regExpression As New System.Text.RegularExpressions.Regex("^\w{1,32}\.txt")
        Dim matchCheck As System.Text.RegularExpressions.Match = regExpression.Match(filename)
        Return matchCheck.Success
    End Function

    'This is the implementation of the ILog.WriteLog method.
    Public Sub WriteLog(ByVal message As String, ByVal logType As EventLogEntryType) _
    Implements Logging.ILog.WriteLog
        Dim strFilePath As String

        strFilePath = mPath + Path.DirectorySeparatorChar + mFileName

        'Verify the string is less than MESSAGE_LENGTH characters.
        'To change size of minimum number of characters, change the value of constant.
        If Microsoft.VisualBasic.Len(message) > MESSAGE_LENGTH Then
            If mLogMinCharacters Then
                message = Microsoft.VisualBasic.Left(message, 100)
            Else
                Throw New Exception("Cannot add strings over " & MESSAGE_LENGTH & " characters to the log.")
            End If
        End If

        Dim objFileInfo As New System.IO.FileInfo(strFilePath)
        If objFileInfo.Exists Then
            If objFileInfo.Length > MAX_FILE_SIZE Then
                'This checks if the file has exceeded its limit.
                'To handle this error, add code to do the needful, otherwise
                'ignore or remove this part of the code. 
                'To change the minimum size, modify the constant MAX_FILE_SIZE.
            End If
        End If

        Dim outputStream As StreamWriter
        Try
            'Create the StreamWriter class which is part of the System.IO namespace.
            outputStream = New StreamWriter(strFilePath, True, System.Text.Encoding.Default)
            outputStream.WriteLine(DateTime.Now & SEVERITY_HEADER & logType.ToString() & MESSAGE_HEADER & message)
        Catch ex As Exception
            'Catch a general exception and pass back to caller.
            Throw New Exception(ex.Message)
        Finally
            'Regardless of what happens we want to close the stream.
            outputStream.Close()
        End Try
    End Sub
End Class
