using System;
using System.Threading;
using System.Runtime.InteropServices;
using System.Reflection;

public unsafe class StaApartment : ComApartment
{
	public StaApartment(Type cls) : this(cls, true) { }
	public StaApartment(Type cls, bool pump) : base(cls, ApartmentState.STA, pump) { }
}
public unsafe class MtaApartment : ComApartment
{
	public MtaApartment(Type cls) : this(cls, true) { }
	public MtaApartment(Type cls, bool pump) : base(cls, ApartmentState.MTA, pump) { }
}
public unsafe class ComApartment
{
	#region Definitions
	public delegate void Callback(ComApartment This);
	#endregion

	#region Private Data Members
	private Kernel32.Win32Thread m_Win32AptThread;
	private Kernel32.Win32AutoResetEvent m_win32Event;
	private Thread m_aptThread;
	private AutoResetEvent m_invoked, m_started, m_finished;
	private AutoResetEvent m_managedEvent;
	private object m_comObject;
	private Guid m_clsid;
	private Callback m_callback;
	private ApartmentState m_aptType;
	private bool m_pump;
	private bool m_exit;
	#endregion

	#region Constructor
	public ComApartment(Type cls, ApartmentState aptState, bool pump)
	{
		if (!cls.IsClass && cls.IsCOMObject)
			throw new Exception("StaApartment can only construct COM classes");

		m_aptType = aptState;
		m_pump = pump;
		m_exit = false;

		m_win32Event = new Kernel32.Win32AutoResetEvent(false);
		m_invoked = m_started = m_finished = new AutoResetEvent(false);
		m_managedEvent = new AutoResetEvent(false);
		m_clsid = cls.GUID;

		m_Win32AptThread = new Kernel32.Win32Thread(new ThreadStart(ApartmentStart));
		m_started.WaitOne();
	}
	private void ApartmentStart()
	{
		m_aptThread = Thread.CurrentThread;
		m_aptThread.ApartmentState = m_aptType;

		IntPtr pUnk;
		int hr = 0;

		try
		{
			IntPtr intPtr = new IntPtr(null);

			hr = Ole32.Exports.CoCreateInstance(
				ref m_clsid, intPtr, Ole32.CLSCTX.InprocServer, ref IID.IUnknown, out pUnk);

			if (hr != 0) 
				throw new Exception("Ole32.CoCreateInstance failed");

			m_comObject = Marshal.GetObjectForIUnknown(pUnk);

			Marshal.Release(pUnk);
		}
		catch(Exception e)
		{
			System.Console.WriteLine("ComApartment threw an exception while starting up the apartment: " + e);
			return;
		}

		ApartmentLoop();
	}
	#endregion

	#region Main Loop
	private void ApartmentLoop()
	{
		do
		{
			bool pump = m_pump;
			m_invoked.Set();

			if (!pump)
			{
				try
				{
					m_win32Event.WaitOne();
				}
				catch(Exception e)
				{
					System.Console.WriteLine("Win32Event threw exception from main apartment loop: " + e);
				}
			}
			else
			{
				m_managedEvent.WaitOne();
			}

			try 
			{
				m_callback(this);
			}
			catch(Exception e)
			{
				System.Console.WriteLine("Apartment thread threw exception while executing callback: " + e);
			}

		} while(!m_exit);

		m_finished.Set();
	}
	#endregion

	#region Private Members
	private void StartPump(ComApartment This)
	{
		m_pump = true;
	}
	private void StopPump(ComApartment This)
	{
		m_pump = false;
	}
	private void ExitApartment(ComApartment This)
	{
		m_exit = true;
	}
	#endregion

	#region Public Members
	public void InvokeInApt(Callback callback)
	{
		if (callback == null) 
			return;

		m_callback = callback;
        
		if (m_pump)
		{
			m_managedEvent.Set();
		}
		else
		{
			m_win32Event.Set();		
		}

		m_invoked.WaitOne();
	}
	public void ClearObject()
	{
		m_comObject = null;
	}
	public void StopPumping()
	{
		if (!m_pump) return;

		InvokeInApt(new Callback(StopPump));
	}
	public void StartPumping()
	{
		if (m_pump) return;

		InvokeInApt(new Callback(StartPump));
	}
	public void Exit()
	{
		if (m_exit) return;

		InvokeInApt(new Callback(ExitApartment));
	}
	public object Object
	{
		get 
		{ 
			return m_comObject; 
		}
	}
	public Thread ApartmentThread
	{
		get
		{
			return m_aptThread;
		}
	}
	public Kernel32.Win32Thread ApartmentWin32Thread
	{
		get
		{
			return m_Win32AptThread;
		}
	}
	#endregion
}
