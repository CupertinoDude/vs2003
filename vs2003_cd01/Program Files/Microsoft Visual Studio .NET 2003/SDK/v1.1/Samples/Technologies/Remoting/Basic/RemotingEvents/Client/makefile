all: Client.exe

Zap.dll:
  copy ..\bin\Zap.dll

Wak.dll:
  copy ..\bin\Wak.dll
 
Client.exe: Wak.dll Zap.dll Client.cs
 csc /debug+ /r:System.Runtime.Remoting.dll /r:Wak.dll /r:Zap.dll Client.cs

