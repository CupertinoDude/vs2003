all: EventFireHost.exe Zap.dll Wak.dll

Wak.dll:
  copy ..\bin\Wak.dll

EventFireHost.exe: EventFireHost.cs
 csc /debug+ /r:System.Runtime.Remoting.dll EventFireHost.cs

Zap.dll: Zap.cs
  csc /debug+ /t:library -out:Zap.dll Zap.cs
  copy Zap.dll ..\bin