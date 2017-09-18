all: server.exe FileServerSink.dll

FileServerSink.dll: FileServerSink.cs
  csc /debug+ /t:library /r:System.Runtime.Remoting.dll FileServerSink.cs

server.exe: server.cs FileServerSink.dll 
  csc /debug+ /r:FileServerSink.dll /r:System.Runtime.Remoting.dll server.cs
  
run:
  start server.exe
  
