all: IPFilterSink.dll common.dll server.exe client.exe

IPFilterSink.dll: IPFilterSink.cs
  csc /debug+ /t:library /r:System.dll /r:System.Runtime.Remoting.dll IPFilterSink.cs

common.dll: common.cs
  csc /debug+ /t:library /r:System.Runtime.Remoting.dll common.cs

server.exe: server.cs IPFilterSink.dll 
  csc /debug+ /r:IPFilterSink.dll /r:System.dll /r:System.Runtime.Remoting.dll server.cs

client.exe: client.cs common.dll 
  csc /debug+ /r:common.dll /r:System.Runtime.Remoting.dll client.cs

