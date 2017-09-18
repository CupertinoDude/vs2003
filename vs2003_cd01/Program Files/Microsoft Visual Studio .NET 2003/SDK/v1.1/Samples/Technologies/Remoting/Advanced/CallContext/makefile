all: FooAssembly.dll FooHost.exe FooClient.exe

FooAssembly.dll: FooAssembly.cs
        csc /debug+ /r:System.Runtime.Remoting.dll /t:library /out:FooAssembly.dll FooAssembly.cs

FooHost.exe: FooHost.cs
        csc /debug+ /r:System.Runtime.Remoting.dll FooHost.cs

FooClient.exe: FooClient.cs FooAssembly.dll
        csc /debug+ /r:System.Runtime.Remoting.dll /r:FooAssembly.dll FooClient.cs 

