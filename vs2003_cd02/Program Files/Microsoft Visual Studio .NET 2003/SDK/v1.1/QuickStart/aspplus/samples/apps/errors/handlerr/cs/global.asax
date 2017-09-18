<%@ Import Namespace="System.Diagnostics" %>

  <script language="C#" runat="server">

    void Application_Error(Object sender, EventArgs e) {

         String Message = "\n\nURL:\n http://localhost/" + Request.Path
                                + "\n\nMESSAGE:\n " + Server.GetLastError().Message
                                + "\n\nSTACK TRACE:\n" + Server.GetLastError().StackTrace;

         // Create Event Log if it does not exist

         String LogName = "Application";
         if (!EventLog.SourceExists(LogName)) {
            EventLog.CreateEventSource(LogName, LogName);
         }

         // Insert into Event Log
         EventLog Log = new EventLog();
         Log.Source = LogName;
         Log.WriteEntry(Message, EventLogEntryType.Error);

    }

  </script>
