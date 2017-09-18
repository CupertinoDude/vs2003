all: LoggingSinks.dll common.dll server.exe client.exe

LoggingSinks.dll: LoggingSinks.cs
  csc /debug+ /t:library /r:System.dll /r:System.Runtime.Remoting.dll LoggingSinks.cs

common.dll: common.cs
  csc /debug+ /t:library /r:System.Runtime.Remoting.dll common.cs

server.exe: server.cs LoggingSinks.dll 
  csc /debug+ /r:LoggingSinks.dll /r:System.dll /r:System.Runtime.Remoting.dll server.cs

client.exe: client.cs common.dll 
  csc /debug+ /r:LoggingSinks.dll /r:common.dll /r:System.Runtime.Remoting.dll client.cs

