all: Wak.dll EventSinkHost.exe

Zap.dll:
  cd ..\EventFire
  nmake -a Zap.dll
  cd ..\EventSink
  copy ..\bin\Zap.dll

Wak.dll: Zap.dll Wak.cs
  csc /debug+ /t:library /r:Zap.dll -out:Wak.dll Wak.cs
  copy Wak.dll ..\bin\Wak.dll
 
EventSinkHost.exe: Wak.dll EventSinkHost.cs
  csc /debug+ /r:System.Runtime.Remoting.dll /r:Zap.dll /r:Wak.dll EventSinkHost.cs

