<%@ Import Namespace="System.Diagnostics" %>

  <script language="VB" runat="server">

    Sub Application_Error(sender As Object, e As EventArgs)

         Dim Message As String = "\n\nURL:\n http://localhost/" & Request.Path _
                                           & "\n\nMESSAGE:\n " & Server.GetLastError().Message _
                                           & "\n\nSTACK TRACE:\n" & Server.GetLastError().StackTrace

         ' Create Event Log if it does not exist

         Dim LogName As String = "Application"
         If (Not EventLog.SourceExists(LogName))
            EventLog.CreateEventSource(LogName, LogName)
         End If

         ' Insert into Event Log
         Dim Log As New EventLog
         Log.Source = LogName
         Log.WriteEntry(Message, EventLogEntryType.Error)

    End Sub

  </script>
