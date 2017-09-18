using System;
using System.Threading;
using System.Runtime.InteropServices;

namespace Kernel32
{
	public unsafe class Exports
	{
		#region Helper Library

		#region Handle & Object Functions
		[DllImport(@"Kernel32.dll", SetLastError = true)]
		public static extern int CloseHandle(HANDLE handle);
		#endregion

		#endregion

		#region DLLs, Processes & Threads

		#region Threads
		[DllImport(@"Kernel32.dll", SetLastError = true)]
		public static extern HANDLE CreateThread(
			void* lpThreadAttributes, 
			int stackSize, 
			[MarshalAs(UnmanagedType.FunctionPtr)] UThreadStart threadStarter,
			[MarshalAs(UnmanagedType.FunctionPtr)] ThreadStart threadStart,
			int creationFlags,
			out int threadId);
		[DllImport(@"Kernel32.dll")]
		public static extern int GetCurrentThreadId();
		[DllImport(@"Kernel32.dll")]
		public static extern HANDLE GetCurrentThread();
		#endregion

		#region Synchronization

		#region Wait Functions
		[DllImport(@"Kernel32.dll", SetLastError = true)]
		public static extern int WaitForMultipleObjectsEx(int count, HANDLE[] handles, bool waitAll, int ms, bool altertable);
		[DllImport(@"Kernel32.dll", SetLastError = true)]
		public static extern int WaitForSingleObjectEx(HANDLE handle, int ms, bool alertable);
		#endregion

		#region Events Functions
		[DllImport(@"Kernel32.dll", SetLastError = true)]
		public static extern HANDLE CreateEvent(SecurityAttributes* pEventAttributes, bool manualReset, bool initialState, string name);
		[DllImport(@"Kernel32.dll", SetLastError = true)]
		public static extern bool PulseEvent(HANDLE handle);
		[DllImport(@"Kernel32.dll", SetLastError = true)]
		public static extern bool ResetEvent(HANDLE handle);
		[DllImport(@"Kernel32.dll", SetLastError = true)]
		public static extern bool SetEvent(HANDLE handle);
		#endregion

		#endregion

		#endregion
	}
	public unsafe delegate void UThreadStart(void* pParam);
	public class Win32Exception : Exception
	{
		public Win32Exception(int err)
		{
		}
		public Win32Exception()
		{
		}
	}
	public struct SecurityAttributes { }
	[Flags]
	public enum WaitFlags
	{
		None = 0,
		Alertable = 1,
        ThrowOnIOCompletion = 2,
		ThrowOnTimeOut = 4,
		ReportAbandoned = 8
	}
	public struct WaitFlagsParser
	{
		#region Static Members
		public static implicit operator WaitFlags(WaitFlagsParser wfp)
		{
			return wfp.Enum;
		}
		public static implicit operator WaitFlagsParser(WaitFlags wf)
		{
			WaitFlagsParser wfp;
			wfp.Enum = wf;
			return wfp;
		}
		#endregion

		#region Data Members
		public WaitFlags Enum;
		#endregion

		#region Constructor
		public WaitFlagsParser(WaitFlags waitFlags)
		{
			Enum = waitFlags;
		}
		#endregion

		#region Public Members
		public bool Alertable { get { return (Enum & WaitFlags.Alertable) != 0; } }
		public bool ThrowOnIOCompletion { get { return (Enum & WaitFlags.ThrowOnIOCompletion) != 0; } }
		public bool ThrowOnTimeOut { get { return (Enum & WaitFlags.ThrowOnTimeOut) != 0; } }
		public bool ReportAbandoned { get { return (Enum & WaitFlags.ReportAbandoned) != 0; } }
		#endregion
	}
	public struct HANDLE
	{
		public IntPtr Value;
	}
	public class Win32Handle
	{
		#region Static Members
		public static implicit operator HANDLE(Win32Handle hnd)
		{
			return hnd.Handle;
		}
		#endregion

		#region Private Data Members
		private HANDLE m_handle;
		private bool m_isPseudoHandle;
		#endregion

		#region Constructor
		protected Win32Handle()
		{
		}
		protected void Init(HANDLE handle, bool isPseudoHandle)
		{
			Init(handle);
			m_isPseudoHandle = isPseudoHandle;
		}
		protected void Init(HANDLE handle)
		{
			m_isPseudoHandle = false;
			m_handle = handle;
		}
		#endregion

		#region Public Members
		public HANDLE Handle
		{
			get
			{
				return m_handle;
			}
		}
		#endregion
	}
	public class Win32Thread : Win32Handle
	{
		#region Static Members
		public static int GetCurrentThreadId()
		{
			return Exports.GetCurrentThreadId();
		}
		public static Win32Thread GetCurrentThread()
		{
			unsafe
			{
				HANDLE psuedoHandle = Exports.GetCurrentThread();
				return new Win32Thread(psuedoHandle);
			}
		}
		#endregion

		#region Private Data Members
		private UThreadStart m_uThreadStart;
		private ThreadStart m_threadStart;
		private int m_threadId;
		#endregion

		#region Constructor
		private Win32Thread(HANDLE psuedoHandle)
		{
			Init(psuedoHandle, true);
		}
		public Win32Thread(ThreadStart threadStart)
		{
			if (threadStart == null)
				throw new ArgumentNullException();
			else
				m_threadStart = threadStart;

			unsafe 
			{
				m_uThreadStart = new UThreadStart(UThreadStarter);

				HANDLE handle = Exports.CreateThread(
					null, 0, m_uThreadStart, null, 0, out m_threadId);

				if (handle.Value.ToPointer() == null)
					throw new Win32Exception();

				Init(handle);
			}
		}
		#endregion

