all: MediaPlayer.dll Homenet.dll MediaHost.exe

MediaPlayer.dll: 
  tlbimp /silent msdxm.ocx 
  copy MediaPlayer.dll ..\bin

Homenet.dll: Homenet.cs
  csc /debug+ /t:library -r:MediaPlayer.dll -out:Homenet.dll Homenet.cs
  copy Homenet.dll ..\bin

MediaHost.exe: MediaHost.cs
  csc /debug+ MediaHost.cs

