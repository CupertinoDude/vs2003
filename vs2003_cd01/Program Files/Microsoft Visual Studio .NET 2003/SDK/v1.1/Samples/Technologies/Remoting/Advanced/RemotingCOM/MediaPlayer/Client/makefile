all: Client.exe 

Homenet.dll : 
  copy ..\bin\Homenet.dll
  copy ..\bin\MediaPlayer.dll

Client.exe: Homenet.dll Client.cs
  csc /debug+ /r:System.Runtime.Remoting.dll /r:Homenet.dll /out:Client.exe Client.cs

