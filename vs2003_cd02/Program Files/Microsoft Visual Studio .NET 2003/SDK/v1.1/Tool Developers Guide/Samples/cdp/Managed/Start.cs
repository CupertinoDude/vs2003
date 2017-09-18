using System;
using System.Threading;
using System.Diagnostics;
using System.Runtime.InteropServices;

public class CDPDemo
{
	[STAThread]
	public static unsafe void Main(string[] args)
	{
		System.Console.WriteLine("Start");

		// Great Probes
		PInvoke.Test.Entry(true);
		CollectedDelegate.Test.Entry(false);

		// Good Probes
		ComMarshaling.Test.Entry(true); 
		InvalidIUnknown.Test.Entry(true);
		NotMarshalable.Test.Entry(false);

		// Marginal Probes
		Apartment.Test.Entry(true);
		DisconnectedContext.Test.Entry(true);

		System.Console.WriteLine("Done");
	}
}

















