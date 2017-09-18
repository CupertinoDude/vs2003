using System;
using Microsoft.Win32;
using System.Reflection;
using System.Runtime.InteropServices;

namespace CollectedDelegate
{
	class Exports
	{
		public const string Dll = @"../../../SimpleObject/InProc/SimpleObject.dll";

		[DllImport(
			 Dll, 
			 EntryPoint="SetDelegate", 
			 CallingConvention=CallingConvention.Cdecl)]
		public static extern void SetDelegate([MarshalAs(UnmanagedType.FunctionPtr)] Delegate d);

		[DllImport(
			 Dll, 
			 EntryPoint="CallDelegate", 
			 CallingConvention=CallingConvention.Cdecl)]
		public static extern void CallDelegate();
	}

	delegate void Delegate();

	class CollectedClass
	{
		public void OnCallback() 
		{ 
		}
	}

	public class Test
	{
		public static void Entry(bool enabled)
		{
			CollectedClass collectedClass = new CollectedClass();
			Delegate d = new Delegate(collectedClass.OnCallback);

			Exports.SetDelegate(d);

			if (enabled)
			{
				d = null;
			}
			
			System.GC.Collect();
			System.GC.WaitForPendingFinalizers();

			Exports.CallDelegate();
		}
	}
}