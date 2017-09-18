#define TRACE

using System;
using System.Diagnostics;
using System.Threading;
using System.Security.Permissions;
using Microsoft.VisualStudioAnalyzer.EventFire;
using Microsoft.VisualStudioAnalyzer.EventInstall;

/// <summary>
/// This sample defines a .NET trace listener for Visual Studio Analyzer.
/// This TraceListener can be used with calls to System.Diagnostics.Trace and
/// System.Diagnostics.Debug, in order to redirect the Trace and Debug output to Visual 
/// Studio Analyzer.
/// <see cref="System.Diagnostics.Trace"/>
/// <see cref="System.Diagnostics.Debug"/>
/// 
/// This code runs entirely in one assembly.  Since some of the code needs to access the registry
/// the entire assembly needs to run in a context that allows access to the registry.
/// If this code were to be used in a real application, then the registry access should be moved
/// into a different assembly and the tracing code left here.  This would allow the tracing
/// code to run in any context and the registry accessing code to be run only when needed
/// and in contexts that actually were granted access to the registry.
/// 
/// </summary>
/// 

// This assembly uses internally a COM interop assembly to read/write the 
// registry using Analyzer COM objects.  This code should fail if the 
// calling code is not allowed to read the registry.
[type: RegistryPermissionAttribute(SecurityAction.LinkDemand,
Read="HKEY_LOCAL_MACHINE\\SOFTWARE\\MICROSOFT\\VisualStudio\\Analyzer")]

	public class VATraceListener : TraceListener
	{

		private const string EVENT_SOURCE_GUID = VATraceListenerInstaller.EVENT_SOURCE_GUID;
		private const string WRITE_EVENT_GUID = VATraceListenerInstaller.WRITE_EVENT_GUID;
		private const string FAIL_EVENT_GUID = VATraceListenerInstaller.FAIL_EVENT_GUID;
		private const string INDENT_EVENT_GUID = VATraceListenerInstaller.INDENT_EVENT_GUID;
		private const string UNINDENT_EVENT_GUID = VATraceListenerInstaller.UNINDENT_EVENT_GUID;

		/// <remarks>
		/// VATraceListener set explicitly thread ID and app domain information, since
		/// this information currently is not captured automatically by Visual Studio Analyzer
		/// Not all fields are assigned values by all methods. The last field is either
		/// the category field (Write calls), or a details field (Fail calls). If field
		/// n is assigned a value, field n-1 must also be assigned a value.
		/// </remarks>
		private const int FIELD_THREAD = 0;
		private const int FIELD_APPDOMAIN = 1;
		private const int FIELD_ARG = 2;
		private const int FIELD_CATEGORY_DETAILS = 3; // switches depending on context
		private const int NUM_FIELDS = 4;

		private MSVSAInprocEventCreator eventCreator = null;
		private string[] fields = new string[NUM_FIELDS];
		private string[] values = new string[NUM_FIELDS];

		private int lastIndent = 0;

		/// <summary>
		/// Constructs a new MSVSAInprocEventCreator object and begins a new
		/// session with Visual Studio Analyzer. When this class is 					/// instantiated, you should already have started recording events.
		/// </summary>
		/// <param name="sessionName">The name of the session.</param>
		public VATraceListener(string sessionName) 
		{
			
			// By calling Register we ensure that the TraceListener for VS Analyzer
			// is properly configured. Note: the registration needs to occur only once
			// per machine, you can improve performance by creating a separate command-line 
			// application that calls Register only once, instead of calling it here in the
			// constructor.
			VATraceListenerInstaller.Register();

			eventCreator = new MSVSAInprocEventCreator();
			eventCreator.BeginSession(EVENT_SOURCE_GUID,sessionName);
			fields[FIELD_THREAD] = "SourceThread";
			fields[FIELD_APPDOMAIN] = "Application Domain";
			fields[FIELD_ARG] = "Arguments";
			fields[FIELD_CATEGORY_DETAILS] = "Category/Details";
		}

		/// <summary>
		/// Ends the session when this object is destructed.
		/// </summary>
		~VATraceListener() 
		{
			if (eventCreator != null)
			{
				if(lastIndent != IndentLevel) FireIndent(lastIndent<IndentLevel);
				eventCreator.EndSession();
			}
		}

		/// <summary>
		/// Fires a Visual Studio Analyzer event. Sets the thread ID and app domain fields.
		/// </summary>
		/// <param name="eventGUID">The GUID of the event to fire.</param>
		/// <param name="numFields">Number of fields caller has set. Does not include
		/// thread ID and app domain.</param>
		private void FireEvent(string eventGUID, int numFields) 
		{
			if (eventCreator == null) throw new VATraceListenerException("TraceLitener is not initialized.");
			int threadID = AppDomain.GetCurrentThreadId();

			if(lastIndent != IndentLevel) FireIndent(lastIndent<IndentLevel);
			
			// threadID's are hex in Visual Studio Analyzer
			values[FIELD_THREAD] = threadID.ToString("x");
			values[FIELD_APPDOMAIN] = AppDomain.CurrentDomain.FriendlyName;
			eventCreator.FireEvent(eventGUID,fields,values,numFields+2,VSAEventFlags.cVSAEventDefaultSource);
		}


		/// <summary>
		/// Fires Visual Studio Analyzer events to reflect indentation 
		/// levels in the trace output.
		/// </summary>
		/// <param name="toIncrease">Indicates whether indents or unindents are occuring.</param>
		private void FireIndent(bool toIncrease)
		{
			string[] indentFields = new string[1] {"CorrelationID"};
			string[] indentValues = new string[1];

			while(lastIndent!=IndentLevel)
			{
				if(toIncrease)
				{
					lastIndent++;
					indentValues[0] = lastIndent.ToString();
					eventCreator.FireEvent(INDENT_EVENT_GUID, indentFields, indentValues, 1, VSAEventFlags.cVSAEventDefaultSource);
				}
				else
				{
					indentValues[0] = lastIndent.ToString();
					eventCreator.FireEvent(UNINDENT_EVENT_GUID, indentFields, indentValues, 1, VSAEventFlags.cVSAEventDefaultSource);
					lastIndent--;
				}
			}
		}


		/// <summary>
		/// Closes the session. After this method has been called, the object cannot
		/// be used anymore.
		/// </summary>
		override public void Close() 
		{
			eventCreator.EndSession();
			eventCreator = null; // free the resource
		}

		/// <summary>
		/// Has no meaning for this class, as no traces are cached on this sample.
		/// </summary>
		override public void Flush() 
		{
			base.Flush();
		}

		/// <overload>
		/// Fires a Fail event. Called when an assertion fails or when the program
		/// explicitly fails.
		/// </overload>
		/// <param name="message">Message appears as Arguments in Visual Studio Analyzer.</param>
		override public void Fail(string message) 
		{
			values[FIELD_ARG] = message;
			FireEvent(FAIL_EVENT_GUID,1);
		}

		/// <param name="message">Message appears as Arguments in Visual Studio Analyzer.</param>
		/// <param name="detailMessage">Detailed message appears as Details in Visual Studio Analyzer when
		/// this method is called.</param>
		override public void Fail(string message, string detailMessage) 
		{

			values[FIELD_ARG] = message;
			values[FIELD_CATEGORY_DETAILS] = detailMessage;

			FireEvent(FAIL_EVENT_GUID,2);
		}

		/// <overload>
		/// Fires a Write event. This event can be used to capture useful information.
		/// Called when Write or WriteLine is called.
		/// </overload>
		/// <param name="message">Message appears as Arguments in Visual Studio Analyzer.</param>
		override public void Write(string message) 
		{
			values[FIELD_ARG] = message;
			FireEvent(WRITE_EVENT_GUID,1);
		}

		/// <param name="message">Message appears as Arguments in Visual Studio Analyzer.</param>
		/// <param name="category">String appears as the trace category field when specified.</param>
		override public void Write(string message, string category) 
		{
			values[FIELD_ARG] = message;
			values[FIELD_CATEGORY_DETAILS] = category;
			FireEvent(WRITE_EVENT_GUID,2);
		}

		/// <param name="o">Type of the object and the result of its ToString operation
		/// are displayed in Arguments. Type and ToString value are separated by a comma.
		/// </param>
		override public void Write(object o) 
		{
			values[FIELD_ARG] = o.GetType().ToString()+", "+o.ToString();
			FireEvent(WRITE_EVENT_GUID,1);
		}

		/// <param name="o">Type of the object and the result of its ToString operation
		/// are displayed in Arguments. Type and ToString value are separated by a comma.
		/// </param>
		/// <param name="category">String appears as the trace category field when specified.</param>
		override public void Write(object o, string category) 
		{
			values[FIELD_ARG] = o.GetType().ToString()+", "+o.ToString();
			values[FIELD_CATEGORY_DETAILS] = category;
			FireEvent(WRITE_EVENT_GUID,2);
		}

		/// <summary>
		/// Does not have any meaning for this class.
		/// </summary>
		override protected void WriteIndent() 
		{
			NeedIndent = true;
		}

		/// <overload>
		/// All WriteLine methods call their corresponding Write method. No carriage return
		/// or line feed are written.
		/// </overload>
		override public void WriteLine(string message) 
		{
			Write(message);
		}

		override public void WriteLine(string message, string category) 
		{
			Write(message,category);
		}

		override public void WriteLine(object o) 
		{
			Write(o);
		}

		override public void WriteLine(object o, string category) 
		{
			Write(o,category);
		}

	}

	/// <summary>
	/// Thrown on an attempt to send an event after the Listener has been closed.
	/// </summary>
	public class VATraceListenerException : Exception
	{
		public VATraceListenerException(string message) : base(message)
		{
		}
	}

	/// <summary>
	///  Installs or uninstalls the VATraceListener.  
	/// </summary>
	public class VATraceListenerInstaller 
	{

		private const string DEBUG_EVENT_CATEGORY_ALL = "{6c736d85-BCBF-11D0-8A23-00AA00B58E10}";
		private const int DEBUG_EVENT_TYPE_GENERIC = 2;
		private const int DEBUG_EVENT_TYPE_BEGIN = 4;
		private const int DEBUG_EVENT_TYPE_END = 5;

		public const string EVENT_SOURCE_GUID = "{CE9745B0-3A2D-48cd-B0CC-D3DD253A963F}";
		public const string EVENT_CATEGORY_GUID = "{963C0613-47C2-4626-8A17-0271444AB898}";
		public const string WRITE_EVENT_GUID = "{91770101-0E22-4010-B6B5-D187391FF51C}";
		public const string FAIL_EVENT_GUID = "{97AE531E-941B-455b-8C42-A646AE6E2359}";
		public const string INDENT_EVENT_GUID = "{91770101-0E28-4010-B6B5-D187391FF51C}";
		public const string UNINDENT_EVENT_GUID = "{97AE531E-941F-455b-8C42-A646AE6E2359}";

		private const string EVENT_SOURCE_NAME = ".Net Diagnostics Events";
		private const string EVENT_CATEGORY_NAME = ".Net Trace and Debug";
		private const string WRITE_EVENT_NAME = "Write";
		private const string FAIL_EVENT_NAME = "Fail";
		private const string INDENT_EVENT_NAME = "Indent Begin";
		private const string UNINDENT_EVENT_NAME = "Indent End";

		private const string EVENT_CATEGORY_DESCRIPTION =
			"Captures events from System.Diagnostics.Trace and/or System.Diagnostics.Debug.";
		private const string WRITE_EVENT_DESCRIPTION =
			"Captures all Write and WriteLine events.";
		private const string FAIL_EVENT_DESCRIPTION =
			"Captures all Fail events and all failed assertions.";
		private const string INDENT_EVENT_DESCRIPTION =
			"Captures the beginning of an indentation block in the trace output.";
		private const string UNINDENT_EVENT_DESCRIPTION =
			"Captures the end of an indentation block in the trace output.";

		/// <summary>
		/// Checks whether the VATraceListener was already registered.
		/// </summary>
		/// <returns>True if registered, otherwise false.</returns>
		public static bool IsRegistered() 
		{
			MSVSAEventSourceInstaller installer = new MSVSAEventSourceInstaller();
			bool isInstalled = false;
			installer.IsSourceRegistered(EVENT_SOURCE_GUID, out isInstalled);
			return isInstalled;
		}

		/// <summary>
		/// Registers VATraceListener.
		/// </summary>
		public static void Register() 
		{
			MSVSAEventSourceInstaller installer = new MSVSAEventSourceInstaller();
			bool isInstalled = false;
			installer.IsSourceRegistered(EVENT_SOURCE_GUID, out isInstalled);
			if (!isInstalled)
			{
				installer.RegisterSource(EVENT_SOURCE_NAME,EVENT_SOURCE_GUID);
				installer.RegisterEventCategory(EVENT_SOURCE_GUID,EVENT_CATEGORY_GUID,
					DEBUG_EVENT_CATEGORY_ALL,EVENT_CATEGORY_NAME,EVENT_CATEGORY_DESCRIPTION,"",0);
				installer.RegisterCustomEvent(EVENT_SOURCE_GUID,WRITE_EVENT_GUID,
					WRITE_EVENT_NAME,WRITE_EVENT_DESCRIPTION,DEBUG_EVENT_TYPE_GENERIC,
					EVENT_CATEGORY_GUID,"",0);
				installer.RegisterCustomEvent(EVENT_SOURCE_GUID,FAIL_EVENT_GUID,
					FAIL_EVENT_NAME,FAIL_EVENT_DESCRIPTION,DEBUG_EVENT_TYPE_GENERIC,
					EVENT_CATEGORY_GUID,"",0);

				installer.RegisterCustomEvent(EVENT_SOURCE_GUID,INDENT_EVENT_GUID,
					INDENT_EVENT_NAME,INDENT_EVENT_DESCRIPTION,DEBUG_EVENT_TYPE_BEGIN,
					EVENT_CATEGORY_GUID,"",0);
				installer.RegisterCustomEvent(EVENT_SOURCE_GUID,UNINDENT_EVENT_GUID,
					UNINDENT_EVENT_NAME,UNINDENT_EVENT_DESCRIPTION,DEBUG_EVENT_TYPE_END,
					EVENT_CATEGORY_GUID,"",0);
			}
		}

		/// <summary>
		/// Unregisters the VATraceListener.
		/// </summary>
		public static void Unregister() 
		{
			MSVSAEventSourceInstaller installer = new MSVSAEventSourceInstaller();
			bool isInstalled = false;
			installer.IsSourceRegistered(EVENT_SOURCE_GUID, out isInstalled);
			if (isInstalled) installer.UnRegisterSource(EVENT_SOURCE_GUID);
		}
	}
