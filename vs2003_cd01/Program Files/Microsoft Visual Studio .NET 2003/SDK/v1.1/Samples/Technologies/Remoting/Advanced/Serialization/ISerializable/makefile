all : ISerializableClient.exe

ISerializableClient.exe : ISerializableClient.cs
  csc /debug+ /r:System.Runtime.Serialization.Formatters.Soap.dll ISerializableClient.cs

run:
  ISerializableClient.exe