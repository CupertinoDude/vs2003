all: CollectionLibrary.dll client.exe

CollectionLibrary.dll: 
  copy ..\..\bin\CollectionLibrary.dll

client.exe: client.cs
  csc /debug+ /r:System.Runtime.Remoting.dll /r:CollectionLibrary.dll /out:client.exe client.cs

