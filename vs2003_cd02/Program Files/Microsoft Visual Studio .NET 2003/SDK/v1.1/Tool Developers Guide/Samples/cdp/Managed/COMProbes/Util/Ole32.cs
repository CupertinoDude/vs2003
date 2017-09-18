using System;
using System.Runtime.InteropServices;

namespace Ole32
{
	public class Exports
	{
		//public const string DllName = @"ole32.dll";
		public const string DllName = @"..\..\..\SimpleObject\InProc\SimpleObject.dll";

		[DllImport(
			 DllName, 
			 EntryPoint="CoInitialize", 
			 CallingConvention=CallingConvention.StdCall)]
		public static extern int CoInitialize(int reserved); 

		[DllImport(
			 DllName, 
			 EntryPoint="CoInitializeEx", 
			 CallingConvention=CallingConvention.StdCall)]
		public static extern int CoInitializeEx(int reserved, COINIT dwCoInit); 

		[DllImport(
			 DllName, 
			 EntryPoint="CoUninitialize", 
			 CallingConvention=CallingConvention.StdCall)]
		public static extern int CoUninitialize();

		[DllImport(
			 DllName, 
			 EntryPoint="CoCreateInstance", 
			 CallingConvention=CallingConvention.StdCall)]
		public static extern unsafe int CoCreateInstance(
			ref Guid rclsid, IntPtr pUnkOuter, CLSCTX dwClsContext, ref Guid riid, out IntPtr ppv);
	}
	[Flags]
	public enum CLSCTX : int
	{ 
		InprocServer = 1, 
		InprocHandler = 2, 
		LocalServer = 4,
		RemoteServer = 16,
		NoCodeDownload = 400,
		NoFailureLog = 4000,
	} 
	[Flags]
	public enum COINIT : int
	{ 
		ApartmentThreaded = 0x2,
		MultiThreaded =		0x0,
		DisableOle1DDE =	0x4,
		SpeedOverMemory =	0x8
	} 

}