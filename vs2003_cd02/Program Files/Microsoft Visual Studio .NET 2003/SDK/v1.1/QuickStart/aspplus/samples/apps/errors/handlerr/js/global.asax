<%@ Import Namespace="System.Diagnostics" %>

  <script language="JScript" runat="server">

    function Application_Error(sender:Object, e:EventArgs) : void {

         var Message:String = "\n\nURL:\n http://localhost/" + Request.Path
                                + "\n\nMESSAGE:\n " + Server.GetLastError().Message
                                + "\n\nSTACK TRACE:\n" + Server.GetLastError().StackTrace;

         // Create Event Log if it does not exist

         var LogName:String = "Application";
         if (!EventLog.SourceExists(LogName)) {
            EventLog.CreateEventSource(LogName, LogName);
         }

         // Insert into Event Log
         var Log:EventLog = new EventLog();
         Log.Source = LogName;
         Log.WriteEntry(Message, EventLogEntryType.Error);

    }

  </script>