		#region Private Data Members
		private unsafe void UThreadStarter(void* pParam)
		{
			m_threadStart();
		}
		#endregion

		#region Public Members
		public int Id
		{
			get
			{
				return m_threadId;
			}
		}
		#endregion
	}
	public class Win32WaitHandle : Win32Handle
	{
		#region Definitions
		private static readonly uint WaitFailed			= 0xFFFFFFFF;
		public static readonly int WaitObject0			= 0x00000000;
		public static readonly int WaitAbandoned0		= 0x00000080;
		public static readonly int WaitIOCompletion		= 0x000000C0;
		public static readonly int WaitTimeOut			= 0x00000102;
		public class IOCompletion : Exception {}
		public class TimeOut : Exception {}
		#endregion

		#region Static Members
		private static int Wait(Win32WaitHandle[] handles, bool waitAll, WaitFlagsParser flags, int timeOut)
		{
			HANDLE[] rawHandles = new HANDLE[handles.Length];
			handles.CopyTo(rawHandles, 0);

			int ret = Exports.WaitForMultipleObjectsEx(handles.Length, rawHandles, waitAll, timeOut, flags.Alertable);

			if (ret == WaitFailed)
			{
				int lastError = Marshal.GetLastWin32Error();
				throw new Win32Exception(lastError);
			}
			else if (!flags.ReportAbandoned && 
				ret > WaitAbandoned0 && 
				ret < WaitAbandoned0 + handles.Length - 1)
			{
				ret = ret - WaitAbandoned0;
			}
			else if (ret == WaitIOCompletion && flags.ThrowOnIOCompletion)
			{
				throw new IOCompletion();
			}
			else if (ret == WaitTimeOut && flags.ThrowOnTimeOut)
			{
				throw new TimeOut();
			}

			return ret;
		}
		public static int WaitAny(Win32WaitHandle[] handles, WaitFlags flags, int timeOut)
		{
			return Wait(handles, false, flags, timeOut);
		}
		public static int WaitAny(Win32WaitHandle[] handles,  WaitFlags flags, TimeSpan timeOut)
		{
			return WaitAny(handles, flags, timeOut.Milliseconds);
		}
		public static int WaitAny(Win32WaitHandle[] handles, WaitFlags flags)
		{
			return WaitAny(handles, flags, int.MaxValue);
		}
		public static int WaitAll(Win32WaitHandle[] handles, WaitFlags flags, int timeOut)
		{
			return Wait(handles, false, flags, timeOut);
		}
		public static int WaitAll(Win32WaitHandle[] handles, WaitFlags flags, TimeSpan timeOut)
		{
			return WaitAll(handles, flags, timeOut.Milliseconds);
		}
		public static int WaitAll(Win32WaitHandle[] handles, WaitFlags flags)
		{
			return WaitAll(handles, flags, int.MaxValue);
		}
		#endregion

		#region Constructor
		protected Win32WaitHandle()
		{
		}
		#endregion

		#region Public Members
		public int WaitOne(WaitFlagsParser flags, int timeOut)
		{
			int ret = Exports.WaitForSingleObjectEx(this, int.MaxValue, flags.Alertable);

			if (ret == WaitFailed)
			{
				throw new Win32Exception();
			}
			else if (ret == WaitAbandoned0 && !flags.ReportAbandoned)
			{
				ret = WaitObject0;
			}
			else if (ret == WaitIOCompletion && flags.ThrowOnIOCompletion)
			{
				throw new IOCompletion();
			}
			else if (ret == WaitTimeOut && flags.ThrowOnTimeOut)
			{
				throw new TimeOut();
			}
			else
			{
				System.Diagnostics.Debug.Assert(ret == WaitObject0);
			}

			return ret;
		}
		public int WaitOne(WaitFlags flags, TimeSpan timeOut)
		{
			return WaitOne(flags, timeOut.Milliseconds);
		}
		public int WaitOne(WaitFlags flags)
		{
			return WaitOne(flags, int.MaxValue);
		}
		public int WaitOne()
		{
			WaitFlagsParser wfp;
			wfp.Enum = WaitFlags.None;
			return WaitOne(wfp, int.MaxValue);
		}
		public void Pulse()
		{
			if (!Exports.PulseEvent(this))
			{
				throw new Win32Exception();
			}
		}
		public void Reset()
		{
			if (!Exports.ResetEvent(this))
			{
				throw new Win32Exception();
			}
		}
		public void Set()
		{
			if (!Exports.SetEvent(this))
			{
				throw new Win32Exception();
			}
		}
		#endregion
	}
	public class Win32Event : Win32WaitHandle
	{
		#region Constructor
		protected Win32Event(bool manualReset, bool initialState, string name)
		{
			unsafe 
			{
				HANDLE handle = Exports.CreateEvent(null, manualReset, initialState, name);

				if (handle.Value.ToPointer() == null)
				{
					throw new Win32Exception();
				}

				Init(handle);
			}
		}
		#endregion
	}
	public class Win32AutoResetEvent : Win32Event
	{
		#region Constructor
		public Win32AutoResetEvent(bool initialState, string name) : base(false, initialState, name)
		{
		}
		public Win32AutoResetEvent(bool initialState) : this(initialState, null)
		{
		}
		#endregion		
	}
	public class Win32ManualResetEvent : Win32Event
	{
		#region Constructor
		public Win32ManualResetEvent(bool initialState, string name) : base(true, initialState, name)
		{
		}
		public Win32ManualResetEvent(bool initialState) : this(initialState, null)
		{
		}
		#endregion		
	}
}
