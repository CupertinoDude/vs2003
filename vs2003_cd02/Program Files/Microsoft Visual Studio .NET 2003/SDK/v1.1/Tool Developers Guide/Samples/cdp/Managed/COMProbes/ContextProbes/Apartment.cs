using System;
using System.Threading;
using System.Runtime.InteropServices;

namespace Apartment
{
	public class Test
	{
		public static bool m_enable;

		public static void Test00()
		{
			Thread.CurrentThread.ApartmentState = ApartmentState.STA;

			if (m_enable)
			{
				/// MARGINAL: This should have fired this probe but this case is not handled.
				Thread.CurrentThread.ApartmentState = ApartmentState.MTA;
			}
		}

		public static void Test01()
		{
			int hr = Ole32.Exports.CoInitializeEx(0, Ole32.COINIT.ApartmentThreaded);
			if (hr != 0) Marshal.ThrowExceptionForHR(hr);

			if (m_enable)
			{
				Thread.CurrentThread.ApartmentState = ApartmentState.MTA;
			}
		}

		public static void Test02()
		{
			Thread.CurrentThread.ApartmentState = ApartmentState.MTA;

			if (m_enable)
			{
				int hr;
				hr = Ole32.Exports.CoUninitialize();
				if (hr != 0) Marshal.ThrowExceptionForHR(hr);

				hr = Ole32.Exports.CoInitializeEx(0, Ole32.COINIT.ApartmentThreaded);
				if (hr != 0) Marshal.ThrowExceptionForHR(hr);
			}

			ApartmentState aptState = Thread.CurrentThread.ApartmentState;
		}

		public static void Entry(bool enable)
		{
			m_enable = enable;

			/// MARGINAL: This probe requires the runtime to load COM (ole.dll) before
			/// it will work. I do this by creating an unmanaged COM object (CDPTests).
			new CDPTests();

			RunTest(new ThreadStart(Test.Test00));
			RunTest(new ThreadStart(Test.Test01));
			RunTest(new ThreadStart(Test.Test02));
		}

		private static void RunTest(ThreadStart threadStart)
		{
			Thread thread = new Thread(new ThreadStart(threadStart));
			thread.Start();
			thread.Join();
		}
	}
}