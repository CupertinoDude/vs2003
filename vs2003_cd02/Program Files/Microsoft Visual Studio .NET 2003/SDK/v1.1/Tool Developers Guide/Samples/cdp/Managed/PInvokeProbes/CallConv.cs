using System;
using System.Runtime.InteropServices;

namespace PInvoke
{
	class Exports
	{
		public const string DLL = @"../../../SimpleObject/InProc/SimpleObject.dll";

		[DllImport(DLL, 
			//CallingConvention=CallingConvention.StdCall)]			
			CallingConvention=CallingConvention.Cdecl)] 
			//CallingConvention=CallingConvention.ThisCall)]
		public static extern void StdCall(bool param1);

		[DllImport(DLL, 
			 CallingConvention=CallingConvention.StdCall)]			
			 //CallingConvention=CallingConvention.Cdecl)] 
			 //CallingConvention=CallingConvention.ThisCall)]
		public static extern void CdeclCall(bool param1);

		[DllImport(DLL, 
			 //CallingConvention=CallingConvention.StdCall)]			
			 CallingConvention=CallingConvention.Cdecl)] 
			 //CallingConvention=CallingConvention.ThisCall)]
		public static extern void ThisCall(int This, bool param1);
	}

	public class Test
	{
		public static void Entry(bool Enable)
		{
			if (Enable)
			{
				Exports.StdCall(true);
				Exports.CdeclCall(true);
				Exports.ThisCall(1, true);
			}
		}
	}
}
