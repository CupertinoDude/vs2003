using System;
using System.Runtime.InteropServices; 
using System.Text;

namespace ComMarshaling
{
	public struct Primitives
	{
		public sbyte s1; public short s2; public int s4; public long s8;
		public byte u1; public ushort u2; public uint u4; public ulong u8; 
		public double d8; public float d4;
		public bool b;

		public Primitives(bool initToZero)
		{
			s1=0; s2=0; s4=0; s8=0; u1=0; u2=0; u4=0; u8=0; d8=0; d4=0; b=true;
		}
	}

	[Guid(Test.IID_UniversalMarshaler),
	InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
	public interface IUniversalMarshaler
	{
		void MarshalPrimitives(
			sbyte s1, short s2, int s4, long s8, 
			byte u1, ushort u2, uint u4, ulong u8, 
			double d8, float d4, 
			bool b, 
			int LPM);

		void MarshalPrimitivesStruct(Primitives primitives, int LPM);

		void MarshalOutPrimitives(
			out sbyte s1, out short s2, out int s4, out long s8, 
			out byte u1, out ushort u2, out uint u4, out ulong u8, 
			out double d8, out float d4, 
			out bool b, 
			int LPM);

		void MarshalBoxedPrimitives(
			SByte s1, Int16 s2, Int32 s4, Int64 s8, 
			Byte u1, UInt16 u2, UInt32 u4, UInt64 u8, 
			Double d8, Single d4, 
			Boolean b, 
			int LPM);

		void MarshalString(
			string Default, 
			[MarshalAs(UnmanagedType.BStr)] string BStr,
			[MarshalAs(UnmanagedType.LPStr)] string LPStr,
			[MarshalAs(UnmanagedType.LPWStr)] string LPWStr,
			[MarshalAs(UnmanagedType.AnsiBStr)] string AnsiBStr,
			int LPM);
	}

	public class Test
	{
		public const string IID_UniversalMarshaler = "56823962-6326-3651-a632-626690873284";
		public const int LPM = 0x600DF00D; // Last parameter marker

		public static void Entry(bool enabled)
		{
			if (!enabled) return;
			IUniversalMarshaler um = new CDPTests() as IUniversalMarshaler;	

			sbyte s1=0; short s2=0; int s4=0; long s8=0;
			byte u1=0; ushort u2=0; uint u4=0; ulong u8=0;
			double d8=0; float d4=0;
			bool b=false;

			System.Diagnostics.Debug.WriteLine("\nMarshalPrimitives");
			um.MarshalPrimitives(0,0,0,0,0,0,0,0,0,0,false,LPM);

			Primitives primitives = new Primitives();
			System.Diagnostics.Debug.WriteLine("\nMarshalPrimitivesStruct");
			um.MarshalPrimitivesStruct(primitives,LPM);

			System.Diagnostics.Debug.WriteLine("\nMarshalBoxedPrimitives");
			um.MarshalBoxedPrimitives(0,0,0,0,0,0,0,0,0,0,false,LPM);

			System.Diagnostics.Debug.WriteLine("\nMarshalOutPrimitives");
			um.MarshalOutPrimitives(out s1, out s2, out s4, out s8, out u1, out u2, out u4, out u8, out d8, out d4, out b, LPM);

			System.Diagnostics.Debug.WriteLine("\nMarshalString");
			um.MarshalString("Default","BStr","LPStr","LPWStr","AnsiBStr",LPM);
		}
	}
}














