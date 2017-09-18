using System;
using System.Threading;
using System.Runtime.InteropServices;

[Guid("00000abc-b41b-11cf-a6bb-0080c7b2d682"),
InterfaceType(ComInterfaceType.InterfaceIsIUnknown)] 
public interface ICDPTests
{
	bool AllowQIOfBrokenIMarshal { get; set; }
	bool FailAllQIs { get; set; }
}

[Guid("000F00F0-0F00-11cf-a6bb-0080c7b2d684"),
InterfaceType(ComInterfaceType.InterfaceIsIUnknown)] 
public interface IFoo
{
	void Foo();
	void Bar(ref object variant);
}

[ComImport, Guid("00000abc-882c-11cf-a6bb-0080c7b2d684")] 
public class CDPTests
{
}