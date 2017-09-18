all: CAOLibrary.dll client.exe

CAOLibrary.dll: 
  copy ..\..\bin\CAOLibrary.dll

client.exe: client.cs
  csc /debug+ /r:System.Runtime.Remoting.dll /r:CAOLibrary.dll /out:client.exe client.cs

