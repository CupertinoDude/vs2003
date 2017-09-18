using System;
using System.Runtime.InteropServices;

namespace InvalidIUnknown
{
	public class Test
	{
		public static void Entry(bool enable)
		{
			CDPTests comObject = new CDPTests();
			ICDPTests helper = (ICDPTests)comObject;
			IFoo foo = (IFoo)helper;

			// . Calling FailAllQIs here has no effect on GetIUnknownForObject because 
			// the runtime has cached the pUnk and does not need to QI for it so the 
			// runtime will not observe the failure
			//cdpComTests.FailAllQIs = enable;
			IntPtr pUnk;
			Guid iid = typeof(ICDPTests).GUID;

			int hr = Marshal.QueryInterface(
				Marshal.GetIUnknownForObject(helper),
				ref iid, 
				out pUnk);

			// . This will cause getObjectForIUnknown to throw an ExcecutionEngineException.
			// The runtime does not seach its cache to for pUnk when pUnk is a raw pointer.
			// When the runtime does a QI on the pUnk the call will return an error condition. 
			helper.FailAllQIs = enable;
			object obj = Marshal.GetObjectForIUnknown(pUnk);

			// . Calling FailAllQI here has no effect because the pUnk has been matched
			// to cached pUnk and thus to the cached IFoo. To prove this, comment out the
			// cast to (IFoo) at the start of this function and this call will throw an
			// invalid cast exception.
			//cdpComTests.FailAllQIs = enable;
			obj = (IFoo)obj;		
		}
	}
}