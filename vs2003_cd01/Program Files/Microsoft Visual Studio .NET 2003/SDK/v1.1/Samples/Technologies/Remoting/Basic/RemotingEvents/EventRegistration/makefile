all: EventRegistration.exe

Zap.dll:
  copy ..\bin\Zap.dll

Wak.dll:
  copy ..\bin\Wak.dll
 
EventRegistration.exe: Zap.dll Wak.dll EventRegistration.cs
 csc /debug+ /r:System.Runtime.Remoting.dll /r:Wak.dll /r:Zap.dll EventRegistration.cs

